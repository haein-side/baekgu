package com.baekgu.silvertown.admin.model.dao;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.baekgu.silvertown.admin.model.dto.AdminDTO;
import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.common.config.ConfigLocation;

public class AdminDAO {
	private final Properties prop;

	public AdminDAO() {
		prop = new Properties();

		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "admin/admin-mapper.xml"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<AdminDTO> searchAdminList(Connection con, PageInfoDTO pageInfo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		List<AdminDTO> adminList = null;

		String query = prop.getProperty("selectAdminList");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartRow());
			pstmt.setInt(2, pageInfo.getEndRow());

			rset = pstmt.executeQuery();

			adminList = new ArrayList<>();

			while (rset.next()) {
				AdminDTO admin = new AdminDTO();
				admin.setAdminId(rset.getString("admin_id"));
				admin.setAdminPwd(rset.getString("admin_pwd"));
				admin.setAdminName(rset.getString("admin_name"));
				admin.setAdminEmail(rset.getString("admin_email"));
				admin.setAdminDate(rset.getDate("admin_date"));
				admin.setAdminRole(rset.getString("admin_role"));
				
				adminList.add(admin);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return adminList;
	}

	public int selectTotalCount(Connection con) {

		Statement stmt = null;
		ResultSet rset = null;

		int totalCount = 0;

		String query = prop.getProperty("selectTotalCount");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				totalCount = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return totalCount;
	}
}
