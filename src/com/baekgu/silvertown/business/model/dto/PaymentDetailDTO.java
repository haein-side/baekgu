package com.baekgu.silvertown.business.model.dto;

import java.sql.Date;

public class PaymentDetailDTO {

	private int postAdCode;
	private java.sql.Date postAdDate;
	private int pMethodCode;
	private int postAdPaid;
	private String adName;
	private int postAdWeek;
	private int adPrice;
	private int totalPrice;
	private int postCode;
	private java.sql.Date postStart;
	private java.sql.Date postEnd;
	private String postMName;
	
	public PaymentDetailDTO() {
		super();
	}
	
	public PaymentDetailDTO(int postAdCode, Date postAdDate, int pMethodCode, int postAdPaid, String adName,
			int postAdWeek, int adPrice, int totalPrice, int postCode, Date postStart, Date postEnd, String postMName) {
		super();
		this.postAdCode = postAdCode;
		this.postAdDate = postAdDate;
		this.pMethodCode = pMethodCode;
		this.postAdPaid = postAdPaid;
		this.adName = adName;
		this.postAdWeek = postAdWeek;
		this.adPrice = adPrice;
		this.totalPrice = totalPrice;
		this.postCode = postCode;
		this.postStart = postStart;
		this.postEnd = postEnd;
		this.postMName = postMName;
	}
	
	public int getPostAdCode() {
		return postAdCode;
	}
	public void setPostAdCode(int postAdCode) {
		this.postAdCode = postAdCode;
	}
	public java.sql.Date getPostAdDate() {
		return postAdDate;
	}
	public void setPostAdDate(java.sql.Date postAdDate) {
		this.postAdDate = postAdDate;
	}
	public int getpMethodCode() {
		return pMethodCode;
	}
	public void setpMethodCode(int pMethodCode) {
		this.pMethodCode = pMethodCode;
	}
	public int getPostAdPaid() {
		return postAdPaid;
	}
	public void setPostAdPaid(int postAdPaid) {
		this.postAdPaid = postAdPaid;
	}
	public String getAdName() {
		return adName;
	}
	public void setAdName(String adName) {
		this.adName = adName;
	}
	public int getPostAdWeek() {
		return postAdWeek;
	}
	public void setPostAdWeek(int postAdWeek) {
		this.postAdWeek = postAdWeek;
	}
	public int getAdPrice() {
		return adPrice;
	}
	public void setAdPrice(int adPrice) {
		this.adPrice = adPrice;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getPostCode() {
		return postCode;
	}
	public void setPostCode(int postCode) {
		this.postCode = postCode;
	}
	public java.sql.Date getPostStart() {
		return postStart;
	}
	public void setPostStart(java.sql.Date postStart) {
		this.postStart = postStart;
	}
	public java.sql.Date getPostEnd() {
		return postEnd;
	}
	public void setPostEnd(java.sql.Date postEnd) {
		this.postEnd = postEnd;
	}
	public String getPostMName() {
		return postMName;
	}
	public void setPostMName(String postMName) {
		this.postMName = postMName;
	}
	
	@Override
	public String toString() {
		return "PaymentDetailDTO [postAdCode=" + postAdCode + ", postAdDate=" + postAdDate + ", pMethodCode="
				+ pMethodCode + ", postAdPaid=" + postAdPaid + ", adName=" + adName + ", postAdWeek=" + postAdWeek
				+ ", adPrice=" + adPrice + ", totalPrice=" + totalPrice + ", postCode=" + postCode + ", postStart="
				+ postStart + ", postEnd=" + postEnd + ", postMName=" + postMName + "]";
	}
	
	
}
