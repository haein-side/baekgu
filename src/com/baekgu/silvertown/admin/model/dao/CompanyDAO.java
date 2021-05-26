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
			
			pstmt.setInt(1, pageInfo.getStartRow());
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
				company.setProfit(rset.getString("B_PROFIT"));
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

	/**
	 * 기업에 따른 담당자 조회
	 * @param con
	 * @param no
	 * @return
	 */
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

	/**
	 * 블락 회원 수를 조회하고 카운트 값 리턴
	 * @param con
	 * @return
	 */
	public int selectBlockCompanyCount(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		
		int count = 0;
		
		String query = prop.getProperty("selectBlockCount");
		
		try {
			
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				
				count = rset.getInt("COUNT(*)");
				
			}
			
			System.out.println("블락 기업 수 : " + count);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		
		
		return count;
	}

	/**
	 * 블락 기업을 조회하고 리스트 리턴
	 * @param con
	 * @param pageInfo
	 * @return
	 */
	public List<CompanyDTO> blockCompanyList(Connection con, PageInfoDTO pageInfo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<CompanyDTO> companyList = null;
		
		String query = prop.getProperty("selectBlockCompanyList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, pageInfo.getStartRow());
			
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
			
			System.out.println("블락 기업 리스트 : " + companyList);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return companyList;
	}

	/**
	 * 정상기업 카운트 리턴
	 * @param con
	 * @return
	 */
	public int selectNomalCompanyCount(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		
		int count = 0;
		
		String query = prop.getProperty("selectNomalCount");
		
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
	 * 정상유저 리스트 리턴
	 * @param con
	 * @param pageInfo
	 * @return
	 */
	public List<CompanyDTO> nomalCompanyList(Connection con, PageInfoDTO pageInfo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<CompanyDTO> companyList = null;
		
		String query = prop.getProperty("selectNomalCompanyList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, pageInfo.getStartRow());
			
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
			
			System.out.println("정상 기업 리스트 : " + companyList);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return companyList;
	}

	/**
	 * 검색조건에 따른 기업 수 카운트
	 * @param con
	 * @param condition
	 * @param value
	 * @return
	 */
	public int searchCompanyCount(Connection con, String condition, String value) {
		
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		//쿼리문이 셀렉트 옵션의 갯수에 따라 나온다. 따라서 null로 선언을 해주고 후에 if문으로 값을 준다
		String query = null;
		
		int companyCount = 0;
		
		try {
			
		//셀렉트 옵션이 이름이라면
		if(condition.equals("name")) {
			
			query = prop.getProperty("searchNameCompanyCount");
			
		  //셀렉트 옵션이 코드라면
		} else if(condition.equals("code")) {
			
			query = prop.getProperty("searchCodeCompanyCount");
			
		  //셀렉트 옵션이 기업분류라면
		} else if(condition.equals("category")) {
			
			query = prop.getProperty("searchCategoryCompanyCount");
		
			//셀렉트 옵션이 승인여부라면
		} else {
			
			//검색값이 거절일때의 카운트 쿼리
			if(value.equals("거절")) {
				query = prop.getProperty("searchReturnStateCompanyCount");
				
			//검색값이 승인일때의 카운트 쿼리	
			} else {
				query = prop.getProperty("searchStateCompanyCount");
			}
		}
		
		//쿼리가 승인여부의 쿼리라면
		if(value.equals("거절") || value.equals("승인")) {
			
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				companyCount = rset.getInt("COUNT(*)");
			}
			
			
		
		//그 외의 쿼리 처리
		} else {
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, value);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				companyCount = rset.getInt("COUNT(*)");
			}
			
			
		}
		

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
			close(stmt);
		}
		System.out.println("사용 쿼리 : " + query);
		System.out.println("companyCount : " + companyCount);
		
		return companyCount;
	}

	/**
	 * 검색 조건에 따른 기업 리스트 조회
	 * @param con
	 * @param pageInfo
	 * @param condition
	 * @param value
	 * @return
	 */
	public List<CompanyDTO> searchCompanyList(Connection con, PageInfoDTO pageInfo, String condition, String value) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = null;
		List<CompanyDTO> companyList = null;
		
		try {
			
		if(condition.equals("name")) {
			
			query = prop.getProperty("searchNameCompanyList");
			
		} else if(condition.equals("code")) {
			
			query = prop.getProperty("searchCodeCompanyList");
			
		} else if(condition.equals("category")) {
			
			query = prop.getProperty("searchCategoryCompanyList");
			
		} else {
			
			if(value.equals("거절")) {
				query = prop.getProperty("searchReturnStateCompanyList");
			} else {
				query = prop.getProperty("searchStateCompanyList");
			}
		}
		
		
		
		
		//value가 승인여부 쿼리문 작동시에는 ?가 안 들어간다 따라서 따로 빼준다
		if(value.equals("거절") || value.equals("승인")) {
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, pageInfo.getStartRow());
			
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
			
		//value가 승인여부와 관계없는 경우
		} else {
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, value);
			pstmt.setInt(2, pageInfo.getStartRow());
			
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
		}
		

			System.out.println("사용 쿼리 : " + query);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		System.out.println("검색 결과 : " + companyList);
		
		
		return companyList;
	}
	
	/**
	 * d_list_code 조회
	 * @param con
	 * @param block
	 * @return
	 */
	public int selectDecisionCode(Connection con, BlockDTO block) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int reportCode = 0;
		
		String query = prop.getProperty("selectReportCode");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, block.getPostCode());

			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				block.setrCode(rset.getInt("D_LIST_CODE"));
				reportCode = block.getrCode();
				
			}
			System.out.println("신고내역 코드 : " + reportCode);
			System.out.println("사용쿼리 : " + query);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return reportCode;
	}

	/**
	 * 기업 블락 업데이트
	 * @param con
	 * @param block
	 * @return
	 */
	public int updateBlockCompany(Connection con, BlockDTO block) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateBlockDecisionList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, block.getbReason());
			pstmt.setString(2, block.getAdmin());
			pstmt.setInt(3, block.getrCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		System.out.println("result : " + result);
		
		return result;
	}

	/**
	 * B_BLOCK = 1 업데이트	
	 * @param con
	 * @param block
	 * @return
	 */
	public int updateBlock(Connection con, BlockDTO block) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("updateBlockCompany");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, block.getCompanyCode());
			
			result = pstmt.executeUpdate();
			System.out.println("사용 쿼리 : " + query);
			System.out.println("블락처리 결과 : " + result);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateNoBlockCompany(Connection con, BlockDTO block) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateNoBlockDecisionList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, block.getbReason());
			pstmt.setString(2, block.getAdmin());
			pstmt.setInt(3, block.getrCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		System.out.println("result : " + result);
		
		return result;
	}



}


























