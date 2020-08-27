package ETS.payment;

import ETS.payment.service.PaymentService;
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
//import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseBody;

/**************************************************
* @FileName   : PaymentController.java
* @Description: 결제 관리 컨트롤러
* @Author     : Youngbin Hong
* @Version    : 2020. 8. 14.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

@Controller
@RequestMapping("payment")
public class PaymentController {
	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	@Autowired
	private PaymentService paymentService;
	
	/**************************************************
	* @MethodName : getVoucherManagement
	* @Description: 이용권 관리 목록 명세
	* @param request, model, response
	* @return String
	* @throws Exception
	* @Author     : Youngbin Hong
	* @Version    : 2020. 8. 14.
	**************************************************/
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/voucherManagement", method = {RequestMethod.GET, RequestMethod.POST})
	public String getVoucherManagement(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {
		List<CamelMap> resultUseTicketList = new ArrayList<CamelMap>();
		List<CamelMap> resultExchangeList = new ArrayList<CamelMap>();
		List<CamelMap> eventList = new ArrayList<CamelMap>();
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
			rowMax = paymentService.getuseTicketListCount(paramMap);
		} catch (Exception e) {
			logger.error("이용권 리스트 오류 : {}", e);
		}
		
		//페이지 정보
		DataMap pageMap = Paging.initDataMapPage(rowMax, pageCount, rowCount, Integer.parseInt(nowPage));
		
		paramMap.put("rowCount", rowCount);
		paramMap.put("scopeRow", pageMap.getInt("scopeRow"));
		
		try {
			resultUseTicketList = paymentService.getuseTicketList(paramMap);
			resultExchangeList = paymentService.getExchangeList();
			eventList = paymentService.geteventList();
		} catch (Exception e) {
			logger.error("게시물 조회 오류 : {}", e);
		}

		model.addAttribute("eventList", eventList);
		model.addAttribute("resultUseTicketList", resultUseTicketList);
		model.addAttribute("resultExchangeList", resultExchangeList);
		model.addAttribute("pageInfo", pageMap);
		
		HttpUtil.getParams(paramMap, model);
		
		return "/payment/voucherManagement";
	}
	
	/**************************************************
	* @MethodName : ajaxuseTicketRegister
	* @Description: 이용권 등록 및 해당 이용권 이벤트 설정
	* @param request, model, response
	* @return Model
	* @throws Exception
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	@RequestMapping(value = { "/ajaxuseTicketRegister" }, method = {RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Model ajaxuseTicketRegister(HttpServletRequest request, Model model) {
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		boolean sw = false;
		int result = 0;
		String useTicketSeq = paramMap.getString("useTicketSeq");
		String UseEveSeq = paramMap.getString("UseEveSeq");
		logger.info("paramMap 테스트 : {}", paramMap);
		try {
			//seq보내는건 event등록 창  + (이용권+event)등록창
			if (StringUtils.isNotEmpty(useTicketSeq)) {
				result = this.paymentService.registerEvent(paramMap);
			}
			else {
				result = this.paymentService.registeruseTicket(paramMap);
			}
			sw = (result==1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("sw", sw);
		return model;
	}
	
	/**************************************************
	* @MethodName : ajaxuseTicketDelete
	* @Description: 이용권 삭제
	* @param request, model, response
	* @return Model
	* @throws Exception
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	@RequestMapping(value = {"/ajaxuseTicketDelete"}, method = RequestMethod.POST)
	@ResponseBody
    public Model ajaxuseTicketDelete(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		logger.info("paraMap 테스트 : {}", paramMap);
		boolean sw = false;
		
		try {
			sw = this.paymentService.deleteuseTicket(paramMap);
		} catch (Exception e) {
			logger.error("공지사항 삭제 오류 : {}", e);
		}
		
		model.addAttribute("sw", sw);
		
		return model;
	}
	
	/**************************************************
	* @MethodName : ajaxreleaseEV
	* @Description: 이용권 해제
	* @param request, model
	* @return Model
	* @throws Exception
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	@RequestMapping(value = { "/ajaxreleaseEV" }, method = {RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Model ajaxreleaseEV(HttpServletRequest request, Model model) {
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		boolean sw = false;
		int result = 0;
		
		String useTicketSeq = paramMap.getString("useTicketSeq");
		String UseEveSeq = paramMap.getString("UseEveSeq");
		logger.info("paramMap 테스트 : {}", paramMap);
		try {
			result = this.paymentService.releaseEvent(paramMap);
			sw = (result==1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("sw", sw);
		return model;
	}
	
	/**************************************************
	* @MethodName : getPaymentList
	* @Description: 알 수 없음
	* @param request, model, response
	* @return String
	* @throws Exception
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	@RequestMapping(value= "/voucherList", method = {RequestMethod.GET, RequestMethod.POST})
	public String getPaymentList(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception{
		
		List<CamelMap> resultList = new ArrayList<CamelMap>();
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		
		int rowMax = 0;
		int pageCount = 10;
		int rowCount = 10;
		
		String nowPage = paramMap.getString("nowPage");
		
		if(StringUtils.isEmpty(nowPage)) {
			nowPage = "1";
		}
		
		paramMap.put("nowPage", nowPage);
		
		rowMax = paymentService.getPaymentListCount(paramMap);
		
		DataMap pageMap = Paging.initDataMapPage(rowMax, pageCount, rowCount, Integer.parseInt(nowPage));
		
		paramMap.put("rowCount", rowCount);
		paramMap.put("scopeRow", pageMap.getInt("scopeRow"));
		
		resultList = paymentService.getPaymentList(paramMap);
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("pageInfo", pageMap);
		
		return "/payment/voucherList";
	}
	
	/**************************************************
	* @MethodName : getRefferalManage
	* @Description: 레퍼럴 관리
	* @param request, model, response
	* @return String
	* @throws Exception
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/referralManagement", method = {RequestMethod.GET, RequestMethod.POST})
	public String getRefferalManage(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {
		
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
			rowMax = paymentService.getManageListCount(paramMap);
		} catch (Exception e) {
			logger.error("게시물 갯수 조회 오류 : {}", e);
		}
		
		//페이지 정보
		DataMap pageMap = Paging.initDataMapPage(rowMax, pageCount, rowCount, Integer.parseInt(nowPage));
		
		paramMap.put("rowCount", rowCount);
		paramMap.put("scopeRow", pageMap.getInt("scopeRow"));
		
		try {
			resultList = paymentService.getManageList(paramMap);
			
		} catch (Exception e) {
			logger.error("게시물 조회 오류 : {}", e);
		}
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("pageInfo", pageMap);
		
		HttpUtil.getParams(paramMap, model);
		
		return "/payment/referralManagement";
	}
		
		
	/**************************************************
	* @MethodName : ajaxmanageSubmit
	* @Description: 레퍼럴 등록
	* @param request, model, response
	* @return Model
	* @throws Exception
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	@RequestMapping(value = { "/ajaxRefferalSubmit" }, method = {RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Model ajaxmanageSubmit(HttpServletRequest request, Model model) {
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		logger.info("paramMap : {}", paramMap);
		boolean sw = false;
		int result = 0;
		
		try {
			result = this.paymentService.insertManage(paramMap);
			sw = (result==1);
		} catch (Exception e1) {
			logger.debug("레퍼럴 저장 오류", e1);
		}
		model.addAttribute("sw", sw);
		return model;
	}
		
}
