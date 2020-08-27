package ETS.common.spring.security.handler;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.util.StringUtils;

import com.fasterxml.jackson.databind.ObjectMapper;

import ETS.common.spring.http.RequestSnack;
import ETS.common.spring.http.SuccessBody;

/**************************************************
* @FileName   : SignInSuccessHandler.java
* @Description: 알 수 없음
* @Author     : Seokkyun Choi
* @Version    : 2016. 9. 21.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

public class SignInSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

	private boolean redirect = true;
	
	/**************************************************
	* @MethodName : setRedirect
	* @Description: 알 수 없음
	* @param redirect
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 21.
	**************************************************/
	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
	
	/**************************************************
	* @MethodName : redirectUrl
	* @Description: 알 수 없음
	* @param request
	* @param response
	* @return String
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 21.
	**************************************************/
	private String redirectUrl(HttpServletRequest request, HttpServletResponse response) {
		HttpSessionRequestCache requestCache = new HttpSessionRequestCache();
		SavedRequest savedRequest = requestCache.getRequest(request, response);

		if (savedRequest == null) {
			return determineTargetUrl(request, response);
		}

		String targetUrlParameter = getTargetUrlParameter();
		if (isAlwaysUseDefaultTargetUrl() || (targetUrlParameter != null && StringUtils.hasText(request.getParameter(targetUrlParameter)))) {
			requestCache.removeRequest(request, response);

			return determineTargetUrl(request, response);
		}

		clearAuthenticationAttributes(request);
		return savedRequest.getRedirectUrl();
	}
	
	/**************************************************
	* @MethodName : onAuthenticationSuccess
	* @Description: 알 수 없음
	* @param request
	* @param response
	* @param authentication
	* @throws IOException, ServletException
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 21.
	**************************************************/
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {

		response.setStatus(HttpServletResponse.SC_OK);

		if(RequestSnack.isAjax(request)) {
			String redirectUrl = redirectUrl(request, response);

			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");

			SuccessBody success = new SuccessBody();

			success.setError(false);

			Map<String, Object> data = new HashMap<String, Object>();
			data.put("redirect", redirect);
			data.put("redirectUrl", redirectUrl);
			success.setData(data);

			ObjectMapper objectMapper = new ObjectMapper();
			String json = objectMapper.writeValueAsString(success);

			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			out.close();
		} else {
			super.onAuthenticationSuccess(request, response, authentication);
		}
	}
	
}