package com.baekgu.silvertown.user.model.dao;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.List;
import java.util.Properties;

import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.common.config.ConfigLocation;
import com.baekgu.silvertown.user.model.dto.ApplyDTO;
import com.baekgu.silvertown.user.model.dto.ReportDTO;
import com.baekgu.silvertown.user.model.dto.UserDTO;



public class UserDAO {
	
	// 해당 클래스에서 사용할 Properties 선언
	private final Properties prop;
	
	public UserDAO() {
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
	
	/**
	 * 암호화된 비밀번호와 유저 차단 여부를 리턴하는 메소드
	 * @param con
	 * @param requestUser
	 * @return encPwdBlock
	 */
	public UserDTO selectEnCryptedPwd(Connection con, UserDTO requestUser) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		UserDTO encPwdBlock = null;
		
		String query = prop.getProperty("selectBlockEncryptedPwd");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestUser.getUserPhone());
			
			rset = pstmt.executeQuery();
			
			encPwdBlock = new UserDTO();
			
			if(rset.next()) {
				
				encPwdBlock.setUserPwd(rset.getString("USER_PWD"));
				encPwdBlock.setUserBlock(rset.getInt("USER_BLOCK"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println("DAO 비밀번호 가져오기 : " + encPwdBlock.getUserPwd());
		
		return encPwdBlock;
	}

	/**
	 * 비밀번호 일치 시 정보 조회용 메소드
	 * @param con
	 * @param requestUser
	 * @return 회원 정보
	 */
	public UserDTO selectLoginUser(Connection con, UserDTO requestUser) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		UserDTO loginUser = null;
		System.out.println(requestUser);
		String query = prop.getProperty("selectLoginUser");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestUser.getUserPhone());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new UserDTO();
				
				loginUser.setUserCode(rset.getInt("USER_CODE"));
				loginUser.setUserName(rset.getString("USER_NAME"));
				loginUser.setUserPhone(rset.getString("USER_PHONE"));
				loginUser.setUserPwd(rset.getString("USER_PWD"));
				loginUser.setUserBday(rset.getDate("USER_BDAY"));
				loginUser.setUserGender(rset.getString("USER_GENDER"));
				loginUser.setUserAddress(rset.getString("USER_ADDRESS"));
				loginUser.setUserRegisterDate(rset.getDate("USER_REGISTER_DATE"));
				loginUser.setUserBlock(rset.getInt("USER_BLOCK"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("DAO 모든 유저값 가져오기: " + loginUser);

		return loginUser;
	}


	
	/**
	 * USER TABLE 신규 회원 insert용 메소드
	 * @param con
	 * @param requestUser
	 * @return newUser (insert된 회원 수)
	 */
	public int insertNewUser(Connection con, UserDTO requestUser) {
		
		PreparedStatement pstmt = null;
		
		int newUser = 0;
		
		String query = prop.getProperty("insertNewUser");
		
		try {
			
			pstmt = con.prepareStatement(query);
			
			System.out.println(requestUser.getUserBday());
			
			pstmt.setString(1, requestUser.getUserPhone());
			pstmt.setString(2, requestUser.getUserPwd());
			pstmt.setString(3, requestUser.getUserName());
			pstmt.setDate(4, requestUser.getUserBday());
			pstmt.setString(5, requestUser.getUserGender());
			pstmt.setString(6, requestUser.getUserAddress());
			
			newUser = pstmt.executeUpdate();
			
			System.out.println("dao에 왔음");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return newUser;
	}

	
	/**
	 * 아이디 중복체크
	 * @param con
	 * @param userPhone
	 * @return
	 */
	public String checkId(Connection con, String userPhone) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String userId = userPhone;
		String result = "";
		
		System.out.println("DAO에 들어온 userPhone : " + userId);
		
		String query = prop.getProperty("checkId");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				System.out.println("하이");
				int userCode = rset.getInt("COUNT(USER_CODE)");
				System.out.println("DAO에서 본 userCode : " + userCode);
				if(userCode == 0) {
					result = "success";
				} else {
					result = "fail";
				}
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println("DAO에서 보내는 결과 : " + result);
		
		return result;
		
	}

	public int insertNewResume(Connection con) {
		PreparedStatement pstmt = null;
		
		int newResume = 0;
		
		String query = prop.getProperty("insertNewResume");
		
		try {
			
			pstmt = con.prepareStatement(query);
			
			newResume = pstmt.executeUpdate();
			
			System.out.println("newResumeDAO에 왔음");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return newResume;
	}

	/**
	 * 상세검색에서 업종 정보로 직종 정보를 조회하는 메소드
	 * @param con
	 * @param industryInfo
	 * @return jobInfo
	 */
	public UserDTO selectJobByIndustry(Connection con, UserDTO industryInfo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<UserDTO> jobInfo = null;
		
		String query = prop.getProperty("selectJobByIndustry");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, industryInfo.getJobName());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				for(int i = 0; i < (industryInfo.getJobName()).length(); i++) {
					
					//jobInfo.setJobName();
				}
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("DAO job Info 값 : " + jobInfo);

		
		return (UserDTO) jobInfo;
	}

	public List<ApplyDTO> selectApply(Connection con, int userCode, PageInfoDTO applyPageInfo) {
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String query = prop.getProperty("selectApply");
		
		List<ApplyDTO> allApply = null;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userCode);
			pstmt.setInt(2, applyPageInfo.getStartRow());
			pstmt.setInt(3, 3);
			
			rset = pstmt.executeQuery();
			
			allApply = new ArrayList<>();
			
			while(rset.next()) {
				
				ApplyDTO app = new ApplyDTO();
				app.setUserCode(userCode);
				app.setApplyDate(rset.getDate("APPLY_DATE"));
				app.setbName(rset.getString("B_NAME"));
				app.setPostTitle(rset.getString("POST_TITLE"));
				app.setApplyCancel(rset.getInt("APPLY_CANCEL"));
				app.setApplyRead(rset.getInt("APPLY_READ"));
				
				allApply.add(app);
				
				System.out.println(allApply);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return allApply;
	}

	public List<ReportDTO> selectReport(Connection con, int userCode, PageInfoDTO blockPageInfo) {
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String query = prop.getProperty("selectReport");
		
		List<ReportDTO> allReport = null;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userCode);
			pstmt.setInt(2, blockPageInfo.getStartRow());
			pstmt.setInt(3, 3);
			
			rset = pstmt.executeQuery();
			allReport = new ArrayList<>();
			
			while(rset.next()) {
				
				ReportDTO rpt = new ReportDTO();
				rpt.setReportDate(rset.getDate("REPORT_DATE"));
				rpt.setPostTitle(rset.getString("POST_TITLE"));
				rpt.setDecisionCode(rset.getInt("DECISION_CODE"));
				
				allReport.add(rpt);
				
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println(allReport);
		
		return allReport;
	}

	public int applySelectTotalCount(Connection con, int userCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int applytotalCount = 0;
		
		String query = prop.getProperty("applySelectTotalCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				applytotalCount = rset.getInt("COUNT(*)");
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return applytotalCount;
	}

	public int blockSelectTotalCount(Connection con, int userCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int blocktotalCount = 0;
		
		String query = prop.getProperty("blockSelectTotalCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				blocktotalCount = rset.getInt("COUNT(*)");
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return blocktotalCount;
	}

	

}
