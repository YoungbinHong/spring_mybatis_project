package ETS.common.security;

import java.security.MessageDigest;

import org.apache.commons.codec.binary.Base64;

/**************************************************
* @FileName   : SHA256.java
* @Description: 알 수 없음
* @Author     : 알 수 없음
* @Version    : 2020. 8. 14.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

public class SHA256 {
	
	/**************************************************
	* @MethodName : main
	* @Description: 알 수 없음
	* @param args[]
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	public static void main(String args[]){
		try {
			String data = "test";
			System.out.println(encrypt(data));
			System.out.println("encrypt data...");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**************************************************
	* @MethodName : encrypt
	* @Description: 알 수 없음
	* @param data
	* @return String
	* @throws Exception
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
    public static String encrypt(String data) throws Exception {
    	byte[] textBytes = data.getBytes("UTF-8");
    	
        MessageDigest md = MessageDigest.getInstance("SHA-256");

        return Base64.encodeBase64String(md.digest(textBytes));
    }
}
