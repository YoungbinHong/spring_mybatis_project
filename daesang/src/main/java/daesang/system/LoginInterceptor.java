package daesang.system;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import daesang.common.CamelMap;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Autowired
	private SessionRegistry sessionRegistry;
	
	private String ajaxHeader;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object hadler) throws Exception {
		//logger.debug("preHandle");
		
		SessionInformation sessionInfomation = this.sessionRegistry.getSessionInformation(request.getSession().getId());
		if(sessionInfomation == null || request.getSession().getAttribute("userInfo") == null){
			response.sendRedirect("/login?error=logout");
			return false;
		}
		CamelMap sessionMap = (CamelMap) sessionInfomation.getPrincipal();
		if(sessionMap.getString("removeSessionId") != null && StringUtils.isNotEmpty(sessionMap.getString("removeSessionId"))){
			String removeSessionId = sessionMap.getString("removeSessionId");
			this.sessionRegistry.removeSessionInformation(removeSessionId);
			response.sendRedirect("/login?error=duplogin");
			return false;
		}
				
		return true;
	}
	
	private boolean isAjaxRequest(HttpServletRequest request) {
        return request.getHeader(this.ajaxHeader) != null    && request.getHeader(this.ajaxHeader).equals(Boolean.TRUE.toString());
    }
/*
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object hadler, ModelAndView mnv) throws Exception {
		//logger.debug("postHandle");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object hadler, Exception ex) throws Exception {
		//logger.debug("afterCompletion");
	}
*/
}
