package com.baekgu.silvertown.business.model.dto;

public class BusinessMemberDTO {

	private String bId;
	private String bPwd;
	private String bName;
	private String bPhone;
	private String bEmail;
	private int bCode;
	private int blockStatus;
	private String bReason;
	private String cName;
	private String bNumber;
	public BusinessMemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BusinessMemberDTO(String bId, String bPwd, String bName, String bPhone, String bEmail, int bCode,
			int blockStatus, String bReason, String cName, String bNumber) {
		super();
		this.bId = bId;
		this.bPwd = bPwd;
		this.bName = bName;
		this.bPhone = bPhone;
		this.bEmail = bEmail;
		this.bCode = bCode;
		this.blockStatus = blockStatus;
		this.bReason = bReason;
		this.cName = cName;
		this.bNumber = bNumber;
	}
	public String getbId() {
		return bId;
	}
	public void setbId(String bId) {
		this.bId = bId;
	}
	public String getbPwd() {
		return bPwd;
	}
	public void setbPwd(String bPwd) {
		this.bPwd = bPwd;
	}
	public String getbName() {
		return bName;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
	public String getbPhone() {
		return bPhone;
	}
	public void setbPhone(String bPhone) {
		this.bPhone = bPhone;
	}
	public String getbEmail() {
		return bEmail;
	}
	public void setbEmail(String bEmail) {
		this.bEmail = bEmail;
	}
	public int getbCode() {
		return bCode;
	}
	public void setbCode(int bCode) {
		this.bCode = bCode;
	}
	public int getBlockStatus() {
		return blockStatus;
	}
	public void setBlockStatus(int blockStatus) {
		this.blockStatus = blockStatus;
	}
	public String getbReason() {
		return bReason;
	}
	public void setbReason(String bReason) {
		this.bReason = bReason;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	
	public String getbNumber() {
		return bNumber;
	}
	public void setbNumber(String bNumber) {
		this.bNumber = bNumber;
	}
	@Override
	public String toString() {
		return "BusinessMemberDTO [bId=" + bId + ", bPwd=" + bPwd + ", bName=" + bName + ", bPhone=" + bPhone
				+ ", bEmail=" + bEmail + ", bCode=" + bCode + ", blockStatus=" + blockStatus + ", bReason=" + bReason
				+ ", cName=" + cName + ", bNumber=" + bNumber + "]";
	}
	
	
	
}