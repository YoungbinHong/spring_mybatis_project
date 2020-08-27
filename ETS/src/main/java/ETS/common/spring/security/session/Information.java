package ETS.common.spring.security.session;

import java.util.Date;

/**************************************************
* @FileName   : Information.java
* @Description: 알 수 없음
* @Author     : Seokkyun Choi
* @Version    : 2016. 9. 22.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

public class Information {
	
	private final String username;
	private final String sessionId;
	private final Date lastRequest;
	private final Object principal;
	
	/**************************************************
	* @MethodName : Information
	* @Description: 생성자
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 22.
	**************************************************/
	public Information(String username, String sessionId, Date lastRequest, Object principal) {
		this.username = username;
		this.sessionId = sessionId;
		this.lastRequest = lastRequest;
		this.principal = principal;
	}
	
	/**************************************************
	* @MethodName : getUsername
	* @Description: 알 수 없음
	* @return String
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 22.
	**************************************************/
	public String getUsername() {
		return username;
	}
	
	/**************************************************
	* @MethodName : getSessionId
	* @Description: 알 수 없음
	* @return String
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 22.
	**************************************************/
	public String getSessionId() {
		return sessionId;
	}
	
	/**************************************************
	* @MethodName : getLastRequest
	* @Description: 알 수 없음
	* @return Date
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 22.
	**************************************************/
	public Date getLastRequest() {
		return lastRequest;
	}
	
	/**************************************************
	* @MethodName : getPrincipal
	* @Description: 알 수 없음
	* @return Object
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 22.
	**************************************************/
	public Object getPrincipal() {
		return principal;
	}
	
}
