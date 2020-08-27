package ETS.common.spring.http;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

/**************************************************
* @FileName   : RequestSnack.java
* @Description: 알 수 없음
* @Author     : Seokkyun Choi
* @Version    : 2016. 9. 21.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

public class RequestSnack {
	
	private RequestSnack() {}
	
	/**************************************************
	* @MethodName : getPathQueryString
	* @Description: 알 수 없음
	* @param request
	* @return String
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 22.
	**************************************************/
	public static String getPathQueryString(HttpServletRequest request) {
		String servlet_path = request.getServletPath();
		String query_string = request.getQueryString();
		query_string = ( StringUtils.isEmpty(query_string) ) ? "" : "?" + query_string;
		String servlet_url = servlet_path + query_string;

		return servlet_url;
	}
	
	/**************************************************
	* @MethodName : isAjax
	* @Description: 알 수 없음
	* @param request
	* @return boolean
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 22.
	**************************************************/
	public static boolean isAjax(HttpServletRequest request) {
		String accept = request.getHeader("accept");
		String ajax = request.getHeader("X-Requested-With");

		return ( StringUtils.indexOf(accept, "json") > -1 && StringUtils.isNotEmpty(ajax));
	}
}
