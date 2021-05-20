package com.baekgu.silvertown.business.model.dto;

public class HrDTO {

	private String hrId;
	private String hrPwd;
	private String hrName;
	private String hrPhone;
	private String hrEmail;
	private int bCode;
	
	public HrDTO() {
		super();
	}
	
	public HrDTO(String hrId, String hrPwd, String hrName, String hrPhone, String hrEmail, int bCode) {
		super();
		this.hrId = hrId;
		this.hrPwd = hrPwd;
		this.hrName = hrName;
		this.hrPhone = hrPhone;
		this.hrEmail = hrEmail;
		this.bCode = bCode;
	}

	public String getHrId() {
		return hrId;
	}
	public void setHrId(String hrId) {
		this.hrId = hrId;
	}
	public String getHrPwd() {
		return hrPwd;
	}
	public void setHrPwd(String hrPwd) {
		this.hrPwd = hrPwd;
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
	public int getbCode() {
		return bCode;
	}
	public void setbCode(int bCode) {
		this.bCode = bCode;
	}
	
	@Override
	public String toString() {
		return "HrDTO [hrId=" + hrId + ", hrPwd=" + hrPwd + ", hrName=" + hrName + ", hrPhone=" + hrPhone + ", hrEmail="
				+ hrEmail + ", bCode=" + bCode + "]";
	}
	
	
}
