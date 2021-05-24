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

import com.baekgu.silvertown.admin.model.dto.BusinessJoinDTO;
import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.common.config.ConfigLocation;

public class BusinessJoinDAO {
	
	private final Properties prop;

	public BusinessJoinDAO() {
		
		prop = new Properties();

		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "admin/admin-businessjoin.xml"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}

	/**
	 * 가입 승인을 위한 기업 정보 전체 조회용 
	 * @param con
	 * @param pageInfo
	 * @return
	 */
	public List<BusinessJoinDTO> selectJoinList(Connection con, PageInfoDTO pageInfo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<BusinessJoinDTO> businessList = null;
		
		String query = prop.getProperty("selectJoinList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, pageInfo.getStartRow());
			pstmt.setInt(2, pageInfo.getEndRow());
			
			rset = pstmt.executeQuery();
			
			businessList = new ArrayList<>();
			
			while(rset.next()) {
				BusinessJoinDTO business = new BusinessJoinDTO();
				business.setbCode(rset.getInt("b_code"));
				business.setbName(rset.getString("b_name"));
				business.setbOwner(rset.getString("b_owner"));
				business.setbNumber(rset.getString("b_number"));
				business.setbAddress(rset.getString("b_address"));
				business.setbPhone(rset.getString("b_phone"));
				
				
				businessList.add(business);
			}
			
			
		} catch(SQLException e) {
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return businessList;
	}

	/**
	 * 페이징 처리를 위한 관리자 전체 게시물 수 조회용 메소드 
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
	 * 기업코드를 통한 상세보기용 
	 * @param con
	 * @param bCode
	 * @return
	 */
	public BusinessJoinDTO BusinessJoinDetail(Connection con, int bCode) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		BusinessJoinDTO bJoinDTO = null;
		
		String query = prop.getProperty("BusinessJoinDetail");
		System.out.println(query);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				bJoinDTO = new BusinessJoinDTO();
				
				bJoinDTO.setbCode(rset.getInt("B_CODE"));
				bJoinDTO.setbName(rset.getString("B_NAME"));
				bJoinDTO.setbOwner(rset.getString("B_OWNER"));
				bJoinDTO.setbNumber(rset.getString("B_NUMBER"));
				bJoinDTO.setbAddress(rset.getString("B_ADDRESS"));
				bJoinDTO.setbPhone(rset.getString("B_PHONE"));
				bJoinDTO.setbProfit(rset.getString("B_PROFIT"));
				bJoinDTO.setHrId(rset.getString("HR_ID"));
				bJoinDTO.setHrName(rset.getString("HR_NAME"));
				bJoinDTO.setHrPhone(rset.getString("HR_PHONE"));
				bJoinDTO.setHrEmail(rset.getString("HR_EMAIL"));

				System.out.println("기업코드로 상세정보 조회 : " + bJoinDTO);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return bJoinDTO;
	}

	/**
	 * 가입 승인 시 업데이트용 
	 * @param con
	 * @param joinDTO
	 * @return
	 */
	public int joinSubmitUpdate(Connection con, BusinessJoinDTO joinDTO) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("joinSubmitUpdate");

		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1,"이상없음");
			pstmt.setString(2,joinDTO.getAdminId());
			pstmt.setInt(3,joinDTO.getbCode());
			
			result = pstmt.executeUpdate();
			System.out.println(query);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("DAO " + result);
		
		return result;
	}

	/**
	 * 가입 거절 시 업데이트 
	 * @param con
	 * @param joinDTO
	 * @return
	 */
	public int joinBlockUpdate(Connection con, BusinessJoinDTO joinDTO) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("joinBlockUpdate");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,joinDTO.getdListReason());
			pstmt.setString(2,joinDTO.getAdminId());
			pstmt.setInt(3,joinDTO.getbCode());
			
			result = pstmt.executeUpdate();
			System.out.println(query);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("DAO " + result);
		
		return result;
	}

}
