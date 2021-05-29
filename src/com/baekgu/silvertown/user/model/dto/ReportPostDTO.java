package com.baekgu.silvertown.user.model.dto;

public class ReportPostDTO {

	/* 개인이 기업을 신고하는 DTO */
	private int postCode;
	private int resumeCode;
	private String reportReason;
	private int userCode;

	public ReportPostDTO() {}

	/**
	 * @param postCode
	 * @param resumeCode
	 * @param reportReason
	 * @param userCode
	 */
	public ReportPostDTO(int postCode, int resumeCode, String reportReason, int userCode) {
		super();
		this.postCode = postCode;
		this.resumeCode = resumeCode;
		this.reportReason = reportReason;
		this.userCode = userCode;
	}

	public int getPostCode() {
		return postCode;
	}

	public void setPostCode(int postCode) {
		this.postCode = postCode;
	}

	public int getResumeCode() {
		return resumeCode;
	}

	public void setResumeCode(int resumeCode) {
		this.resumeCode = resumeCode;
	}

	public String getReportReason() {
		return reportReason;
	}

	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	@Override
	public String toString() {
		return "ReportPostDTO [postCode=" + postCode + ", resumeCode=" + resumeCode + ", reportReason=" + reportReason
				+ ", userCode=" + userCode + "]";
	}
	
}
