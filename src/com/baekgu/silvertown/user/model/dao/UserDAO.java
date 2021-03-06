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
import java.sql.Date;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.List;
import java.util.Properties;

import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.common.config.ConfigLocation;
import com.baekgu.silvertown.user.model.dto.ApplyDTO;
import com.baekgu.silvertown.user.model.dto.DetailedSearchPostDTO;
import com.baekgu.silvertown.user.model.dto.ReportDTO;
import com.baekgu.silvertown.user.model.dto.ResumeDTO;
import com.baekgu.silvertown.user.model.dto.SearchPostDTO;
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
	
//	/**
//	 * 암호화된 비밀번호와 유저 차단 여부를 리턴하는 메소드
//	 * @param con
//	 * @param requestUser
//	 * @return encPwdBlock
//	 */
//	public UserDTO selectEnCryptedPwd(Connection con, UserDTO requestUser) {
//		
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		
//		UserDTO encPwdBlock = null;
//		
//		String query = prop.getProperty("selectBlockEncryptedPwd");
//		
//		try {
//			pstmt = con.prepareStatement(query);
//			pstmt.setString(1, requestUser.getUserPhone());
//			
//			rset = pstmt.executeQuery();
//			
//			encPwdBlock = new UserDTO();
//			
//			if(rset.next()) {
//				
//				encPwdBlock.setUserPwd(rset.getString("USER_PWD"));
//				encPwdBlock.setUserBlock(rset.getInt("USER_BLOCK"));
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(rset);
//			close(pstmt);
//		}
//		
//		System.out.println("DAO 비밀번호 가져오기 : " + encPwdBlock.getUserPwd());
//		
//		return encPwdBlock;
//	}

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
		
		String query = prop.getProperty("selectLoginUser");
		
		try {
			pstmt = con.prepareStatement(query);
			System.out.println("dao에서의 유저 폰 : " + requestUser.getUserPhone());
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

	/**
	 * 최초 회원가입시 기본 이력서 생성해줌
	 * @param con
	 * @return
	 */
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

	/**
	 * 유저코드를 이용한 전체 입사지원내역 조회
	 * @param con
	 * @param userCode
	 * @param applyPageInfo
	 * @return
	 */
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
				app.setApplyCode(rset.getInt("APPLY_CODE"));
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

	/**
	 * 유저코드를 이용한 전체 신고내역 조회
	 * @param con
	 * @param userCode
	 * @param blockPageInfo
	 * @return
	 */
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

	/**
	 * 유저코드를 이용한 전체 지원내역 수 조회
	 * @param con
	 * @param userCode
	 * @return
	 */
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

	/**
	 * 유저코드를 이용한 전체 신고내역 수 조회
	 * @param con
	 * @param userCode
	 * @return
	 */
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

	/**
	 * 유저코드와 지원코드를 이용한 지원취소
	 * @param con
	 * @param applycode
	 * @param userCode
	 * @return
	 */
	public int deleteApply(Connection con, int applycode) {
		int cancelApply = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("cancelApply");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, applycode);
			
			cancelApply = pstmt.executeUpdate();
			
			System.out.println("cancelApply의 결과 : " + cancelApply);
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return cancelApply;
		
	}

	/**
	 * 유저코드를 이용해서 이력서 내용을 조회해옴
	 * @param con
	 * @param userCode
	 * @return 이력서 내용
	 */
	public ResumeDTO selectResumeInfo(Connection con, int userCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ResumeDTO resumeInfo = new ResumeDTO();
		
		String query = prop.getProperty("selectResumeInfo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				resumeInfo.setUserName(rset.getString("USER_NAME"));
				resumeInfo.setUserPhone(rset.getString("USER_PHONE"));
				resumeInfo.setResumeSubphone(rset.getString("RESUME_SUBPHONE"));
				resumeInfo.setUserGender(rset.getString("USER_GENDER"));
				resumeInfo.setUserBday(rset.getDate("USER_BDAY"));
				resumeInfo.setUserAddress(rset.getString("USER_ADDRESS"));
				resumeInfo.setResumeLetter(rset.getString("RESUME_LETTER"));
				resumeInfo.setResumeAdvantage(rset.getString("RESUME_ADVANTAGE"));
				resumeInfo.setDegreeCode(rset.getInt("DEGREE_CODE"));
				resumeInfo.setExpCode(rset.getInt("EXP_CODE"));
				resumeInfo.setResumeWriteDate(rset.getDate("RESUME_WRITE_DATE"));
		
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println("resumeInfo from DAO : " + resumeInfo);
		
		return resumeInfo;
	}

	/**
	 * 입력받은 값을 이용해 이력서 내용 수정하기
	 * @param con
	 * @param updateResume
	 * @return
	 */
	public int updateResume(Connection con, ResumeDTO updateResume) {
		PreparedStatement pstmt = null;
		
		int reviseResume = 0;
		
		String query = prop.getProperty("updateResume");
		
		try {
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, updateResume.getUserPhone());
			pstmt.setString(2, updateResume.getResumeSubphone());
			pstmt.setString(3, updateResume.getUserGender());
			pstmt.setDate(4, updateResume.getUserBday());
			pstmt.setString(5, updateResume.getUserAddress());
			pstmt.setString(6, updateResume.getResumeLetter());
			pstmt.setString(7, updateResume.getResumeAdvantage());
			pstmt.setInt(8, updateResume.getDegreeCode());
			pstmt.setInt(9, updateResume.getExpCode());
			pstmt.setInt(10, updateResume.getUserCode());
			
			reviseResume = pstmt.executeUpdate();
			
			System.out.println("reviseResume DAO 도착");
			System.out.println("dao에서 보낸 reviseResume : " + reviseResume);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return reviseResume;
		
		
	}

	/**
	 * 암호화 처리 된 비밀번호 조회용 메소드
	 * @param con
	 * @param requestUser
	 * @return
	 */
	public String selectEncryptedPwd(Connection con, UserDTO requestUser) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String encPwd = null;
		
		String query = prop.getProperty("selectEncryptedPwd");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, requestUser.getUserPhone());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				encPwd = rset.getString("USER_PWD");
			}
			
			System.out.println("encPwd : " + encPwd);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return encPwd;
	}

	/**
	 * db에 인증번호 저장
	 * @param con
	 * @param num
	 * @param numStr
	 * @return
	 */
	public int insertVerifiedNum(Connection con, String num, String numStr) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("insertVerifiedNum");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, numStr);
			pstmt.setString(2, num);
			
			result = pstmt.executeUpdate();
			
			System.out.println("insertVerifiedNum에 왔음");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	/**
	 * 휴대폰번호에 대한 인증번호 조회
	 * @param con
	 * @param num
	 * @return
	 */
	public String selectVerifiedNum(Connection con, String num) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String numStr = null;
		
		String query = prop.getProperty("selectVerifiedNum");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				numStr = rset.getString("VERIFIED_NUM");
			}
			
			System.out.println("조회된 인증번호 : " + numStr);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return numStr;
	}

	/**
	 * 휴대폰번호의 비밀번호 업데이트
	 * @param con
	 * @param userPhone
	 * @param enteredPwd
	 * @return
	 */
	public int updatePwd(Connection con, String userPhone, String enteredPwd) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("updatePwd");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, enteredPwd);
			pstmt.setString(2, userPhone);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);

		}
		return result;
	}


	

}








