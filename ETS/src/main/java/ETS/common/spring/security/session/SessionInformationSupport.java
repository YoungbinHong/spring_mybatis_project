package ETS.common.spring.security.session;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.userdetails.User;

/**************************************************
* @FileName   : SessionInformationSupport.java
* @Description: 알 수 없음
* @Author     : Seokkyun Choi
* @Version    : 2016. 9. 22.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

public class SessionInformationSupport {
	
	private final SessionRegistry sessionRegistry;
	
	/**************************************************
	* @MethodName : SessionInformationSupport
	* @Description: 생성자
	* @param sessionRegistry
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 22.
	**************************************************/
	public SessionInformationSupport(SessionRegistry sessionRegistry) {
		this.sessionRegistry = sessionRegistry;
	}
	
	/**************************************************
	* @MethodName : getSessionInformations
	* @Description: 알 수 없음
	* @return List<Information>
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 22.
	**************************************************/
	public List<Information> getSessionInformations() {

		List<SessionInformation> sessionInformations = new ArrayList<SessionInformation>();
		for(Object principal : sessionRegistry.getAllPrincipals()) {
			sessionInformations.addAll(sessionRegistry.getAllSessions(principal, false));
		}

		List<Information> informations = new ArrayList<Information>();
		for(SessionInformation sessionInformation : sessionInformations) {


			Date lastRequest = sessionInformation.getLastRequest();
			String sessionId = sessionInformation.getSessionId();

			String username = null;

			Object principal = sessionInformation.getPrincipal();
			if (principal instanceof User) {
				User user = (User) principal;
				username = user.getUsername();
			}

			Information information = new Information(username, sessionId, lastRequest, principal);

			informations.add(information);
		}

		return informations;
	}
	
	/**************************************************
	* @MethodName : userExists
	* @Description: 알 수 없음
	* @param username
	* @return boolean
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 22.
	**************************************************/
	public boolean userExists(String username) {
		for(Information information : getSessionInformations()) {
			String _username = information.getUsername();

			if (username.equals(_username)) {
				return true;
			}
		}

		return false;
	}
}
