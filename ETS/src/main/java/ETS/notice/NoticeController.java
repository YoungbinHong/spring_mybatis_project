package ETS.notice;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
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

import ETS.common.service.CommonService;
import ETS.common.util.CamelMap;
import ETS.common.util.DataMap;
import ETS.common.util.HttpUtil;
import ETS.common.util.Paging;
import ETS.notice.service.NoticeService;

/**************************************************
* @FileName   : NoticeController.java
* @Description: 게시판 관리 페이지 컨트롤러
* @Author     : Seung-Jun. Kim
* @Version    : 2020. 1. 29.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

@Controller
@RequestMapping("notice")
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private CommonService commonService;
	
	private static CamelMap noticeInfo2 = new CamelMap();
	
	/**************************************************
	* @MethodName : getBoardNotice
	* @Description: 공지사항 관리
	* @param request
	* @param model
	* @param response
	* @return String
	* @throws Exception
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 1. 29.
	**************************************************/
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/notice", method = {RequestMethod.GET, RequestMethod.POST})
	public String getBoardNotice(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {
		
		List<CamelMap> resultList = new ArrayList<CamelMap>();
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		String searchText = paramMap.getString("searchText");
		String stdate = paramMap.getString("stdate");
		String eddate = paramMap.getString("eddate");
		String listNum = paramMap.getString("listNum");
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		String format_time1 = format1.format (System.currentTimeMillis());

		if (StringUtils.isNotEmpty(eddate)) {
			String time = " 23:59:59";
			eddate = eddate + time;
		}
		else {
			eddate = format_time1;
		}
		
		paramMap.put("eddate", eddate);
		
		System.out.println("!!!!!!!!!!!!");
		logger.info("검색 테스트: {}", paramMap);
		logger.info("listNum: {}", listNum);
		logger.info("eddate: {}", eddate);
		logger.info("stdate: {}", stdate);
		
		
		int rowMax = 0;
		int pageCount = 10;
		int rowCount = 10;
		
		
		String nowPage = paramMap.getString("nowPage");
		
		
		if (StringUtils.isEmpty(nowPage)) {
			nowPage = "1";
		}

		paramMap.put("nowPage", nowPage);
		
		if(listNum.equals("ten")) {
			rowCount = 10;
		}
		if(listNum.equals("tw")) {
			rowCount = 20;
			System.out.println("aaaaaaaaaaaaaa");
		}
		if(listNum.equals("tt")) {
			rowCount = 30;
		}
		if(listNum.equals("ft")) {
			rowCount = 50;
		}
		if(listNum.equals("hd")) {
			rowCount = 100;
		}
		if(listNum.equals("th")) {
			rowCount = 200;
		}


		//rowMax
		try {
			rowMax = noticeService.getNoticeListCount(paramMap);
			logger.info("rowMax : {}",rowMax);
		} catch (Exception e) {
			logger.error("게시물 갯수 조회 오류 : {}", e);
		}
		
		//페이지 정보
		DataMap pageMap = Paging.initDataMapPage(rowMax, pageCount, rowCount, Integer.parseInt(nowPage));
		logger.info("pageMap22222 : {}",pageMap);
		logger.info("paramMap22222 : {}",paramMap);
		
		paramMap.put("rowCount", rowCount);
		paramMap.put("scopeRow", pageMap.getInt("scopeRow"));
		paramMap.put("stdate", stdate);
		paramMap.put("eddate", eddate);
		//if(param != "") {
		//	paramMap.put("searchText", param);			
		//}
		
		try {
			resultList = noticeService.getNoticeList(paramMap);
			logger.info("resultList 테스트2 : {}", resultList.size());
			
		} catch (Exception e) {
			logger.error("게시물 조회 오류 : {}", e);
		}
		logger.info("resultList 테스트 : {}", resultList);
		logger.info("resultList 길이 : {}", resultList.size());
		logger.info("pageMap : {}",pageMap);
		model.addAttribute("resultList", resultList);
		model.addAttribute("pageInfo", pageMap);
		model.addAttribute("searchText",searchText);
    	model.addAttribute("stdate",stdate);
    	model.addAttribute("eddate",eddate);
    	model.addAttribute("listNum",listNum);	
        
		HttpUtil.getParams(paramMap, model);
		
		return "/notice/notice";
	}
	
	/**************************************************
	* @MethodName : getBoardNoticeView
	* @Description: 공지사항 상세보기
	* @param request
	* @param model
	* @param response
	* @return String
	* @throws Exception
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 1. 31.
	**************************************************/
	@RequestMapping(value = "/noticeView", method = {RequestMethod.GET, RequestMethod.POST})
	public String getBoardNoticeView(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		logger.info("paramMap 테스트1: {}",paramMap);
		CamelMap noticeInfo;
		try {
			noticeInfo = this.noticeService.getNoticeView(paramMap);
			logger.info("noticeInfo 테스트2: {}",noticeInfo);
			
		} catch (SQLException e) {
			noticeInfo = new CamelMap();
			logger.debug("notice read", e);
		}
		model.addAttribute("noticeInfo", noticeInfo);
		
		return "/notice/noticeView";
	}
	
	
	/**************************************************
	* @MethodName : getBoardNoticeView2
	* @Description: 공지사항 상세보기
	* @param request
	* @param model
	* @param response
	* @return String
	* @throws Exception
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 1. 31.
	**************************************************/
	@RequestMapping(value = "/noticeView2", method = {RequestMethod.GET, RequestMethod.POST})
	public CamelMap getBoardNoticeView2(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		logger.info("paramMap 테스트1: {}",paramMap);
		CamelMap noticeInfo;
		try {
			noticeInfo = this.noticeService.getNoticeView(paramMap);
			logger.info("noticeInfo 테스트2: {}",noticeInfo);
			
		} catch (SQLException e) {
			noticeInfo = new CamelMap();
			logger.debug("notice read", e);
		}
		model.addAttribute("noticeInfo", noticeInfo);
		
		return noticeInfo;
	}
	
	@RequestMapping(value="/testForm", method=RequestMethod.GET)
	public String testForm(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		logger.info("paramMap 테스트1: {}",paramMap);
		CamelMap noticeInfo;
		try {
			noticeInfo = this.noticeService.getNoticeView(paramMap);
			logger.info("noticeInfo 테스트2: {}",noticeInfo);
			
		} catch (SQLException e) {
			noticeInfo = new CamelMap();
			logger.debug("notice read", e);
		}
		model.addAttribute("noticeInfo", noticeInfo);
		
		return "/notice/noticeModal";
	}

	
	/**************************************************
	* @MethodName : getBoardNoticeModal
	* @Description: 공지사항 상세보기
	* @param request
	* @param model
	* @param response
	* @return String
	* @throws Exception
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 1. 31.
	**************************************************/
	@RequestMapping(value = "/noticeModal", method = {RequestMethod.GET, RequestMethod.POST})
	public String getBoardNoticeModal(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		logger.info("paramMap 테스트1: {}",paramMap);
		CamelMap noticeInfo;
		int noticeviewcount;
		try {
			noticeInfo = this.noticeService.getNoticeView(paramMap);
			logger.info("noticeInfo 테스트2: {}",noticeInfo);
			
		} catch (SQLException e) {
			noticeInfo = new CamelMap();
			logger.debug("notice read", e);
		}
		model.addAttribute("noticeInfo", noticeInfo);
		System.out.println("@@@@@@@@@@@@");
		noticeInfo2 = noticeInfo;
		logger.info("noticeSeq : {}",paramMap.getString("noticeSeq"));
		model.addAttribute("noticeSeq",paramMap.getString("noticeSeq"));
		noticeviewcount = this.noticeService.updateNoticeViewCount(paramMap);
		return "/notice/noticeModal";
	}
	
	
	/**************************************************
	* @MethodName : getBoardNoticeModalView
	* @Description: 공지사항 상세보기
	* @param request
	* @param model
	* @param response
	* @return String
	* @throws Exception
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 1. 31.
	**************************************************/
	@RequestMapping(value = "/noticeModalView", method = {RequestMethod.GET, RequestMethod.POST})
	public String getBoardNoticeModalView(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {
		
		model.addAttribute("noticeInfo",noticeInfo2);
		return "/notice/noticeModal";
	}
	
	/**************************************************
	* @MethodName : getBoardNoticePreview
	* @Description: 공지사항 상세보기
	* @param request
	* @param model
	* @param response
	* @return String
	* @throws Exception
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 1. 31.
	**************************************************/
	@RequestMapping(value = "/noticePreview", method = {RequestMethod.GET, RequestMethod.POST})
	public String getBoardNoticePreview(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {
	
		return "/notice/noticePreview";
	}
	
	/**************************************************
	* @MethodName : getBoardNoticeWrite
	* @Description: 공지사항 등록화면
	* @param request
	* @param model
	* @param response
	* @return String
	* @throws Exception
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 2. 4.
	**************************************************/
	@RequestMapping(value = "/noticeWrite", method = {RequestMethod.GET, RequestMethod.POST})
	public String getBoardNoticeWrite(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {
		
		CamelMap noticeInfo = new CamelMap();
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		String noticeSeq = null;
		//String noticeSeq = paramMap.getString("noticeSeq");
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies) {
			if("modalNoticeSeq".equals(cookie.getName())) {
				noticeSeq = cookie.getValue();
			}
		}
		paramMap.put("noticeSeq", noticeSeq);
		//String crud = "INS";
		
		//if (StringUtils.isNotEmpty(noticeSeq)) crud = "MOD";
		
		String crud = "MOD";
		try {
			if ("MOD".equals(crud)) {
				noticeInfo = noticeService.getNoticeView(paramMap);
				System.out.println("$$$$$$$$$$$");
				logger.info("noticeInfo : {}",noticeInfo);
			}
		} catch (Exception e) {
			logger.error("게시물 조회 오류 : {}", e);
		}
		
		model.addAttribute("noticeInfo", noticeInfo);
		model.addAttribute("crud", crud);
		
		HttpUtil.getParams(paramMap, model);
		System.out.println("aaa");
		
		return "/notice/noticeWrite";
	}
	
	/**************************************************
	* @MethodName : callTelegramTransmission
	* @Description: 텔레그램 발송
	* @param 
	* @return String
	* @Author     : Youngbin Hong
	* @Version    : 2020. 8. 14.
	**************************************************/
	@RequestMapping(value="/telegramTransmission")
	public String callTelegramTransmission() {
		return "/notice/telegramTransmission";
	}
	
	/**************************************************
	* @MethodName : ajaxNoticeSubmit
	* @Description: 공지사항 등록
	* @param request
	* @param model
	* @return Model
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 2. 4.
	**************************************************/
	@SuppressWarnings("unchecked")
	@RequestMapping(value = { "/ajaxNoticeSubmit" }, method = {RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Model ajaxNoticeSubmit(HttpServletRequest request, Model model) {
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		
		boolean sw = false;
		int result = 0;
		
		Cookie[] cookies = request.getCookies(); // 저장된 쿠키들을 담기위한 배열
	    Cookie cookie = null;
	
        // 저장되어 있는 쿠키 배열 검색
        for(Cookie c: cookies){
            System.out.println("cookie name: "+c.getName());
            System.out.println("cookie value: "+c.getValue());

            // 쿠키의 이름이 "memberId"와 같으면 cookie에 그 정보를 담아라.
            if(c.getName().equals("username")){
                paramMap.put("id", c.getValue());
            }
        }
		
		paramMap.put("filePath", "BOARD");
		paramMap.put("imgNm", "");
		
		System.out.println("###########");
		logger.info("paramMap : {}", paramMap);
		
		List<DataMap> rstFileList = null;
		
		try {
			rstFileList = commonService.saveFile(request, paramMap);
			for (DataMap fileMap : rstFileList) {
				
				logger.info("fileMap : {}", fileMap);
				paramMap.put("imgNm", fileMap.get("saveFilePath") + "/" + fileMap.get("saveFileName"));
				paramMap.put("orgImgNm", fileMap.get("realFileName"));
			}
			
			if(paramMap.get("fix")== null) {
				paramMap.put("fix", 0);
			}
			
			if (!"MOD".equals(paramMap.getString("crud"))){
				result = this.noticeService.insertNotice(paramMap);
			} else {
				result = this.noticeService.updateNotice(paramMap);
			}
			
			sw = (result==1);
		} catch (Exception e1) {
			logger.debug("공지사항 저장 오류", e1);
		}
		model.addAttribute("sw", sw);
		return model;
	}
	
	/**************************************************
	* @MethodName : ajaxNoticeDelete
	* @Description: 공지사항 삭제
	* @param request
	* @param response
	* @param model
	* @return Model
	* @throws IOException
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 1. 31.
	**************************************************/
	@RequestMapping(value = {"/ajaxNoticeDelete"}, method = RequestMethod.POST)
	@ResponseBody
    public Model ajaxNoticeDelete(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		System.out.println("ppppppppppppppppp");
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		
		boolean sw = false;

		logger.info("삭제 데이터 확인 : {}", paramMap);
		
		try {
			sw = this.noticeService.deleteNotice(paramMap);
		} catch (Exception e) {
			logger.error("공지사항 삭제 오류 : {}", e);
		}
		
		model.addAttribute("sw", sw);
		
		return model;
	}
	
	/**************************************************
	* @MethodName : getUserList
	* @Description: 롤링 공지
	* @param request
	* @param response
	* @param model
	* @return Model
	* @throws IOException
	* @Author     : Seung-Jun. Kim
	* @Version    : 알 수 없음
	**************************************************/
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/rollingNotice", method = {RequestMethod.GET, RequestMethod.POST})
	public String getUserList(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {
		
		List<CamelMap> resultList = new ArrayList<CamelMap>();
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		
		String searchText = paramMap.getString("searchText");
		String stdate = paramMap.getString("stdate");
		String eddate = paramMap.getString("eddate");
		
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
			rowMax = noticeService.getRollingListCount(paramMap);
		} catch (Exception e) {
			logger.error("조회 오류 : {}", e);
		}
		
		//페이지 정보
		DataMap pageMap = Paging.initDataMapPage(rowMax, pageCount, rowCount, Integer.parseInt(nowPage));
		
		paramMap.put("rowCount", rowCount);
		paramMap.put("scopeRow", pageMap.getInt("scopeRow"));
		
		paramMap.put("searchText", searchText);
		paramMap.put("stdate", stdate);
		paramMap.put("eddate", eddate);
		
		try {
			resultList = noticeService.getRollingList(paramMap);
			
		} catch (Exception e) {
			logger.error("조회 오류 : {}", e);
		}
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("pageInfo", pageMap);
		model.addAttribute("searchText",searchText);
		model.addAttribute("stdate",stdate);
		model.addAttribute("eddate",eddate);
		
		HttpUtil.getParams(paramMap, model);
		
		return "/notice/rollingNotice";
	}
	
	/**************************************************
	* @MethodName : ajaxRollingDelete
	* @Description: 롤링 공지 삭제
	* @param request
	* @param response
	* @param model
	* @return Model
	* @throws IOException
	* @Author     : Seung-Jun. Kim
	* @Version    : 알 수 없음
	**************************************************/
	
	@RequestMapping(value = {"/ajaxRollingDelete"}, method = RequestMethod.POST)
	@ResponseBody
    public Model ajaxRollingDelete(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		
		boolean sw = false;
		
		try {
			sw = this.noticeService.deleteRolling(paramMap);
		} catch (Exception e) {
			logger.error("공지사항 삭제 오류 : {}", e);
		}
		
		model.addAttribute("sw", sw);
		
		return model;
	}
	
	/**************************************************
	* @MethodName : ajaxRollingSubmit
	* @Description: 롤링 공지 등록
	* @param request
	* @param response
	* @param model
	* @return Model
	* @throws IOException
	* @Author     : Seung-Jun. Kim
	* @Version    : 알 수 없음
	**************************************************/
	
	@RequestMapping(value = { "/ajaxRollingSubmit" }, method = {RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Model ajaxRollingSubmit(HttpServletRequest request, Model model) {
		DataMap paramMap = HttpUtil.getRequestDataMap(request);

		boolean sw = false;
		int result = 0;
		
		try {
			result = this.noticeService.insertRolling(paramMap);
			sw = (result==1);
		} catch (Exception e1) {
			logger.debug("공지사항 저장 오류", e1);
		}
		model.addAttribute("sw", sw);
		
		return model;
	}
	
}