package daesang.common;

import java.util.ResourceBundle;

import javax.servlet.http.HttpSession;

import org.springframework.context.support.MessageSourceAccessor;

/************************************************** 
 * @FileName   : Global.java
 * @Description: properties file info read
 * @Author     : joon
 * @Version    : 2016. 01. 14.
 * @Copyright  : ⓒ ADUP. All Right Reserved
 **************************************************/
public class Global {
	
	public static HttpSession session = null;

	public static ResourceBundle resource = ResourceBundle.getBundle("properties/env");
	//PagingTag 등.. Global.resource.getString("CONTEXT_PATH") = request.getContextPath() request로 받기 힘든 경우..

	public static MessageSourceAccessor messageSourceAccessor;

	public static String getMessages(String key){
		return messageSourceAccessor.getMessage(key);
	}
	public MessageSourceAccessor getMessageSourceAccessor() {
		return messageSourceAccessor;
	}
	public void setMessageSourceAccessor(MessageSourceAccessor messageSourceAccessor) {
		Global.messageSourceAccessor = messageSourceAccessor;
	}
	public static HttpSession getSession(){
		return session;
	}
	public static void setSession(HttpSession httpSession){
		session = httpSession;
	}
}
