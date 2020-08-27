package ETS.log;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ETS.common.util.CamelMap;
import ETS.common.util.DataMap;
import ETS.common.util.HttpUtil;

/**************************************************
* @FileName   : OrderLogController.java
* @Description: 주문 로그 페이지 컨트롤러
* @Author     : hyngsk
* @Version    : 2020. 8. 20.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/
@Controller
@RequestMapping("log")
public class OrderLogController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderLogController.class);
	
	
	/**************************************************
	* @MethodName : getOrderLogList
	* @Description: 주문 로그 명세
	* @param request
	* @param model
	* @param response
	* @return String
	* @Author     : hyngsk
	* @Version    : 2020. 8. 20.
	**************************************************/
	@RequestMapping(value="/orderLog", method = {RequestMethod.GET, RequestMethod.POST})
	public String getOrderLogList(HttpServletRequest request, Model model, HttpServletResponse response) {
		List<CamelMap> resultList = new ArrayList<CamelMap>();
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		
		String searchID = paramMap.getString("searchID");
		String searchOdr = paramMap.getString("searchOdr");
		
		logger.info("searchID : {} searchOdr : {}", searchID, searchOdr);
		
		model.addAttribute("searchID", searchID);
		model.addAttribute("searchOdr",searchOdr);
		
		HttpUtil.getParams(paramMap, model);
		
		return "log/orderLog";
	}
	
}