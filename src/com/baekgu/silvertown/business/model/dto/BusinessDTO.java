package com.baekgu.silvertown.business.model.dto;

public class BusinessDTO {

	
	private String businessName;
	private String businessNum;
	private String ownerName;
	private int profit;
	private int bCategory;
	private String businessNo;
	private String address;
	
	public BusinessDTO() {
		super();
	}
	
	
	public BusinessDTO(String businessName, String businessNum, String ownerName, int profit, int bCategory, String businessNo,
			String address) {
		
		super();
		this.businessName = businessName;
		this.businessNum = businessNum;
		this.ownerName = ownerName;
		this.profit = profit;
		this.bCategory = bCategory;
		this.businessNo = businessNo;
		this.address = address;
	}
	
	public int getbCategory() {
		return bCategory;
	}


	public void setbCategory(int bCategory) {
		this.bCategory = bCategory;
	}


	public String getBusinessName() {
		return businessName;
	}
	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}
	public String getBusinessNum() {
		return businessNum;
	}
	public void setBusinessNum(String businessNum) {
		this.businessNum = businessNum;
	}
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public int getProfit() {
		return profit;
	}
	public void setProfit(int profit) {
		this.profit = profit;
	}
	public String getBusinessNo() {
		return businessNo;
	}
	public void setBusinessNo(String businessNo) {
		this.businessNo = businessNo;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}


	@Override
	public String toString() {
		return "BusinessDTO [businessName=" + businessName + ", businseeNum=" + businessNum + ", ownerName=" + ownerName
				+ ", profit=" + profit + ", bCategory=" + bCategory + ", businessNo=" + businessNo + ", address="
				+ address + "]";
	}
	
	
	
	
	
}
