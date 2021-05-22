package com.baekgu.silvertown.business.model.dto;

import java.sql.Date;

public class PostInsertDTO {

	private String name;               // 담당자 이름
	private String phone;               // 전화번호
	private String email;               // 이메일 주소
/*-------------------------------------------------------------------*/	
	private int industry;              //모집분야명
	private int job;                  // 담당 업무
	private int exp;                  // 경력
	private String priority;           // 우대사항 
/*--------------------------------------------------------------------*/	
	private String postTitle;          // 공고 제목
	private String postContent;        // 공고 내용
	private java.sql.Date startDate;   // 모집 시작일
	private java.sql.Date endDate;     // 모집 마감일
	private long payment;              // 월급
	private String address;            // 근무지
	private int pay;                  // 지불 방식
	private int postTo;               // 공고 티오
	private int online;              // 온라인
	private java.sql.Date postDate;   // 공고등록
	private String days;              // 근무요일
	private String gender;           // 성별
	private String benefit;        // 복지
	private String  fullTimeYn;         // 정규직 비정규직
	private int hours;               // 근무시간
	private int age;                // 연령
	private int degree;              // 학력
	private String hrId;             // 담당자 아이디
	private int dListCode;           // 심사코드
	private int periodCode;          // 근무시간 
	private int locationCode;         // 근무지코드
	
	
	public PostInsertDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public PostInsertDTO(String name, String phone, String email, int industry, int job, int exp, String priority,
			String postTitle, String postContent, Date startDate, Date endDate, long payment, String address, int pay,
			int postTo, int online, Date postDate, String days, String gender, String benefit, String fullTimeYn,
			int hours, int age, int degree, String hrId, int dListCode, int periodCode, int locationCode) {
		super();
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.industry = industry;
		this.job = job;
		this.exp = exp;
		this.priority = priority;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.startDate = startDate;
		this.endDate = endDate;
		this.payment = payment;
		this.address = address;
		this.pay = pay;
		this.postTo = postTo;
		this.online = online;
		this.postDate = postDate;
		this.days = days;
		this.gender = gender;
		this.benefit = benefit;
		this.fullTimeYn = fullTimeYn;
		this.hours = hours;
		this.age = age;
		this.degree = degree;
		this.hrId = hrId;
		this.dListCode = dListCode;
		this.periodCode = periodCode;
		this.locationCode = locationCode;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public int getIndustry() {
		return industry;
	}


	public void setIndustry(int industry) {
		this.industry = industry;
	}


	public int getJob() {
		return job;
	}


	public void setJob(int job) {
		this.job = job;
	}


	public int getExp() {
		return exp;
	}


	public void setExp(int exp) {
		this.exp = exp;
	}


	public String getPriority() {
		return priority;
	}


	public void setPriority(String priority) {
		this.priority = priority;
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


	public java.sql.Date getStartDate() {
		return startDate;
	}


	public void setStartDate(java.sql.Date startDate) {
		this.startDate = startDate;
	}


	public java.sql.Date getEndDate() {
		return endDate;
	}


	public void setEndDate(java.sql.Date endDate) {
		this.endDate = endDate;
	}


	public long getPayment() {
		return payment;
	}


	public void setPayment(long payment) {
		this.payment = payment;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public int getPay() {
		return pay;
	}


	public void setPay(int pay) {
		this.pay = pay;
	}


	public int getPostTo() {
		return postTo;
	}


	public void setPostTo(int postTo) {
		this.postTo = postTo;
	}


	public int getOnline() {
		return online;
	}


	public void setOnline(int online) {
		this.online = online;
	}


	public java.sql.Date getPostDate() {
		return postDate;
	}


	public void setPostDate(java.sql.Date postDate) {
		this.postDate = postDate;
	}


	public String getDays() {
		return days;
	}


	public void setDays(String days) {
		this.days = days;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getBenefit() {
		return benefit;
	}


	public void setBenefit(String benefit) {
		this.benefit = benefit;
	}


	public String getFullTimeYn() {
		return fullTimeYn;
	}


	public void setFullTimeYn(String fullTimeYn) {
		this.fullTimeYn = fullTimeYn;
	}


	public int getHours() {
		return hours;
	}


	public void setHours(int hours) {
		this.hours = hours;
	}


	public int getAge() {
		return age;
	}


	public void setAge(int age) {
		this.age = age;
	}


	public int getDegree() {
		return degree;
	}


	public void setDegree(int degree) {
		this.degree = degree;
	}


	public String getHrId() {
		return hrId;
	}


	public void setHrId(String hrId) {
		this.hrId = hrId;
	}


	public int getdListCode() {
		return dListCode;
	}


	public void setdListCode(int dListCode) {
		this.dListCode = dListCode;
	}


	public int getPeriodCode() {
		return periodCode;
	}


	public void setPeriodCode(int periodCode) {
		this.periodCode = periodCode;
	}


	public int getLocationCode() {
		return locationCode;
	}


	public void setLocationCode(int locationCode) {
		this.locationCode = locationCode;
	}


	@Override
	public String toString() {
		return "PostInsertDTO [name=" + name + ", phone=" + phone + ", email=" + email + ", industry=" + industry
				+ ", job=" + job + ", exp=" + exp + ", priority=" + priority + ", postTitle=" + postTitle
				+ ", postContent=" + postContent + ", startDate=" + startDate + ", endDate=" + endDate + ", payment="
				+ payment + ", address=" + address + ", pay=" + pay + ", postTo=" + postTo + ", online=" + online
				+ ", postDate=" + postDate + ", days=" + days + ", gender=" + gender + ", benefit=" + benefit
				+ ", fullTimeYn=" + fullTimeYn + ", hours=" + hours + ", age=" + age + ", degree=" + degree + ", hrId="
				+ hrId + ", dListCode=" + dListCode + ", periodCode=" + periodCode + ", locationCode=" + locationCode
				+ "]";
	}
	

}
