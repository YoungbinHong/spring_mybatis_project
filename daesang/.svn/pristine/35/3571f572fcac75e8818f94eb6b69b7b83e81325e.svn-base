/*
 * @(#)MailContent.java $version 2010. 8. 5.
 *
 * Copyright 2010 CoreMed Corp. All rights Reserved. 
 * CoreMed PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */

package daesang.common.util.mail;

import org.apache.commons.lang.StringUtils;

import daesang.common.Global;



/**
 * @author joon
 * @version 2014. 10. 09.
 */
public class MailContent {
	
	public static synchronized String etcToHtml(String normalText, String boldText){
		StringBuilder sb = new StringBuilder();
		
		String edmUrl = Global.resource.getString("EDM_URL");
		String facebookUrl = Global.resource.getString("FACEBOOK_URL");
		String blogUrl = Global.resource.getString("BLOG_URL");
		
		header(sb, edmUrl);
		
		sb.append("<p style=\"line-height:1.3; font-size:16px; color:#444; letter-spacing:-1.6px;\">스타박스 운영관리자입니다.<br/><br/></p>\n");
		sb.append("<p style=\"line-height:1.3; font-size:16px; color:#444; letter-spacing:-1.6px;\"><b class='mail_col1'>").append(normalText).append("</b> :</p>\n");
		sb.append("<p style=\"line-height:1.3; font-size:16px; color:#444; letter-spacing:-1.6px;\">").append(boldText).append("</p>\n");
		sb.append("<p style=\"line-height:1.3; font-size:16px; color:#444; letter-spacing:-1.6px; margin-bottom:105px;\">문의사항이 있으시면 고객센터<b class='mail_col1'>help@mystarbox.kr</b>로 문의주세요.<br/>감사합니다.<br/><br/></p>\n");

		footer(sb, edmUrl, facebookUrl, blogUrl);
		
		return sb.toString();
	}
	
	/************************************************** 
	 * @MethodName : outToHtml
	 * @Description: 탈퇴 이메일
	 * @param nickname
	 * @param repDate
	 * @param repContext
	 * @return String
	 * @Author     : joon
	 * @Version    : 2016. 5. 18.
	**************************************************/
	public static synchronized String outToHtml(String nickname){
		StringBuilder sb = new StringBuilder();
		
		String edmUrl = Global.resource.getString("EDM_URL");
		String facebookUrl = Global.resource.getString("FACEBOOK_URL");
		String blogUrl = Global.resource.getString("BLOG_URL");
		
		header(sb, edmUrl);
		
		if(StringUtils.isNotEmpty(nickname))
			sb.append("<p style=\"line-height:1.3; font-size:16px; color:#444; letter-spacing:-1.6px;\"><b>").append(nickname).append("님</b><br/>스타박스 운영관리자입니다.<br/><br/></p>\n");
		else
			sb.append("<p style=\"line-height:1.3; font-size:16px; color:#444; letter-spacing:-1.6px;\">스타박스 운영관리자입니다.<br/><br/></p>\n");
		
		sb.append("<p style=\"line-height:1.3; font-size:16px; color:#444; letter-spacing:-1.6px;\">회원님이 작성한 댓글은 스타박스 운영정책에 위배되며 허용기준을 초과하기에 경고 없이 회원 탈퇴되었습니다.</p>\n");
		sb.append("<p style=\"line-height:1.3; font-size:16px; color:#444; letter-spacing:-1.6px; margin-bottom:105px;\">해당 휴대폰으로는 6개월 이내에 재 가입하실 수 없으며<br/>이에 대해 문의사항이 있으시면 고객센터<b class='mail_col1'>help@mystarbox.kr</b>로 문의주세요.<br/>감사합니다.<br/><br/></p>\n");

		footer(sb, edmUrl, facebookUrl, blogUrl);
		
		return sb.toString();
	}
	
