package daesang.index;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import daesang.common.CamelMap;
import daesang.common.DataMap;
import daesang.common.Global;
import daesang.common.service.CommonService;
import daesang.common.spring.http.StatusCode;
import daesang.common.spring.http.SuccessBody;
import daesang.common.spring.security.session.SessionInformationSupport;
import daesang.common.util.HttpUtil;

@Controller
public class IndexController {

	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	private static final String GROUP_CODE = "MACG";
	
	
	@Autowired
	private SessionRegistry sessionRegistry;

	@Autowired
	private UserDetailsService userDetailsService;
	
	@Autowired
	private CommonService commonService;
	
	@Value("#{config.usernameParameter}")
	private String usernameParameter;
	@Value("#{config.passwordParameter}")
	private String passwordParameter;
	@Value("#{config.rememberMeparameter}")
	private String rememberMeparameter;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String dispMemberLogin(Model model) {
		model.addAttribute("usernameParameter", this.usernameParameter);
		model.addAttribute("passwordParameter", this.passwordParameter);
		model.addAttribute("rememberMeparameter", this.rememberMeparameter);
		return "login";
	}
	
	@SuppressWarnings({ "unchecked" })
	@RequestMapping(value = "/login/duplication", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody SuccessBody procMemberLoginDuplication(@RequestBody MultiValueMap<String, String> params) {

		String username = params.getFirst(this.usernameParameter);
		String password = params.getFirst(this.passwordParameter);

		SuccessBody body = new SuccessBody();
		body.setStatusCode(StatusCode.DuplicationLogin);

		body.setStatusCode(StatusCode.Unauthorized);
		try {						
			UserDetails details = this.userDetailsService.loadUserByUsername(username);
			
			if (details != null) {
				
				String comparePassword = "";
				if(StringUtils.isNotEmpty(password)){
					try {
//						comparePassword = SHA256.encrypt(password);
						comparePassword = password;
					} catch (Exception e) {
						logger.info("비밀번호 암호화 오류 : {}", e.getMessage());
					}
				}
				
				// 사용자 정보 일치여부
				if (details.getPassword().equals(comparePassword)) {
					try {
						DataMap paramMap = new DataMap();
						paramMap.put("user_id", username);
						paramMap.put("sessionid", this.usernameParameter);
						CamelMap userInfo = this.commonService.selectUserLoginInfo(paramMap);
						if(userInfo != null){
							if("N".equals(userInfo.getString("memberGb"))){
								body.setStatusCode(StatusCode.OK);
							}else if("P".equals(userInfo.getString("memberGb")) && "A".equals(userInfo.getString("memberStatus"))){
								body.setStatusCode(StatusCode.OK);
							}else{
								body.setStatusCode(StatusCode.MemberStatus);
							}
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					
					// 이미 로그인 사용자 여부
					SessionInformationSupport sessionInformationSupport = new SessionInformationSupport(this.sessionRegistry);
					
					if(sessionInformationSupport != null){
						for(int i=0;i<sessionInformationSupport.getSessionInformations().size();i++){			
							CamelMap sesMap = (CamelMap) sessionInformationSupport.getSessionInformations().get(i).getPrincipal();
							if(username.equals(sesMap.getString(Global.resource.getString("DUP_ID")))){								
								body.setData(sesMap);
								body.setError(true);
								break;
							}
						}
					}
				}
			}
		} catch (UsernameNotFoundException e) {
			// 없는 경우 로그인 처리.
			body.setStatusCode(StatusCode.Unauthorized);
		}
		
		return body;
	}
	
	/**************************************************
	* @MethodName : signin
	* @Description: 로그인
	* @param request
	* @param response
	* @throws Exception void
	* @Author     : Jong-Hoon. Jung
	* @Version    : 2019. 1. 15.
	**************************************************/
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/signin", method = {RequestMethod.GET, RequestMethod.POST})
	public void signin(HttpServletRequest request, HttpServletResponse response) throws Exception {

		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		
		String removeSessionId = paramMap.getString("removeSessionId");
		
		if(StringUtils.isNotEmpty(removeSessionId)){
			this.sessionRegistry.removeSessionInformation(removeSessionId);
			
			CamelMap removeMap = new CamelMap();
			removeMap.put("removeSessionId", removeSessionId);
			removeMap.put(Global.resource.getString("DUP_ID"), "");
			removeMap.put("sessionId", removeSessionId);
			removeMap.put("lastRequest", "");
			
			this.sessionRegistry.registerNewSession(removeSessionId, removeMap);
		}

//		String sessionId = request.getSession().getId();
		String sessionId = Global.session.getId();
		paramMap.put("sessionId", sessionId);
		CamelMap userInfo = this.commonService.selectUserLoginInfo(paramMap);
		
		this.sessionRegistry.registerNewSession(sessionId, userInfo);
		request.getSession().setAttribute("userInfo", userInfo);
		response.sendRedirect("/index");
	}
	
	/**************************************************
	* @MethodName : logout
	* @Description: 로그아웃
	* @param request
	* @param response
	* @throws Exception void
	* @Author     : Jong-Hoon. Jung
	* @Version    : 2019. 1. 15.
	**************************************************/
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public void logout(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String sessionId = session.getId();
		
		this.sessionRegistry.removeSessionInformation(sessionId);
		session.removeAttribute("userInfo");
		session.invalidate();
		
		response.sendRedirect("/login");
	}
	
	@RequestMapping(value = "/error/{id}", method = RequestMethod.GET)
	public String dispMemberMypage(@PathVariable("id") String error) {
		logger.info("error : {}", error);
		return "error/" + error;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/index", method = {RequestMethod.GET, RequestMethod.POST})
	public String index(HttpServletRequest request, Model model, HttpServletResponse response) {
		request.getSession();
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		HttpUtil.getParams(paramMap, model);
		
		CamelMap userMap = new CamelMap();
		
		if (request.getSession().getAttribute("userInfo") != null) {
			userMap = (CamelMap) request.getSession().getAttribute("userInfo");
			model.addAttribute("memberSeq", userMap.get("memeberSeq"));
		}

		DataMap codeMap = new DataMap();
		codeMap.put("groupCode", GROUP_CODE);
		List<CamelMap> codeList = this.commonService.getCommonCodeMstForGrp(codeMap);
		model.addAttribute("codeList", codeList);

		return "index";
	}
	
}
