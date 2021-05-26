package com.baekgu.silvertown.user.model.dto;

import java.sql.Date;

public class PostDTO {

	private int postCode;
	private String postTitle;
	private String postContent;
	private int postTo;
	private Date postStart;
	private Date postEnd;
	private int postOnline;
	private Date postDate;
	private String postAddress;
	private String postDay;
	private int payment;
	private String gender;
	private String advantage;
	private String benefit;
	private int fulltimeYn;
	private String postMName;
	private String postMEmail;
	private String postMPhone;
	private int expCode;
	private int jobCode;
	private int periodCode;
	private int hourCode;
	private int locationCode;
	private int payCode;
	private int ageCode;
	private int hrId;
	private int degreeCode;
	private int dListCode;

	private String degreeLevel;

	private String expName;

	private String periodName;

	private String hourName;

	private String locationName;

	private String ageName;

	private String payName;

	private String hrName;
	private String hrPhone;
	private String hrEmail;

	private String bCode;

	private String bName; 
	private String bOwner; 
	private String bNumber; 
	private String bAddress; 
	private String bPhone; 
	private String bType; 
	private int bBlock; 
	private long bProfit; 
	private int bCategoryCode; 
  
	private int categoryCode; 
	private String categoryLevel;

	private String dListReason; 
	private Date dListdate; 
	private int decisionCode; 
	private int dListTypeCode;

	private int reportCode; 
	private String reportReason; 
	private Date reportDate;   

	private String dListTarget;

	private String decisionStatus;
	 

	/* 고객 엔티티 */
	private int userCode;
	private String userName;
	private String userPhone;
	private String userPwd;
	private Date userBday;
	private String userGender;
	private String userAddress;
	private Date userRegisterDate;
	private int userBlock;
	private String verifiedNum;

	/* 이력서 엔티티 */
	private int resumeCode;
	private Date resumeWriteDate;
	private String resumeSubphone;
	private String resumeLetter;
	private String resumeAdvantage;

	/* 지원자관리 */
	private int applyCode;
	private Date applyDate;
	private String applyYn;
	private int applyRead;
	// 아래 1건은 FK
	private int applyCancel;

	/* 직종 테이블 */

	private String jobName;

	/* 업종 테이블 */
	private int industryCode;
	private String industryName;

	public PostDTO() {}

