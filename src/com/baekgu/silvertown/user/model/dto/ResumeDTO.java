package com.baekgu.silvertown.user.model.dto;

import java.sql.Date;


public class ResumeDTO {
	private int userCode;
	private String userName;
	private String userPhone;
	private String resumeSubphone;
	private String userGender;
	private Date userBday;
	private String userAddress;
	private String resumeLetter;
	private String resumeAdvantage;
	private int degreeCode;
	private int expCode;
	private Date resumeWriteDate;
	
	public ResumeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ResumeDTO(int userCode, String userName, String userPhone, String resumeSubphone, String userGender,
			Date userBday, String userAddress, String resumeLetter, String resumeAdvantage, int degreeCode, int expCode,
			Date resumeWriteDate) {
		super();
		this.userCode = userCode;
		this.userName = userName;
		this.userPhone = userPhone;
		this.resumeSubphone = resumeSubphone;
		this.userGender = userGender;
		this.userBday = userBday;
		this.userAddress = userAddress;
		this.resumeLetter = resumeLetter;
		this.resumeAdvantage = resumeAdvantage;
		this.degreeCode = degreeCode;
		this.expCode = expCode;
		this.resumeWriteDate = resumeWriteDate;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getResumeSubphone() {
		return resumeSubphone;
	}

	public void setResumeSubphone(String resumeSubphone) {
		this.resumeSubphone = resumeSubphone;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public Date getUserBday() {
		return userBday;
	}

	public void setUserBday(Date userBday) {
		this.userBday = userBday;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getResumeLetter() {
		return resumeLetter;
	}

	public void setResumeLetter(String resumeLetter) {
		this.resumeLetter = resumeLetter;
	}

	public String getResumeAdvantage() {
		return resumeAdvantage;
	}

	public void setResumeAdvantage(String resumeAdvantage) {
		this.resumeAdvantage = resumeAdvantage;
	}

	public int getDegreeCode() {
		return degreeCode;
	}

	public void setDegreeCode(int degreeCode) {
		this.degreeCode = degreeCode;
	}

	public int getExpCode() {
		return expCode;
	}

	public void setExpCode(int expCode) {
		this.expCode = expCode;
	}

	public Date getResumeWriteDate() {
		return resumeWriteDate;
	}

	public void setResumeWriteDate(Date resumeWriteDate) {
		this.resumeWriteDate = resumeWriteDate;
	}

	@Override
	public String toString() {
		return "ResumeDTO [userCode=" + userCode + ", userName=" + userName + ", userPhone=" + userPhone
				+ ", resumeSubphone=" + resumeSubphone + ", userGender=" + userGender + ", userBday=" + userBday
				+ ", userAddress=" + userAddress + ", resumeLetter=" + resumeLetter + ", resumeAdvantage="
				+ resumeAdvantage + ", degreeCode=" + degreeCode + ", expCode=" + expCode + ", resumeWriteDate="
				+ resumeWriteDate + "]";
	}
	
	
	
	
	
}
