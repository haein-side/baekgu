package com.baekgu.silvertown.admin.model.service;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.baekgu.silvertown.admin.model.dao.AdminLoginDAO;
import com.baekgu.silvertown.admin.model.dto.AdminDTO;

public class AdminLoginService {

	/* 의존 관계에 있는 객체가 불변을 유지할 수 있도록 final 필드 선언 */
	private final AdminLoginDAO adminDAO;
	
	public AdminLoginService() {
		adminDAO = new AdminLoginDAO();
	}
	
	public AdminDTO loginCheck(AdminDTO requestAdmin) {
		
		Connection con = getConnection();
		AdminDTO loginAdmin = null;
		
		String encPwd = ""; 
				
		encPwd = adminDAO.selectEncryptedPwd(con,requestAdmin);
		
		System.out.println("encPwd : " + encPwd);
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		/* 로그인 요청한 원문 비밀번호와 저장되어 있는 암호화된 비밀번호가 일치하는지 확인(암호버전) */
		if(passwordEncoder.matches(requestAdmin.getAdminPwd(), encPwd)) {
			/* 비밀번호가 일치하는 경우에만 회원 정보를 조회해온다. */
			loginAdmin = adminDAO.selectLoginAdmin(con, requestAdmin);
		} else{
			System.out.println("로그인 실패!!");
		}

		return loginAdmin;
	}
	
	
}





















