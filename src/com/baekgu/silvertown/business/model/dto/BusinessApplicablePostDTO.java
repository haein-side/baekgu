package com.baekgu.silvertown.business.model.dto;

import java.sql.Date;

public class BusinessApplicablePostDTO {
		 
	private int postCode;
	private String managerName;
	private String postTitle;
	private int postTO;
	private Date postDate;
	private int countOfApplicants;
	private int countOfUnreadResume;
	
	

	public BusinessApplicablePostDTO() {
		super();
	}
	
	public BusinessApplicablePostDTO(int postCode, String managerName, String postTitle, int postTO, Date postDate,
			int countOfApplicants, int countOfUnreadResume) {
		super();
		this.postCode = postCode;
		this.managerName = managerName;
		this.postTitle = postTitle;
		this.postTO = postTO;
		this.postDate = postDate;
		this.countOfApplicants = countOfApplicants;
		this.countOfUnreadResume = countOfUnreadResume;
	}

	public int getPostCode() {
		return postCode;
	}

	public void setPostCode(int postCode) {
		this.postCode = postCode;
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

	public int getPostTO() {
		return postTO;
	}

	public void setPostTO(int postTO) {
		this.postTO = postTO;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public int getCountOfApplicants() {
		return countOfApplicants;
	}

	public void setCountOfApplicants(int countOfApplicants) {
		this.countOfApplicants = countOfApplicants;
	}

	public int getCountOfUnreadResume() {
		return countOfUnreadResume;
	}

	public void setCountOfUnreadResume(int countOfUnreadResume) {
		this.countOfUnreadResume = countOfUnreadResume;
	}

	@Override
	public String toString() {
		return "BusinessAppliacablePostDTO [postCode=" + postCode + ", managerName=" + managerName + ", postTitle="
				+ postTitle + ", postTO=" + postTO + ", postDate=" + postDate + ", countOfApplicants="
				+ countOfApplicants + ", countOfUnreadResume=" + countOfUnreadResume + "]";
	}
	
	
	
}
