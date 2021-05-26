package com.baekgu.silvertown.user.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.List;
import java.util.Properties;

import com.baekgu.silvertown.common.config.ConfigLocation;
import com.baekgu.silvertown.user.model.dto.PostDTO;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;

public class PostDAO {

	private final Properties prop;
	
	public PostDAO() {
		prop = new Properties();
		
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "customer/customer-mapper.xml"));
		
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public PostDTO selectPostInfo(Connection con, int postCode) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		PostDTO postInfo = null;
		String query = prop.getProperty("postContent");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, postCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				postInfo = new PostDTO();
				
				postInfo.setPostCode(rset.getInt("POST_CODE"));
				postInfo.setPostTitle(rset.getString("POST_TITLE"));
				postInfo.setPostTo(rset.getInt("POST_TO"));
				postInfo.setPostStart(rset.getDate("POST_START"));
				postInfo.setPostEnd(rset.getDate("POST_END"));
				postInfo.setPostOnline(rset.getInt("POST_ONLINE"));
				postInfo.setPostDate(rset.getDate("POST_DATE"));
				postInfo.setPostAddress(rset.getString("POST_ADDRESS"));
				postInfo.setPostDay(rset.getString("POST_DAY"));
				postInfo.setPayment(rset.getInt("PAYMENT"));
				postInfo.setGender(rset.getString("GENDER"));
				postInfo.setAdvantage(rset.getString("ADVANTAGE"));
				postInfo.setBenefit(rset.getString("BENEFIT"));
				postInfo.setFulltimeYn(rset.getInt("FULLTIME_YN"));
				postInfo.setPostMName(rset.getString("POST_M_NAME"));
				postInfo.setPostMEmail(rset.getString("POST_M_EMAIL"));
				postInfo.setPostMPhone(rset.getString("POST_M_PHONE"));
				postInfo.setReportCode(rset.getInt("REPORT_CODE"));
				postInfo.setdListCode(rset.getInt("D_LIST_CODE"));
				postInfo.setdListTarget(rset.getString("D_LIST_TARGET"));
				postInfo.setExpCode(rset.getInt("EXP_CODE"));
				postInfo.setExpName(rset.getString("EXP_NAME"));
				postInfo.setJobCode(rset.getInt("JOB_CODE"));
				postInfo.setJobName(rset.getString("JOB_NAME"));
				postInfo.setIndustryName(rset.getString("INDUSTRY_NAME"));
				postInfo.setPeriodCode(rset.getInt("PERIOD_CODE"));
				postInfo.setPeriodName(rset.getString("PERIOD_NAME"));
				postInfo.setHourCode(rset.getInt("HOUR_CODE"));
				postInfo.setHourName(rset.getString("HOUR_NAME"));
				postInfo.setLocationCode(rset.getInt("LOCATION_CODE"));
				postInfo.setLocationName(rset.getString("LOCATION_NAME"));
				postInfo.setPayCode(rset.getInt("PAY_CODE"));
				postInfo.setPayName(rset.getString("PAY_NAME"));
				postInfo.setAgeCode(rset.getInt("AGE_CODE"));
				postInfo.setAgeName(rset.getString("AGE_NAME"));
				postInfo.setHrName(rset.getString("HR_NAME"));
				postInfo.setHrPhone(rset.getString("HR_PHONE"));
				postInfo.setbName(rset.getString("B_NAME"));
				postInfo.setbOwner(rset.getString("B_OWNER"));
				postInfo.setbAddress(rset.getString("B_ADDRESS"));
				postInfo.setbProfit(rset.getLong("B_PROFIT"));
				postInfo.setDegreeCode(rset.getInt("DEGREE_CODE"));
				postInfo.setDegreeLevel(rset.getString("DEGREE_LEVEL"));
				
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("DAO 공고 정보 조회 성공");
		System.out.println("DAO postInfo : " + postInfo);
		
		return postInfo;
	}

	public PostDTO selectResume(Connection con, PostDTO userPostCode) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		PostDTO selectResume = null;
		
		String query = prop.getProperty("selectResumeCode");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userPostCode.getUserCode());
			
			rset = pstmt.executeQuery();
			
			selectResume = new PostDTO();
			
			if(rset.next()) {
				
				selectResume.setResumeCode(rset.getInt("RESUME_CODE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		System.out.println("DAO resume 출력 : " + selectResume.getResumeCode());
		
		return selectResume;
	}

	/**
	 * 지원하기(Apply) insert 메소드
	 * @param con
	 * @param applyInfo
	 * @return newApply
	 */
	public int insertApply(Connection con, PostDTO applyInfo) {
		
		PreparedStatement pstmt = null;
		
		int newApply = 0;
		
		String query = prop.getProperty("insertApply");
		
		try {
		
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, applyInfo.getResumeCode());
			pstmt.setInt(2, applyInfo.getPostCode());
			
			newApply = pstmt.executeUpdate();
			
			System.out.println("DAO 쿼리문 실행 결과 : " + newApply);
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return newApply;
	}

}
