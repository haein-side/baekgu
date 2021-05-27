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
import com.baekgu.silvertown.admin.model.dto.CompanyDTO;
import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.common.config.ConfigLocation;
import com.baekgu.silvertown.user.model.dto.ReportDTO;

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

	/**
	 * 접수대기중 카운트 리턴
	 * @param con
	 * @return
	 */
	public int selectWaitReportCount(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		
		int count = 0;
		
		String query = prop.getProperty("selectWaitCount");
		
		try {
			
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				
				count = rset.getInt("COUNT(*)");
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		

		return count;
	}

	/**
	 * 접수대기 신고내역 리스트 리턴
	 * @param con
	 * @param pageInfo
	 * @return
	 */
	public List<BlockDTO> selectWaitReportList(Connection con, PageInfoDTO pageInfo) {
	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<BlockDTO> waitList = null;
		
		String query = prop.getProperty("selectWaitReport");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, pageInfo.getStartRow());
			
			rset = pstmt.executeQuery();
			
			waitList = new ArrayList<>();
			
			while(rset.next()) {
				
				CompanyDTO wait = new CompanyDTO();
				
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
				
				waitList.add(report);
				
			}
			
			System.out.println("대기 리스트 : " + waitList);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return waitList;
	}

	/**
	 * 검색결과 리스트 
	 * @param con
	 * @param pageInfo
	 * @param value
	 * @param condition
	 * @return
	 */
	public List<BlockDTO> selectSearchReport(Connection con, PageInfoDTO pageInfo, String searchSelect, String searchInput) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
			
		List<BlockDTO> searchList = null;
		
		String query = null;
		
		System.out.println("searchSelect dao: " + searchSelect);
		
		if(searchSelect.equals("rCode")) {
			
			query = prop.getProperty("searchrCodeReport");
			
		} else if(searchSelect.equals("bdCode")) {
			
			query = prop.getProperty("searchbdCodeReport");
			
		} 	
		
		System.out.println("사용 쿼리 : " + query);
			
		try {
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, searchInput);
			pstmt.setInt(2, pageInfo.getStartRow());
			
			rset = pstmt.executeQuery();
			
			searchList = new ArrayList<>();
			
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
				
				searchList.add(report);
				
			}
			System.out.println("검색 리스트 : " + searchList);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return searchList;
	}

	/**
	 * 신고관리 검색 카운트 메소드
	 * @param con
	 * @param searchSelect
	 * @param searchInput
	 * @return
	 */
	public int SearhCount(Connection con, String searchSelect, String searchInput) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		//쿼리문이 셀렉트 옵션의 갯수에 따라 나온다. 따라서 null로 선언을 해주고 후에 if문으로 값을 준다
		String query = null;
		int totalCount = 0;
		
		if(searchSelect.equals("rCode")) {
			
			query = prop.getProperty("searchrCodeCount");
			
		} else if(searchSelect.equals("bdCode")) {
			
			query = prop.getProperty("searchbdCodeCount");
			
		} 
		System.out.println("count serachInput : " + searchInput);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, searchInput);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				totalCount = rset.getInt("COUNT(*)");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("사용 쿼리 : " + query);
		System.out.println("count : " + totalCount);
		
		return totalCount;
		
		
	}


	
	

}


















