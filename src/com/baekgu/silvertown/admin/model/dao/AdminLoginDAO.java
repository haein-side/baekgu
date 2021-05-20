package com.baekgu.silvertown.admin.model.dao;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.baekgu.silvertown.admin.model.dto.AdminDTO;
import com.baekgu.silvertown.common.config.ConfigLocation;

public class AdminLoginDAO {

	private final Properties prop;
	
	public AdminLoginDAO() {
		prop = new Properties();
		
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "admin/admin-login.xml"));
			
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 암호화 처리 된 비밀번호 조회용 메소드
	 * @param con 연결객체
	 * @param requestAdmin 로그인 입력 값(아이디, 패스워드)
	 * @return 암호화된 비밀번호
	 */
	public String selectEncryptedPwd(Connection con, AdminDTO requestAdmin) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String encPwd = null;
		
		String query = prop.getProperty("selectEncryptedPwd");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestAdmin.getAdminId());
			pstmt.setString(2, requestAdmin.getAdminPwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				encPwd = rset.getString("ADMIN_PWD");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println(encPwd);
		
		return encPwd;
	}

	/**
	 * 패스워드가 일치 시, 회원 정보 조회용 메소드
	 * @param con con연결객체정보
	 * @param requestAdmin 로그인정보(아이디,패스워드)
	 * @return 조회된 사용자 정보
	 */
	public AdminDTO selectLoginAdmin(Connection con, AdminDTO requestAdmin) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		AdminDTO loginAdmin = null;
		
		String query = prop.getProperty("selectLoginAdmin");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestAdmin.getAdminId());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginAdmin = new AdminDTO();
				
				loginAdmin.setAdminId(rset.getString("ADMIN_ID"));
				loginAdmin.setAdminName(rset.getString("ADMIN_NAME"));
				loginAdmin.setAdminEmail(rset.getString("ADMIN_EMAIL"));
				loginAdmin.setAdminDate(rset.getDate("ADMIN_DATE"));
				loginAdmin.setAdminRole(rset.getString("ADMIN_ROLE"));
			
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		
		return loginAdmin;
	}

	
	
	
	
	
	
	
	
}
























