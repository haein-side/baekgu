package com.baekgu.silvertown.business.model.dto;

import java.sql.Date;

public class BusinessReportListDTO {

	private Date reportDate;
	private String reportReason;
	private String managerName;
	private String postTitle;
	private Date decisionDate;
	private String decisionReason;
	private String decisionStatus;
	private String userName;
	
	public BusinessReportListDTO() {
		super();
	}
	
	public BusinessReportListDTO(Date reportDate, String reportReason, String managerName, String postTitle,
			Date decisionDate, String decisionReason, String decisionStatus, String userName) {
		super();
		this.reportDate = reportDate;
		this.reportReason = reportReason;
		this.managerName = managerName;
		this.postTitle = postTitle;
		this.decisionDate = decisionDate;
		this.decisionReason = decisionReason;
		this.decisionStatus = decisionStatus;
		this.userName = userName;
	}
	
	public Date getReportDate() {
		return reportDate;
	}
	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}
	public String getReportReason() {
		return reportReason;
	}
	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public Date getDecisionDate() {
		return decisionDate;
	}
	public void setDecisionDate(Date decisionDate) {
		this.decisionDate = decisionDate;
	}
	public String getDecisionReason() {
		return decisionReason;
	}
	public void setDecisionReason(String decisionReason) {
		this.decisionReason = decisionReason;
	}
	public String getDecisionStatus() {
		return decisionStatus;
	}
	public void setDecisionStatus(String decisionStatus) {
		this.decisionStatus = decisionStatus;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Override
	public String toString() {
		return "BusinessReportListDTO [reportDate=" + reportDate + ", reportReason=" + reportReason + ", managerName="
				+ managerName + ", postTitle=" + postTitle + ", decisionDate=" + decisionDate + ", decisionReason="
				+ decisionReason + ", decisionStatus=" + decisionStatus + ", userName=" + userName + "]";
	}
	
	
}
