package com.baekgu.silvertown.user.model.dto;

import java.sql.Date;

public class ReportDTO {

	private Date reportDate;
	private String postTitle;
	private int decisionCode;
	
	public ReportDTO() {
		super();
	}

	public ReportDTO(Date reportDate, String postTitle, int decisionCode) {
		super();
		this.reportDate = reportDate;
		this.postTitle = postTitle;
		this.decisionCode = decisionCode;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public int getDecisionCode() {
		return decisionCode;
	}

	public void setDecisionCode(int decisionCode) {
		this.decisionCode = decisionCode;
	}

	@Override
	public String toString() {
		return "ReportDTO [reportDate=" + reportDate + ", postTitle=" + postTitle + ", decisionCode=" + decisionCode
				+ "]";
	}
	
}
