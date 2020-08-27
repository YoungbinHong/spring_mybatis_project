package ETS.common.spring.http;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**************************************************
* @FileName   : HttpSnack.java
* @Description: 알 수 없음
* @Author     : Seokkyun Choi
* @Version    : 2016. 9. 22.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

public class HttpSnack {
	
	/**************************************************
	* @MethodName : HttpSnack
	* @Description: 생성자
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 22.
	**************************************************/
	private HttpSnack() {}
	
	/**************************************************
	* @MethodName : getHttpServletRequest
	* @Description: 알 수 없음
	* @param request
	* @return HttpServletRequest
	* @throws Exception
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 22.
	**************************************************/
	public static HttpServletRequest getHttpServletRequest(ServletRequest request) {
		if (!(request instanceof HttpServletRequest)) throw new RuntimeException("Expecting an HTTP request");
		return (HttpServletRequest) request;
	}
	
	/**************************************************
	* @MethodName : getHttpServletResponse
	* @Description: 알 수 없음
	* @param response
	* @return HttpServletResponse
	* @throws Exception
	* @Author     : Seokkyun Choi
	* @Version    : 2016. 9. 22.
	**************************************************/
	public static HttpServletResponse getHttpServletResponse(ServletResponse response) {
		if (!(response instanceof HttpServletResponse)) throw new RuntimeException("Expecting an HTTP response");
		return (HttpServletResponse) response;
	}
}
