package com.sc.main.vo;

public class UserVO {
	private String userid;
	private String userpw;
	private String userpw_chk;
	private String username;
	private String tel1;
	private String tel2;
	private String tel3;
	private String tel;
	private String email1;
	private String email2;
	private int zipcode;
	private String addr;
	private String addrdetail;
	private String credit1;
	private String credit2;
	private String credit3;
	private String credit4;
	private String email;
	private String creditcardno;
	
	public void setTelSplit() {
		String[] stel=tel.split("-");
		this.tel1 = stel[0];
		this.tel2 = stel[1];
		this.tel3 = stel[2];
	}
	
	public void setEmailSplit() {
		String[] semail=email.split("@");
		this.email1 = semail[0];
		this.email2 = semail[1];
	}
	
	public void setCreditSplit() {
		String[] scard = creditcardno.split("-");
		this.credit1 = scard[0];
		this.credit2 = scard[1];
		this.credit3 = scard[2];
		this.credit4 = scard[3];
	}
	
	public String getTel() {
		return tel;
	}
	
	public void setTel() {
		this.tel = tel1+"-"+tel2+"-"+tel3;
	}
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUserpw_chk() {
		return userpw_chk;
	}
	public void setUserpw_chk(String userpw_chk) {
		this.userpw_chk = userpw_chk;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public int getZipcode() {
		return zipcode;
	}
	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddrdetail() {
		return addrdetail;
	}
	public void setAddrdetail(String addrdetail) {
		this.addrdetail = addrdetail;
	}
	public String getCredit1() {
		return credit1;
	}
	public void setCredit1(String credit1) {
		this.credit1 = credit1;
	}
	public String getCredit2() {
		return credit2;
	}
	public void setCredit2(String credit2) {
		this.credit2 = credit2;
	}
	public String getCredit3() {
		return credit3;
	}
	public void setCredit3(String credit3) {
		this.credit3 = credit3;
	}
	public String getCredit4() {
		return credit4;
	}
	public void setCredit4(String credit4) {
		this.credit4 = credit4;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail() {
		this.email = email1+"@"+email2;
	}
	public String getCreditcardno() {
		return creditcardno;
	}
	public void setCreditcardno() {
		this.creditcardno = credit1+"-"+credit2+"-"+credit3+"-"+credit4;
	}
	@Override
	public String toString() {
		return "UserVO [userid=" + userid + ", userpw=" + userpw + ", userpw_chk=" + userpw_chk + ", username="
				+ username + ", tel1=" + tel1 + ", tel2=" + tel2 + ", tel3=" + tel3 + ", email1=" + email1 + ", email2="
				+ email2 + ", zipcode=" + zipcode + ", addr=" + addr + ", addrdetail=" + addrdetail + ", credit1="
				+ credit1 + ", credit2=" + credit2 + ", credit3=" + credit3 + ", credit4=" + credit4 + ", email="
				+ email + ", creditcardno=" + creditcardno + ", tel=" + tel + "]";
	}
	
}
