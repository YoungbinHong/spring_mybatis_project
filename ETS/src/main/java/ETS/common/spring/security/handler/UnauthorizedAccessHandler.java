package ETS.common.spring.security.handler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;

import com.fasterxml.jackson.databind.ObjectMapper;

import ETS.common.spring.http.RequestSnack;
import ETS.common.spring.http.SuccessBody;

/**************************************************
* @FileName   : HttpSnack.java
* @Description: 인증(Consumer)되지 않은 사용자가 허가되지 않은 페이지에 접근할때 요청되는 헨들러.
* @Author     : Seokkyun Choi
* @Version    : 2016. 5. 30.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

public class UnauthorizedAccessHandler implements AuthenticationEntryPoint {

	private final String loginFormUrl;
	private boolean redirect = true;
	
	/**************************************************
	* @MethodName : UnauthorizedAccessHandler
	* @Description: 생성자
	* @param loginFormUrl
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 5. 30.
	**************************************************/
	public UnauthorizedAccessHandler(String loginFormUrl) {
		this.loginFormUrl = loginFormUrl;
	}
	
	/**************************************************
	* @MethodName : setRedirect
	* @Description: 알 수 없음
	* @param redirect
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 5. 30.
	**************************************************/
	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
	
	/**************************************************
	* @MethodName : commence
	* @Description: 알 수 없음
	* @param request
	* @param response
	* @param exception
	* @throws IOException, ServletException
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 5. 30.
	**************************************************/
	public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {

		if(RequestSnack.isAjax(request)) {
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			SuccessBody success = new SuccessBody();

			success.setMessage(exception.getMessage());
			success.setError(true);

			ObjectMapper objectMapper = new ObjectMapper();
			String data = objectMapper.writeValueAsString(success);
			PrintWriter out = response.getWriter();
			out.print(data);
			out.flush();
			out.close();
		} else {
			if (redirect) {
				response.sendRedirect(request.getContextPath() + loginFormUrl);
			} else {
				request.getRequestDispatcher(request.getContextPath() + loginFormUrl).forward(request, response);
			}
		}
	}
	
}