	/************************************************** 
	 * @MethodName : replyToHtml
	 * @Description: 댓글 이메일
	 * @param nickname
	 * @param repDate
	 * @param repContext
	 * @return String
	 * @Author     : joon
	 * @Version    : 2016. 5. 18.
	**************************************************/
	public static synchronized String replyToHtml(String nickname, String repDate, String repContext, boolean blackSw){
		StringBuilder sb = new StringBuilder();
		
		String edmUrl = Global.resource.getString("EDM_URL");
		String facebookUrl = Global.resource.getString("FACEBOOK_URL");
		String blogUrl = Global.resource.getString("BLOG_URL");
		
		header(sb, edmUrl);
		
		if(StringUtils.isNotEmpty(nickname))
			sb.append("<p><b style=\"display:inline-block;font-weight:700;font-family:'Nanum Gothic','NanumGothic';\">").append(nickname).append("님</b> 안녕하세요.<br/>스타박스 운영관리자입니다.<br/><br/></p>\n");
		else
			sb.append("<p>안녕하세요.<br/>스타박스 운영관리자입니다.<br/><br/></p>\n");
		
		sb.append("<p style=\"line-height:1.3; font-size:16px; color:#444; letter-spacing:-1.6px;\">회원님이 <b class='mail_col1'>").append(repDate).append("</b>에 작성한 댓글 :</p>\n");
		sb.append("<p style=\"line-height:1.3; font-size:16px; color:#444; letter-spacing:-1.6px;\">").append(repContext).append("</p>\n");
		sb.append("<p style=\"line-height:1.3; font-size:16px; color:#444; letter-spacing:-1.6px;\">위 댓글은 스타박스 운영정책에 위배되기에 삭제되었습니다.<br/><br/></p>\n");
		
		if(blackSw){
			sb.append("<p style=\"line-height:1.3; font-size:16px; color:#444; letter-spacing:-1.6px;\">또한, 회원님은 누적5회 이상 댓글이 삭제되어 앞으로 10일간 서비스 이용이 제한됩니다.<br/><br/></p>\n");
		}
		
		sb.append("<p style=\"line-height:1.3; font-size:16px; color:#444; letter-spacing:-1.6px; margin-bottom:105px;\">이에 대해 문의사항이 있으시면 고객센터 <b style=\"color:#3e606f\">help@mystarbox.kr</b>로 문의주세요.<br/>감사합니다.<br/><br/></p>\n");
				
		footer(sb, edmUrl, facebookUrl, blogUrl);
		
		return sb.toString();
	}
	
	/************************************************** 
	 * @MethodName : JoinToHtml
	 * @Description: 회원 가입 이메일
	 * @param nickname
	 * @param joinDate
	 * @param joinType
	 * @return String
	 * @Author     : joon
	 * @Version    : 2016. 5. 18.
	**************************************************/
	public static synchronized String JoinToHtml(String nickname, String joinDate, String joinType){
		StringBuilder sb = new StringBuilder();
		
		String edmUrl = Global.resource.getString("EDM_URL");
		String facebookUrl = Global.resource.getString("FACEBOOK_URL");
		String blogUrl = Global.resource.getString("BLOG_URL");
		
		header(sb, edmUrl);
		
		if(StringUtils.isNotEmpty(nickname)){
			sb.append("<p style=\"margin-left:30px; font-size:35px; letter-spacing:-3px;\"><span style=\"display:inline-block;font-weight:700;font-family:'Nanum Gothic','NanumGothic';\">").append(nickname).append("님, </span><span style=\"color:#3e606f !important;font-family:'Nanum Gothic','NanumGothic';\">스타박스 회원가입</span>을 환영합니다</p>\n");
			sb.append("<p style=\"line-height:1.3; font-size:16px; color:#444; letter-spacing:-1.6px; margin-top:85px\"><b style=\"color:#3e606f font-family:'Nanum Gothic','NanumGothic';\">").append(nickname).append("님</b> 안녕하세요.<br/><br/>스타박스는 회원님께서 좋아하는 스타가 출연하는 방송이나 관심있는 TV프로그램, 라디오 프로그램을 <br /><b>본방 시간에 알람</b>으로 알려드리는 서비스를 제공하고 있습니다.</p>\n");
		}else{
			sb.append("<p style=\"margin-left:30px; font-size:35px; letter-spacing:-3px;\"> <span style=\"color:#3e606f !important;font-family:'Nanum Gothic','NanumGothic';\">스타박스 회원가입</span>을 환영합니다</p>\n");
			sb.append("<p style=\"line-height:1.3; font-size:16px; color:#444; letter-spacing:-1.6px; margin-top:85px\">안녕하세요.<br/><br/>스타박스는 회원님께서 좋아하는 스타가 출연하는 방송이나 관심있는 TV프로그램, 라디오 프로그램을 <br /><b>본방 시간에 알람</b>으로 알려드리는 서비스를 제공하고 있습니다.</p>\n");
		}
		
		sb.append("<table cellpadding='0' cellspacing='0' style=\"width:100%;border-collapse:collapse;border-spacing:0; margin:55px 0 98px; font-size:14px;\" summary='' >\n");
		sb.append("	<caption></caption>\n");
		sb.append("	<colgroup>\n");
		sb.append("		<col width='178'/>\n");
		sb.append("		<col width=''/>\n");
		sb.append("	</colgroup>\n");
		sb.append("	<tbody>\n");
		sb.append("		<tr style=\"border-top:1px solid #e9e9e9; border-bottom:1px solid #e9e9e9; font-family:'Nanum Gothic','NanumGothic';\">\n");
		sb.append("			<th width=\"178\" style=\"padding-left:50px; background-color:#f9f9f9; color:#666; text-align:left;\">가입일시</th>\n");
		sb.append("			<td style=\"padding:10px 52px; font-weight:700;\">").append(joinDate).append("</td>\n");
		sb.append("		</tr>\n");
		sb.append("		<tr style=\"border-bottom:1px solid #e9e9e9;\">\n");
		sb.append("			<th style=\"padding-left:50px; background-color:#f9f9f9; color:#666; text-align:left;\">닉네임</th>\n");
		sb.append("			<td style=\"padding:10px 52px; font-weight:700;\">").append(nickname).append("</td>\n");
		sb.append("		</tr>\n");
		sb.append("		<tr style=\"border-bottom:1px solid #e9e9e9;\">\n");
		sb.append("			<th style=\"padding-left:50px; background-color:#f9f9f9; color:#666; text-align:left;\">가입계정</th>\n");
		sb.append("			<td style=\"padding:10px 52px; font-weight:700;\">").append(joinType).append("</td>\n");
		sb.append("		</tr>\n");
		sb.append("	</tbody>\n");
		sb.append("</table>\n");
		
		footer(sb, edmUrl, facebookUrl, blogUrl);
		
		return sb.toString();
	}
	
