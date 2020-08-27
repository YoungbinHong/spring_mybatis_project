/*
 * @(#)PagingAction.java $version 2011. 11. 17.
 *
 * Copyright 2010 CoreMed Corp. All rights Reserved. 
 * CoreMed PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */

package daesang.common.taglib;

import java.io.IOException;

import javax.servlet.jsp.tagext.TagSupport;

/**
 * @author joon
 * @version 2011. 11. 17.
 */
public final class PagingAction extends TagSupport {
	private static final long serialVersionUID = 6413561626844723724L;

	public static final int START_PAGENUM = 1;
	
	private String url; // 페이지 클릭시 이동할 url
	private String pageCount; // [설정] 한번에 보여줄 페이지 갯수
	private String rowCount; // [설정] 한페이지당 row수
	private String rowMax; // 총 row수
	private String nowPage; // 현재 선택한 페이지
	
	private String params; // 추가 param list

	/** {@inheritDoc} */
	@Override
	public int doStartTag() {
		try {			
			pageContext.getOut().print(makePageHTML());
		} catch (IOException e) {
			
		}		
		
		return SKIP_BODY;		
	}
	
	/**
	 * Page HTML 만들기
	 * @return
	 */
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
			sb.append("<div class='pagination mgt50'>");
			sb.append(getAHref(1, "prev"));
		
			// 2. -10 page
//			if(startPage - 1 > 1){
//				sb.append(getAHref(startPage-1, "◁"));				
//			}
						
			// 3. 1...10
			@SuppressWarnings("unused")
			String css = "";
			for(int i = startPage; i <= endPage; i++){
				sb.append(getAHref(i, String.valueOf(i)));
			}
			
			// 4. +10 page
//			if(endPage + 1 <= maxPage){
//				sb.append(getAHref(endPage + 1, "▷"));
//			}
			
			// 5. last page
			sb.append(getAHref(maxPage, "next"));
			sb.append("</div>\n");
			
			// 6. script
			sb.append(getScript());
		}
		return sb.toString();
	}
	
	/**
	 * make <a href>
	 * @param nPage
	 * @param title
	 * @return
	 */
	private String getAHref(int nPage, String title){
		String css = "";
		
		if(nowPage.equals(title)){
			css = "class='active'";
		} else if("prev".equals(title)){
			css = "class='prev'";
		} else if("next".equals(title)){
			css = "class='next'";
		}
		
		StringBuilder sb = new StringBuilder();

		sb.append("<a href='#none' onClick='goPage(").append(nPage).append(")' ").append(css).append(" >");		
		sb.append(title);
		sb.append("</a>\n");
		
		return sb.toString();
	}
	
	
	/**
	 * make Script for paging 
	 * @return
	 */
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

	public void setUrl(String url) {
		this.url = url;
	}

	public void setPageCount(String pageCount) {
		this.pageCount = pageCount;
	}

	public void setRowCount(String rowCount) {
		this.rowCount = rowCount;
	}

	public void setRowMax(String rowMax) {
		this.rowMax = rowMax;
	}

	public void setNowPage(String nowPage) {
		this.nowPage = nowPage;
	}

	public void setParams(String params) {
		this.params = params;
	}	
}
