package ETS.common.taglib;

import java.io.IOException;

import javax.servlet.jsp.tagext.TagSupport;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**************************************************
* @FileName   : PagingAction.java
* @Description: 알 수 없음
* @Author     : joon
* @Version    : 2011. 11. 17.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

public final class PagingAction extends TagSupport {
	private static final long serialVersionUID = 6413561626844723724L;
	private static final Logger logger= LoggerFactory.getLogger(PagingAction.class);
	public static final int START_PAGENUM = 1;
	
	private String url; // 페이지 클릭시 이동할 url
	private String pageCount; // [설정] 한번에 보여줄 페이지 갯수
	private String rowCount; // [설정] 한페이지당 row수
	private String rowMax; // 총 row수
	private String nowPage; // 현재 선택한 페이지
	private String params; // 추가 param list
	
	/** {@inheritDoc} **/
	
	/**************************************************
	* @MethodName : doStartTag
	* @Description: 알 수 없음
	* @return int
	* @Author     : joon
	* @Version    : 2011. 11. 17.
	**************************************************/
	@Override
	public int doStartTag() {
		try {			
			pageContext.getOut().print(makePageHTML());
		} catch (IOException e) {
			
		}		
		
		return SKIP_BODY;		
	}
	
	/**************************************************
	* @MethodName : makePageHTML
	* @Description: Page HTML 만들기
	* @return String
	* @Author     : joon
	* @Version    : 2011. 11. 17.
	**************************************************/
	public String makePageHTML(){
		
		StringBuilder sb = new StringBuilder();
		int pCount = Integer.parseInt(pageCount);
		int rCount = Integer.parseInt(rowCount);
		int rMax = Integer.parseInt(rowMax);
		int nPage = Integer.parseInt(nowPage);
				
		if(pCount > 0 && rCount > 0 && rMax > 0 && nPage > 0){
			// 총 페이지 수
			int maxPage = rMax / rCount + (int)(Math.ceil(rMax % rCount / (double)rCount));
			
			int startPage = 1;
			int endPage = pCount;
			
			startPage = 1 + (pCount * (nPage / pCount - ((nPage % pCount == 0) ? 1 : 0)));
						
			endPage = startPage + pCount - 1;
			
			if(endPage > maxPage) endPage = maxPage;
						
			// 1. start page
			sb.append("<ul class='pagination justify-content-center'>");
			//sb.append(getAHref(1, "start"));
		
			// 2. -10 page
			if(startPage - 1 > 1){
				sb.append(getAHref(startPage-1, "prev"));
			}
						
			// 3. 1...10
			@SuppressWarnings("unused")
			String css = "";
			for(int i = startPage; i <= endPage; i++){
				sb.append(getAHref(i, String.valueOf(i)));
			}
			
			// 4. +10 page
			if(endPage + 1 <= maxPage){
				sb.append(getAHref(endPage + 1, "next"));
			}
			
			// 5. last page
			//sb.append(getAHref(maxPage, "end"));
			sb.append("</ul>\n");
			
			// 6. script
			sb.append(getScript());
		}
		return sb.toString();
	}
	
	/**************************************************
	* @MethodName : getAHref
	* @Description: make <a href>
	* @param nPage, title
	* @return String
	* @Author     : joon
	* @Version    : 2011. 11. 17.
	**************************************************/
	private String getAHref(int nPage, String title){
		String css = "";
		
		if(nowPage.equals(title)){
			css = " active";
		}
		
		StringBuilder sb = new StringBuilder();
		
		if("start".equals(title)){
			
		} else if("prev".equals(title)){
			sb.append("<li class='page-item'><a class='page-link' aria-label='Previous' href='#' onClick='goPage(").append(nPage).append(")'  ><span aria-hidden='true'>&laquo;</span><span class='sr-only'>Previous</span></a></li>");
		} else if("next".equals(title)){
			sb.append("<li class='page-item'><a class='page-link' aria-label='Next' href='#' onClick='goPage(").append(nPage).append(")'  ><span aria-hidden='true'>&raquo;</span><span class='sr-only'>Next</span></a></li>");
		} else if("end".equals(title)){
			
		} else {
			sb.append("<li class='page-item").append(css).append("'><a class='page-link' href='#' onClick='goPage(").append(nPage).append(")'>");		
			sb.append(title);
			sb.append("</a></li>\n");
		}
		
		return sb.toString();
	}
	