	/**
	 * @param postCode
	 * @param postTitle
	 * @param postContent
	 * @param postTo
	 * @param postStart
	 * @param postEnd
	 * @param postOnline
	 * @param postDate
	 * @param postAddress
	 * @param postDay
	 * @param payment
	 * @param gender
	 * @param advantage
	 * @param benefit
	 * @param fulltimeYn
	 * @param postMName
	 * @param postMEmail
	 * @param postMPhone
	 * @param expCode
	 * @param jobCode
	 * @param periodCode
	 * @param hourCode
	 * @param locationCode
	 * @param payCode
	 * @param ageCode
	 * @param hrId
	 * @param degreeCode
	 * @param dListCode
	 * @param degreeLevel
	 * @param expName
	 * @param periodName
	 * @param hourName
	 * @param locationName
	 * @param ageName
	 * @param payName
	 * @param hrName
	 * @param hrPhone
	 * @param hrEmail
	 * @param bCode
	 * @param bName
	 * @param bOwner
	 * @param bNumber
	 * @param bAddress
	 * @param bPhone
	 * @param bType
	 * @param bBlock
	 * @param bProfit
	 * @param bCategoryCode
	 * @param categoryCode
	 * @param categoryLevel
	 * @param dListReason
	 * @param dListdate
	 * @param decisionCode
	 * @param dListTypeCode
	 * @param reportCode
	 * @param reportReason
	 * @param reportDate
	 * @param dListTarget
	 * @param decisionStatus
	 * @param userCode
	 * @param userName
	 * @param userPhone
	 * @param userPwd
	 * @param userBday
	 * @param userGender
	 * @param userAddress
	 * @param userRegisterDate
	 * @param userBlock
	 * @param verifiedNum
	 * @param resumeCode
	 * @param resumeWriteDate
	 * @param resumeSubphone
	 * @param resumeLetter
	 * @param resumeAdvantage
	 * @param applyCode
	 * @param applyDate
	 * @param applyYn
	 * @param applyRead
	 * @param applyCancel
	 * @param jobName
	 * @param industryCode
	 * @param industryName
	 */
	public PostDTO(int postCode, String postTitle, String postContent, int postTo, Date postStart, Date postEnd,
			int postOnline, Date postDate, String postAddress, String postDay, int payment, String gender,
			String advantage, String benefit, int fulltimeYn, String postMName, String postMEmail, String postMPhone,
			int expCode, int jobCode, int periodCode, int hourCode, int locationCode, int payCode, int ageCode,
			int hrId, int degreeCode, int dListCode, String degreeLevel, String expName, String periodName,
			String hourName, String locationName, String ageName, String payName, String hrName, String hrPhone,
			String hrEmail, String bCode, String bName, String bOwner, String bNumber, String bAddress, String bPhone,
			String bType, int bBlock, long bProfit, int bCategoryCode, int categoryCode, String categoryLevel,
			String dListReason, Date dListdate, int decisionCode, int dListTypeCode, int reportCode,
			String reportReason, Date reportDate, String dListTarget, String decisionStatus, int userCode,
			String userName, String userPhone, String userPwd, Date userBday, String userGender, String userAddress,
			Date userRegisterDate, int userBlock, String verifiedNum, int resumeCode, Date resumeWriteDate,
			String resumeSubphone, String resumeLetter, String resumeAdvantage, int applyCode, Date applyDate,
			String applyYn, int applyRead, int applyCancel, String jobName, int industryCode, String industryName) {
		super();
		this.postCode = postCode;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postTo = postTo;
		this.postStart = postStart;
		this.postEnd = postEnd;
		this.postOnline = postOnline;
		this.postDate = postDate;
		this.postAddress = postAddress;
		this.postDay = postDay;
		this.payment = payment;
		this.gender = gender;
		this.advantage = advantage;
		this.benefit = benefit;
		this.fulltimeYn = fulltimeYn;
		this.postMName = postMName;
		this.postMEmail = postMEmail;
		this.postMPhone = postMPhone;
		this.expCode = expCode;
		this.jobCode = jobCode;
		this.periodCode = periodCode;
		this.hourCode = hourCode;
		this.locationCode = locationCode;
		this.payCode = payCode;
		this.ageCode = ageCode;
		this.hrId = hrId;
		this.degreeCode = degreeCode;
		this.dListCode = dListCode;
		this.degreeLevel = degreeLevel;
		this.expName = expName;
		this.periodName = periodName;
		this.hourName = hourName;
		this.locationName = locationName;
		this.ageName = ageName;
		this.payName = payName;
		this.hrName = hrName;
		this.hrPhone = hrPhone;
		this.hrEmail = hrEmail;
		this.bCode = bCode;
		this.bName = bName;
		this.bOwner = bOwner;
		this.bNumber = bNumber;
		this.bAddress = bAddress;
		this.bPhone = bPhone;
		this.bType = bType;
		this.bBlock = bBlock;
		this.bProfit = bProfit;
		this.bCategoryCode = bCategoryCode;
		this.categoryCode = categoryCode;
		this.categoryLevel = categoryLevel;
		this.dListReason = dListReason;
		this.dListdate = dListdate;
		this.decisionCode = decisionCode;
		this.dListTypeCode = dListTypeCode;
		this.reportCode = reportCode;
		this.reportReason = reportReason;
		this.reportDate = reportDate;
		this.dListTarget = dListTarget;
		this.decisionStatus = decisionStatus;
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
		this.applyCode = applyCode;
		this.applyDate = applyDate;
		this.applyYn = applyYn;
		this.applyRead = applyRead;
		this.applyCancel = applyCancel;
		this.jobName = jobName;
		this.industryCode = industryCode;
		this.industryName = industryName;
	}

	public int getPostCode() {
		return postCode;
	}

