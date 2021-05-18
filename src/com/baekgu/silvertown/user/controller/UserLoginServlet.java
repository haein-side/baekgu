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


@WebServlet("/customer/login")
public class UserLoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인 정보 받아오기
		String userPhone = request.getParameter("USER_PHONE");
		String userPwd = request.getParameter("USER_PWD");
		
		// 출력 테스트
		System.out.println("고객 전화번호 : " + userPhone);
		System.out.println("고객 비밀번호 : " + userPwd);
		
		// DTO타입의 변수로 값 넣어주기
		UserDTO requestUser = new UserDTO();
		requestUser.setUserPhone(userPhone);
		requestUser.setUserPwd(userPwd);
		
		// 서비스 객체 생성
		UserService userService = new UserService();
		
		// 서비스에서 주는 값을 DTO형태로 받기
		UserDTO loginUser = userService.loginCheck(requestUser);
		
		// 뷰 분기처리, 로그인 정보는 session에 담기
		if(loginUser != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			
			// 서버 연결 후 출력 확인해보기
			
			/*
			 * 로그인 성공 시, 메인 화면에서 다른 header를 적용하는 법을 고민해보자 (메뉴 변경) 
			 */
			// redirect경로 설정 맞는지 확인
			response.sendRedirect(request.getContextPath());
		} else {
			// 수업 때 사용한 
			// 실패시 로그인 화면으로 돌아가서 alert을 통해 '아이디 혹은 비밀번호를 다시 확인해주세요.' 알리기
			//request.setAttribute("message", "로그인 실패!"); // error 페이지를 보여줄 경우 설정하기
			request.getRequestDispatcher("/WEB-INF/views/main/signin.jsp");
		}
		
		
	}

}
