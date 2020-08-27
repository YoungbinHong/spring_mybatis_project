package kr.co.adup.base;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class BaseInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(BaseInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object hadler) throws Exception {
		String base = request.getContextPath();
		String url = request.getRequestURL().toString();
		String uri = request.getRequestURI();
		int lastIdx = uri.lastIndexOf("/");
		String menu = lastIdx > 0 ? uri.substring(1, lastIdx) : "";
		String page = uri.substring(lastIdx + 1);
		String osName = System.getProperty("os.name");
		
		request.setAttribute("base", base); //struts는 기본 제공..
		request.setAttribute("menu", menu);
		request.setAttribute("page", page);
		if(osName.startsWith("Window")){
			request.setAttribute("OS", "Windows");
		}else{
			request.setAttribute("OS", "Linux");
		}

		logger.info("url : {}", url);
		logger.info("uri : {}", uri);
		logger.info("page : {}", page);
		logger.info("osName : {}", osName);

		logger.info("base is {}, menu is {}, page is {}", base, menu);

		return true;
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
