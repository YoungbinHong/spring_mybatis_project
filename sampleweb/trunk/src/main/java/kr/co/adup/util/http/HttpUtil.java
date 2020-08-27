package kr.co.adup.util.http;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.NetworkInterface;
import java.net.Socket;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.adup.util.CamelMap;
import kr.co.adup.util.Str;
import net.minidev.json.JSONObject;


/**************************************************
 * @FileName : HttpUtil.java
 * @Description: Http Common cookie or map setting
 * @Author : joon
 * @Version : 2016. 01. 14.
 * @Copyright : ⓒ ADUP. All Right Reserved
 **************************************************/
public class HttpUtil {

	private static final Logger logger = LoggerFactory.getLogger(HttpUtil.class);;

	public static HttpServletRequest getHttpServletRequest(ServletRequest request) {
		if (!(request instanceof HttpServletRequest)) throw new RuntimeException("Expecting an HTTP request");
		return (HttpServletRequest) request;
	}

	public static HttpServletResponse getHttpServletResponse(ServletResponse response) {
		if (!(response instanceof HttpServletResponse)) throw new RuntimeException("Expecting an HTTP response");
		return (HttpServletResponse) response;
	}
	public static String getPathQueryString(HttpServletRequest request) {
		String servlet_path = request.getServletPath();
		String query_string = request.getQueryString();
		query_string = ( Str.isEmpty(query_string) ) ? "" : "?" + query_string;
		return servlet_path + query_string;
	}

	public static boolean isAjax(HttpServletRequest request) {
		String accept = request.getHeader("accept");
		String ajax = request.getHeader("X-Requested-With");

		return ( Str.indexOf(accept, "json") > -1 && Str.isNotEmpty(ajax));
	}
	/**************************************************
	 * @MethodName : createCookie
	 * @Description: Cookies created
	 * @param setName
	 * @param setValue
	 * @param maxage
	 * @param path
	 * @param response
	 *            void
	 * @Author : joon
	 * @Version : 2016. 01. 14.
	 **************************************************/
	public static void createCookie(String setName, String setValue, int maxage, String path, HttpServletResponse response) {
		Cookie cookie = new Cookie(setName, setValue);
		cookie.setMaxAge(maxage);
		cookie.setPath(path);

		response.addCookie(cookie);
	}

