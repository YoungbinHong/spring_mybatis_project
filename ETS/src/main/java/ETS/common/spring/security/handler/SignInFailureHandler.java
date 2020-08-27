package ETS.common.spring.security.handler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import ETS.common.spring.http.RequestSnack;
import ETS.common.spring.http.SuccessBody;

/**************************************************
* @FileName   : SignInFailureHandler.java
* @Description: 로그인 실패할 경우 호출되는 헨들러
* @Author     : Seokkyun Choi
* @Version    : 2016. 5. 30.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

public class SignInFailureHandler extends SimpleUrlAuthenticationFailureHandler {
	
	/**************************************************
	* @MethodName : SignInFailureHandler
	* @Description: 생성자
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 22.
	**************************************************/
	public SignInFailureHandler() {}
	
	/**************************************************
	* @MethodName : SignInFailureHandler
	* @Description: 생성자
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 22.
	**************************************************/
	public SignInFailureHandler(String defaultFailureUrl) {
		super(defaultFailureUrl);
	}
	
	/**************************************************
	* @MethodName : onAuthenticationFailure
	* @Description: 알 수 없음
	* @param request
	* @param response
	* @param exception
	* @throws IOException, ServletException
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 22.
	**************************************************/
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {

		if(RequestSnack.isAjax(request)) {
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");

			SuccessBody success = new SuccessBody();

			success.setError(true);
			success.setMessage(exception.getMessage());

			ObjectMapper objectMapper = new ObjectMapper();
			String json = objectMapper.writeValueAsString(success);
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			out.close();
		} else {
			super.onAuthenticationFailure(request, response, exception);
		}
	}
	
}