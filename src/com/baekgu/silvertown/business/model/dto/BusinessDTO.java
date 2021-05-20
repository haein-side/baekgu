package com.baekgu.silvertown.business.model.dto;

public class BusinessDTO {

	private String bName;
	private String bOwner;
	private String bNumber;
	private String bAddress;
	private String bPhone;
	private int bBlock;
	private long profit;
	private String bLogo;
	private int bCategoryCode;
	private int dListCode;
	
	public BusinessDTO() {
		super();
	}
	
	public BusinessDTO(String bName, String bOwner, String bNumber, String bAddress, String bPhone, int bBlock,
			long profit, String bLogo, int bCategoryCode, int dListCode) {
		super();
		this.bName = bName;
		this.bOwner = bOwner;
		this.bNumber = bNumber;
		this.bAddress = bAddress;
		this.bPhone = bPhone;
		this.bBlock = bBlock;
		this.profit = profit;
		this.bLogo = bLogo;
		this.bCategoryCode = bCategoryCode;
		this.dListCode = dListCode;
	}

	public String getbName() {
		return bName;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
	public String getbOwner() {
		return bOwner;
	}
	public void setbOwner(String bOwner) {
		this.bOwner = bOwner;
	}
	public String getbNumber() {
		return bNumber;
	}
	public void setbNumber(String bNumber) {
		this.bNumber = bNumber;
	}
	public String getbAddress() {
		return bAddress;
	}
	public void setbAddress(String bAddress) {
		this.bAddress = bAddress;
	}
	public String getbPhone() {
		return bPhone;
	}
	public void setbPhone(String bPhone) {
		this.bPhone = bPhone;
	}
	public int getbBlock() {
		return bBlock;
	}
	public void setbBlock(int bBlock) {
		this.bBlock = bBlock;
	}
	public long getProfit() {
		return profit;
	}
	public void setProfit(long profit) {
		this.profit = profit;
	}
	public String getbLogo() {
		return bLogo;
	}
	public void setbLogo(String bLogo) {
		this.bLogo = bLogo;
	}
	public int getbCategoryCode() {
		return bCategoryCode;
	}
	public void setbCategoryCode(int bCategoryCode) {
		this.bCategoryCode = bCategoryCode;
	}
	public int getdListCode() {
		return dListCode;
	}
	public void setdListCode(int dListCode) {
		this.dListCode = dListCode;
	}
	
	@Override
	public String toString() {
		return "BusinessDTO [bName=" + bName + ", bOwner=" + bOwner + ", bNumber=" + bNumber + ", bAddress=" + bAddress
				+ ", bPhone=" + bPhone + ", bBlock=" + bBlock + ", profit=" + profit + ", bLogo=" + bLogo
				+ ", bCategoryCode=" + bCategoryCode + ", dListCode=" + dListCode + "]";
	}
	

	
}
