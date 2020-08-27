package ETSAdupBot;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ETS.notice.NoticeController;

/**************************************************
* @FileName   : ETSAdupBot.java
* @Description: 알 수 없음
* @Author     : Seungjun Kim
* @Version    : 2020. 8. 14.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

public class ETSAdupBot {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	public static boolean funcTelegram(String contents) {
		String token = "1264225345:AAHCNEs_XjLMQSh9UhYBtXoKh-iNGjn8I3A";
		String chat_id = "1129901703";
		String text = "";
		String t = "";
		if (!contents.isEmpty()) text = contents;
		text= text.substring(3 , text.length()-4);
		logger.error("내용 : {}  텍스트 :  {}  ", contents , text);
		/*text = "✉️ [id]님의 주문 정보입니다. ✉️\r\n" + 
				"\r\n" + 
				"Exchange : [binance]\r\n" + 
				"Trading type : Actual\r\n" + 
				"Order ID : [5eb3b04d976c861bd15e4d67]\r\n" + 
				"Date : 2020-06-05 19:30:05\r\n" + 
				"\r\n" + 
				"Strategy Order의 매도 주문이 체결 되었습니다.\r\n" + 
				"\r\n" + 
				"- Pair : BTC-USDT\r\n" + 
				"- Strategy Name : BTC 오류테스트\r\n" + 
				"- Buy indicator : 'supertrend' \r\n" + 
				"- Sell indicator : 'supertrend' \r\n" + 
				"- Sell Trailling : Off \r\n" + 
				"\r\n" + 
				"- Profit And Loss : -1.26688886\r\n" + 
				"- Transaction : Win 10 / Lose 29 (79 times)\r\n" + 
				"- Rate of Return : -0.2 %\r\n" + 
				"\r\n" + 
				"🔸 Sell Order 🔸\r\n" + 
				"\r\n" + 
				"- Sell price : 9720.88000000\r\n" + 
				"- Filled : 0.00150000\r\n" + 
				"- Total : 14.58132000\r\n" + 
				"\r\n" + 
				"🔹 Buy Order 🔹\r\n" + 
				"\r\n" + 
				"- Average Price : 9857.90000000  \r\n" + 
				"- Total Filled : 0.00150000  \r\n" + 
				"- Total : 14.78685000\r\n" + 
				"";*/

		BufferedReader in = null;

		try {
			URL obj = new URL("https://api.telegram.org/bot" + token + "/sendmessage?chat_id=" + chat_id + "&text=" + URLEncoder.encode(text,"UTF-8"));
			
			HttpURLConnection con = (HttpURLConnection) obj.openConnection();
			con.setRequestMethod("GET");
			in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			String line;

			while ((line = in.readLine()) != null) { // response를 차례대로 출력
				System.out.println(line);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (in != null)
				try {
					in.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
		}
		
		return true;
	}
}
