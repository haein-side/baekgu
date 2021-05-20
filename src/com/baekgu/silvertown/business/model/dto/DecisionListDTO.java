package com.baekgu.silvertown.business.model.dto;

import java.sql.Date;

public class DecisionListDTO {

	private String dListReason;
	private java.sql.Date dListDate;
	private String adminId;
	private int decisionCode;
	private int dListTypeCode;
	
	public DecisionListDTO() {
		super();
	}
	
	public DecisionListDTO(String dListReason, Date dListDate, String adminId, int decisionCode, int dListTypeCode) {
		super();
		this.dListReason = dListReason;
		this.dListDate = dListDate;
		this.adminId = adminId;
		this.decisionCode = decisionCode;
		this.dListTypeCode = dListTypeCode;
	}
	
	public String getdListReason() {
		return dListReason;
	}
	public void setdListReason(String dListReason) {
		this.dListReason = dListReason;
	}
	public java.sql.Date getdListDate() {
		return dListDate;
	}
	public void setdListDate(java.sql.Date dListDate) {
		this.dListDate = dListDate;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public int getDecisionCode() {
		return decisionCode;
	}
	public void setDecisionCode(int decisionCode) {
		this.decisionCode = decisionCode;
	}
	public int getdListTypeCode() {
		return dListTypeCode;
	}
	public void setdListTypeCode(int dListTypeCode) {
		this.dListTypeCode = dListTypeCode;
	}
	
	@Override
	public String toString() {
		return "DecisionListDTO [dListReason=" + dListReason + ", dListDate=" + dListDate + ", adminId=" + adminId
				+ ", decisionCode=" + decisionCode + ", dListTypeCode=" + dListTypeCode + "]";
	}
	
	
}