	private static final void header(StringBuilder sb, String edmUrl){
		
		sb.append("<!DOCTYPE html>\n");
		sb.append("<html lang='ko'>\n");
		sb.append("<head>\n");
		sb.append("	<title>:: [STARBOX] 발송메일 ::</title>\n");
		sb.append("	<meta charset='utf-8' />\n");
		sb.append("	<meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'>\n");
		sb.append("	<meta name='viewport' content='width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=2.0,user-scalable=yes,targer-densitydpi=medium-dpi'>\n");		
		sb.append("</head>\n");
		sb.append("<body>\n");
		sb.append("	<div style=\"font-family:'Nanum Gothic','NanumGothic';letter-spacing:-1.4px; width:800px; padding:48px 76px; background-color:#f7f7f7; margin:0 auto; letter-spacing:-1.4px;\">\n");
		sb.append("		<div style=\"background-color:#fff;\">\n");
		sb.append("			<div style=\"height:193px; background:url('").append(edmUrl).append("/images/mail/mail_bg.png') no-repeat bottom center; border-top:3px solid #3e606f;\">\n");
		sb.append("				<p style=\"padding:35px 0 30px; background-color:#d1dbbd; text-align:center;\"><img src='").append(edmUrl).append("/images/mail/mail_logo.png' alt='스타박스'/></p>\n");
		sb.append("			</div>\n");
		sb.append("			<div style=\"padding:60px 70px 0;\">\n");	
	}
	
	private static final void footer(StringBuilder sb, String edmUrl, String facebookUrl, String blogUrl){
		
		sb.append("		<div style=\"padding-right:50px; margin-bottom:30px; font-family:'Nanum Gothic','NanumGothic';\">\n");
		sb.append("			<p style=\"text-align:center;\">\n");
		sb.append("				<a href='").append(facebookUrl).append("' target=\"_blank\" style=\"color:#3e606f; display:inline-block; margin:0 32px; font-size:16px; font-weight:700; letter-spacing:0; text-decoration:none;\">FaceBook</a><span style=\"display:inline-block; width:1px; height:13px; background-color:#b3b3b3; vertical-align:bottom;\"></span><a href='").append(blogUrl).append("' target=\"_blank\" style=\"text-decoration:none; color:#3e606f;display:inline-block; margin:0 32px; font-size:16px; font-weight:700; letter-spacing:0;\">Blog</a>\n");
		sb.append("			</p>\n");
		sb.append("		</div>\n");
		sb.append("		</div>\n");
		sb.append("		<div style=\"padding:29px 70px; background-color:#ebebeb; font-family:'Nanum Gothic','NanumGothic';\">\n");
		sb.append("			<p style=\"line-height:1.4; font-size:14px; margin-bottom:6px;\">이 메일은 발신 전용으로 회신이 되지 않습니다.</p>\n");
		sb.append("			<p style=\"line-height:1.4; font-size:12px;\">Copyright © 2014 adup. 04626, 2, Toegye-ro 36-gil, Jung-gu, Seoul, Korea. All Rights Reserved.&nbsp; <a href='http://mystarbox.kr/service/terms' target=\"_blank\" style=\"text-decoration:none; color:blue;\">이용 약관</a> &nbsp;&nbsp;|&nbsp;&nbsp; <a href='http://mystarbox.kr/service/privacy' target=\"_blank\" style=\"text-decoration:none; color:blue;\">개인정보 보호</a></p>\n");
		sb.append("		</div>\n");
		sb.append("	</div>\n");		
		sb.append("</div>\n");
		sb.append("</body>\n");
		sb.append("</html>\n");
	}
}
