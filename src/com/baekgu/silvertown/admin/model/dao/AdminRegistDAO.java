package com.baekgu.silvertown.admin.model.dao;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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

		AdminDTO adminDTO = null;

		String query = prop.getProperty("selectOneAdminId");
		System.out.println(query);

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, adminId);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				adminDTO = new AdminDTO();
				adminDTO.setAdminId(rset.getString("admin_id"));
				adminDTO.setAdminPwd(rset.getString("admin_pwd"));
				adminDTO.setAdminName(rset.getString("admin_name"));
				adminDTO.setAdminEmail(rset.getString("admin_email"));
				adminDTO.setAdminDate(rset.getDate("admin_date"));
				adminDTO.setAdminRole(rset.getString("admin_role"));

			}

			System.out.println("관리자 상세보기용 dao: " + adminDTO);

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return adminDTO;
	}

	/**
	 * 관리자 정보 업데이트용 
	 * @param con
	 * @param adminDTO
	 * @return
	 */
	public int updateAdmin(Connection con, AdminDTO adminDTO) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateAdmin");
			
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, adminDTO.getAdminPwd());
			pstmt.setString(2, adminDTO.getAdminName());
			pstmt.setString(3, adminDTO.getAdminEmail());
			//date는 날짜인데 ? 어카지,,? 이거맞나 ?
			pstmt.setDate(4,  ( java.sql.Date)adminDTO.getAdminDate());
			pstmt.setString(5, adminDTO.getAdminRole());
			pstmt.setString(6, adminDTO.getAdminId());
			
			result = pstmt.executeUpdate();
			System.out.println("dao : " + result);
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	/**
	 * 아이디를 통한 관리자 삭제용 
	 * @param con
	 * @param adminList
	 * @return
	 */
	public int adminDelete(Connection con, ArrayList<String> adminList) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("adminDelete");
		
			try {
				pstmt = con.prepareStatement(query);
				
				for(int i=0; i<adminList.size(); i++) {
					pstmt.setString(1, adminList.get(i));
					result = pstmt.executeUpdate();
				}
				
				
			} catch (SQLException e) {
			
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
		return result;
	}

}
