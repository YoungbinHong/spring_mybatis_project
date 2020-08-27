package ETS.adminAuth;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ETS.adminAuth.service.AuthService;

/**************************************************
* @FileName   : AuthController.java
* @Description: 권한 관리 페이지 컨트롤러
* @Author     : Youngbin Hong
* @Version    : 2020. 8. 14.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

@Controller
@RequestMapping("adminAuth")
public class AuthController{
	
	@Autowired
	private AuthService authService;
	
	/**************************************************
	* @MethodName : callAuthorityManagement
	* @Description: 권한 관리 목록 명세
	* @param request
	* @param model	
	* @param response
	* @return String
	* @throws Exception
	* @Author     : Youngbin Hong
	* @Version    : 2020. 8. 14.
	**************************************************/
	@RequestMapping(value="/auth")
	public String callAuthorityManagement(HttpServletRequest request, Model model, HttpServletResponse response) {
		return "adminAuth/auth";
	}
	
}