	public void setPostCode(int postCode) {
		this.postCode = postCode;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public int getPostTo() {
		return postTo;
	}

	public void setPostTo(int postTo) {
		this.postTo = postTo;
	}

	public Date getPostStart() {
		return postStart;
	}

	public void setPostStart(Date postStart) {
		this.postStart = postStart;
	}

	public Date getPostEnd() {
		return postEnd;
	}

	public void setPostEnd(Date postEnd) {
		this.postEnd = postEnd;
	}

	public int getPostOnline() {
		return postOnline;
	}

	public void setPostOnline(int postOnline) {
		this.postOnline = postOnline;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public String getPostAddress() {
		return postAddress;
	}

	public void setPostAddress(String postAddress) {
		this.postAddress = postAddress;
	}

	public String getPostDay() {
		return postDay;
	}

	public void setPostDay(String postDay) {
		this.postDay = postDay;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAdvantage() {
		return advantage;
	}

	public void setAdvantage(String advantage) {
		this.advantage = advantage;
	}

	public String getBenefit() {
		return benefit;
	}

	public void setBenefit(String benefit) {
		this.benefit = benefit;
	}

	public int getFulltimeYn() {
		return fulltimeYn;
	}

	public void setFulltimeYn(int fulltimeYn) {
		this.fulltimeYn = fulltimeYn;
	}

	public String getPostMName() {
		return postMName;
	}

	public void setPostMName(String postMName) {
		this.postMName = postMName;
	}

	public String getPostMEmail() {
		return postMEmail;
	}

	public void setPostMEmail(String postMEmail) {
		this.postMEmail = postMEmail;
	}

	public String getPostMPhone() {
		return postMPhone;
	}

	public void setPostMPhone(String postMPhone) {
		this.postMPhone = postMPhone;
	}

	public int getExpCode() {
		return expCode;
	}

	public void setExpCode(int expCode) {
		this.expCode = expCode;
	}

	public int getJobCode() {
		return jobCode;
	}

	public void setJobCode(int jobCode) {
		this.jobCode = jobCode;
	}

	public int getPeriodCode() {
		return periodCode;
	}

	public void setPeriodCode(int periodCode) {
		this.periodCode = periodCode;
	}

	public int getHourCode() {
		return hourCode;
	}

	public void setHourCode(int hourCode) {
		this.hourCode = hourCode;
	}

	public int getLocationCode() {
		return locationCode;
	}

	public void setLocationCode(int locationCode) {
		this.locationCode = locationCode;
	}

	public int getPayCode() {
		return payCode;
	}

	public void setPayCode(int payCode) {
		this.payCode = payCode;
	}

	public int getAgeCode() {
		return ageCode;
	}

	public void setAgeCode(int ageCode) {
		this.ageCode = ageCode;
	}

	public int getHrId() {
		return hrId;
	}

	public void setHrId(int hrId) {
		this.hrId = hrId;
	}

	public int getDegreeCode() {
		return degreeCode;
	}

	public void setDegreeCode(int degreeCode) {
		this.degreeCode = degreeCode;
	}

	public int getdListCode() {
		return dListCode;
	}

	public void setdListCode(int dListCode) {
		this.dListCode = dListCode;
	}

	public String getDegreeLevel() {
		return degreeLevel;
	}

	public void setDegreeLevel(String degreeLevel) {
		this.degreeLevel = degreeLevel;
	}

	public String getExpName() {
		return expName;
	}

	public void setExpName(String expName) {
		this.expName = expName;
	}

	public String getPeriodName() {
		return periodName;
	}

	public void setPeriodName(String periodName) {
		this.periodName = periodName;
	}

	public String getHourName() {
		return hourName;
	}

	public void setHourName(String hourName) {
		this.hourName = hourName;
	}

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	public String getAgeName() {
		return ageName;
	}

	public void setAgeName(String ageName) {
		this.ageName = ageName;
	}

	public String getPayName() {
		return payName;
	}

	public void setPayName(String payName) {
		this.payName = payName;
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

	public String getbCode() {
		return bCode;
	}

	public void setbCode(String bCode) {
		this.bCode = bCode;
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

	public String getbType() {
		return bType;
	}

	public void setbType(String bType) {
		this.bType = bType;
	}

	public int getbBlock() {
		return bBlock;
	}

	public void setbBlock(int bBlock) {
		this.bBlock = bBlock;
	}

	public long getbProfit() {
		return bProfit;
	}

	public void setbProfit(long bProfit) {
		this.bProfit = bProfit;
	}

	public int getbCategoryCode() {
		return bCategoryCode;
	}

	public void setbCategoryCode(int bCategoryCode) {
		this.bCategoryCode = bCategoryCode;
	}

	public int getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}

	public String getCategoryLevel() {
		return categoryLevel;
	}

	public void setCategoryLevel(String categoryLevel) {
		this.categoryLevel = categoryLevel;
	}

	public String getdListReason() {
		return dListReason;
	}

	public void setdListReason(String dListReason) {
		this.dListReason = dListReason;
	}

	public Date getdListdate() {
		return dListdate;
	}

	public void setdListdate(Date dListdate) {
		this.dListdate = dListdate;
	}

	public int getDecisionCode() {
		return decisionCode;
	}

	public void setDecisionCode(int decisionCode) {
		this.decisionCode = decisionCode;
	}

	public int getdListTypeCode() {
		return dListTypeCode;
	}

	public void setdListTypeCode(int dListTypeCode) {
		this.dListTypeCode = dListTypeCode;
	}

	public int getReportCode() {
		return reportCode;
	}

	public void setReportCode(int reportCode) {
		this.reportCode = reportCode;
	}

	public String getReportReason() {
		return reportReason;
	}

	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public String getdListTarget() {
		return dListTarget;
	}

	public void setdListTarget(String dListTarget) {
		this.dListTarget = dListTarget;
	}

	public String getDecisionStatus() {
		return decisionStatus;
	}

	public void setDecisionStatus(String decisionStatus) {
		this.decisionStatus = decisionStatus;
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

	public int getApplyCancel() {
		return applyCancel;
	}

	public void setApplyCancel(int applyCancel) {
		this.applyCancel = applyCancel;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public int getIndustryCode() {
		return industryCode;
	}

	public void setIndustryCode(int industryCode) {
		this.industryCode = industryCode;
	}

	public String getIndustryName() {
		return industryName;
	}

	public void setIndustryName(String industryName) {
		this.industryName = industryName;
	}

	@Override
	public String toString() {
		return "PostDTO [postCode=" + postCode + ", postTitle=" + postTitle + ", postContent=" + postContent
				+ ", postTo=" + postTo + ", postStart=" + postStart + ", postEnd=" + postEnd + ", postOnline="
				+ postOnline + ", postDate=" + postDate + ", postAddress=" + postAddress + ", postDay=" + postDay
				+ ", payment=" + payment + ", gender=" + gender + ", advantage=" + advantage + ", benefit=" + benefit
				+ ", fulltimeYn=" + fulltimeYn + ", postMName=" + postMName + ", postMEmail=" + postMEmail
				+ ", postMPhone=" + postMPhone + ", expCode=" + expCode + ", jobCode=" + jobCode + ", periodCode="
				+ periodCode + ", hourCode=" + hourCode + ", locationCode=" + locationCode + ", payCode=" + payCode
				+ ", ageCode=" + ageCode + ", hrId=" + hrId + ", degreeCode=" + degreeCode + ", dListCode=" + dListCode
				+ ", degreeLevel=" + degreeLevel + ", expName=" + expName + ", periodName=" + periodName + ", hourName="
				+ hourName + ", locationName=" + locationName + ", ageName=" + ageName + ", payName=" + payName
				+ ", hrName=" + hrName + ", hrPhone=" + hrPhone + ", hrEmail=" + hrEmail + ", bCode=" + bCode
				+ ", bName=" + bName + ", bOwner=" + bOwner + ", bNumber=" + bNumber + ", bAddress=" + bAddress
				+ ", bPhone=" + bPhone + ", bType=" + bType + ", bBlock=" + bBlock + ", bProfit=" + bProfit
				+ ", bCategoryCode=" + bCategoryCode + ", categoryCode=" + categoryCode + ", categoryLevel="
				+ categoryLevel + ", dListReason=" + dListReason + ", dListdate=" + dListdate + ", decisionCode="
				+ decisionCode + ", dListTypeCode=" + dListTypeCode + ", reportCode=" + reportCode + ", reportReason="
				+ reportReason + ", reportDate=" + reportDate + ", dListTarget=" + dListTarget + ", decisionStatus="
				+ decisionStatus + ", userCode=" + userCode + ", userName=" + userName + ", userPhone=" + userPhone
				+ ", userPwd=" + userPwd + ", userBday=" + userBday + ", userGender=" + userGender + ", userAddress="
				+ userAddress + ", userRegisterDate=" + userRegisterDate + ", userBlock=" + userBlock + ", verifiedNum="
				+ verifiedNum + ", resumeCode=" + resumeCode + ", resumeWriteDate=" + resumeWriteDate
				+ ", resumeSubphone=" + resumeSubphone + ", resumeLetter=" + resumeLetter + ", resumeAdvantage="
				+ resumeAdvantage + ", applyCode=" + applyCode + ", applyDate=" + applyDate + ", applyYn=" + applyYn
				+ ", applyRead=" + applyRead + ", applyCancel=" + applyCancel + ", jobName=" + jobName
				+ ", industryCode=" + industryCode + ", industryName=" + industryName + "]";
	}

}
