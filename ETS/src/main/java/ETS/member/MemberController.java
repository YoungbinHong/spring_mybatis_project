package ETS.member;

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
import ETS.common.util.Paging;
import ETS.common.util.http.HttpUtil;
import ETS.member.service.MemberService;

/**************************************************
* @FileName   : MemberController.java
* @Description: 회원 관리 페이지 컨트롤러
* @Author     : Youngbin Hong
* @Version    : 2020. 8. 14.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

@Controller
@RequestMapping("member")
public class MemberController{
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	/**************************************************
	* @MethodName : showMember
	* @Description: 회원 목록 명세
	* @param request
	* @param model
	* @param response
	* @return String
	* @throws Exception
	* @Author     : Youngbin Hong
	* @Version    : 2020. 8. 14.
	**************************************************/
	@SuppressWarnings({"unchecked", "unchecked"})
	@RequestMapping(value="/member", method= {RequestMethod.GET, RequestMethod.POST})
	public String showMember(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {
		
		List<CamelMap> resultList = new ArrayList<CamelMap>();
		
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		
		// Model 을 위한 String 선언
		String searchID = paramMap.getString("searchID");
		String searchTelegramID = paramMap.getString("searchTelegramID");
		String voucherType = paramMap.getString("voucherType");
		String searchType2 = paramMap.getString("searchType2");
	
		// 페이징 처리
		String nowPage = paramMap.getString("nowPage");
		String listNum = paramMap.getString("listNum");
		
		int rowMax = 0;
		int pageCount = 10;
		int rowCount = 20;
		
		if (StringUtils.isEmpty(nowPage)) {
			nowPage = "1";
		}
		paramMap.put("nowPage", nowPage);
		
		if(listNum.equals("tw")) {
			rowCount = 20;
		}
		if(listNum.equals("tt")) {
			rowCount = 30;
		}
		if(listNum.equals("ft")) {
			rowCount = 50;
		}
		if(listNum.equals("st")) {
			rowCount = 70;
		}
		if(listNum.equals("hd")) {
			rowCount = 100;
		}
		if(listNum.equals("th")) {
			rowCount = 200;
		}
		
		//rowMax
		try {
			rowMax = memberService.showMemberCount(paramMap);
			logger.info("rowMax : {}",rowMax);
		} catch (Exception e) {
			logger.error("게시물 갯수 조회 오류 : {}", e);
		}
		
		//pageInfo
		DataMap pageMap = Paging.initDataMapPage(rowMax, pageCount, rowCount, Integer.parseInt(nowPage));
		
		paramMap.put("rowCount", rowCount);
		paramMap.put("scopeRow", pageMap.getInt("scopeRow"));
		
		// ResultList
		resultList = memberService.showMember(paramMap);
		
		// Model에 Attribute 추가
		model.addAttribute("resultList", resultList);
		
		model.addAttribute("searchID", searchID);
		model.addAttribute("searchTelegramID", searchTelegramID);
		model.addAttribute("voucherType", voucherType);
		model.addAttribute("searchType2", searchType2);
		
		model.addAttribute("pageInfo", pageMap);
		model.addAttribute("listNum",listNum);
		
		HttpUtil.getParams(paramMap, model);
		
		return "member/member";
	}
	
	/**************************************************
	* @MethodName : showNormalOrder
	* @Description: 일반주문 명세
	* @param request
	* @param model
	* @param response
	* @return String
	* @throws Exception 
	* @Author     : Youngbin Hong
	* @Version    : 2020. 8. 26.
	**************************************************/
	public void showNormalOrder(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {
		
		List<CamelMap> normalOrderList = new ArrayList<CamelMap>();
		
		DataMap paramMap = HttpUtil.getRequestDataMap(request);
		
		normalOrderList = memberService.showNormalOrder(paramMap);
		
		model.addAttribute("normalOrderList", normalOrderList);
		
		HttpUtil.getParams(paramMap, model);
		
	}
	
}