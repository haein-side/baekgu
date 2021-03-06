package com.baekgu.silvertown.business.model.dto;

import java.sql.Date;

public class BusinessPostDTO {

	private int postCode; // 해당 직종
	private String decisionStatus; // 심사 상태 
	private Date postDate; // 공고 등록일
	private String postTitle; // 공고 제목
	private String adName; // 구매한 광고이름 (없을수 있음)
	private Date postStart; // 공고 시작일
	private Date postEnd; // 공고 마감일
	private int countOfApplicants; // 해당 공고에 대한 지원자수 
	private String postManager;
	private String industry;
	private String job;
	private int weeks;
	
	public BusinessPostDTO() {
		super();
	}

	public BusinessPostDTO(int postCode, String decisionStatus, Date postDate, String postTitle, String adName,
			Date postStart, Date postEnd, String jobName, int countOfApplicants, String postManager, String industry, String job) {
		super();
		this.postCode = postCode;
		this.decisionStatus = decisionStatus;
		this.postDate = postDate;
		this.postTitle = postTitle;
		this.adName = adName;
		this.postStart = postStart;
		this.postEnd = postEnd;
		this.countOfApplicants = countOfApplicants;
		
	}

	public int getPostCode() {
		return postCode;
	}

	public void setPostCode(int postCode) {
		this.postCode = postCode;
	}

	public String getDecisionStatus() {
		return decisionStatus;
	}

	public void setDecisionStatus(String decisionStatus) {
		this.decisionStatus = decisionStatus;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getAdName() {
		return adName;
	}

	public void setAdName(String adName) {
		this.adName = adName;
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


	public int getCountOfApplicants() {
		return countOfApplicants;
	}

	public void setCountOfApplicants(int countOfApplicants) {
		this.countOfApplicants = countOfApplicants;
	}

	public String getPostManager() {
		return postManager;
	}

	public void setPostManager(String postManager) {
		this.postManager = postManager;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public int getWeeks() {
		return weeks;
	}

	public void setWeeks(int weeks) {
		this.weeks = weeks;
	}

	@Override
	public String toString() {
		return "BusinessPostDTO [postCode=" + postCode + ", decisionStatus=" + decisionStatus + ", postDate=" + postDate
				+ ", postTitle=" + postTitle + ", adName=" + adName + ", postStart=" + postStart + ", postEnd="
				+ postEnd + ", countOfApplicants=" + countOfApplicants + "]";
	}
	
	
}
