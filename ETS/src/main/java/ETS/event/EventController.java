package ETS.event;

import ETS.event.service.EventService;
import ETS.common.util.CamelMap;
import ETS.common.util.DataMap;
import ETS.common.util.HttpUtil;
import ETS.common.util.Paging;

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
* @FileName   : EventmanageController.java
* @Description: 이벤트 페이지 컨트롤러
* @Author     : Youngbin Hong
* @Version    : 2020. 8. 14.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

@Controller
@RequestMapping("event")
public class EventController {
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@Autowired
	private EventService eventService;
	
	/**************************************************
	* @MethodName : eventManagement
	* @Description: 이벤트 관리 페이지
	* @param request, model, response
	* @return String
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/eventManagement", method = {RequestMethod.GET, RequestMethod.POST})
	public String getEventList(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {
		List<CamelMap> resultExchangeList = new ArrayList<CamelMap>();
		List<CamelMap> eventList = new ArrayList<CamelMap>();
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		
		String searchEventname = paramMap.getString("searchEventname");
		String stdate = paramMap.getString("stdate");
		String eddate = paramMap.getString("eddate");
		String searchExchange= paramMap.getString("searchExchange");
		
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
			rowMax = eventService.geteventListCount(paramMap);
		} catch (Exception e) {
			logger.error("이용권 리스트 오류 : {}", e);
		}
		
		//페이지 정보
		DataMap pageMap = Paging.initDataMapPage(rowMax, pageCount, rowCount, Integer.parseInt(nowPage));
		
		paramMap.put("rowCount", rowCount);
		paramMap.put("scopeRow", pageMap.getInt("scopeRow"));
		
		try {
			eventList = eventService.geteventList(paramMap);
			resultExchangeList = eventService.getExchangeList();
		} catch (Exception e) {
			logger.error("게시물 조회 오류 : {}", e);
		}
		
		model.addAttribute("eventList", eventList);
		model.addAttribute("resultExchangeList", resultExchangeList);
		model.addAttribute("pageInfo", pageMap);
		model.addAttribute("searchEventname", searchEventname);
		model.addAttribute("searchExchange", searchExchange);
		model.addAttribute("stdate", stdate);
		model.addAttribute("eddate", eddate);
		
		
		logger.info("이벤트 이름 테스트 : {}", searchEventname);
		logger.info("거래소 테스트 : {}", searchExchange);
		logger.info("stdate 테스트 : {}", stdate);
		logger.info("eddate 테스트 : {}", eddate);
		logger.info("model 테스트 : {}", model);
		
		HttpUtil.getParams(paramMap, model);
		return "/event/eventManagement";
	}
	
	/**************************************************
	* @MethodName : eventRegistration
	* @Description: 이벤트 등록 페이지
	* @param request, model, response
	* @return String
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	@RequestMapping(value="/eventRegistration", method = {RequestMethod.GET, RequestMethod.POST})
	public String callEventRegistration(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {
		List<CamelMap> resultExchangeList = new ArrayList<CamelMap>();
		List<CamelMap> TicketList = new ArrayList<CamelMap>();
		
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		
		
		try {
			
			//logger.info("eventList : {}", eventList);
			resultExchangeList = eventService.getExchangeList();
			TicketList = eventService.getTicketList(paramMap);
		} catch (Exception e) {
			logger.error("게시물 조회 오류 : {}", e);
		}
		
		model.addAttribute("resultExchangeList", resultExchangeList);
		model.addAttribute("TicketList", TicketList);
		
		logger.info("이용권 테스트: {}", TicketList);
		
		HttpUtil.getParams(paramMap, model);
		return "/event/eventRegistration";
	}
	
	/**************************************************
	* @MethodName : ajaxeventSave
	* @Description: 이벤트 저장
	* @param request, model
	* @return String
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	@RequestMapping(value = { "/ajaxeventSave" }, method = {RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Model ajaxeventSave(HttpServletRequest request, Model model) {
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		logger.info("paramMap 테스트 : {}", paramMap);
		String EventPeriods = paramMap.getString("EventPeriodS");
		
		boolean sw = false;
		int result = 0;
		logger.info("EventPeriodS 테스트 : {}", EventPeriods);
		try {
			result = this.eventService.SaveEvent(paramMap);
			sw = (result==1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("sw", sw);
		return model;
	}
	
	/**************************************************
	* @MethodName : ajaxDelete
	* @Description: 이벤트 삭제
	* @param request
	* @param response
	* @param model
	* @return Model
	* @throws IOException
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 1. 31.
	**************************************************/
	@RequestMapping(value = {"/ajaxDelete"}, method = RequestMethod.POST)
	@ResponseBody
    public Model ajaxDelete(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		
		boolean sw = false;
		
		try {
			sw = this.eventService.deleteEvent(paramMap);
		} catch (Exception e) {
			logger.error("공지사항 삭제 오류 : {}", e);
		}
		
		model.addAttribute("sw", sw);
		
		return model;
	}
	
	/**************************************************
	* @MethodName : ajaxeventUpdate
	* @Description: 이벤트 변경
	* @param request, model
	* @return String
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/

	@RequestMapping(value = { "/ajaxeventUpdate" }, method = {RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Model ajaxeventUpdate(HttpServletRequest request, Model model) {
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		logger.info("paramMap 테스트 : {}", paramMap);
		
		boolean sw = false;
		int result = 0;
		
		try {
			result = this.eventService.UpdateEvent(paramMap);
			sw = (result==1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("sw", sw);
		return model;
	}
	
}