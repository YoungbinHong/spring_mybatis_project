package ETS.common;

import java.util.ResourceBundle;

import org.springframework.context.support.MessageSourceAccessor;

/************************************************** 
 * @FileName   : Global.java
 * @Description: properties file info read
 * @Author     : joon
 * @Version    : 2016. 01. 14.
 * @Copyright  : ⓒ ADUP. All Right Reserved
 **************************************************/

public class Global {
	
	public static ResourceBundle resource = ResourceBundle.getBundle("properties/env");
	//PagingTag 등.. Global.resource.getString("CONTEXT_PATH") = request.getContextPath() request로 받기 힘든 경우..

	public static MessageSourceAccessor messageSourceAccessor;

	/**************************************************
	* @MethodName : getMessages
	* @Description: 생성자
	* @param key
	* @return String
	* @Author     : joon
	* @Version    : 2016. 01. 14.
	**************************************************/
	public String getMessages(String key){
		return messageSourceAccessor.getMessage(key);
	}
	
	/**************************************************
	* @MethodName : getMessages
	* @Description: 생성자
	* @param key, obj
	* @return String
	* @Author     : joon
	* @Version    : 2016. 01. 14.
	**************************************************/
	public String getMessages(String key, Object[] obj){
		return messageSourceAccessor.getMessage(key, obj);
	}
	
	/**************************************************
	* @MethodName : getMessages
	* @Description: 생성자
	* @param key, str
	* @return String
	* @Author     : joon
	* @Version    : 2016. 01. 14.
	**************************************************/
	public String getMessages(String key, String...str){
		return messageSourceAccessor.getMessage(key, str);
	}
	
	/**************************************************
	* @MethodName : getMessageSourceAccessor
	* @Description: 알 수 없음
	* @return MessageSourceAccessor
	* @Author     : joon
	* @Version    : 2016. 01. 14.
	**************************************************/
	public MessageSourceAccessor getMessageSourceAccessor() {
		return messageSourceAccessor;
	}
	
	/**************************************************
	* @MethodName : getMessageSourceAccessor
	* @Description: 알 수 없음
	* @param messageSourceAccessor
	* @Author     : joon
	* @Version    : 2016. 01. 14.
	**************************************************/
	public void setMessageSourceAccessor(MessageSourceAccessor messageSourceAccessor) {
		Global.messageSourceAccessor = messageSourceAccessor;
	}
}
