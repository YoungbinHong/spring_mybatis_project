package ETS.common.security;

import java.security.Key;

import javax.crypto.Cipher;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESedeKeySpec;

import org.apache.commons.codec.binary.Base64;

/**************************************************
* @FileName   : TripleDES.java
* @Description: 알 수 없음
* @Author     : 알 수 없음
* @Version    : 2020. 8. 14.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

public class TripleDES {
	
	private final static String key = "123456789009876543210123";
	private final static String DESede = "DESede/ECB/PKCS5Padding";
	
	/**************************************************
	* @MethodName : main
	* @Description: 알 수 없음
	* @param args
	* @throws Exception
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	public static void main(String[] args) throws Exception {
		String data = "test"; // min 12, column size = original length * 3
		System.out.println(encrypt(data));
		System.out.println(decrypt(encrypt(data))); // 암호화 & 복호화
	}
	
	/**************************************************
	* @MethodName : getKey
	* @Description: 알 수 없음
	* @return Key
	* @throws Exception
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	public static Key getKey() throws Exception {
		DESedeKeySpec desKeySpec = new DESedeKeySpec(key.getBytes());
		SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DESede");
		Key key = keyFactory.generateSecret(desKeySpec);
		return key;
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
		
		Cipher cipher = javax.crypto.Cipher.getInstance(DESede);
		cipher.init(javax.crypto.Cipher.ENCRYPT_MODE, getKey());
		
		return Base64.encodeBase64String(cipher.doFinal(textBytes));
	}

	/**************************************************
	* @MethodName : decrypt
	* @Description: 알 수 없음
	* @param data
	* @return String
	* @throws Exception
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	public static String decrypt(String data) throws Exception {
		Cipher cipher = javax.crypto.Cipher.getInstance(DESede);
		cipher.init(javax.crypto.Cipher.DECRYPT_MODE, getKey());
		
		byte[] textBytes = cipher.doFinal(Base64.decodeBase64(data));

		return new String(textBytes, "UTF8");
	}

}
