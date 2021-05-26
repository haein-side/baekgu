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

import com.baekgu.silvertown.admin.model.dto.PostDTO;
import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.common.config.ConfigLocation;

public class PostApproveDAO {

	private final Properties prop;

	public PostApproveDAO() {

		prop = new Properties();

		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "admin/admin-businessjoin.xml"));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	/**
	 * 공고심사를 위한 테이블 목록 조회
	 * 
	 * @param con
	 * @param pageInfo
	 * @return
	 */
	public List<PostDTO> selectPostList(Connection con, PageInfoDTO pageInfo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		List<PostDTO> postList = null;

		String query = prop.getProperty("selectPostList");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, pageInfo.getStartRow());
			pstmt.setInt(2, pageInfo.getEndRow());

			rset = pstmt.executeQuery();

			postList = new ArrayList<>();

			while (rset.next()) {
				PostDTO postdto = new PostDTO();
				postdto.setPostCode(rset.getInt("POST_CODE"));
				postdto.setPostTitle(rset.getString("POST_TITLE"));
				postdto.setHrId(rset.getString("HR_ID"));
				postdto.setName(rset.getString("POST_M_NAME"));
				postdto.setEmail(rset.getString("POST_M_EMAIL"));
				System.out.println(query);

				postList.add(postdto);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return postList;
	}

	/**
	 * 페이징 처리를 위한 공고심사 전체 게시물 수 조회용 메소드
	 * 
	 * @param con
	 * @return
	 */
	public int selectTotalCount(Connection con) {

		Statement stmt = null;
		ResultSet rset = null;

		int totalCount = 0;

		String query = prop.getProperty("postTotalCount");

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

	/**
	 * 공고 코드를 통한 상세정보 조회
	 * 
	 * @param con
	 * @param postCode
	 * @return
	 */
	public PostDTO selectPostDetail(Connection con, int postCode) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		PostDTO postDTO = null;

		String query = prop.getProperty("selectPostDetail");
		System.out.println(query);

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, postCode);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				postDTO = new PostDTO();
				postDTO.setPostCode(rset.getInt("POST_CODE"));
				postDTO.setPostTitle(rset.getString("POST_TITLE"));
				postDTO.setPostContent(rset.getString("POST_CONTENT"));
				postDTO.setPostTo(rset.getInt("POST_TO"));
				postDTO.setStartDate(rset.getDate("POST_START"));
				postDTO.setEndDate(rset.getDate("POST_END"));
				postDTO.setOnline(rset.getInt("POST_ONLINE"));
				postDTO.setPostDate(rset.getDate("POST_DATE"));
				postDTO.setAddress(rset.getString("POST_ADDRESS"));
				postDTO.setDays(rset.getString("POST_DAY"));
				postDTO.setPayment(rset.getLong("PAYMENT"));
				postDTO.setGender(rset.getString("GENDER"));
				postDTO.setAdvantage(rset.getString("ADVANTAGE"));
				postDTO.setBenefit(rset.getString("BENEFIT"));
				postDTO.setFullTimeYn(rset.getString("FULLTIME_YN"));
				postDTO.setName(rset.getString("POST_M_NAME"));
				postDTO.setEmail(rset.getString("POST_M_EMAIL"));
				postDTO.setPhone(rset.getString("POST_M_PHONE"));
				postDTO.setExp(rset.getInt("EXP_CODE"));
				postDTO.setExpName(rset.getString("EXP_NAME"));
				postDTO.setJob(rset.getInt("JOB_CODE"));
				postDTO.setJobName(rset.getString("JOB_NAME"));
				postDTO.setPeriodCode(rset.getInt("PERIOD_CODE"));
				postDTO.setPeriodName(rset.getString("PERIOD_NAME"));
				postDTO.setHours(rset.getInt("HOUR_CODE"));
				postDTO.setHourName(rset.getString("HOUR_NAME"));
				postDTO.setLocationCode(rset.getInt("LOCATION_CODE"));
				postDTO.setLocationName(rset.getString("LOCATION_NAME"));
				postDTO.setPay(rset.getInt("PAY_CODE"));
				postDTO.setPayName(rset.getString("PAY_NAME"));
				postDTO.setAge(rset.getInt("AGE_CODE"));
				postDTO.setAgeName(rset.getString("AGE_NAME"));
				postDTO.setHrId(rset.getString("HR_ID"));
				postDTO.setDegree(rset.getInt("DEGREE_CODE"));
				postDTO.setDegreeLevel(rset.getString("DEGREE_LEVEL"));
				postDTO.setdListCode(rset.getInt("D_LIST_CODE"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return postDTO;
	}

	/**
	 * 공고 코드를 이용한 광고 정보 조회 
	 * @param con
	 * @param postCode
	 * @return
	 */
	public List<PostDTO> selectAdDetail(Connection con, int postCode) {
	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<PostDTO> payment = null;
		
		String query = prop.getProperty("selectAdDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, postCode);
			
			rset = pstmt.executeQuery();
			
			payment = new ArrayList<>();
			
			while(rset.next()) {
				
				PostDTO pay = new PostDTO();
				pay.setPostCode(rset.getInt("POST_CODE"));
				pay.setPostAdCode(rset.getInt("POST_AD_CODE"));
				pay.setAdWeek(rset.getInt("POST_AD_WEEK"));
				pay.setAdCode(rset.getInt("AD_CODE"));
				pay.setAdName(rset.getString("AD_NAME"));
				pay.setAdPrice(rset.getInt("AD_PRICE"));
				
				payment.add(pay);
				
				System.out.println("광고 신청 조회 : " + payment);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return payment;
	}

	/**
	 * 공고 승인 시 업데이트 
	 * @param con
	 * @param postDTO
	 * @return
	 */
	public int postSubmitUpdate(Connection con, PostDTO postDTO) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("postSubmitUpdate");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1,"이상없음");
			pstmt.setString(2,postDTO.getAdminId());
			pstmt.setInt(3,postDTO.getPostCode());
			
			result = pstmt.executeUpdate();
			System.out.println(query);
			
		
		} catch (SQLException e) {
		
			e.printStackTrace();
		} close(pstmt);
		
		System.out.println("DAO " + result);
		
		return result;
	}

	/**
	 * 공고 거절 시 업데이트 
	 * @param con
	 * @param postDTO
	 * @return
	 */
	public int postBlockUpdate(Connection con, PostDTO postDTO) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("postBlockUpdate");
		
		   try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,postDTO.getListReason());
			pstmt.setString(2,postDTO.getAdminId());
			pstmt.setInt(3,postDTO.getPostCode());
			
			result = pstmt.executeUpdate();
			System.out.println(query);
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		   System.out.println("DAO " + result);
		
		return result;
	}

}
