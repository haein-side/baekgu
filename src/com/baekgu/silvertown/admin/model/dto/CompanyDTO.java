package com.baekgu.silvertown.admin.model.dto;

public class CompanyDTO {

	private int code;
	private String name;
	private String owner;
	private String companyNumber;
	private String address;
	private String phone;
	private int block;
	private String profit;
	private int category;
	private int dListCode;
	private int dCode;
	private int dtypeCode;
	//-----------------------//
	private String hrId;
	private String hrName;
	private String hrPhone;
	private String hrEmail;
	
	
	public CompanyDTO() {}


	public CompanyDTO(int code, String name, String owner, String companyNumber, String address, String phone,
			int block, String profit, int category, int dListCode, int dCode, int dtypeCode, String hrId, String hrName,
			String hrPhone, String hrEmail) {
		super();
		this.code = code;
		this.name = name;
		this.owner = owner;
		this.companyNumber = companyNumber;
		this.address = address;
		this.phone = phone;
		this.block = block;
		this.profit = profit;
		this.category = category;
		this.dListCode = dListCode;
		this.dCode = dCode;
		this.dtypeCode = dtypeCode;
		this.hrId = hrId;
		this.hrName = hrName;
		this.hrPhone = hrPhone;
		this.hrEmail = hrEmail;
	}


	public int getCode() {
		return code;
	}


	public void setCode(int code) {
		this.code = code;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getOwner() {
		return owner;
	}


	public void setOwner(String owner) {
		this.owner = owner;
	}


	public String getCompanyNumber() {
		return companyNumber;
	}


	public void setCompanyNumber(String companyNumber) {
		this.companyNumber = companyNumber;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public int getBlock() {
		return block;
	}


	public void setBlock(int block) {
		this.block = block;
	}


	public String getProfit() {
		return profit;
	}


	public void setProfit(String profit) {
		this.profit = profit;
	}


	public int getCategory() {
		return category;
	}


	public void setCategory(int category) {
		this.category = category;
	}


	public int getdListCode() {
		return dListCode;
	}


	public void setdListCode(int dListCode) {
		this.dListCode = dListCode;
	}


	public int getdCode() {
		return dCode;
	}


	public void setdCode(int dCode) {
		this.dCode = dCode;
	}


	public int getDtypeCode() {
		return dtypeCode;
	}


	public void setDtypeCode(int dtypeCode) {
		this.dtypeCode = dtypeCode;
	}


	public String getHrId() {
		return hrId;
	}


	public void setHrId(String hrId) {
		this.hrId = hrId;
	}


	public String getHrName() {
		return hrName;
	}


	public void setHrName(String hrName) {
		this.hrName = hrName;
	}


	public String getHrPhone() {
		return hrPhone;
	}


	public void setHrPhone(String hrPhone) {
		this.hrPhone = hrPhone;
	}


	public String getHrEmail() {
		return hrEmail;
	}


	public void setHrEmail(String hrEmail) {
		this.hrEmail = hrEmail;
	}


	@Override
	public String toString() {
		return "CompanyDTO [code=" + code + ", name=" + name + ", owner=" + owner + ", companyNumber=" + companyNumber
				+ ", address=" + address + ", phone=" + phone + ", block=" + block + ", profit=" + profit
				+ ", category=" + category + ", dListCode=" + dListCode + ", dCode=" + dCode + ", dtypeCode="
				+ dtypeCode + ", hrId=" + hrId + ", hrName=" + hrName + ", hrPhone=" + hrPhone + ", hrEmail=" + hrEmail
				+ "]";
	}


	
	

	
	

	
	
	
	
	
	
	
}
