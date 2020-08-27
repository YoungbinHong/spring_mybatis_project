package ETS.common.spring.http;

/**************************************************
* @FileName   : StatusCode.java
* @Description:
* 200 : 성공
* 401 : 로그인하지 않음.
* 402 : 접근권한이 없음.
* 403 : 중복로그인 여부 필요.
* 404 : 비밀번호 기간이 만료됨.
* 480 : 폼 유효성검사 오류
* @Author     : Seokkyun Choi
* @Version    : 2016. 8. 19.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

public enum StatusCode {
	OK(200),
	Unauthorized(401),
	AccessDenied(402),
	DuplicationLogin(403),
	PasswordUseExpired(404),
	FormValidation(480),
	MemberStatus(500);
	
	private final int value;
	
	/**************************************************
	* @MethodName : StatusCode
	* @Description: 알 수 없음
	* @param value
	* @return StatusCode
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 8. 19.
	**************************************************/
	StatusCode(int value) {
		this.value = value;
	}
	
	/**************************************************
	* @MethodName : value
	* @Description: 알 수 없음
	* @return int
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 8. 19.
	**************************************************/
	public int value() {
		return value;
	}
}