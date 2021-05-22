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

import com.baekgu.silvertown.admin.model.dto.BlockDTO;
import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.common.config.ConfigLocation;

public class ReportDAO {
	
	private final Properties prop;
	
	public ReportDAO() {
		prop = new Properties();
		
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "admin/admin-reportList.xml"));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 신고내역 카운트
	 * @param con
	 * @return
	 */
	public int selectTotalCount(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		
		int totalCount = 0;
		
		String query = prop.getProperty("selectTotalCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				totalCount = rset.getInt("COUNT(*)");
			}

			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		System.out.println("신고내역 수 : " + totalCount);
		
		return totalCount;
	}

	/**
	 * 신고내역의 정보를 조회하고 리턴
	 * @param con
	 * @param pageInfo
	 * @return
	 */
	public List<BlockDTO> selectReportList(Connection con, PageInfoDTO pageInfo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<BlockDTO> reportList = null;
		
		String query = prop.getProperty("selectReportList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartRow());
			pstmt.setInt(2, 10);
			
			System.out.println("getStartRow : " + pageInfo.getStartRow());
			
			rset = pstmt.executeQuery();
			
			reportList = new ArrayList<>();
			
			while(rset.next()) {
				
				BlockDTO report = new BlockDTO();
				
				report.setrCode(rset.getInt("REPORT_CODE"));
				report.setrReason(rset.getString("REPORT_REASON"));
				report.setrDate(rset.getDate("REPORT_DATE"));
				report.setPostCode(rset.getInt("POST_CODE"));
				report.setUserCode(rset.getInt("USER_CODE"));
				report.setDlCode(rset.getInt("D_LIST_CODE"));
				
				report.setbCode(rset.getInt("D_LIST_CODE"));
				report.setbReason(rset.getString("D_LIST_REASON"));
				report.setbDate(rset.getDate("D_LIST_DATE"));
				report.setBdCode(rset.getInt("DECISION_CODE"));
				report.setBdTCode(rset.getInt("D_LIST_TYPE_CODE"));
				report.setAdmin(rset.getString("ADMIN_ID"));
				
				reportList.add(report);
			}
			
			System.out.println("신고내역 : " + reportList);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		
		
		return reportList;
	}

}


















