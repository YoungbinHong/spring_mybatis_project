package ETS.adminAuth;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**************************************************
* @FileName   : AdminLogController.java
* @Description: 관리자 로그 페이지 컨트롤러
* @Author     : Youngbin Hong
* @Version    : 2020. 8. 14.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

@Controller
@RequestMapping("adminAuth")
public class AdminLogController {
	
	/**************************************************
	* @MethodName : callAdministratorLog
	* @Description: 관리자 로그 명세
	* @param 
	* @return String
	* @throws Exception
	* @Author     : Youngbin Hong
	* @Version    : 2020. 8. 14.
	**************************************************/
	@RequestMapping(value="/adminLog")
	public String callAdministratorLog() {
		return "adminAuth/adminLog";
	}
	
}