package com.baekgu.silvertown.user.model.dao;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.baekgu.silvertown.common.config.ConfigLocation;
import com.baekgu.silvertown.user.model.dto.ReportPostDTO;

public class ReportDAO {
	
	private final Properties prop;

	public ReportDAO() {
		prop = new Properties();

		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "customer/customer-mapper.xml"));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertDecisionList(Connection con, int i) {
		
		PreparedStatement psmt = null;

		int result = 0;

		String query = prop.getProperty("insertDefaultDecisionList");

		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, i);

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}

		return result;
	}

	public int insertPostReport(Connection con, ReportPostDTO postReport) {
		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("insertPostReport");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, postReport.getReportReason());
			pstmt.setInt(2, postReport.getPostCode());
			pstmt.setInt(3, postReport.getUserCode());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		
			close(pstmt);
		}
		System.out.println("DAO userCode : " + postReport.getUserCode());

		return result;
	}

}
