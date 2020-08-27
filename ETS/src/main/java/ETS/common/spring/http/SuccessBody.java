package ETS.common.spring.http;

/**************************************************
* @FileName   : SuccessBody.java
* @Description: 알 수 없음
* @Author     : Seokkyun Choi
* @Version    : 2016. 9. 21.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

public class SuccessBody {

	private String message;
	private boolean error = false;
	private Object data;
	private StatusCode statusCode = StatusCode.OK;
	@SuppressWarnings("unused")
	private int code = StatusCode.OK.ordinal();
	
	/**************************************************
	* @MethodName : SuccessBody
	* @Description: 생성자
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 21.
	**************************************************/
	public SuccessBody() {
	}
	
	/**************************************************
	* @MethodName : SuccessBody
	* @Description: 생성자
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 21.
	**************************************************/
	public SuccessBody(String message) {
		this.message = message;
	}
	
	/**************************************************
	* @MethodName : SuccessBody
	* @Description: 생성자
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 21.
	**************************************************/
	public SuccessBody(String message, boolean error) {
		this.message = message;
		this.error = error;
	}
	
	/**************************************************
	* @MethodName : SuccessBody
	* @Description: 생성자
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 21.
	**************************************************/
	public SuccessBody(String message, boolean error, Object data) {
		this.message = message;
		this.error = error;
		setData(data);
	}
	
	/**************************************************
	* @MethodName : SuccessBody
	* @Description: 생성자
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 21.
	**************************************************/
	public SuccessBody(String message, boolean error, StatusCode statusCode) {
		this.message = message;
		this.error = error;
		this.statusCode = statusCode;
	}
	
	/**************************************************
	* @MethodName : getMessage
	* @Description: 알 수 없음
	* @return String
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 21.
	**************************************************/
	public String getMessage() {
		return message;
	}
	
	/**************************************************
	* @MethodName : setMessage
	* @Description: 알 수 없음
	* @param message
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 21.
	**************************************************/
	public void setMessage(String message) {
		this.message = message;
	}
	
	/**************************************************
	* @MethodName : isError
	* @Description: 알 수 없음
	* @return boolean
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 21.
	**************************************************/
	public boolean isError() {
		return error;
	}
	
	/**************************************************
	* @MethodName : setError
	* @Description: 알 수 없음
	* @param error
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 21.
	**************************************************/
	public void setError(boolean error) {
		this.error = error;
	}
	
	/**************************************************
	* @MethodName : getData
	* @Description: 알 수 없음
	* @return Object
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 21.
	**************************************************/
	public Object getData() {
		return data;
	}
	
	/**************************************************
	* @MethodName : setData
	* @Description: 알 수 없음
	* @param data
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 21.
	**************************************************/
	public void setData(Object data) {
		this.data = data;
	}
	
	/**************************************************
	* @MethodName : getStatusCode
	* @Description: 알 수 없음
	* @return StatusCode
	* @throws Exception
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 21.
	**************************************************/
	public StatusCode getStatusCode() {
		return statusCode;
	}
	
	/**************************************************
	* @MethodName : setStatusCode
	* @Description: 알 수 없음
	* @param statusCode
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 21.
	**************************************************/
	public void setStatusCode(StatusCode statusCode) {
		this.statusCode = statusCode;
	}

	/**************************************************
	* @MethodName : getCode
	* @Description: 알 수 없음
	* @return int
	* @Author     : SeokKyun Choi
	* @Version    : 2016. 9. 21.
	**************************************************/
	public int getCode() {
		return statusCode.value();
	}
}
