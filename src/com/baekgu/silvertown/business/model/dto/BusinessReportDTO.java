package com.baekgu.silvertown.business.model.dto;

public class BusinessReportDTO {

	private int postCode;
	private int resumeCode;
	private String reportReason;

	public BusinessReportDTO() {
		super();
	}

	public BusinessReportDTO(int postCode, int resumeCode, String reportReason) {
		super();
		this.postCode = postCode;
		this.resumeCode = resumeCode;
		this.reportReason = reportReason;
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

	@Override
	public String toString() {
		return "BusinessReportDTO [postCode=" + postCode + ", resumeCode=" + resumeCode + ", reportReason="
				+ reportReason + "]";
	}
	
}
