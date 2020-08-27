package daesang.system;

import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import daesang.common.Global;

public class BaseInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(BaseInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object hadler) throws Exception {
		//logger.debug("preHandle");
		Global.session = request.getSession();

		String base = request.getContextPath();
		String urlstring = request.getRequestURL().toString();
		String uri = request.getRequestURI();
		int lastIdx = uri.lastIndexOf("/");
		String menu = lastIdx > 0 ? uri.substring(1, lastIdx) : "";
		String page = uri.substring(lastIdx + 1);
		String domainName = Global.resource.getString("DOMAIN_NAME");
		
		request.setAttribute("base", base); //struts는 기본 제공..
		request.setAttribute("menu", menu);
		request.setAttribute("page", page);

		URL url = new URL(urlstring);
		String protocol = url.getProtocol();
		String host = url.getHost().toLowerCase();
//		Loading EhCache -> EhcacheUtil.getCache(cache name)
		logger.info("url : {}", urlstring);
		logger.info("protocol : {}", protocol);
		logger.info("host : {}", host);
		logger.info("uri : {}", uri);
		logger.info("page : {}", page);
		logger.info("domainName : {}", domainName);
		
		logger.info("base is {}, menu is {}, page is {}", base, menu, page);

		int pos = host.indexOf("www");
		if(pos<0){ // not include www
			if("http".equalsIgnoreCase(protocol)){ // http://xxxx
				String reUrl = urlstring.replaceAll("http://", "");
				logger.info("redirect : 2 {}", "https://www."+reUrl);
				response.sendRedirect("https://www."+reUrl);
			}else{ // https://xxxx
				String reUrl = urlstring.replaceAll("https://", "");
				logger.info("redirect : 3 {}", "https://www."+reUrl);
				response.sendRedirect("https://www."+reUrl);
			}
		}else{ // include www
			if("http".equalsIgnoreCase(protocol)){ // http://www.xxx
				String reUrl = urlstring.replaceAll("http://www", "");
				logger.info("redirect : 1 {}", "https://www"+reUrl);
				response.sendRedirect("https://www"+reUrl);
			}
		}
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
