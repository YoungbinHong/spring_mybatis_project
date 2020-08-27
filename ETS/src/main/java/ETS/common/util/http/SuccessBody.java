package ETS.common.util.http;


/**
 * @author Seok Kyun. Choi. 최석균 (Syaku)
 * @site http://syaku.tistory.com
 * @since 2016. 9. 21.
 */
public class SuccessBody {

	private String message;
	private boolean error = false;
	private Object data;
	private StatusCode statusCode = StatusCode.OK;
	@SuppressWarnings("unused")
	private int code = StatusCode.OK.ordinal();

	public SuccessBody() {
	}

	public SuccessBody(String message) {
		this.message = message;
	}

	public SuccessBody(String message, boolean error) {
		this.message = message;
		this.error = error;
	}

	public SuccessBody(String message, boolean error, Object data) {
		this.message = message;
		this.error = error;
		setData(data);
	}

	public SuccessBody(String message, boolean error, StatusCode statusCode) {
		this.message = message;
		this.error = error;
		this.statusCode = statusCode;
	}

	public String getMessage() {
		return this.message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public boolean isError() {
		return this.error;
	}

	public void setError(boolean error) {
		this.error = error;
	}

	public Object getData() {
		return this.data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public StatusCode getStatusCode() {
		return this.statusCode;
	}

	public void setStatusCode(StatusCode statusCode) {
		this.statusCode = statusCode;
	}

	public int getCode() {
		return this.statusCode.value();
	}
}
