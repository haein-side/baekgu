package com.baekgu.silvertown.admin.model.dto;

import java.sql.Date;


public class BusinessJoinDTO {

	
	/* ---------- 기업 정보 -------*/
	private int bCode; // 기업코드
	private String bName; // 기업이름
	private String bOwner; // 기업대표자
	private String bNumber; // 사업자번호
	private String bAddress; // 기업주소
	private String bPhone; // 기업번호
	private int bBlock;  // 기업차단여부 
	private String bProfit; // 기업매출액
	
	/* ---------- 기업 담당자 -------*/
	 
	private String hrId; // 기업담당자아이디
	private String hrPwd; // 기업담당자비번
	private String hrName; // 기업담당자이름
	private String hrPhone; // 기업담당자번호
	private String hrEmail; // 기업담당자이메일
	
	/* -----------------*/
	private String dListReason; // 승인, 거절 사유 
	private Date dListDate; // 승인, 거절 날짜 
	private int decisionCode; // 접수,승인,거절 (1,2,3) 
	private int dListCode; // 기업가입(3)
	private String adminId;
	/*-----------------------------------*/
	
	public BusinessJoinDTO() {}

	public BusinessJoinDTO(int bCode, String bName, String bOwner, String bNumber, String bAddress, String bPhone,
			int bBlock, String bProfit, String hrId, String hrPwd, String hrName, String hrPhone, String hrEmail,
			String dListReason, Date dListDate, int decisionCode, int dListCode, String adminId) {
		super();
		this.bCode = bCode;
		this.bName = bName;
		this.bOwner = bOwner;
		this.bNumber = bNumber;
		this.bAddress = bAddress;
		this.bPhone = bPhone;
		this.bBlock = bBlock;
		this.bProfit = bProfit;
		this.hrId = hrId;
		this.hrPwd = hrPwd;
		this.hrName = hrName;
		this.hrPhone = hrPhone;
		this.hrEmail = hrEmail;
		this.dListReason = dListReason;
		this.dListDate = dListDate;
		this.decisionCode = decisionCode;
		this.dListCode = dListCode;
		this.adminId = adminId;
	}

	
	public int getbCode() {
		return bCode;
	}

	public void setbCode(int bCode) {
		this.bCode = bCode;
	}

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
		this.bName = bName;
	}

	public String getbOwner() {
		return bOwner;
	}

	public void setbOwner(String bOwner) {
		this.bOwner = bOwner;
	}

	public String getbNumber() {
		return bNumber;
	}

	public void setbNumber(String bNumber) {
		this.bNumber = bNumber;
	}

	public String getbAddress() {
		return bAddress;
	}

	public void setbAddress(String bAddress) {
		this.bAddress = bAddress;
	}

	public String getbPhone() {
		return bPhone;
	}

	public void setbPhone(String bPhone) {
		this.bPhone = bPhone;
	}

	public int getbBlock() {
		return bBlock;
	}

	public void setbBlock(int bBlock) {
		this.bBlock = bBlock;
	}

	public String getbProfit() {
		return bProfit;
	}

	public void setbProfit(String bProfit) {
		this.bProfit = bProfit;
	}

	public String getHrId() {
		return hrId;
	}

	public void setHrId(String hrId) {
		this.hrId = hrId;
	}

	public String getHrPwd() {
		return hrPwd;
	}

	public void setHrPwd(String hrPwd) {
		this.hrPwd = hrPwd;
	}

	public String getHrName() {
		return hrName;
	}

	public void setHrName(String hrName) {
		this.hrName = hrName;
	}

	public String getHrPhone() {
		return hrPhone;
	}

	public void setHrPhone(String hrPhone) {
		this.hrPhone = hrPhone;
	}

	public String getHrEmail() {
		return hrEmail;
	}

	public void setHrEmail(String hrEmail) {
		this.hrEmail = hrEmail;
	}

	public String getdListReason() {
		return dListReason;
	}

	public void setdListReason(String dListReason) {
		this.dListReason = dListReason;
	}

	public Date getdListDate() {
		return dListDate;
	}

	public void setdListDate(Date dListDate) {
		this.dListDate = dListDate;
	}

	public int getDecisionCode() {
		return decisionCode;
	}

	public void setDecisionCode(int decisionCode) {
		this.decisionCode = decisionCode;
	}

	public int getdListCode() {
		return dListCode;
	}

	public void setdListCode(int dListCode) {
		this.dListCode = dListCode;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	@Override
	public String toString() {
		return "BusinessJoinDTO [bCode=" + bCode + ", bName=" + bName + ", bOwner=" + bOwner + ", bNumber=" + bNumber
				+ ", bAddress=" + bAddress + ", bPhone=" + bPhone + ", bBlock=" + bBlock + ", bProfit=" + bProfit
				+ ", hrId=" + hrId + ", hrPwd=" + hrPwd + ", hrName=" + hrName + ", hrPhone=" + hrPhone + ", hrEmail="
				+ hrEmail + ", dListReason=" + dListReason + ", dListDate=" + dListDate + ", decisionCode="
				+ decisionCode + ", dListCode=" + dListCode + ", adminId=" + adminId + "]";
	}
	
	
	



	
	
}
