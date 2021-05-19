package com.baekgu.silvertown.admin.model.dto;

import java.sql.Connection;
import java.util.Date;

public class AdminDTO {

	/* 관리자 등록 시 사용 */
	
	private String adminId; // 아이디
	private String adminPwd; // 비번
	private String adminName; // 이름
	private String adminEmail; // 이메일
	private Date adminDate; // 등록날짜
	private String adminRole; // 관리자 권한

	
	public AdminDTO() {
		
	}


	public AdminDTO(String adminId, String adminPwd, String adminName, String adminEmail, Date adminDate,
			String adminRole) {
		super();
		this.adminId = adminId;
		this.adminPwd = adminPwd;
		this.adminName = adminName;
		this.adminEmail = adminEmail;
		this.adminDate = adminDate;
		this.adminRole = adminRole;
	}


	public String getAdminId() {
		return adminId;
	}


	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}


	public String getAdminPwd() {
		return adminPwd;
	}


	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}


	public String getAdminName() {
		return adminName;
	}


	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}


	public String getAdminEmail() {
		return adminEmail;
	}


	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}


	public Date getAdminDate() {
		return adminDate;
	}


	public void setAdminDate(Date adminDate) {
		this.adminDate = adminDate;
	}


	public String getAdminRole() {
		return adminRole;
	}


	public void setAdminRole(String adminRole) {
		this.adminRole = adminRole;
	}


	@Override
	public String toString() {
		return "AdminDTO [adminId=" + adminId + ", adminPwd=" + adminPwd + ", adminName=" + adminName + ", adminEmail="
				+ adminEmail + ", adminDate=" + adminDate + ", adminRole=" + adminRole + "]";
	}

	
	
	
	


	
	
	
	
	
	
	
	
	
}
