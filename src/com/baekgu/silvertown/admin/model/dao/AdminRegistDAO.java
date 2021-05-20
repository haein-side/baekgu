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

public class AdminRegistDAO {

	private final Properties prop;

	public AdminRegistDAO() {
		prop = new Properties();

		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "admin/admin-mapper.xml"));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 새관리자 등록용
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

				/* count처리 하는 이유는 ? 아이디가 있는지 없는지만 0/1로 처리하면 됨. */
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

	/**
	 * 관리자 아이디를 통한 상세보기용
	 * 
	 * @param con
	 * @param adminId
	 * @return
	 */
	public AdminDTO selectOndAdminId(Connection con, String adminId) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		AdminDTO result = null;

		String query = prop.getProperty("selectOneAdminId");
		System.out.println(query);

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, adminId);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				result = new AdminDTO();
				result.setAdminId(rset.getString("admin_id"));
				result.setAdminPwd(rset.getString("admin_pwd"));
				result.setAdminName(rset.getString("admin_name"));
				result.setAdminEmail(rset.getString("admin_email"));
				result.setAdminDate(rset.getDate("admin_date"));
				result.setAdminRole(rset.getString("admin_role"));

			}

			System.out.println(result);

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return result;
	}

}
