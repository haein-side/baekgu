package com.baekgu.silvertown.admin.model.dto;

import java.sql.Date;

public class BlockDTO {
	
	private int rCode;
	private String rReason;
	private Date rDate;
	private int postCode;
	private int userCode;
	private int dlCode;
	/*--------------------*/
	private int bCode;
	private String bReason;
	private Date bDate;
	private int bdCode;
	private int bdTCode;
	private String admin;
	
	
	public BlockDTO() {
	}


	public BlockDTO(int bCode, String bReason, Date bDate, int bdCode, int bdTCode, String admin, int rCode,
			String rReason, Date rDate, int postCode, int userCode, int dlCode) {
		super();
		this.bCode = bCode;
		this.bReason = bReason;
		this.bDate = bDate;
		this.bdCode = bdCode;
		this.bdTCode = bdTCode;
		this.admin = admin;
		this.rCode = rCode;
		this.rReason = rReason;
		this.rDate = rDate;
		this.postCode = postCode;
		this.userCode = userCode;
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


	@Override
	public String toString() {
		return "BlockDTO [bCode=" + bCode + ", bReason=" + bReason + ", bDate=" + bDate + ", bdCode=" + bdCode
				+ ", bdTCode=" + bdTCode + ", admin=" + admin + ", rCode=" + rCode + ", rReason=" + rReason + ", rDate="
				+ rDate + ", postCode=" + postCode + ", userCode=" + userCode + ", dlCode=" + dlCode + "]";
	}


	


	


	
	
	
	
	
	

}
