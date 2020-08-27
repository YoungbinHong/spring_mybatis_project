package ETS.adminAuth;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ETS.adminAuth.service.AccountService;
import ETS.common.util.CamelMap;
import ETS.common.util.DataMap;
import ETS.common.util.http.HttpUtil;

/**************************************************
* @FileName   : AccountController.java
* @Description: 계정 관리 페이지 컨트롤러
* @Author     : Youngbin Hong
* @Version    : 2020. 8. 20.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

@Controller
@RequestMapping("adminAuth")
public class AccountController{
	
	@Autowired
	private AccountService accountService;
	
	/**************************************************
	* @MethodName : selectAccountList
	* @Description: 계정 관리 명세
	* @param 
	* @return String
	* @throws Exception
	* @Author     : Youngbin Hong
	* @Version    : 2020. 8. 20.
	**************************************************/
	@RequestMapping(value="/account", method={RequestMethod.GET, RequestMethod.POST})
	public String selectAccountList(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {
		
		List<CamelMap> resultList = new ArrayList<CamelMap>();
		
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		
		resultList = accountService.selectAccountList(paramMap);
		
		model.addAttribute("resultList", resultList);
		
		return "adminAuth/account";
	}
	
	/**************************************************
	* @MethodName : insertAccountList
	* @Description: 계정 관리 명세
	* @param 
	* @return String
	* @throws Exception
	* @Author     : Youngbin Hong
	* @Version    : 2020. 8. 21.
	**************************************************/
	@RequestMapping(value="/ajaxAccountSubmit", method= {RequestMethod.GET, RequestMethod.POST})
	public Model ajaxAccountSubmit(HttpServletRequest request, Model model) {
		return model;
	}
}