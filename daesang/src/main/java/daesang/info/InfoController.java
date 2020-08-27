package daesang.info;

import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
//import org.springframework.security.core.session.SessionInformation;
//import org.springframework.security.core.session.SessionRegistry;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**************************************************
* @FileName   : InfoController.java
* @Description: 공동 정보 페이지 컨트롤러
* @Author     : Jong-Hoon. Jung
* @Version    : 2019. 1. 9.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/
@Controller
@RequestMapping("info")
public class InfoController {
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	
	/**************************************************
	* @MethodName : getGuideRules
	* @Description: 가이드 규칙
	* @param request
	* @param model
	* @return String
	* @Author     : Jong-Hoon. Jung
	* @Version    : 2019. 1. 9.
	**************************************************/
	@RequestMapping(value = {"/guideRules"}, method = {RequestMethod.GET, RequestMethod.POST})
    public String getGuideRules(HttpServletRequest request, Model model) {
        
        return "info/guideRules";
    }
	
	/**************************************************
	* @MethodName : getGuideWay
	* @Description: 가이드 이용방법
	* @param request
	* @param model
	* @return String
	* @Author     : Jong-Hoon. Jung
	* @Version    : 2019. 1. 9.
	**************************************************/
	@RequestMapping(value = {"/guideWay"}, method = {RequestMethod.GET, RequestMethod.POST})
    public String getGuideWay(HttpServletRequest request, Model model) {
        
        return "info/guideWay";
    }
	
	/**************************************************
	* @MethodName : getCompanyIntroduce
	* @Description: 회사 소개
	* @param request
	* @param model
	* @return String
	* @Author     : Jong-Hoon. Jung
	* @Version    : 2019. 1. 31.
	**************************************************/
	@RequestMapping(value = {"/companyIntroduce"}, method = {RequestMethod.GET, RequestMethod.POST})
    public String getCompanyIntroduce(HttpServletRequest request, Model model) {
        
        return "info/companyIntroduce";
    }
}
