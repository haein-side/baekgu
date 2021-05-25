package com.baekgu.silvertown.admin.model.dto;

import java.sql.Date;

public class PaymentDTO {
	
	private int postAdCode; //공고에 관련된 광고코드
	private Date postAdDate; //광고결제날짜
	private int adCode; //광고코드
	private String adName; //광고이름
	private int adPrice; //광고가격
	private int postCode; //공고코드
	private int methodCode; //결제방법코드
	private String methodName; //결제방법이름
	private int bCode; //기업코드
	private String bCategory; //기업분류
	private String bName; //기업명
	private String bAddress; //기업주소
	private String bNumber; //사업자등록번호
	private String bOnwer; //대표자이름
	private Date now; //오늘날짜
	private int week; //사용 주
	private int onePrice; //단가
	
	
	
	public PaymentDTO() {
		super();
		
	}



	public PaymentDTO(int postAdCode, Date postAdDate, int adCode, String adName, int adPrice, int postCode,
			int methodCode, String methodName, int bCode, String bCategory, String bName, String bAddress,
			String bNumber, String bOnwer, Date now, int week, int onePrice) {
		super();
		this.postAdCode = postAdCode;
		this.postAdDate = postAdDate;
		this.adCode = adCode;
		this.adName = adName;
		this.adPrice = adPrice;
		this.postCode = postCode;
		this.methodCode = methodCode;
		this.methodName = methodName;
		this.bCode = bCode;
		this.bCategory = bCategory;
		this.bName = bName;
		this.bAddress = bAddress;
		this.bNumber = bNumber;
		this.bOnwer = bOnwer;
		this.now = now;
		this.week = week;
		this.onePrice = onePrice;
	}



	public int getPostAdCode() {
		return postAdCode;
	}



	public void setPostAdCode(int postAdCode) {
		this.postAdCode = postAdCode;
	}



	public Date getPostAdDate() {
		return postAdDate;
	}



	public void setPostAdDate(Date postAdDate) {
		this.postAdDate = postAdDate;
	}



	public int getAdCode() {
		return adCode;
	}



	public void setAdCode(int adCode) {
		this.adCode = adCode;
	}



	public String getAdName() {
		return adName;
	}



	public void setAdName(String adName) {
		this.adName = adName;
	}



	public int getAdPrice() {
		return adPrice;
	}



	public void setAdPrice(int adPrice) {
		this.adPrice = adPrice;
	}



	public int getPostCode() {
		return postCode;
	}



	public void setPostCode(int postCode) {
		this.postCode = postCode;
	}



	public int getMethodCode() {
		return methodCode;
	}



	public void setMethodCode(int methodCode) {
		this.methodCode = methodCode;
	}



	public String getMethodName() {
		return methodName;
	}



	public void setMethodName(String methodName) {
		this.methodName = methodName;
	}



	public int getbCode() {
		return bCode;
	}



	public void setbCode(int bCode) {
		this.bCode = bCode;
	}



	public String getbCategory() {
		return bCategory;
	}



	public void setbCategory(String bCategory) {
		this.bCategory = bCategory;
	}



	public String getbName() {
		return bName;
	}



	public void setbName(String bName) {
		this.bName = bName;
	}



	public String getbAddress() {
		return bAddress;
	}



	public void setbAddress(String bAddress) {
		this.bAddress = bAddress;
	}



	public String getbNumber() {
		return bNumber;
	}



	public void setbNumber(String bNumber) {
		this.bNumber = bNumber;
	}



	public String getbOnwer() {
		return bOnwer;
	}



	public void setbOnwer(String bOnwer) {
		this.bOnwer = bOnwer;
	}



	public Date getNow() {
		return now;
	}



	public void setNow(Date now) {
		this.now = now;
	}



	public int getWeek() {
		return week;
	}



	public void setWeek(int week) {
		this.week = week;
	}



	public int getOnePrice() {
		return onePrice;
	}



	public void setOnePrice(int onePrice) {
		this.onePrice = onePrice;
	}



	@Override
	public String toString() {
		return "PaymentDTO [postAdCode=" + postAdCode + ", postAdDate=" + postAdDate + ", adCode=" + adCode
				+ ", adName=" + adName + ", adPrice=" + adPrice + ", postCode=" + postCode + ", methodCode="
				+ methodCode + ", methodName=" + methodName + ", bCode=" + bCode + ", bCategory=" + bCategory
				+ ", bName=" + bName + ", bAddress=" + bAddress + ", bNumber=" + bNumber + ", bOnwer=" + bOnwer
				+ ", now=" + now + ", week=" + week + ", onePrice=" + onePrice + "]";
	}



	
	
	
	
	
	
	
	

}
