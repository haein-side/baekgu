package com.baekgu.silvertown.user.model.dto;

import java.sql.Date;

public class UserDTO {
	
	/* 고객 엔티티 */
	int userCode;
	String userName;
	String userPhone;
	String userPwd;
	Date userBday;
	String userGender;
	String userAddress;
	Date userRegisterDate;
	int userBlock;
	String verifiedNum;
	
	/* 이력서 엔티티 */
	int resumeCode;
	Date resumeWriteDate;
	String resumeSubphone;
	String resumeLetter;
	String resumeAdvantage;
	// 아래 2건은 FK
	int expCode;
	int degreeCode;
	
	/* 지원자관리 */
	int applyCode;
	Date applyDate;
	String applyYn;
	int applyRead;
	// 아래 1건은 FK
	int postCode;
	int applyCancel;
	
	/* 공고 */
	
	
	public UserDTO() {}

	public UserDTO(int userCode, String userName, String userPhone, String userPwd, Date userBday, String userGender,
			String userAddress, Date userRegisterDate, int userBlock, String verifiedNum, int resumeCode,
			Date resumeWriteDate, String resumeSubphone, String resumeLetter, String resumeAdvantage, int expCode,
			int degreeCode, int applyCode, Date applyDate, String applyYn, int applyRead, int postCode,
			int applyCancel) {
		super();
		this.userCode = userCode;
		this.userName = userName;
		this.userPhone = userPhone;
		this.userPwd = userPwd;
		this.userBday = userBday;
		this.userGender = userGender;
		this.userAddress = userAddress;
		this.userRegisterDate = userRegisterDate;
		this.userBlock = userBlock;
		this.verifiedNum = verifiedNum;
		this.resumeCode = resumeCode;
		this.resumeWriteDate = resumeWriteDate;
		this.resumeSubphone = resumeSubphone;
		this.resumeLetter = resumeLetter;
		this.resumeAdvantage = resumeAdvantage;
		this.expCode = expCode;
		this.degreeCode = degreeCode;
		this.applyCode = applyCode;
		this.applyDate = applyDate;
		this.applyYn = applyYn;
		this.applyRead = applyRead;
		this.postCode = postCode;
		this.applyCancel = applyCancel;
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

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public Date getUserBday() {
		return userBday;
	}

	public void setUserBday(Date userBday) {
		this.userBday = userBday;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public Date getUserRegisterDate() {
		return userRegisterDate;
	}

	public void setUserRegisterDate(Date userRegisterDate) {
		this.userRegisterDate = userRegisterDate;
	}

	public int getUserBlock() {
		return userBlock;
	}

	public void setUserBlock(int userBlock) {
		this.userBlock = userBlock;
	}

	public String getVerifiedNum() {
		return verifiedNum;
	}

	public void setVerifiedNum(String verifiedNum) {
		this.verifiedNum = verifiedNum;
	}

	public int getResumeCode() {
		return resumeCode;
	}

	public void setResumeCode(int resumeCode) {
		this.resumeCode = resumeCode;
	}

	public Date getResumeWriteDate() {
		return resumeWriteDate;
	}

	public void setResumeWriteDate(Date resumeWriteDate) {
		this.resumeWriteDate = resumeWriteDate;
	}

	public String getResumeSubphone() {
		return resumeSubphone;
	}

	public void setResumeSubphone(String resumeSubphone) {
		this.resumeSubphone = resumeSubphone;
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

	public int getExpCode() {
		return expCode;
	}

	public void setExpCode(int expCode) {
		this.expCode = expCode;
	}

	public int getDegreeCode() {
		return degreeCode;
	}

	public void setDegreeCode(int degreeCode) {
		this.degreeCode = degreeCode;
	}

	public int getApplyCode() {
		return applyCode;
	}

	public void setApplyCode(int applyCode) {
		this.applyCode = applyCode;
	}

	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	public String getApplyYn() {
		return applyYn;
	}

	public void setApplyYn(String applyYn) {
		this.applyYn = applyYn;
	}

	public int getApplyRead() {
		return applyRead;
	}

	public void setApplyRead(int applyRead) {
		this.applyRead = applyRead;
	}

	public int getPostCode() {
		return postCode;
	}

	public void setPostCode(int postCode) {
		this.postCode = postCode;
	}

	public int getApplyCancel() {
		return applyCancel;
	}

	public void setApplyCancel(int applyCancel) {
		this.applyCancel = applyCancel;
	}

	@Override
	public String toString() {
		return "UserDTO [userCode=" + userCode + ", userName=" + userName + ", userPhone=" + userPhone + ", userPwd="
				+ userPwd + ", userBday=" + userBday + ", userGender=" + userGender + ", userAddress=" + userAddress
				+ ", userRegisterDate=" + userRegisterDate + ", userBlock=" + userBlock + ", verifiedNum=" + verifiedNum
				+ ", resumeCode=" + resumeCode + ", resumeWriteDate=" + resumeWriteDate + ", resumeSubphone="
				+ resumeSubphone + ", resumeLetter=" + resumeLetter + ", resumeAdvantage=" + resumeAdvantage
				+ ", expCode=" + expCode + ", degreeCode=" + degreeCode + ", applyCode=" + applyCode + ", applyDate="
				+ applyDate + ", applyYn=" + applyYn + ", applyRead=" + applyRead + ", postCode=" + postCode
				+ ", applyCancel=" + applyCancel + "]";
	}

}
