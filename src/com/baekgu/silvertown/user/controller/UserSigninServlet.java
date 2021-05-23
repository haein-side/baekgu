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
public class UserSigninServlet extends HttpServlet {

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
		
	
		
		String errorPage = "";
		
		// 회원가입 확인 분기문 (비밀번호)
		if(loginUser.getUserPwd() != null) {

			// 값을 보내서 조회해오기
			loginUserInfo = userServiceInfo.loginInfo(requestUser);
			
			System.out.println("컨트롤러 유저 값 조회 : " + loginUserInfo);
		} else {
			// 회원가입 안내 alert
			System.out.println("잘못된 아이디");
			
			errorPage="/WEB-INF/views/customer/common/errorAgain.jsp";
       	 	request.setAttribute("errorMessage", "입력하신 정보를 찾을 수 없습니다. 다시 로그인 해주세요.");
       	 	request.getRequestDispatcher(errorPage).forward(request, response);
		}
		
		// 차단 여부 확인
		if(loginUserInfo.getUserBlock() != 1) {
			
			// 비밀번호 대조
			if(requestUser.getUserPwd().equals(loginUser.getUserPwd())) {
				// 로그인 성공
				// 뷰 분기처리, 로그인 정보는 session에 담기
				if(loginUser != null) {
					HttpSession session = request.getSession();
		               
		            // 받아온 회원정보를 loginUserInfo라는 속성으로 넣어줌
		            session.setAttribute("loginUserInfo", loginUserInfo);
		               
		            System.out.println("loginUser의 usercode : " + loginUserInfo.getUserCode());

					
					// 서버 연결 후 출력 확인해보기
					System.out.println("로그인 성공");
					/* 로그인 성공 시 메인으로 */
					System.out.println(request.getContextPath());
					// doGet 방식 사용
					response.sendRedirect(request.getContextPath() + "/user/toMain");
				}

			} else {
				// 비밀번호 틀렸습니다.
				System.out.println("잘못된 비밀번호");
				
				errorPage="/WEB-INF/views/customer/common/errorpwd.jsp";
	        	request.setAttribute("errorMessage", "비밀번호가 틀렸습니다.");
	        	request.getRequestDispatcher(errorPage).forward(request, response);
			}
		} else {
			// 차단된 유저입니다.
			errorPage="/WEB-INF/views/customer/common/errorBlockUser.jsp";
			System.out.println("차단 유저");
       	 	request.setAttribute("errorMessage", "고객님의 이력서 신고 접수가 승인되어 백구 이용이 제한되었습니다.");
       	 	request.getRequestDispatcher(errorPage).forward(request, response);
		}

	}

}
