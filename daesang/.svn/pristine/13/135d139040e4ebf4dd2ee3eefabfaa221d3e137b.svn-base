package daesang.common.util;

import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.NetworkInterface;
import java.net.Socket;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;

import daesang.common.Constants;
import daesang.common.DataMap;
import daesang.common.Global;

/************************************************** 
 * @FileName   : HttpUtil.java
 * @Description: Http Common cookie or map setting
 * @Author     : joon
 * @Version    : 2016. 01. 14.
 * @Copyright  : ⓒ ADUP. All Right Reserved
 **************************************************/
public class HttpUtil {
	
	private static final Logger logger = LoggerFactory.getLogger(HttpUtil.class);

    /************************************************** 
     * @MethodName : createCookie
     * @Description: Cookies created
     * @param setName
     * @param setValue
     * @param maxage
     * @param path
     * @param response void
     * @Author     : joon
     * @Version    : 2016. 01. 14.
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
     * @param response void
     * @Author     : joon
     * @Version    : 2016. 01. 14.
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
	 * @Author     : joon
	 * @Version    : 2016. 01. 14.
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
     * @Author     : joon
     * @Version    : 2016. 01. 14.
    **************************************************/
    public static HashMap<String, String> getRequestMap(HttpServletRequest request) {
        HashMap<String, String> map = new HashMap<String, String>();
        String reqName = "";

        for (Enumeration<String> e = request.getParameterNames(); e.hasMoreElements();) {
            reqName = e.nextElement();
            map.put(reqName, StrTool.sNN(request.getParameter(reqName)).trim());
        }
        map.put("lang", Constants.langCheck(request));
        return map;
    }

    /************************************************** 
     * @MethodName : jsonObjToMap
     * @Description: Setting the parameter json value map
     * @param obj
     * @return HashMap<String,String>
     * @Author     : joon
     * @Version    : 2016. 01. 14.
    **************************************************/
    public static HashMap<String, String> jsonObjToMap(JSONObject obj){
        HashMap<String, String> map = new HashMap<String, String>();
        Iterator<?> keys = obj.keySet().iterator();
        while (keys.hasNext()) {
            String key = (String) keys.next();
            map.put(key, (String) obj.get(key));
        }
        return map;
    }

    /************************************************** 
     * @MethodName : getRequestMap
     * @Description: Setting the parameter value DataMap
     * @param request
     * @return HashMap<String,String>
     * @Author     : joon
     * @Version    : 2016. 01. 14.
    **************************************************/
	@SuppressWarnings("unchecked")
    public static DataMap getRequestDataMap(HttpServletRequest request) {
    	DataMap map = new DataMap();
        String reqName = "";
        
        for (Enumeration<String> e = request.getParameterNames(); e.hasMoreElements();) {
            reqName = e.nextElement();
            boolean sw = true;

            if(reqName.equals("START_YMD") || reqName.equals("END_YMD")){
            	String str = StrTool.sNN(request.getParameter(reqName)).trim();
            	if(str.indexOf("/") > -1){
	            	try {
						map.put(reqName, DateUtil.dateParse(str, "yyyy/MM/dd", "yyyyMMdd"));
					} catch (Exception e1) {
						e1.printStackTrace();
					}

	            	sw = false;
            	}
            }
            
            String val = StrTool.sNN(request.getParameter(reqName)).trim();

            if(sw){
            	map.put(reqName, val);
            }
            
            logger.info("reqName : {}, value : {}", reqName, val);
        }
        
        if(StringUtils.isEmpty(map.getString("LANG"))) map.put("LANG", Constants.langCheck(request));

//        map.put("sessionId", request.getSession().getId());
        map.put("sessionId", Global.session.getId());

        return map;
    }

	/************************************************** 
     * @MethodName : jsonObjToDataMap
     * @Description: Setting the parameter json value DataMap
     * @param obj
     * @return DataMap
     * @Author     : joon
     * @Version    : 2016. 01. 14.
    **************************************************/
    @SuppressWarnings("unchecked")
	public static DataMap jsonObjToDataMap(JSONObject obj){
    	DataMap map = new DataMap();
        Iterator<?> keys = obj.keySet().iterator();
        while (keys.hasNext()) {
            String key = (String) keys.next();
            map.put(key, obj.get(key));
        }
        return map;
    }

	public static boolean testInet(String url, int port) {
		Socket sock = new Socket();
		InetSocketAddress addr = new InetSocketAddress(url, port);
		try {
			sock.connect(addr,3000);
			return true;
		} catch (IOException e) {
			return false;
		} finally {
			try {sock.close();}
			catch (IOException e) {}
		}
	}
	
	public static String getMacAddress() throws UnknownHostException, SocketException{
		InetAddress ipAddress = InetAddress.getLocalHost();
		NetworkInterface networkInterface = NetworkInterface.getByInetAddress(ipAddress);
		byte[] macAddressBytes = networkInterface.getHardwareAddress();
		StringBuilder macAddressBuilder = new StringBuilder();
		
		for (int macAddressByteIndex = 0; macAddressByteIndex < macAddressBytes.length; macAddressByteIndex++){
		    String macAddressHexByte = String.format("%02X",macAddressBytes[macAddressByteIndex]);
		    macAddressBuilder.append(macAddressHexByte);
		
		    if (macAddressByteIndex != macAddressBytes.length - 1){
		        macAddressBuilder.append(":");
		    }
		}
	
		logger.info("::::::: " + macAddressBuilder.toString());
		return macAddressBuilder.toString();
	}
	
	
	/**************************************************
	* @MethodName : setMenuInfo
	* @Description: 페이지 메뉴값 설정
	* @param menuId
	* @param menuSubId
	* @param tabMenuId
	* @param model void
	* @Author     : Jong-Hoon. Jung
	* @Version    : 2018. 12. 3.
	**************************************************/
	public static void setMenuInfo(String menuId, String menuSubId, String tabMenuId, Model model){
		model.addAttribute("menuID", StringUtils.isNotEmpty(menuId) ? menuId : "");
		model.addAttribute("menuSubID", StringUtils.isNotEmpty(menuSubId) ? menuSubId : "");
		model.addAttribute("menuTab", StringUtils.isNotEmpty(tabMenuId) ? tabMenuId : "");
	}
	
	
	/**************************************************
	* @MethodName : getParams
	* @Description: 파라미터 정보 페이지 전달
	* @param paramMap
	* @param model void
	* @Author     : Jong-Hoon. Jung
	* @Version    : 2018. 12. 3.
	**************************************************/
	@SuppressWarnings("unchecked")
	public static void getParams(DataMap paramMap, Model model){
		
		for(Iterator<String> it = paramMap.keySet().iterator();it.hasNext();){
			String key = it.next();
			String value = paramMap.getString(key);
//			logger.info("model param set ::: key : {}, value : {}", key, value);
			if(StringUtils.isNotEmpty(value)) model.addAttribute(key, value);
		}
	}
}