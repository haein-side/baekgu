package com.baekgu.silvertown.user.model.dto;

/**
 * 공고 검색하고 목록 리스트 조회해줄 때 필요한 DTO
 *
 */
public class SearchPostDTO {
	
	private int dListTypeCode;
	
	private int decisionCode;
	
	private int postCode;
	
	private String postTitle;
	
	private int locationCode;
	private String locationName;
	
	private int industryCode;
	private String industryName;
	
	private int jobCode;
	private String jobName;
	
	private int payment;
	
	private int payCode;
	private String payName;
	
	private String benefit;
	
	private int periodCode;
	private String periodName;
	
	private int adCode;

	public SearchPostDTO() {
		super();
	}

	public SearchPostDTO(int dListTypeCode, int decisionCode, int postCode, String postTitle, int locationCode,
			String locationName, int industryCode, String industryName, int jobCode, String jobName, int payment,
			int payCode, String payName, String benefit, int periodCode, String periodName, int adCode) {
		super();
		this.dListTypeCode = dListTypeCode;
		this.decisionCode = decisionCode;
		this.postCode = postCode;
		this.postTitle = postTitle;
		this.locationCode = locationCode;
		this.locationName = locationName;
		this.industryCode = industryCode;
		this.industryName = industryName;
		this.jobCode = jobCode;
		this.jobName = jobName;
		this.payment = payment;
		this.payCode = payCode;
		this.payName = payName;
		this.benefit = benefit;
		this.periodCode = periodCode;
		this.periodName = periodName;
		this.adCode = adCode;
	}

	public int getdListTypeCode() {
		return dListTypeCode;
	}

	public void setdListTypeCode(int dListTypeCode) {
		this.dListTypeCode = dListTypeCode;
	}

	public int getDecisionCode() {
		return decisionCode;
	}

	public void setDecisionCode(int decisionCode) {
		this.decisionCode = decisionCode;
	}

	public int getPostCode() {
		return postCode;
	}

	public void setPostCode(int postCode) {
		this.postCode = postCode;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public int getLocationCode() {
		return locationCode;
	}

	public void setLocationCode(int locationCode) {
		this.locationCode = locationCode;
	}

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	public int getIndustryCode() {
		return industryCode;
	}

	public void setIndustryCode(int industryCode) {
		this.industryCode = industryCode;
	}

	public String getIndustryName() {
		return industryName;
	}

	public void setIndustryName(String industryName) {
		this.industryName = industryName;
	}

	public int getJobCode() {
		return jobCode;
	}

	public void setJobCode(int jobCode) {
		this.jobCode = jobCode;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public int getPayCode() {
		return payCode;
	}

	public void setPayCode(int payCode) {
		this.payCode = payCode;
	}

	public String getPayName() {
		return payName;
	}

	public void setPayName(String payName) {
		this.payName = payName;
	}

	public String getBenefit() {
		return benefit;
	}

	public void setBenefit(String benefit) {
		this.benefit = benefit;
	}

	public int getPeriodCode() {
		return periodCode;
	}

	public void setPeriodCode(int periodCode) {
		this.periodCode = periodCode;
	}

	public String getPeriodName() {
		return periodName;
	}

	public void setPeriodName(String periodName) {
		this.periodName = periodName;
	}

	public int getAdCode() {
		return adCode;
	}

	public void setAdCode(int adCode) {
		this.adCode = adCode;
	}

	@Override
	public String toString() {
		return "SearchPostDTO [dListTypeCode=" + dListTypeCode + ", decisionCode=" + decisionCode + ", postCode="
				+ postCode + ", postTitle=" + postTitle + ", locationCode=" + locationCode + ", locationName="
				+ locationName + ", industryCode=" + industryCode + ", industryName=" + industryName + ", jobCode="
				+ jobCode + ", jobName=" + jobName + ", payment=" + payment + ", payCode=" + payCode + ", payName="
				+ payName + ", benefit=" + benefit + ", periodCode=" + periodCode + ", periodName=" + periodName
				+ ", adCode=" + adCode + "]";
	}
	

}
