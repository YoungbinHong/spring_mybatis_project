package kr.co.adup.base;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object hadler) throws Exception {
		logger.debug("preHandle");

		HttpSession session = request.getSession();
		if (session.getAttribute("userInfo") == null) {
			logger.warn("login info does not exist!");
			response.sendRedirect("/login?error=logout");
			return false;
		}
		return true;
	}
}
