package com.baekgu.silvertown.business.model.dao;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;


import com.baekgu.silvertown.business.model.dto.BusinessDTO;

import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.business.model.dto.BusinessMemberDTO;
import com.baekgu.silvertown.business.model.dto.HrDTO;
import com.baekgu.silvertown.business.model.dto.BusinessPostDTO;
import com.baekgu.silvertown.common.config.ConfigLocation;

public class BusinessDAO {
	
	private final Properties prop;
	
	public BusinessDAO() {
		prop = new Properties();
		
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "business/business-mapper.xml"));
			
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 기업 로그인 멤버 정보 가져오느 메소드
	 * @param con
	 * @param bMember
	 * @return
	 */
	public BusinessMemberDTO selectLoginMember(Connection con, BusinessMemberDTO bMember) {
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		BusinessMemberDTO businessLoginMember = null;
		
		String query = prop.getProperty("selectLoginBusinessMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bMember.getbId());
			rset = pstmt.executeQuery();
			
			businessLoginMember = new BusinessMemberDTO();
			
			if(rset.next()) {
				
				businessLoginMember.setbId(rset.getString("HR_ID"));
				businessLoginMember.setbPwd(rset.getString("HR_PWD"));
				businessLoginMember.setbName(rset.getString("HR_NAME"));
				businessLoginMember.setbPhone(rset.getString("HR_PHONE"));
				businessLoginMember.setbEmail(rset.getString("HR_EMAIL"));
				businessLoginMember.setbCode(rset.getInt("B_CODE"));
				businessLoginMember.setBlockStatus(rset.getInt("B_BLOCK"));
				businessLoginMember.setbReason(rset.getString("D_LIST_REASON"));
				businessLoginMember.setCName(rset.getString("B_NAME"));
				
				
			}	
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			
			close(rset);
			close(pstmt);
		}
		
		return businessLoginMember;
	}

	/**
	 * 기업 회원가입 시 필요한 심사상태 테이블 값 insert하는 메소드
	 * @param con
	 * @return
	 */
	public int insertNewDecisionList(Connection con) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("insertDecisionList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			
			close(pstmt);
		}
		
		return result;
	}
	
	public int selectTotalCount(Connection con, String loggedId) {
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		int totalCount = 0;
		
		String query = prop.getProperty("selectTotalCount");
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, loggedId);
			
			if(rset.next()) {
				totalCount = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		
		return totalCount;
	}

	public List<BusinessPostDTO> selectPostList(Connection con, String loggedId, PageInfoDTO pageInfo) {

		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		List<BusinessPostDTO> postList = null;
		
		String query = prop.getProperty("selectPostList");
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, loggedId);
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		
		return postList;
	}


	/**
	 * 기업 회원 가입시 필요한 기업정보 insert하는 메소드
	 * @param con
	 * @param business
	 * @return
	 */
	public int insertNewBusiness(Connection con, BusinessDTO business) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("insertBusiness");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, business.getbName());
			pstmt.setString(2, business.getbOwner());
			pstmt.setString(3, business.getbNumber());
			pstmt.setString(4, business.getbAddress());
			pstmt.setString(5, business.getbPhone());
			pstmt.setLong(6, business.getProfit());
			pstmt.setString(7, business.getbLogo());
			pstmt.setInt(8, business.getbCategoryCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}

		
		return result;
	}

	public int insertNewHr(Connection con, HrDTO hr) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("insertHr");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, hr.getHrId());
			pstmt.setString(2, hr.getHrPwd());
			pstmt.setString(3, hr.getHrName());
			pstmt.setString(4, hr.getHrPhone());
			pstmt.setString(5, hr.getHrEmail());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();	
		}
		return result;
	}
}
