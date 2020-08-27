package ETS.operator;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**************************************************
* @FileName   : MemberController.java
* @Description: 오퍼레이터 페이지 컨트롤러
* @Author     : Youngbin Hong
* @Version    : 2020. 8. 14.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

@Controller
@RequestMapping("operator")
public class OperatorController{
	
	/**************************************************
	* @MethodName : callOperator
	* @Description: 오퍼레이터
	* @param 
	* @return String
	* @Author     : Youngbin Hong
	* @Version    : 2020. 8. 14.
	**************************************************/
	@RequestMapping(value="/operator")
	public String callOperator() {
		return "operator/operator";
	}
	
}