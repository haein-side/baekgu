package com.baekgu.silvertown.user.model.dto;

public class BusinessDTO {

	private String bId;
	private String bPwd;
	private String bName;
	private String bPhone;
	private String bEmail;
	private int bCode;
	public BusinessDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BusinessDTO(String bId, String bPwd, String bName, String bPhone, String bEmail, int bCode) {
		super();
		this.bId = bId;
		this.bPwd = bPwd;
		this.bName = bName;
		this.bPhone = bPhone;
		this.bEmail = bEmail;
		this.bCode = bCode;
	}
	public String getbId() {
		return bId;
	}
	public void setbId(String bId) {
		this.bId = bId;
	}
	public String getbPwd() {
		return bPwd;
	}
	public void setbPwd(String bPwd) {
		this.bPwd = bPwd;
	}
	public String getbName() {
		return bName;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
	public String getbPhone() {
		return bPhone;
	}
	public void setbPhone(String bPhone) {
		this.bPhone = bPhone;
	}
	public String getbEmail() {
		return bEmail;
	}
	public void setbEmail(String bEmail) {
		this.bEmail = bEmail;
	}
	public int getbCode() {
		return bCode;
	}
	public void setbCode(int bCode) {
		this.bCode = bCode;
	}
	@Override
	public String toString() {
		return "BusinessDTO [bId=" + bId + ", bPwd=" + bPwd + ", bName=" + bName + ", bPhone=" + bPhone + ", bEmail="
				+ bEmail + ", bCode=" + bCode + "]";
	}
	
	
	}
