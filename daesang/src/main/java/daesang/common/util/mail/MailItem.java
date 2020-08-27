package daesang.common.util.mail;

public class MailItem {

	private String sTO; // 받는 사람 메일주소
	private String sCC; // 참조 사람 메일주소
	private String sFrom; // 보내는 사람 메일주소
	private String sFromName; // 보내는 사람명
	private String sSubject; // 메일 제목	
	private String sContents; // 메일 내용
	private String emailKind; // DB에 웹메일 로그 정보 저장을 위한 이메일 구분 값
	
	public String getsTO() {
		return sTO;
	}
	public void setsTO(String sTO) {
		this.sTO = sTO;
	}
	public String getsCC() {
		return sCC;
	}
	public void setsCC(String sCC) {
		this.sCC = sCC;
	}
	public String getsFrom() {
		return sFrom;
	}
	public void setsFrom(String sFrom) {
		this.sFrom = sFrom;
	}
	public String getsFromName() {
		return sFromName;
	}
	public void setsFromName(String sFromName) {
		this.sFromName = sFromName;
	}
	public String getsSubject() {
		return sSubject;
	}
	public void setsSubject(String sSubject) {
		this.sSubject = sSubject;
	}
	public String getsContents() {
		return sContents;
	}
	public void setsContents(String sContents) {
		this.sContents = sContents;
	}
	public String getEmailKind() {
		return emailKind;
	}
	public void setEmailKind(String emailKind) {
		this.emailKind = emailKind;
	}
}
