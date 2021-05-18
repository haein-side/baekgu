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
	 * 로그인용 메소드
	 * @param requestUser
	 * @return loginUser
	 */
	public UserDTO loginCheck(UserDTO requestUser) {
		
		Connection con = getConnection();
		UserDTO loginUser = null;
		
		// 비밀번호, 유저 차단 여부 조회
		UserDTO encPwdBlock = null;
		encPwdBlock = userDAO.selectEnCryptedPwd(con,requestUser);
		
		// 비밀번호 값이 있는지 확인
		if(!encPwdBlock.getUserPwd().isEmpty()) {
			
			if(encPwdBlock.getUserBlock() != 0) {
				
				BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
				
				// 비밀번호 대조
				if(pwdEncoder.matches(requestUser.getUserPwd(), encPwdBlock.getUserPwd())) {
					
					loginUser = userDAO.selectLoginMember(con, requestUser);
				}
				
				loginUser = userDAO.selectLoginMember(con, requestUser);
				System.out.println("service : " + loginUser);
			
			} else {
				
				// 고객 차단 알림
			}
		} else {
			
			// 회원가입 안함: 알림		
		}

		return loginUser;
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
