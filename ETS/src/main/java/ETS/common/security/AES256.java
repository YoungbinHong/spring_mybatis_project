package ETS.common.security;

import java.security.spec.AlgorithmParameterSpec;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

/**************************************************
* @FileName   : AES256.java
* @Description: 알 수 없음
* @Author     : 알 수 없음
* @Version    : 2020. 8. 14.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

public class AES256 {
	
	private final static String key = "0123456789ABCDEF"; //32...
	private final static String iv  = "0000000000000000";
	private final static String AES = "AES/CBC/PKCS5Padding";
	
	/**************************************************
	* @MethodName : main
	* @Description: 메인 메소드
	* @param args
	* @throws Exception
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	public static void main(String[] args) throws Exception {
		String data = "test";
		System.out.println(encrypt(data));
		System.out.println(decrypt(encrypt(data))); // 암호화 & 복호화
	}
	
	/**************************************************
	* @MethodName : SecretKeySpec
	* @Description: 알 수 없음
	* @return SecretKeySpec
	* @throws Exception
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	public static SecretKeySpec getKey() throws Exception {
		return new SecretKeySpec(key.getBytes("UTF-8"), "AES");
    }
    
	/**************************************************
	* @MethodName : AlgorithmParameterSpec
	* @Description: 알 수 없음
	* @return IvParameterSpec
	* @throws Exception
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
	public static AlgorithmParameterSpec getIv() throws Exception {
		return new IvParameterSpec(iv.getBytes("UTF-8"));
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
		
		Cipher cipher = Cipher.getInstance(AES);
		cipher.init(Cipher.ENCRYPT_MODE, getKey(), getIv());
		
		return Base64.encodeBase64String(cipher.doFinal(textBytes));
    }
    
    /**************************************************
	* @MethodName : SecretKeySpec
	* @Description: 알 수 없음
	* @param data
	* @return String
	* @throws Exception
	* @Author     : 알 수 없음
	* @Version    : 2020. 8. 14.
	**************************************************/
    public static String decrypt(String data) throws Exception {
		byte[] textBytes = Base64.decodeBase64(data);
		
		Cipher cipher = Cipher.getInstance(AES);
		cipher.init(Cipher.DECRYPT_MODE, getKey(), getIv());
		
		return new String(cipher.doFinal(textBytes), "UTF-8");
    }
}
