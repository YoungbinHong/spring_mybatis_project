package ETS.log;

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

import ETS.common.util.CamelMap;
import ETS.common.util.DataMap;
import ETS.common.util.HttpUtil;
import ETS.common.util.Paging;
import ETS.log.service.ConnectLogService;

/**
 * @author hyngsk
 *
 */
@Controller
@RequestMapping("log")
public class ConnectLogController {
	private static final Logger logger = LoggerFactory.getLogger(ConnectLogController.class);

	@Autowired
	private ConnectLogService connectLogService;
	
	
	/**
	 * @param request
	 * @param model
	 * @param response
	 * @return URL
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/connectLog", method = { RequestMethod.GET, RequestMethod.POST })
	public String getConnectLogList(HttpServletRequest request, Model model, HttpServletResponse response) {
		List<CamelMap> resultList = new ArrayList<CamelMap>();
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		
		String searchText = paramMap.getString("searchText");
		String searchType = paramMap.getString("searchType");
		String startDt = paramMap.getString("startDt");
		String endDt = paramMap.getString("endDt");
		
		
		logger.info("searchKeyword : {}, searchType : {}, startDT : {}, endDT : {}",searchText, searchType, startDt, endDt);
		
		int rowMax = 0;
		int pageCount = 10;
		int rowCount;
		logger.info("row count : {}", paramMap.getString("rowCount"));
		if (StringUtils.isNotEmpty(paramMap.getString("rowCount"))||
				StringUtils.isNotEmpty(paramMap.getString("searchType"))) {
			rowCount = paramMap.getInt("rowCount");
			searchType = paramMap.getString("searchType");
		}
		else {
			rowCount = 20;
			searchType = "all";
		}
		logger.info("row count changed : {}", paramMap.getString("rowCount"));
		
		
		String nowPage = paramMap.getString("nowPage");
		
		if (StringUtils.isEmpty(nowPage)) {
			nowPage = "1";
		}
		
		paramMap.put("rowCount", rowCount);
		paramMap.put("nowPage", nowPage);

		//rowMax
		try {
			rowMax = connectLogService.getLogListCount(paramMap);
			logger.info("게시물 갯수는 : {}", rowMax);
		} catch (Exception e) {
			logger.error("게시물 갯수 조회 오류 : {}", e);
		}
		
		//페이지 정보
		
		DataMap pageMap = Paging.initDataMapPage(rowMax, pageCount, rowCount, Integer.parseInt(nowPage));
		logger.info("raw row count : {}", rowCount);
		logger.info("param row count : {}", paramMap.getString("rowCount"));
		logger.info("pageInfo row count : {}", pageMap.getString("rowCount"));
		paramMap.put("rowCount", pageMap.getInt("rowCount"));
		paramMap.put("scopeRow", pageMap.getInt("scopeRow"));
		
		try {
			resultList = connectLogService.getLogList(paramMap);
			logger.info("resultList : {}", resultList.toArray());
			
		} catch (Exception e) {
			logger.error("게시물 조회 오류 : {}", e);
		}
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("pageInfo", pageMap);
		model.addAttribute("searchText", searchText);
		model.addAttribute("searchType", searchType);
		model.addAttribute("startDt", startDt);
		model.addAttribute("endDt", endDt);
		logger.info("검색어 타입 테스트 : {}", searchType);
		logger.info("검색어 테스트 : {}", searchText);
		logger.info("startDt 테스트 : {}", startDt);
		logger.info("endDt 테스트 : {}", endDt);
		logger.info("row count : {}", rowCount);
		logger.info("------------------------------------page reloaded------------------------------------");
		HttpUtil.getParams(paramMap, model);
		
		return "/log/connectLog";
	}

}
