package com.baekgu.silvertown.admin.model.dao;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import com.baekgu.silvertown.admin.model.dto.AdminDTO;
import com.baekgu.silvertown.common.config.ConfigLocation;

public class AdminRegistDAO {

	private final Properties prop;

	public AdminRegistDAO() {
		prop = new Properties();

		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "admin-mapper.xml"));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 관리자 등록용
	 * 
	 * @param con
	 * @param requestadmin
	 * @return
	 */
	public int adminRegist(Connection con, AdminDTO requestadmin) {

		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("adminRegist");

		try {

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestadmin.getAdminId());
			pstmt.setString(2, requestadmin.getAdminPwd());
			pstmt.setString(3, requestadmin.getAdminName());
			pstmt.setString(4, requestadmin.getAdminEmail());
			pstmt.setString(5, requestadmin.getAdminRole());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		System.out.println(result);

		return result;
	}

	/**
	 * 관리자 아이디 중복확인용
	 * 
	 * @param con
	 * @param adminId
	 * @return
	 */
	public int adminIdSelect(Connection con, String adminId) {

		PreparedStatement psmt = null;
		ResultSet rset = null;

		int result = 0;

		String query = prop.getProperty("adminIdSelect");

		try {

			psmt = con.prepareStatement(query);
			psmt.setString(1, adminId);
			
			
			rset = psmt.executeQuery();
			

			if (rset.next()) {
				result = rset.getInt("COUNT(*)");
			}
			
			System.out.println(result + "checkDAO");

		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(psmt);
		}

		return result;
	}

}
