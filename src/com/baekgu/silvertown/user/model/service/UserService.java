package com.baekgu.silvertown.user.model.service;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.commit;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.getConnection;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.baekgu.silvertown.user.model.dao.UserDAO;
import com.baekgu.silvertown.user.model.dto.ApplyDTO;
import com.baekgu.silvertown.user.model.dto.ReportDTO;
import com.baekgu.silvertown.user.model.dto.UserDTO;

public class UserService {

	// DAO와 연결할 필드 변수 선언 (private 선언 후 내부에서만 사용)
	private final UserDAO userDAO; 
	
	// DAO 연결할 생성자 생성
	public UserService() {
		userDAO = new UserDAO();
	}
	
	/**
	 * 로그인시 1차 검증용 메소드
	 * @param requestUser
	 * @return loginUser
	 */
	public UserDTO loginCheck(UserDTO requestUser) {
		
		Connection con = getConnection();
		UserDTO loginUser = null;
		
		//비밀번호를 먼저 매치해서 일치여부 확인
		String encPwd = userDAO.selectEncryptedPwd(con, requestUser);
		
		System.out.println("비밀번호 매치 잘 됐니? : " + encPwd);

		// 비밀번호, 유저 차단 여부 조회
		//UserDTO encPwdBlock = null;
//		loginUser = userDAO.selectEnCryptedPwd(con,requestUser);
//		
//		
//		System.out.println("Service 유저 차단 조회 : " + loginUser.getUserBlock());
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		/* 로그인 요청한 원문 비밀번호와 저장되어 있는 암호화된 비밀번호가 일치하는지 확인 */
		if(passwordEncoder.matches(requestUser.getUserPwd(), encPwd)) {
			/* 비밀번호가 일치하는 경우에만 회원 정보를 조회해온다. */
			loginUser = userDAO.selectLoginUser(con, requestUser);
			System.out.println("서비스의 loginUser : " + loginUser);
		}
		
		System.out.println("loginUser : " + loginUser);
		
		close(con);
		
		return loginUser;
	}


	/**
	 * 로그인시 고객 정보를 가져오는 메소드
	 * @param requestUser
	 * @return loginUserInfo
	 */
	public UserDTO loginInfo(UserDTO requestUser) {
		
		Connection con = getConnection();
		UserDTO loginUserInfo = null;
		
		loginUserInfo = userDAO.selectLoginUser(con, requestUser);

		
		close(con);
		
		return loginUserInfo;
	}

	
	/**
	 * 회원가입용 메소드
	 * @param requestUser
	 * @return int newUser
	 */
	public int insertNewUser(UserDTO requestUser) {
		
		Connection con = getConnection();
		
		int newUser = userDAO.insertNewUser(con, requestUser);
		
		
		if(newUser > 0) {
			commit(con);
			
			/* 기본이력서 생성 */
			int newResume = userDAO.insertNewResume(con);
			
			if (newResume > 0) {
				commit(con);
			} else {
				rollback(con);
			}
			
		} else {
			rollback(con);
		}
		
		close(con);
		
		return newUser;
		
	}

	public String checkId(String userPhone) {
		
		Connection con = getConnection();
		
		String result = userDAO.checkId(con, userPhone);
		
		return result;
	}


	/**
	 * 업종에 따라 직종 정보를 받아오는 메소드
	 * @param industryInfo
	 * @return
	 */
	public UserDTO jobInfo(UserDTO industryInfo) {
		
		Connection con = getConnection();
		UserDTO jobInfo = null;//UserDAO.selectJobByIndustry(con, industryInfo);
		
		close(con);
		
		return jobInfo;
	}

	/**
	 * db에 해당 휴대폰 번호에 대한 인증번호 저장
	 * @param num
	 * @param numStr
	 * @return
	 */
	public int verifiedNum(String num, String numStr) {
		Connection con = getConnection();
		
		int result = userDAO.insertVerifiedNum(con, num, numStr);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	/**
	 * 휴대폰번호의 인증번호 조회
	 * @param num
	 * @return numStr
	 */
	public String selectVerifiedNum(String num) {
		
		Connection con = getConnection();
		
		String numStr = userDAO.selectVerifiedNum(con, num);
		
		close(con);
		
		return numStr;
	}

	/**
	 * 휴대폰번호의 비밀번호 업데이트
	 * @param userPhone
	 * @param enteredPwd
	 * @return
	 */
	public int updatePwd(String userPhone, String enteredPwd) {
		Connection con = getConnection();
		
		int result = userDAO.updatePwd(con, userPhone, enteredPwd);
		
		if(result > 0) {
			commit(con);
			System.out.println("커밋된 result : " + result);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}


}
