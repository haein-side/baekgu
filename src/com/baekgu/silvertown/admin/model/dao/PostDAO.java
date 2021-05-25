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

public class PostDAO {
	
	private final Properties prop;
	
	public PostDAO() {
		prop = new Properties();
		
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "admin/admin-post.xml"));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 공고심사를 마친 공고 카운트
	 * @param con
	 * @return
	 */
	public int selectTotalCount(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		
		int count = 0;
		
		String query = prop.getProperty("selectPostTotalCount");
		
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
		
		System.out.println("공고 수 : " + count);
		
		return count;
	}

	public List<PostDTO> selectPostList(Connection con, PageInfoDTO pageInfo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<PostDTO> postList = null;
		
		String query = prop.getProperty("selectPostList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartRow());
			rset = pstmt.executeQuery();
			
			postList = new ArrayList<>();
			
			while(rset.next()) {
				
				PostDTO post = new PostDTO();
				
				post.setPostCode(rset.getInt("POST_CODE"));
				post.setPostTitle(rset.getString("POST_TITLE"));
				post.setPostContent(rset.getString("POST_CONTENT"));
				post.setPostTo(rset.getInt("POST_TO"));
				post.setStartDate(rset.getDate("POST_START"));
				post.setEndDate(rset.getDate("POST_END"));
				post.setOnline(rset.getInt("POST_ONLINE"));
				post.setPostDate(rset.getDate("POST_DATE"));
				post.setAddress(rset.getString("POST_ADDRESS"));
				post.setDays(rset.getString("POST_DAY"));
				post.setPayment(rset.getLong("PAYMENT"));
				post.setGender(rset.getString("GENDER"));
				post.setAdvantage(rset.getString("ADVANTAGE"));
				post.setBenefit(rset.getString("BENEFIT"));
				post.setFullTimeYn(rset.getString("FULLTIME_YN"));
				post.setName(rset.getString("POST_M_NAME"));
				post.setEmail(rset.getString("POST_M_EMAIL"));
				post.setPhone(rset.getString("POST_M_PHONE"));
				post.setExp(rset.getInt("EXP_CODE"));
				post.setExpName(rset.getString("EXP_NAME"));
				post.setJob(rset.getInt("JOB_CODE"));
				post.setJobName(rset.getString("JOB_NAME"));
				post.setPeriodCode(rset.getInt("PERIOD_CODE"));
				post.setPeriodName(rset.getString("PERIOD_NAME"));
				post.setHours(rset.getInt("HOUR_CODE"));
				post.setHourName(rset.getString("HOUR_NAME"));
				post.setLocationCode(rset.getInt("LOCATION_CODE"));
				post.setLocationName(rset.getString("LOCATION_NAME"));
				post.setPay(rset.getInt("PAY_CODE"));
				post.setPayName(rset.getString("PAY_NAME"));
				post.setAge(rset.getInt("AGE_CODE"));
				post.setAgeName(rset.getString("AGE_NAME"));
				post.setHrId(rset.getString("HR_ID"));
				post.setDegree(rset.getInt("DEGREE_CODE"));
				post.setDegreeLevel(rset.getString("DEGREE_LEVEL"));
				post.setdListCode(rset.getInt("D_LIST_CODE"));
				
				
				postList.add(post);
				
			}
			
			System.out.println("공고 리스트 : " + postList);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return postList;
	}

	/**
	 * 공고 상세보기
	 * @param con
	 * @param code 기업코드
	 * @return
	 */
	public PostDTO selectPostDetail(Connection con, int code) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		PostDTO post = null;
		
		String query = prop.getProperty("selectPostDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, code);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				post = new PostDTO();
				
				post.setPostCode(rset.getInt("POST_CODE"));
				post.setPostTitle(rset.getString("POST_TITLE"));
				post.setPostContent(rset.getString("POST_CONTENT"));
				post.setPostTo(rset.getInt("POST_TO"));
				post.setStartDate(rset.getDate("POST_START"));
				post.setEndDate(rset.getDate("POST_END"));
				post.setOnline(rset.getInt("POST_ONLINE"));
				post.setPostDate(rset.getDate("POST_DATE"));
				post.setAddress(rset.getString("POST_ADDRESS"));
				post.setDays(rset.getString("POST_DAY"));
				post.setPayment(rset.getLong("PAYMENT"));
				post.setGender(rset.getString("GENDER"));
				post.setAdvantage(rset.getString("ADVANTAGE"));
				post.setBenefit(rset.getString("BENEFIT"));
				post.setFullTimeYn(rset.getString("FULLTIME_YN"));
				post.setName(rset.getString("POST_M_NAME"));
				post.setEmail(rset.getString("POST_M_EMAIL"));
				post.setPhone(rset.getString("POST_M_PHONE"));
				post.setExp(rset.getInt("EXP_CODE"));
				post.setExpName(rset.getString("EXP_NAME"));
				post.setJob(rset.getInt("JOB_CODE"));
				post.setJobName(rset.getString("JOB_NAME"));
				post.setPeriodCode(rset.getInt("PERIOD_CODE"));
				post.setPeriodName(rset.getString("PERIOD_NAME"));
				post.setHours(rset.getInt("HOUR_CODE"));
				post.setHourName(rset.getString("HOUR_NAME"));
				post.setLocationCode(rset.getInt("LOCATION_CODE"));
				post.setLocationName(rset.getString("LOCATION_NAME"));
				post.setPay(rset.getInt("PAY_CODE"));
				post.setPayName(rset.getString("PAY_NAME"));
				post.setAge(rset.getInt("AGE_CODE"));
				post.setAgeName(rset.getString("AGE_NAME"));
				post.setHrId(rset.getString("HR_ID"));
				post.setDegree(rset.getInt("DEGREE_CODE"));
				post.setDegreeLevel(rset.getString("DEGREE_LEVEL"));
				post.setdListCode(rset.getInt("D_LIST_CODE"));
				post.setbCode(rset.getInt("B_CODE"));
				post.setBlock(rset.getInt("B_BLOCK"));

				
				
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return post;
	}

	/**
	 * 공고에 따른 광고 조회
	 * @param con
	 * @param code
	 * @return
	 */
	public List<PostDTO> selectAdList(Connection con, int code) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<PostDTO> adList = null;
		
		String query  = prop.getProperty("selectAdList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, code);
			
			rset = pstmt.executeQuery();
			
			adList = new ArrayList<>();
			
			while(rset.next()) {
				
				PostDTO ad = new PostDTO();
				
				ad.setPostAdCode(rset.getInt("POST_AD_CODE"));
				ad.setAdDate(rset.getDate("POST_AD_DATE"));
				ad.setAdPaid(rset.getInt("POST_AD_PAID"));
				ad.setAdWeek(rset.getInt("POST_AD_WEEK"));
				ad.setAdCode(rset.getInt("AD_CODE"));
				ad.setAdName(rset.getString("AD_NAME"));
				ad.setAdPrice(rset.getInt("AD_PRICE"));
				ad.setMethod(rset.getInt("P_METHOD_CODE"));
				ad.setMethodName(rset.getString("P_METHOD_NAME"));
				
				adList.add(ad);
				
				System.out.println("사용 광고 목록 : " + adList);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return adList;
	}

}




















