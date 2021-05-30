package com.baekgu.silvertown.business.model.dto;

import java.sql.Date;

public class PaymentDTO {

	private int postCode;
	private int adCode;
	private int weeks;
	private String postTitle;
	private String adName;
	private java.sql.Date postDate;
	private int totalPrice;
	private int postAdPaid;
	private int postAdCode;
	
	public PaymentDTO() {
		super();
	}

	public PaymentDTO(String postTitle, String adName, Date postDate, int totalPrice, int postAdPaid, int postAdCode) {
		super();
		this.postTitle = postTitle;
		this.adName = adName;
		this.postDate = postDate;
		this.totalPrice = totalPrice;
		this.postAdPaid = postAdPaid;
		this.postAdCode = postAdCode;
		
	}

	public int getPostAdCode() {
		return postAdCode;
	}

	public void setPostAdCode(int postAdCode) {
		this.postAdCode = postAdCode;
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

	public java.sql.Date getPostDate() {
		return postDate;
	}

	public void setPostDate(java.sql.Date postDate) {
		this.postDate = postDate;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getPostAdPaid() {
		return postAdPaid;
	}

	public void setPostAdPaid(int postAdPaid) {
		this.postAdPaid = postAdPaid;
	}

	public int getPostCode() {
		return postCode;
	}

	public void setPostCode(int postCode) {
		this.postCode = postCode;
	}

	public int getAdCode() {
		return adCode;
	}

	public void setAdCode(int adCode) {
		this.adCode = adCode;
	}

	public int getWeeks() {
		return weeks;
	}

	public void setWeeks(int weeks) {
		this.weeks = weeks;
	}

	@Override
	public String toString() {
		return "PaymentDTO [postTitle=" + postTitle + ", adName=" + adName + ", postDate=" + postDate + ", totalPrice="
				+ totalPrice + ", postAdPaid=" + postAdPaid + ", postAdCode=" + postAdCode + "]";
	}

	
	
	

}
