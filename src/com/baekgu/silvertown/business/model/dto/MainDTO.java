package com.baekgu.silvertown.business.model.dto;

public class MainDTO {

	private String bName;
	private String logoPath;
	private int totalApplicant;
	private int totalPost;
	private int currntPost;
	
	public MainDTO() {
		
		super();
	}
	
	public MainDTO(String bName, String logoPath, int totalApplicant, int totalPost, int currntPost) {
		super();
		this.bName = bName;
		this.logoPath = logoPath;
		this.totalApplicant = totalApplicant;
		this.totalPost = totalPost;
		this.currntPost = currntPost;
	}
	
	public String getbName() {
		return bName;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
	public String getLogoPath() {
		return logoPath;
	}
	public void setLogoPath(String logoPath) {
		this.logoPath = logoPath;
	}
	public int getTotalApplicant() {
		return totalApplicant;
	}
	public void setTotalApplicant(int totalApplicant) {
		this.totalApplicant = totalApplicant;
	}
	public int getTotalPost() {
		return totalPost;
	}
	public void setTotalPost(int totalPost) {
		this.totalPost = totalPost;
	}
	public int getCurrntPost() {
		return currntPost;
	}
	public void setCurrntPost(int currntPost) {
		this.currntPost = currntPost;
	}
	
	@Override
	public String toString() {
		return "MainDTO [bName=" + bName + ", logoPath=" + logoPath + ", totalApplicant=" + totalApplicant
				+ ", totalPost=" + totalPost + ", currntPost=" + currntPost + "]";
	}
	
	
}
