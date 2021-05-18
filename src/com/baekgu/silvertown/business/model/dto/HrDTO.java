package com.baekgu.silvertown.business.model.dto;

public class HrDTO {

	private String hId;
	private String hPwd;
	private String hName;
	private String hPhone;
	private String hEmail;
	
	public HrDTO() {
		super();
	}

	public HrDTO(String hId, String hPwd, String hName, String hPhone, String hEmail) {
		super();
		this.hId = hId;
		this.hPwd = hPwd;
		this.hName = hName;
		this.hPhone = hPhone;
		this.hEmail = hEmail;
	}

	public String gethId() {
		return hId;
	}

	public void sethId(String hId) {
		this.hId = hId;
	}

	public String gethPwd() {
		return hPwd;
	}

	public void sethPwd(String hPwd) {
		this.hPwd = hPwd;
	}

	public String gethName() {
		return hName;
	}

	public void sethName(String hName) {
		this.hName = hName;
	}

	public String gethPhone() {
		return hPhone;
	}

	public void sethPhone(String hPhone) {
		this.hPhone = hPhone;
	}

	public String gethEmail() {
		return hEmail;
	}

	public void sethEmail(String hEmail) {
		this.hEmail = hEmail;
	}

	@Override
	public String toString() {
		return "HrDTO [hId=" + hId + ", hPwd=" + hPwd + ", hName=" + hName + ", hPhone=" + hPhone + ", hEmail=" + hEmail
				+ "]";
	}
	
	
}
