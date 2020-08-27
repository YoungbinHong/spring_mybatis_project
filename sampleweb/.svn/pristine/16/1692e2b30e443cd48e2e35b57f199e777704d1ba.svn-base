package kr.co.adup.base.model;

/**
 * 회원정보
 * @author lazym
 *
 */
public class MemberVO {

	/**
	 * 아이디
	 */
	private String cid;

	/**
	 * 권한
	 * admin / company
	 */
	private String cauth;
	
	/**
	 * 회사명
	 */
	private String cname;

	/**
	 * 회사 코드
	 */
	private String company_type;

	public String getCid() {
		return this.cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getCauth() {
		return this.cauth;
	}

	public void setCauth(String cauth) {
		this.cauth = cauth;
	}

	public String getCname() {
		return this.cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCompany_type() {
		return this.company_type;
	}

	public void setCompany_type(String company_type) {
		this.company_type = company_type;
	}

	public boolean isAdmin(){
		return "admin".equals(this.cauth);
	}

	
}
