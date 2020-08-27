package ETS.statistics;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**************************************************
* @FileName   : StatisticsController.java
* @Description: 통계 페이지 컨트롤러
* @Author     : Youngbin Hong
* @Version    : 2020. 8. 14.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

@Controller
@RequestMapping("statistics")
public class StatisticsController{
	
	/**************************************************
	* @MethodName : callStatistics
	* @Description: 통계
	* @param 
	* @return String
	* @Author     : Youngbin Hong
	* @Version    : 2020. 8. 14.
	**************************************************/
	@RequestMapping(value="/statistics")
	public String callStatistics() {
		return "statistics/statistics";
	}
	
}