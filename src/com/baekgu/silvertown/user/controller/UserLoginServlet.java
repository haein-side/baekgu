package com.baekgu.silvertown.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baekgu.silvertown.user.model.dto.UserDTO;
import com.baekgu.silvertown.user.model.service.UserService;


@WebServlet("/user/login")
public class UserLoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인 정보 받아오기
		String userPhone = request.getParameter("USER_PHONE");
		String userPwd = request.getParameter("USER_PWD");
		
		// 출력 테스트
		System.out.println("입력한 고객 전화번호 : " + userPhone);
		System.out.println("입력한 고객 비밀번호 : " + userPwd);
		
		// DTO타입의 변수로 값 넣어주기
		UserDTO requestUser = new UserDTO();
		requestUser.setUserPhone(userPhone);
		requestUser.setUserPwd(userPwd);
		
		// 서비스 객체 생성
		UserService userService = new UserService();
		
		// 서비스에서 주는 값을 DTO형태로 받기
		UserDTO loginUser = userService.loginCheck(requestUser);
		
		System.out.println("컨트롤러 비밀번호, 차단여부 : " + requestUser);
		
		UserService userServiceInfo = new UserService();
		UserDTO loginUserInfo = null;
		
		// 회원가입 확인 분기문 (비밀번호)
		if(loginUser.getUserPwd() != null) {

			// 값을 보내서 조회해오기
			loginUserInfo = userServiceInfo.loginInfo(requestUser);
			
			System.out.println("컨트롤러 유저 값 조회 : " + loginUserInfo);
		} else {
			// 회원가입 안내 alert
			System.out.println("가입된 유저가 아닙니다. 회원가입 해주세요.");
		}
		
		// 차단 여부 확인
		if(loginUserInfo.getUserBlock() != 1) {
			
			// 비밀번호 대조
			if(requestUser.getUserPwd().equals(loginUser.getUserPwd())) {	
				// 로그인 성공
				// 뷰 분기처리, 로그인 정보는 session에 담기
				if(loginUser != null) {
					HttpSession session = request.getSession();
					session.setAttribute("loginUser", loginUser);
					
					// 서버 연결 후 출력 확인해보기
					System.out.println("로그인 성공");
					
					/* 로그인 성공 시 메인으로 */
					response.sendRedirect(request.getContextPath());
				}

			} else {
				// 비밀번호 틀렸습니다.
				System.out.println("비밀번호가 틀렸습니다.");
			}
		} else {
			// 차단된 유저입니다.
			System.out.println("고객님은 사용이 제한되었습니다. (차단)");
		}

		
	}

}