	/**************************************************
	* @MethodName : getScript
	* @Description: make Script for paging
	* @return String
	* @Author     : joon
	* @Version    : 2011. 11. 17.
	**************************************************/
	private String getScript(){
		StringBuilder sb = new StringBuilder();
		
		sb.append("<form id='frmPage' method='post' action='").append(url).append("'>\n");
		sb.append("<input type='hidden' name='pageCount' value='").append(pageCount).append("'>\n");
		sb.append("<input type='hidden' name='rowCount' value='").append(rowCount).append("'>\n");
		sb.append("<input type='hidden' name='rowMax' value='").append(rowMax).append("'>\n");
		sb.append("<input type='hidden' id='nowPage' name='nowPage' value='").append(nowPage).append("'>\n");
		
		if(params != null){
			String[] paramList = params.split("&");
			for(int i = 0; i < paramList.length; i++){
				String[] property = paramList[i].split("=");
				
				if(property.length > 1){
					sb.append("<input type='hidden' name='").append(property[0]).append("'");
					sb.append(" value='").append(property[1]).append("'>\n");
					logger.info("parameter tage is {}", sb);
				}
			}
		}
		
		sb.append("</form>\n");
		
		sb.append("<script type='text/javascript'>\n");
		sb.append("function goPage(pageNum){\n");
		sb.append("var frmPage = document.getElementById('frmPage');\n");
		sb.append("var nowPageObj = frmPage['nowPage'];\n");
		sb.append("nowPageObj.value=pageNum;\n");
		sb.append("frmPage.submit();\n");				
		sb.append("}\n");
		sb.append("</script>\n");
		
		return sb.toString();
	}
	
	/**************************************************
	* @MethodName : setUrl
	* @Description: 알 수 없음
	* @param url
	* @Author     : joon
	* @Version    : 2011. 11. 17.
	**************************************************/
	public void setUrl(String url) {
		this.url = url;
	}
	
	/**************************************************
	* @MethodName : setPageCount
	* @Description: 알 수 없음
	* @param pageCount
	* @Author     : joon
	* @Version    : 2011. 11. 17.
	**************************************************/
	public void setPageCount(String pageCount) {
		this.pageCount = pageCount;
	}
	
	/**************************************************
	* @MethodName : setRowCount
	* @Description: 알 수 없음
	* @param rowCount
	* @Author     : joon
	* @Version    : 2011. 11. 17.
	**************************************************/
	public void setRowCount(String rowCount) {
		this.rowCount = rowCount;
	}
	
	/**************************************************
	* @MethodName : setRowMax
	* @Description: 알 수 없음
	* @param rowMax
	* @Author     : joon
	* @Version    : 2011. 11. 17.
	**************************************************/
	public void setRowMax(String rowMax) {
		this.rowMax = rowMax;
	}
	
	/**************************************************
	* @MethodName : setNowPage
	* @Description: 알 수 없음
	* @param nowPage
	* @Author     : joon
	* @Version    : 2011. 11. 17.
	**************************************************/
	public void setNowPage(String nowPage) {
		this.nowPage = nowPage;
	}
	
	/**************************************************
	* @MethodName : setParams
	* @Description: 알 수 없음
	* @param params
	* @Author     : joon
	* @Version    : 2011. 11. 17.
	**************************************************/
	public void setParams(String params) {
		this.params = params;
	}
	
}
