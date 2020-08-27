package ETS.common.spring.security.session;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.web.authentication.session.ConcurrentSessionControlAuthenticationStrategy;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**************************************************
* @FileName   : ConcurrentSessionControlAuthenticationStrategySupport.java
* @Description: 알 수 없음
* @Author     : Seokkyun Choi
* @Version    : 2016. 9. 22.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

public class ConcurrentSessionControlAuthenticationStrategySupport extends ConcurrentSessionControlAuthenticationStrategy {

	/**************************************************
	* @MethodName : ConcurrentSessionControlAuthenticationStrategySupport
	* @Description: 생성자
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 22.
	**************************************************/
	public ConcurrentSessionControlAuthenticationStrategySupport(SessionRegistry sessionRegistry, int maximumSessions, boolean exceptionIfMaximumExceeded) {
		super(sessionRegistry);
		super.setMaximumSessions(maximumSessions);
		super.setExceptionIfMaximumExceeded(exceptionIfMaximumExceeded);
	}

	/**************************************************
	* @MethodName : setDuplicationLoginDisable
	* @Description: 중복로그인 비활성화인 경우 동시 세션 설정을 수정한다.
	* @param duplicationLoginDisable
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 22.
	**************************************************/
	public void setDuplicationLoginDisable(boolean duplicationLoginDisable) {
		if (duplicationLoginDisable) {
			super.setMaximumSessions(1);
			super.setExceptionIfMaximumExceeded(false);
		}
	}
	
	/**************************************************
	* @MethodName : onAuthentication
	* @Description: 알 수 없음
	* @param authentication, request, response
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 22.
	**************************************************/
	@Override
	public void onAuthentication(Authentication authentication, HttpServletRequest request, HttpServletResponse response) {
		super.onAuthentication(authentication, request, response);
	}
}