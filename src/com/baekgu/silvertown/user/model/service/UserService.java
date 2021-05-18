package com.baekgu.silvertown.user.model.service;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.baekgu.silvertown.user.model.dao.UserDAO;
import com.baekgu.silvertown.user.model.dto.UserDTO;

public class UserService {

	/* DAO와 연결할 필드 변수 */
	private UserDAO userDAO = new UserDAO();
		
	/**
	 * 로그인용 메소드
	 * @param requestUser
	 * @return loginUser
	 */
	public UserDTO loginCheck(UserDTO requestUser) {
		
		Connection con = getConnection();
		UserDTO loginUser = null;
		
		// 비밀번호, 유저 차단 여부 조회
		String encPwdBlock = userDAO.selectEnCryptedPwd(con,requestUser);
		// TODO int 형으로 처리해줘야 하나>
		
		// TODO 2개의 값을 하나씩 출력하는 방법?
		System.out.println("암호화된 비밀번호 : " + encPwdBlock.indexOf(0));
		
		// 비밀번호, 차단 값이 있는지 확인하기
		if(!encPwdBlock.isEmpty()) {
			
			// 라이브러리를 사용해 객체 생성
			BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
			
			// 비밀번호 대조
			if(pwdEncoder.matches(requestUser.getUserPwd(), encPwdBlock)) {
				
				loginUser = userDAO.selectLoginMember(con, requestUser);
			}
			
			loginUser = userDAO.selectLoginMember(con, requestUser);
			System.out.println("service : " + loginUser);
			
		} else {
			
			// 팝업 띄워주기: 입력하신 회원정보가 없습니다. 확인 -> 회원가입 페이지
		}
		
		return loginUser;
	}
	
	
}
