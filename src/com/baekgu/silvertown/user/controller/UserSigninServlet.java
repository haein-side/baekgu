package com.baekgu.silvertown.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

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
		
		/* Service와 연결하여 회원가입과 차단여부 조회 */
		UserService userService = new UserService();
		UserService userServiceInfo = new UserService();
		UserDTO loginUser = userService.loginCheck(requestUser);
		UserDTO loginUserInfo = userServiceInfo.loginInfo(requestUser);
	    System.out.println("Servlet 고객 차단여부 : " + loginUserInfo.getUserBlock());
	       
	    /* Service와 연결하여 로그인 정보 받아오기 */
	    System.out.println("Servlet 고객코드 : " + loginUserInfo.getUserCode());
	    
	    String errorPage = "";
	       
	    /* 회원가입 여부 분기처리 */
		if(loginUserInfo != null) {

            System.out.println("loginUser의 usercode : " + loginUserInfo.getUserCode());
			System.out.println("로그인 성공");

			HttpSession session = request.getSession();
            
            // Session에 조회한 회원정보를 loginUserInfo로 넣어줌
            session.setAttribute("loginUserInfo", loginUserInfo);
			response.sendRedirect(request.getContextPath());
			
		} else {

			System.out.println("잘못된 회원정보");
			
			errorPage="/WEB-INF/views/customer/common/errorWrongId.jsp";
        	request.setAttribute("errorMessage", "잘못된 회원정보 입니다. 다시 로그인 해주세요.");
        	request.getRequestDispatcher(errorPage).forward(request, response);
			
		}

	}
}