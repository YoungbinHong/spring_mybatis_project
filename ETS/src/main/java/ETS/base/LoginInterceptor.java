package ETS.base;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import ETS.common.util.CamelMap;

/**************************************************
* @FileName   : LoginInterceptor.java
* @Description: 알 수 없음
* @Author     : Seungjun Kim
* @Version    : 2020. 8. 14.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private SessionRegistry sessionRegistry;
	
	/**************************************************
	* @MethodName : preHandle
	* @Description: 권한 관리 목록 명세
	* @param request
	* @param response
	* @param hadler
	* @return boolean
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object hadler) throws Exception {
		//logger.debug("preHandle");

		SessionInformation sessionInfomation = sessionRegistry.getSessionInformation(request.getSession().getId());
		
		if(sessionInfomation == null){
			PrintWriter out = null;
			
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");

			out = response.getWriter();
			out.write("<script>alert(\"로그인정보가 없습니다.\");location.href=\"/login\"</script>");
			out.flush();
			out.close();
		}else{
			CamelMap sessionMap = (CamelMap) sessionInfomation.getPrincipal();
			if(sessionMap.getString("removeSessionId") != null && StringUtils.isNotEmpty(sessionMap.getString("removeSessionId"))){
				String removeSessionId = sessionMap.getString("removeSessionId");
				sessionRegistry.removeSessionInformation(removeSessionId);
				
				PrintWriter out = null;
				
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");

				out = response.getWriter();
				out.write("<script>alert(\"다른기기에서 로그인되었습니다. 로그인페이지로 이동합니다.\");location.href=\"/login\"</script>");
				out.flush();
				out.close();
			}			
		}
				
		return true;
	}
}
