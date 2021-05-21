package com.baekgu.silvertown.user.model.dto;

import java.sql.Date;

public class ApplyDTO {
	/* 나의 공간 중 입사지원내역 가져올 때 사용 */
	private int userCode;
	private Date applyDate;
	private String bName;
	private String postTitle;
	private int applyCancel;
	private int applyRead;
	
	public ApplyDTO() {
		super();
	}

	public ApplyDTO(int userCode, Date applyDate, String bName, String postTitle, int applyCancel, int applyRead) {
		super();
		this.userCode = userCode;
		this.applyDate = applyDate;
		this.bName = bName;
		this.postTitle = postTitle;
		this.applyCancel = applyCancel;
		this.applyRead = applyRead;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
		this.bName = bName;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public int getApplyCancel() {
		return applyCancel;
	}

	public void setApplyCancel(int applyCancel) {
		this.applyCancel = applyCancel;
	}

	public int getApplyRead() {
		return applyRead;
	}

	public void setApplyRead(int applyRead) {
		this.applyRead = applyRead;
	}

	@Override
	public String toString() {
		return "ApplyDTO [userCode=" + userCode + ", applyDate=" + applyDate + ", bName=" + bName + ", postTitle="
				+ postTitle + ", applyCancel=" + applyCancel + ", applyRead=" + applyRead + "]";
	}
	
	
}
