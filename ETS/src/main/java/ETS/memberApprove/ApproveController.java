package ETS.memberApprove;

import ETS.common.util.CamelMap;
import ETS.common.util.DataMap;
import ETS.common.util.HttpUtil;
import ETS.common.util.Paging;
import ETS.memberApprove.service.ApproveService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**************************************************
* @FileName   : ApproveController.java
* @Description: 가입 승인 페이지 컨트롤러
* @Author     : Seung-Jun. Kim
* @Version    : 2020. 8. 14.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

@Controller
@RequestMapping("memberApprove")
public class ApproveController {
	private static final Logger logger = LoggerFactory.getLogger(ApproveController.class);
	
	@Autowired
	private ApproveService approveService;
	
	/**************************************************
	* @MethodName : getUserList
	* @Description: 가입 승인 관리
	* @param request
	* @param model
	* @param response
	* @return String
	* @throws Exception
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/standby", method = {RequestMethod.GET, RequestMethod.POST})
	public String getUserList(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {
		
		List<CamelMap> resultList = new ArrayList<CamelMap>();
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		
		
		int rowMax = 0;
		int pageCount = 10;
		int rowCount = 10;
		
		String nowPage = paramMap.getString("nowPage");
		
		if (StringUtils.isEmpty(nowPage)) {
			nowPage = "1";
		}

		paramMap.put("nowPage", nowPage);

		//rowMax
		try {
			rowMax = approveService.getUserListCount(paramMap);
		} catch (Exception e) {
			logger.error("조회 오류 : {}", e);
		}
		
		//페이지 정보
		DataMap pageMap = Paging.initDataMapPage(rowMax, pageCount, rowCount, Integer.parseInt(nowPage));
		
		paramMap.put("rowCount", rowCount);
		paramMap.put("scopeRow", pageMap.getInt("scopeRow"));
		
		try {
			resultList = approveService.getUserList(paramMap);
			
		} catch (Exception e) {
			logger.error("조회 오류 : {}", e);
		}
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("pageInfo", pageMap);
		
		HttpUtil.getParams(paramMap, model);
		
		return "/memberApprove/standby";
	}
	
	/**************************************************
	* @MethodName : getDUserList
	* @Description: 
	* @param request
	* @param model
	* @param response
	* @return String
	* @throws Exception
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/sendback", method = {RequestMethod.GET, RequestMethod.POST})
	public String getDUserList(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {
		
		List<CamelMap> resultList = new ArrayList<CamelMap>();
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		
		
		int rowMax = 0;
		int pageCount = 10;
		int rowCount = 10;
		
		String nowPage = paramMap.getString("nowPage");
		
		if (StringUtils.isEmpty(nowPage)) {
			nowPage = "1";
		}

		paramMap.put("nowPage", nowPage);

		//rowMax
		try {
			rowMax = approveService.getDUserListCount(paramMap);
		} catch (Exception e) {
			logger.error("조회 오류 : {}", e);
		}
		
		//페이지 정보
		DataMap pageMap = Paging.initDataMapPage(rowMax, pageCount, rowCount, Integer.parseInt(nowPage));
		
		paramMap.put("rowCount", rowCount);
		paramMap.put("scopeRow", pageMap.getInt("scopeRow"));
		
		try {
			resultList = approveService.getDUserList(paramMap);
			
		} catch (Exception e) {
			logger.error("조회 오류 : {}", e);
		}
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("pageInfo", pageMap);
		
		HttpUtil.getParams(paramMap, model);
		
		return "/memberApprove/sendback";
	}
	
	/**************************************************
	* @MethodName : ajaxUserDelay
	* @Description: 
	* @param request
	* @param model
	* @param response
	* @return Model
	* @throws IOException
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	@RequestMapping(value = {"/ajaxUserDelay"}, method = RequestMethod.POST)
	@ResponseBody
    public Model ajaxUserDelay(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		
		boolean sw = false;
		
		try {
			sw = this.approveService.userDelay(paramMap);
		} catch (Exception e) {
			logger.error("사용자 반려 오류 : {}", e);
		}
		
		model.addAttribute("sw", sw);
		
		return model;
	}
	
	/**************************************************
	* @MethodName : ajaxDUserApprove
	* @Description: 
	* @param request
	* @param model
	* @param response
	* @return Model
	* @throws IOException
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	@RequestMapping(value = {"/ajaxDUserApprove"}, method = RequestMethod.POST)
	@ResponseBody
    public Model ajaxDUserApprove(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		
		boolean sw = false;
		
		try {
			sw = this.approveService.DuserApprove(paramMap);
		} catch (Exception e) {
			logger.error("사용자 승인 오류 : {}", e);
		}
		
		model.addAttribute("sw", sw);
		
		return model;
	}
	
	/**************************************************
	* @MethodName : ajaxUserApprove
	* @Description: 
	* @param request
	* @param model
	* @param response
	* @return Model
	* @throws IOException
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	@RequestMapping(value = {"/ajaxUserApprove"}, method = RequestMethod.POST)
	@ResponseBody
    public Model ajaxUserApprove(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		
		boolean sw = false;
		
		try {
			sw = this.approveService.userApprove(paramMap);
		} catch (Exception e) {
			logger.error("사용자 승인 오류 : {}", e);
		}
		
		model.addAttribute("sw", sw);
		
		return model;
	}
	
}
