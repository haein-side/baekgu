package com.baekgu.silvertown.admin.model.dto;

import java.sql.Date;

public class BlockDTO {
	
	private int rCode; //리포트 코드
	private String rReason; //리포트 이유
	private Date rDate; //리포트 데이
	private int postCode; //리포트 연관 공고 코드
	private int userCode; //리포트 연관 유저 코드
	private int dlCode; //리포트 연관 d_list_code
	/*--------------------*/
	private int bCode; //d_list_code
	private String bReason; //처리사유
	private Date bDate; //처리날짜
	private int bdCode; //처리코드 1대기중 2승인 3거절
	private int bdTCode; //타겟 1일반회원 2공고 3기업가입 4공고등록
	private String admin; //처리한 관리자
	private int companyCode; //공고코드와 연관된 기업
	public BlockDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BlockDTO(int rCode, String rReason, Date rDate, int postCode, int userCode, int dlCode, int bCode,
			String bReason, Date bDate, int bdCode, int bdTCode, String admin, int companyCode) {
		super();
		this.rCode = rCode;
		this.rReason = rReason;
		this.rDate = rDate;
		this.postCode = postCode;
		this.userCode = userCode;
		this.dlCode = dlCode;
		this.bCode = bCode;
		this.bReason = bReason;
		this.bDate = bDate;
		this.bdCode = bdCode;
		this.bdTCode = bdTCode;
		this.admin = admin;
		this.companyCode = companyCode;
	}
	public int getrCode() {
		return rCode;
	}
	public void setrCode(int rCode) {
		this.rCode = rCode;
	}
	public String getrReason() {
		return rReason;
	}
	public void setrReason(String rReason) {
		this.rReason = rReason;
	}
	public Date getrDate() {
		return rDate;
	}
	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}
	public int getPostCode() {
		return postCode;
	}
	public void setPostCode(int postCode) {
		this.postCode = postCode;
	}
	public int getUserCode() {
		return userCode;
	}
	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}
	public int getDlCode() {
		return dlCode;
	}
	public void setDlCode(int dlCode) {
		this.dlCode = dlCode;
	}
	public int getbCode() {
		return bCode;
	}
	public void setbCode(int bCode) {
		this.bCode = bCode;
	}
	public String getbReason() {
		return bReason;
	}
	public void setbReason(String bReason) {
		this.bReason = bReason;
	}
	public Date getbDate() {
		return bDate;
	}
	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}
	public int getBdCode() {
		return bdCode;
	}
	public void setBdCode(int bdCode) {
		this.bdCode = bdCode;
	}
	public int getBdTCode() {
		return bdTCode;
	}
	public void setBdTCode(int bdTCode) {
		this.bdTCode = bdTCode;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public int getCompanyCode() {
		return companyCode;
	}
	public void setCompanyCode(int companyCode) {
		this.companyCode = companyCode;
	}
	@Override
	public String toString() {
		return "BlockDTO [rCode=" + rCode + ", rReason=" + rReason + ", rDate=" + rDate + ", postCode=" + postCode
				+ ", userCode=" + userCode + ", dlCode=" + dlCode + ", bCode=" + bCode + ", bReason=" + bReason
				+ ", bDate=" + bDate + ", bdCode=" + bdCode + ", bdTCode=" + bdTCode + ", admin=" + admin
				+ ", companyCode=" + companyCode + "]";
	}
	
	
	
	



	


	


	
	
	
	
	
	

}
