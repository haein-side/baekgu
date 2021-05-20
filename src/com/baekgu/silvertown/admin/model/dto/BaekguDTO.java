package com.baekgu.silvertown.admin.model.dto;

public class BaekguDTO {
	
	private String baekguName;
	private String baekguPhone;
	private String fax;
	private String baekguAdd;
	private String baekguNum;
	private String ownerName;
	public BaekguDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BaekguDTO(String baekguName, String baekguPhone, String fax, String baekguAdd, String baekguNum,
			String ownerName) {
		super();
		this.baekguName = baekguName;
		this.baekguPhone = baekguPhone;
		this.fax = fax;
		this.baekguAdd = baekguAdd;
		this.baekguNum = baekguNum;
		this.ownerName = ownerName;
	}
	public String getBaekguName() {
		return baekguName;
	}
	public void setBaekguName(String baekguName) {
		this.baekguName = baekguName;
	}
	public String getBaekguPhone() {
		return baekguPhone;
	}
	public void setBaekguPhone(String baekguPhone) {
		this.baekguPhone = baekguPhone;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getBaekguAdd() {
		return baekguAdd;
	}
	public void setBaekguAdd(String baekguAdd) {
		this.baekguAdd = baekguAdd;
	}
	public String getBaekguNum() {
		return baekguNum;
	}
	public void setBaekguNum(String baekguNum) {
		this.baekguNum = baekguNum;
	}
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	@Override
	public String toString() {
		return "BaekguDTO [baekguName=" + baekguName + ", baekguPhone=" + baekguPhone + ", fax=" + fax + ", baekguAdd="
				+ baekguAdd + ", baekguNum=" + baekguNum + ", ownerName=" + ownerName + "]";
	}
	
	
	
	

}
