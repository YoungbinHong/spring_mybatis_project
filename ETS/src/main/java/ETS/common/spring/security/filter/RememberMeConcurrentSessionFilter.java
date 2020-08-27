package ETS.common.spring.security.filter;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.RememberMeServices;
import org.springframework.security.web.authentication.rememberme.RememberMeAuthenticationFilter;
import org.springframework.security.web.authentication.session.NullAuthenticatedSessionStrategy;
import org.springframework.security.web.authentication.session.SessionAuthenticationStrategy;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**************************************************
* @FileName   : RememberMeConcurrentSessionFilter.java
* @Description: 알 수 없음
* @Author     : Seokkyun Choi
* @Version    : 2016. 9. 27.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

public class RememberMeConcurrentSessionFilter extends RememberMeAuthenticationFilter {
	
	private SessionAuthenticationStrategy sessionStrategy = new NullAuthenticatedSessionStrategy();
	
	/**************************************************
	* @MethodName : setSessionAuthenticationStrategy
	* @Description: RememberMe 설정에서는 동시 세션 제어를 직집 주입해줘야 한다.
	* @param sessionStrategy
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 27.
	**************************************************/
	public void setSessionAuthenticationStrategy(SessionAuthenticationStrategy sessionStrategy) {
		this.sessionStrategy = sessionStrategy;
	}
	
	/**************************************************
	* @MethodName : RememberMeConcurrentSessionFilter
	* @Description: 생성자
	* @param authenticationManager
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 27.
	**************************************************/
	public RememberMeConcurrentSessionFilter(AuthenticationManager authenticationManager, RememberMeServices rememberMeServices) {
		super(authenticationManager, rememberMeServices);
	}
	
	/**************************************************
	* @MethodName : doFilter
	* @Description: 알 수 없음
	* @param req
	* @param res
	* @param chain
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 27.
	**************************************************/
	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		super.doFilter(req, res, chain);
	}

	/**************************************************
	* @MethodName : onSuccessfulAuthentication
	* @Description: 알 수 없음
	* @param request
	* @param response
	* @param authResult
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 27.
	**************************************************/
	@Override
	public void onSuccessfulAuthentication(HttpServletRequest request, HttpServletResponse response, Authentication authResult) {
		sessionStrategy.onAuthentication(authResult, request, response);
	}
}
