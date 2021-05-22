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

import com.baekgu.silvertown.admin.model.dto.CompanyDTO;
import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.common.config.ConfigLocation;

public class CompanyDAO {
	
private final Properties prop;
	
	public CompanyDAO() {
		prop = new Properties();
		
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "admin/admin-company.xml"));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 전체 기업 수를 조회하고 리턴
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

		
		return totalCount;
	}

	/**
	 * 기업 리스트를 조회하고 리턴
	 * @param con
	 * @param pageInfo
	 * @return
	 */
	public List<CompanyDTO> selectCompanyList(Connection con, PageInfoDTO pageInfo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
				
		List<CompanyDTO> companyList = null;
		
		String query = prop.getProperty("selectCompanyList");
				
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, (pageInfo.getStartPage()-1));
			pstmt.setInt(2, 10);
			
			rset = pstmt.executeQuery();
			
			companyList = new ArrayList<>();
			
			while(rset.next()) {
				
				CompanyDTO company = new CompanyDTO();
				
				company.setCode(rset.getInt("B_CODE"));
				company.setName(rset.getString("B_NAME"));
				company.setOwner(rset.getString("B_OWNER"));
				company.setCompanyNumber(rset.getString("B_NUMBER"));
				company.setAddress(rset.getString("B_ADDRESS"));
				company.setPhone(rset.getString("B_PHONE"));
				company.setBlock(rset.getInt("B_BLOCK"));
				company.setCategory(rset.getInt("B_CATEGORY_CODE"));
				company.setdListCode(rset.getInt("D_LIST_CODE"));
				company.setdCode(rset.getInt("DECISION_CODE"));
				company.setDtypeCode(rset.getInt("D_LIST_TYPE_CODE"));
				
				companyList.add(company);
				
			}
			
			System.out.println("기업리스트 : " + companyList);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return companyList;
	}

	/**
	 * 선택한 기업의 상세정보를 리턴
	 * @param con
	 * @param no 기업코드
	 * @return
	 */
	public CompanyDTO selectCompanyDetail(Connection con, int no) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		CompanyDTO company = null;
		
		String query = prop.getProperty("selectCompanyDetail");
		
		try {
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				company = new CompanyDTO();
				
				company.setCode(rset.getInt("B_CODE"));
				company.setName(rset.getString("B_NAME"));
				company.setOwner(rset.getString("B_OWNER"));
				company.setCompanyNumber(rset.getString("B_NUMBER"));
				company.setAddress(rset.getString("B_ADDRESS"));
				company.setPhone(rset.getString("B_PHONE"));
				company.setBlock(rset.getInt("B_BLOCK"));
				company.setProfit(rset.getDouble("B_PROFIT"));
				company.setCategory(rset.getInt("B_CATEGORY_CODE"));
				company.setdListCode(rset.getInt("D_LIST_CODE"));
				company.setdCode(rset.getInt("DECISION_CODE"));
				company.setDtypeCode(rset.getInt("D_LIST_TYPE_CODE"));
				company.setHrId(rset.getString("HR_ID"));
				company.setHrName(rset.getString("HR_NAME"));
				company.setHrPhone(rset.getString("HR_PHONE"));
				company.setHrEmail(rset.getString("HR_EMAIL"));
				
				System.out.println("선택 기업 상세 정보 : " + company);
				
				
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return company;
	}

	public List<CompanyDTO> selectHrList(Connection con, int no) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<CompanyDTO> hrList = null;
		
		String query = prop.getProperty("selectHrList");
		
		try {
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, no);
			
			rset = pstmt.executeQuery();
			
			hrList = new ArrayList<>();
			
			while(rset.next()) {
				
				CompanyDTO hr = new CompanyDTO();
				
				hr.setHrId(rset.getString("HR_ID"));
				hr.setHrName(rset.getString("HR_NAME"));
				hr.setHrPhone(rset.getString("HR_PHONE"));
				hr.setHrEmail(rset.getString("HR_EMAIL"));
				
				hrList.add(hr);
				
				System.out.println("담당자 리스트 : " + hrList);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return hrList;
	}

}


























