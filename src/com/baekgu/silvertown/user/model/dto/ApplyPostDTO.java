package com.baekgu.silvertown.user.model.dto;

import java.sql.Date;

public class ApplyPostDTO {
	
	/* 공고 지원하기 (Apply) DTO */
	private int userCode;
	private int applyCode;
	private Date applyDate;
	private String applyYn;
	private int applyRead;
	private int applyCancel;
	private int resumeCode;
	private int postCode;	
	
	public ApplyPostDTO() {}

	/**
	 * @param userCode
	 * @param applyCode
	 * @param applyDate
	 * @param applyYn
	 * @param applyRead
	 * @param applyCancel
	 * @param resumeCode
	 * @param postCode
	 */
	public ApplyPostDTO(int userCode, int applyCode, Date applyDate, String applyYn, int applyRead, int applyCancel,
			int resumeCode, int postCode) {
		super();
		this.userCode = userCode;
		this.applyCode = applyCode;
		this.applyDate = applyDate;
		this.applyYn = applyYn;
		this.applyRead = applyRead;
		this.applyCancel = applyCancel;
		this.resumeCode = resumeCode;
		this.postCode = postCode;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
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

	public int getResumeCode() {
		return resumeCode;
	}

	public void setResumeCode(int resumeCode) {
		this.resumeCode = resumeCode;
	}

	public int getPostCode() {
		return postCode;
	}

	public void setPostCode(int postCode) {
		this.postCode = postCode;
	}

	@Override
	public String toString() {
		return "ApplyPostDTO [userCode=" + userCode + ", applyCode=" + applyCode + ", applyDate=" + applyDate
				+ ", applyYn=" + applyYn + ", applyRead=" + applyRead + ", applyCancel=" + applyCancel + ", resumeCode="
				+ resumeCode + ", postCode=" + postCode + "]";
	}

}
