package com.baekgu.silvertown.business.model.dto;

public class HrNumDTO {

	private String hrId;
	private int bPhone;
	private int varifiedNum;
	
	public HrNumDTO() {
		super();
	}
	
	public HrNumDTO(String hrId, int bPhone, int varifiedNum) {
		super();
		this.hrId = hrId;
		this.bPhone = bPhone;
		this.varifiedNum = varifiedNum;
	}
	
	public String getHrId() {
		return hrId;
	}
	public void setHrId(String hrId) {
		this.hrId = hrId;
	}
	public int getbPhone() {
		return bPhone;
	}
	public void setbPhone(int bPhone) {
		this.bPhone = bPhone;
	}
	public int getVarifiedNum() {
		return varifiedNum;
	}
	public void setVarifiedNum(int varifiedNum) {
		this.varifiedNum = varifiedNum;
	}
	
	@Override
	public String toString() {
		return "HrNumDTO [hrId=" + hrId + ", bPhone=" + bPhone + ", varifiedNum=" + varifiedNum + "]";
	}
	
	
	
	
}
