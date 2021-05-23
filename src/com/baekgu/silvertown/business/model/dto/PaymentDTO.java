package com.baekgu.silvertown.business.model.dto;

import java.sql.Date;

public class PaymentDTO {

	private String DListStatus;
	private String postTitle;
	private String adName;
	private int adWeek;
	private int totalPrice;
	private java.sql.Date postadDate;
	private int methodCode;
	private int adPaid;
	
	public PaymentDTO() {
		super();
	}
	
	public PaymentDTO(String DListStatus, String postTitle, String adName, int adWeek, int totalPrice, Date postadDate,
			int methodCode, int adPaid) {
		super();
		this.DListStatus = DListStatus;
		this.postTitle = postTitle;
		this.adName = adName;
		this.adWeek = adWeek;
		this.totalPrice = totalPrice;
		this.postadDate = postadDate;
		this.methodCode = methodCode;
		this.adPaid = adPaid;
	}
	
	public String getDListStatus() {
		return DListStatus;
	}
	public void setDListStatus(String DListStatus) {
		this.DListStatus = DListStatus;
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
	public int getAdWeek() {
		return adWeek;
	}
	public void setAdWeek(int adWeek) {
		this.adWeek = adWeek;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public java.sql.Date getPostadDate() {
		return postadDate;
	}
	public void setPostadDate(java.sql.Date postadDate) {
		this.postadDate = postadDate;
	}
	public int getMethodCode() {
		return methodCode;
	}
	public void setMethodCode(int methodCode) {
		this.methodCode = methodCode;
	}
	public int getAdPaid() {
		return adPaid;
	}
	public void setAdPaid(int adPaid) {
		this.adPaid = adPaid;
	}
	
	@Override
	public String toString() {
		return "PaymentDTO [DListCode=" + DListStatus + ", postTitle=" + postTitle + ", adName=" + adName + ", adWeek="
				+ adWeek + ", totalPrice=" + totalPrice + ", postadDate=" + postadDate + ", methodCode=" + methodCode
				+ ", adPaid=" + adPaid + "]";
	}
	
	

}
