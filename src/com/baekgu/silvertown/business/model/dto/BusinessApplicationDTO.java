package com.baekgu.silvertown.business.model.dto;

import java.sql.Date;

public class BusinessApplicationDTO {

	private int applyCode;
	private int resumeCode;
	private int postCode;
	private String applicantName;
	private Date applyDate;
	private int resumeRead;
	private String applyStatus;
	private String postTitle;
	private Date postStart;
	private Date postEnd;
	private String postAdvantages;
	private String resumeAdvantages;
	
	public BusinessApplicationDTO() {
		super();
	}

	public BusinessApplicationDTO(int applyCode, int resumeCode, int postCode, String applicantName, Date applyDate, int resumeRead,
			String applyStatus, String postTitle, Date postStart, Date postEnd, String postAdvantages,
			String resumeAdvantages) {
		super();
		this.applyCode = applyCode;
		this.resumeCode = resumeCode;
		this.postCode = postCode;
		this.applicantName = applicantName;
		this.applyDate = applyDate;
		this.resumeRead = resumeRead;
		this.applyStatus = applyStatus;
		this.postTitle = postTitle;
		this.postStart = postStart;
		this.postEnd = postEnd;
		this.postAdvantages = postAdvantages;
		this.resumeAdvantages = resumeAdvantages;
	}

	public int getApplyCode() {
		return applyCode;
	}

	public void setApplyCode(int applyCode) {
		this.applyCode = applyCode;
	}

	public int getResumeCode() {
		return resumeCode;
	}

	public void setResumeCode(int resumeCode) {
		this.resumeCode = resumeCode;
	}

	public int getPostCode() {
		return postCode;
	}

	public void setPostCode(int postCode) {
		this.postCode = postCode;
	}

	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}
	
	public String getApplicantName() {
		return applicantName;
	}
	
	public void setApplicantName(String applicantName) {
		this.applicantName = applicantName;
	}

	public int getResumeRead() {
		return resumeRead;
	}

	public void setResumeRead(int resumeRead) {
		this.resumeRead = resumeRead;
	}

	public String getApplyStatus() {
		return applyStatus;
	}

	public void setApplyStatus(String applyStatus) {
		this.applyStatus = applyStatus;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public Date getPostStart() {
		return postStart;
	}

	public void setPostStart(Date postStart) {
		this.postStart = postStart;
	}

	public Date getPostEnd() {
		return postEnd;
	}

	public void setPostEnd(Date postEnd) {
		this.postEnd = postEnd;
	}

	public String getPostAdvantages() {
		return postAdvantages;
	}

	public void setPostAdvantages(String postAdvantages) {
		this.postAdvantages = postAdvantages;
	}

	public String getResumeAdvantages() {
		return resumeAdvantages;
	}

	public void setResumeAdvantages(String resumeAdvantages) {
		this.resumeAdvantages = resumeAdvantages;
	}

	@Override
	public String toString() {
		return "BusinessApplicationDTO [applyCode=" + applyCode + ", resumeCode=" + resumeCode + ", postCode="
				+ postCode + ", applyDate=" + applyDate + ", resumeRead=" + resumeRead + ", applyStatus=" + applyStatus
				+ ", postTitle=" + postTitle + ", postStart=" + postStart + ", postEnd=" + postEnd + ", postAdvantages="
				+ postAdvantages + ", resumeAdvantages=" + resumeAdvantages + "]";
	}
	
}
