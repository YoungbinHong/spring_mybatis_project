package ETS.common.spring.security.handler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AbstractAuthenticationTargetUrlRequestHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import ETS.common.spring.http.RequestSnack;
import ETS.common.spring.http.SuccessBody;

/**************************************************
* @FileName   : SignOutSuccessHandler.java
* @Description: 로그아웃 성공 후 호출되는 헨들러
* @Author     : Seokkyun Choi
* @Version    : 2016. 5. 30.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

public class SignOutSuccessHandler extends AbstractAuthenticationTargetUrlRequestHandler implements LogoutSuccessHandler {
	
	/**************************************************
	* @MethodName : onLogoutSuccess
	* @Description: 알 수 없음
	* @param request
	* @param response
	* @param authentication
	* @throws IOException, ServletException
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 5. 30.
	**************************************************/
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {

		if(RequestSnack.isAjax(request)) {
			String targetUrl = determineTargetUrl(request, response);

			if (logger.isDebugEnabled()) {
				logger.debug("targetUrl: " + targetUrl);
				logger.debug("targetUrlParameter name: " + getTargetUrlParameter());
				logger.debug("targetUrlParameter value: " + request.getParameter(getTargetUrlParameter()));
			}

			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");

			SuccessBody success = new SuccessBody();

			response.setStatus(HttpServletResponse.SC_OK);

			success.setError(false);
			success.setData(targetUrl);

			ObjectMapper objectMapper = new ObjectMapper();
			String json = objectMapper.writeValueAsString(success);

			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			out.close();
		} else {
			super.handle(request, response, authentication);
		}

	}
}