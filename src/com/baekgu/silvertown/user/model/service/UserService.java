package com.baekgu.silvertown.user.model.service;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.commit;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.getConnection;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.baekgu.silvertown.user.model.dao.UserDAO;
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
		
		// 비밀번호, 유저 차단 여부 조회
		//UserDTO encPwdBlock = null;
		loginUser = userDAO.selectEnCryptedPwd(con,requestUser);
		
		System.out.println("Service 유저 차단 조회 : " + loginUser.getUserBlock());
		
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
	

}