	/**************************************************
	 * @MethodName : deleteCookie
	 * @Description: cookie delete
	 * @param getName
	 * @param cookies
	 * @param path
	 * @param response
	 *            void
	 * @Author : joon
	 * @Version : 2016. 01. 14.
	 **************************************************/
	public static void deleteCookie(String getName, Cookie[] cookies, String path, HttpServletResponse response) {
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals(getName)) {
					cookies[i].setMaxAge(0);
					cookies[i].setPath(path);
					response.addCookie(cookies[i]);
				}
			}
		}
	}

	/**************************************************
	 * @MethodName : getValueFromCookie
	 * @Description: Load cookies settings
	 * @param getName
	 * @param request
	 * @return String
	 * @Author : joon
	 * @Version : 2016. 01. 14.
	 **************************************************/
	public static String getValueFromCookie(String getName, HttpServletRequest request) {

		String getValue = "";
		Cookie[] cookies = request.getCookies();

		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals(getName)) {
					getValue = cookies[i].getValue();
					break;
				}
			}
		}
		return getValue;
	}

	/**************************************************
	 * @MethodName : getRequestMap
	 * @Description: Setting the parameter value map
	 * @param request
	 * @return HashMap<String,String>
	 * @Author : joon
	 * @Version : 2016. 01. 14.
	 **************************************************/
	public static Map<String, String> getRequestMap(HttpServletRequest request) {
		HashMap<String, String> map = new HashMap<String, String>();

		@SuppressWarnings("unchecked")
		Map<String, String> paramMap = request.getParameterMap();
		for(Iterator<String> it=paramMap.keySet().iterator(); it.hasNext(); ) {
			String key = it.next();
			String val = paramMap.get(key);
			if(Str.isNotBlank(val)) {
				map.put(key, val);
				logger.info("reqName: {}, value : {}", key, val);
			}
		}
		map.put("lang", langCheck(request));
		return map;
	}
	public static CamelMap getRequestCamelMap(HttpServletRequest request) {
		CamelMap map = new CamelMap();

		@SuppressWarnings("unchecked")
		Map<String, String> paramMap = request.getParameterMap();
		for(Iterator<String> it=paramMap.keySet().iterator(); it.hasNext(); ) {
			String key = it.next();
			String val = paramMap.get(key);
			if(Str.isNotBlank(val)) {
				map.put(key, val);
				logger.info("reqName: {}, value : {}", key, val);
			}
		}
		map.put("lang", langCheck(request));
		return map;
	}

	/**************************************************
	 * @MethodName : jsonObjToMap
	 * @Description: Setting the parameter json value map
	 * @param obj
	 * @return HashMap<String,String>
	 * @Author : joon
	 * @Version : 2016. 01. 14.
	 **************************************************/
	public static HashMap<String, String> jsonObjToMap(JSONObject obj) {
		HashMap<String, String> map = new HashMap<String, String>();
		Iterator<?> keys = obj.keySet().iterator();
		while (keys.hasNext()) {
			String key = (String) keys.next();
			map.put(key, (String) obj.get(key));
		}
		return map;
	}

	public static String langCheck(HttpServletRequest request){
		String LANG = request.getParameter("LANG");
		if(Str.isBlank(LANG)) LANG = HttpUtil.getValueFromCookie("selectLocale", request);
		if(Str.isBlank(LANG)) LANG = "ko";
		return LANG;
	}

	public static boolean testInet(String url, int port) {
		Socket sock = new Socket();
		InetSocketAddress addr = new InetSocketAddress(url, port);
		try {
			sock.connect(addr, 3000);
			return true;
		} catch (IOException e) {
			return false;
		} finally {
			try {
				sock.close();
			} catch (IOException e) {
			}
		}
	}

	public static String getMacAddress() throws UnknownHostException, SocketException {
		InetAddress ipAddress = InetAddress.getLocalHost();
		NetworkInterface networkInterface = NetworkInterface.getByInetAddress(ipAddress);
		byte[] macAddressBytes = networkInterface.getHardwareAddress();
		StringBuilder macAddressBuilder = new StringBuilder();

		for (int macAddressByteIndex = 0; macAddressByteIndex < macAddressBytes.length; macAddressByteIndex++) {
			String macAddressHexByte = String.format("%02X", macAddressBytes[macAddressByteIndex]);
			macAddressBuilder.append(macAddressHexByte);

			if (macAddressByteIndex != macAddressBytes.length - 1) {
				macAddressBuilder.append(":");
			}
		}

		logger.info("::::::: " + macAddressBuilder.toString());
		return macAddressBuilder.toString();
	}

	/**
	 * @param request
	 * @return
	 * @throws IOException 
	 */
	public static String getBody(HttpServletRequest request) throws IOException {
		String body = null;
		StringBuilder stringBuilder = new StringBuilder();
		BufferedReader bufferedReader = null;
		try {
			InputStream inputStream = request.getInputStream();
			if (inputStream != null) {
				bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
				char[] charBuffer = new char[128];
				int bytesRead = -1;
				while ((bytesRead = bufferedReader.read(charBuffer)) > 0) {
					stringBuilder.append(charBuffer, 0, bytesRead);
				}
			} else {
				stringBuilder.append("");
			}
		} catch (IOException ex) {
			throw ex;
		} finally {
			if (bufferedReader != null) {
				try {
					bufferedReader.close();
				} catch (IOException ex) {
					throw ex;
				}
			}
		}
		body = stringBuilder.toString();
		return body;
	}
}