package ETS.common.security;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import ETS.common.Global;

/**************************************************
* @FileName   : MD5.java
* @Description: 알 수 없음
* @Author     : 알 수 없음
* @Version    : 2020. 8. 14.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

public class MD5 {
	
	/**************************************************
	* @MethodName : main
	* @Description: 알 수 없음
	* @param arg
	* @throws Exception
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	public static void main(String[] arg) throws Exception {

		String str = "41195629141127219812";
		System.out.println("MD5 : " + encrypt(str));
		
		System.out.println("HMAC-MD5 : " + hmacDigest(str, "8f854a440ad049e1", "HmacMD5"));
		System.out.println("HMAC-MD5 : 1f80fe5138bfd4a360c3e2922e186399");
	}
	
	/**************************************************
	* @MethodName : encrypt
	* @Description: 알 수 없음
	* @param str
	* @return String
	* @throws Exception
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	public static String encrypt(String str) throws Exception {

		String MD5 = "";
		String key = Global.resource.getString("SMS_KEY");
		// System.out.println("str : " + str + ", key : " + key);
		str += "^" + key;

		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			byte byteData[] = md.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16)
						.substring(1));
			}
			MD5 = sb.toString();

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			MD5 = null;
		}

		return MD5;
	}
	
	/**************************************************
	* @MethodName : hmacDigest
	* @Description: 알 수 없음
	* @param msg
	* @param keyString
	* @param algo
	* @return String
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	public static String hmacDigest(String msg, String keyString, String algo) {
		String digest = null;
		try {
			SecretKeySpec key = new SecretKeySpec(
					(keyString).getBytes("UTF-8"), algo);
			Mac mac = Mac.getInstance(algo);
			mac.init(key);
			byte[] bytes = mac.doFinal(msg.getBytes("ASCII"));
			StringBuffer hash = new StringBuffer();
			for (int i = 0; i < bytes.length; i++) {
				String hex = Integer.toHexString(0xFF & bytes[i]);
				if (hex.length() == 1) {
					hash.append('0');
				}
				hash.append(hex);
			}
			digest = hash.toString();
		} catch (UnsupportedEncodingException e) {
		} catch (InvalidKeyException e) {
		} catch (NoSuchAlgorithmException e) {
		}
		return digest;
	}
}
