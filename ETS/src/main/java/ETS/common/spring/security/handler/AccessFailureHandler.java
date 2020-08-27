package ETS.common.spring.security.handler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import ETS.common.spring.http.RequestSnack;
import ETS.common.spring.http.SuccessBody;

/**************************************************
* @FileName   : AccessFailureHandler.java
* @Description: 인증(Consumer)된 사용자가 허가되지 않은 페이지에 접근할때 호출되는 헨들러
* @Author     : Seokkyun Choi
* @Version    : 2016. 5. 30.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

public class AccessFailureHandler implements AccessDeniedHandler {
	
	private final String loginFormUrl;
	private final String errorPage;
	private String redirectUrlParameter = "redirect_url";
	private boolean redirect = true;
	
	/**************************************************
	* @MethodName : AccessFailureHandler
	* @Description: 생성자
	* @param loginFormUrl
	* @param errorPage
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 5. 30.
	**************************************************/
	public AccessFailureHandler(String loginFormUrl, String errorPage) {
		this.loginFormUrl = loginFormUrl;
		this.errorPage = errorPage;
	}
	
	/**************************************************
	* @MethodName : setRedirect
	* @Description: 알 수 없음
	* @param redirect
	* @throws Exception
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 22.
	**************************************************/
	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}

	/**************************************************
	* @MethodName : setRedirect
	* @Description: 이동할 url 값을 담을 약속된 파라메터
	* @param redirectUrlParameter
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 22.
	**************************************************/
	public void setRedirectUrlParameter(String redirectUrlParameter) {
		this.redirectUrlParameter = redirectUrlParameter;
	}
	
	/**************************************************
	* @MethodName : handle
	* @Description: 알 수 없음
	* @param request
	* @param response
	* @param exception
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 22.
	**************************************************/
	public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException exception) throws IOException, ServletException {
		response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);

		if(RequestSnack.isAjax(request)) {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			SuccessBody success = new SuccessBody(exception.getMessage(), true);

			ObjectMapper objectMapper = new ObjectMapper();
			String data = objectMapper.writeValueAsString(success);

			PrintWriter out = response.getWriter();
			out.print(data);
			out.flush();
			out.close();
		} else {
			if (redirect) {
				response.sendRedirect(request.getContextPath() + errorPage);
			} else {
				String url = RequestSnack.getPathQueryString(request);
				request.setAttribute(redirectUrlParameter, url);
				request.setAttribute("loginFormUrl", loginFormUrl);
				request.getRequestDispatcher(request.getContextPath() + errorPage).forward(request, response);
			}
		}
	}
	
}