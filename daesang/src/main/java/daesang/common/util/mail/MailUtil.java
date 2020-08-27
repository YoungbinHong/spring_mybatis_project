/*
 * @(#)MailUtil.java $version 2010. 8. 5.
 *
 * Copyright 2010 CoreMed Corp. All rights Reserved. 
 * CoreMed PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */

package daesang.common.util.mail;

import java.io.File;
import java.util.LinkedList;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Part;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import daesang.common.util.file.FileVO;

/**
 * @author joon
 * @version 2014. 10. 09.
 */
public class MailUtil {

	/**
	 * SMTP를 사용하여 메일을 보낸다. 
	 *
	 * @param sTO 받는사람 메일 주소
	 * @param sCC 참조할 사람 메일주소
	 * @param sSubject 제목
	 * @param sFrom 보내는사람 메일주소
	 * @param sFromName 보내는사람이름
	 * @param paramMap 템플릿 파라메터
	 * @return 0 : 실패, 1 : 성공
	 */
			
	public synchronized static boolean sendMail(MailItem mailItem, FileVO fileVO) {
		return sendMail(mailItem.getsTO(), mailItem.getsCC(), mailItem.getsSubject(), mailItem.getsFrom(), mailItem.getsFromName(), mailItem.getsContents(), fileVO);
	}

	public static boolean sendMail(String sTO, String sCC, String sSubject, String sFrom, String sFromName, String sContents, FileVO fileVO) {
		boolean retStr = false;
		String host = "smtp.works.naver.com";
		String port = "465";	//기존 포트 : 587

		try {
			// Session을 생성하기 위해 java.util.Properties 클래스를
			// 생성하고 자신이 해당하는 SMTP 호스트 주소를 할당합니다.
			Properties props = new Properties();
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", port); //default..
			props.put("mail.smtp.auth", "true");
			
			//SSL 설정
//			props.put("mail.smtp.ssl.enable", "true");
//	        props.put("mail.smtp.ssl.trust", host);
	        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	       
			Authenticator auth = new InetMailAuthenticatorSubmit();
			
			// 기본 Session을 생성하고 할당합니다.
			Session msgSession = Session.getDefaultInstance(props, auth);
//			msgSession.setDebug(true); //for debug
			// Message 클래스의 객체를 Session을 이용해 생성합니다.
			MimeMessage msg = new MimeMessage(msgSession);

			InternetAddress from = new InternetAddress(sFrom, sFromName, "utf-8");
			msg.setFrom(from);

			// 받는사람.......
			LinkedList<InternetAddress> list = new LinkedList<InternetAddress>();
			StringTokenizer parserTo = new StringTokenizer(sTO.replaceAll(";", ","), ",");

			while (parserTo.hasMoreElements()) {
				String receiver = ((String)parserTo.nextElement()).trim();
				list.add(new InternetAddress(receiver));
			}

			Object[] obj = list.toArray();
			InternetAddress[] address = new InternetAddress[obj.length];

			for (int i = 0; i < obj.length; i++) {
				address[i] = (InternetAddress)obj[i];
			}

			msg.setRecipients(Message.RecipientType.TO, address);

			// 받는사람 CC
			LinkedList<InternetAddress> listCC = new LinkedList<InternetAddress>();

			if (sCC != null && sCC.length() > 0) {
				StringTokenizer parserCc = new StringTokenizer(sCC.replaceAll(";", ","), ",");

				while (parserCc.hasMoreElements()) {
					listCC.add(new InternetAddress((String)parserCc.nextElement()));
				}

				Object[] objCC = listCC.toArray();
				InternetAddress[] addressCC = new InternetAddress[objCC.length];

				for (int i = 0; i < objCC.length; i++) {
					addressCC[i] = (InternetAddress)objCC[i];
				}

				msg.setRecipients(Message.RecipientType.CC, addressCC);
			}

			Multipart mp = new MimeMultipart();

			// 내용
			MimeBodyPart mbpCont = new MimeBodyPart();
			mbpCont.setContent(sContents.toString(), "text/html; charset=UTF-8");
			mp.addBodyPart(mbpCont);

			//파일 첨부하기
			if(fileVO != null && fileVO.getUploadFile() != null){
				MimeBodyPart mbp2 = new MimeBodyPart();
				mbp2.addHeader("My-File-Type", fileVO.getUploadFile().getContentType());
				File tmpFile = File.createTempFile("newAttachment", ".tmp");
				fileVO.getUploadFile().transferTo(tmpFile);
				FileDataSource fds = new FileDataSource(tmpFile);
				mbp2.setDataHandler(new DataHandler(fds));
				mbp2.setFileName(fileVO.getUploadFile().getOriginalFilename());
				mbp2.setDisposition(Part.ATTACHMENT);
				mp.addBodyPart(mbp2);
				tmpFile.deleteOnExit();
			}
			
			msg.setContent(mp);
			msg.setSubject(sSubject, "UTF-8");
						
			Transport.send(msg);

			retStr = true; // 성공							
		} catch (Exception ex) {
			ex.printStackTrace();
			
		}

		return retStr;
	}
	
	public static void main(String args[]){
		
//		MailItem mailItem = new MailItem();
//		mailItem.setsTO("joonofgod@naver.com");
//		mailItem.setsFrom("master@adup.kr");
//		mailItem.setsFromName("ADUP");
//		mailItem.setsSubject("메일 테스트!!!");
//		mailItem.setsContents(MailContent.JoinToHtml("", DateUtil.getSimpleDate("yyyy-MM-dd"), "L"));
//		
//		MailUtil.sendMail(mailItem, null);
		
		//메일 전송 테스트...
		if(MailUtil.sendMail("joonofgod@naver.com", null, "메일 테스트!!!", "master@adup.kr", "ADUP", "메일... 잘 들어갑니까??", null)){
			System.out.println("Mail 전송 성공");
		}else{
			System.out.println("Mail 전송 실패");
		}
	}
}

class InetMailAuthenticatorSubmit extends Authenticator {
	public PasswordAuthentication getPasswordAuthentication() {
		//admin, webmaster 등 영구적 계정으로 변경
		return new PasswordAuthentication("master@adup.kr", "dkdltmxmfh#57");
	}
}
