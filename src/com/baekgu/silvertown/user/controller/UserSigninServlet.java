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
		
		/* Service와 연결하여 회원가입(비밀번호)과 차단여부 조회 */
		UserService userService = new UserService();
		UserDTO loginUser = userService.loginCheck(requestUser);
	    System.out.println("Servlet 고객 차단여부 : " + loginUser.getUserBlock());
	    
	    String errorPage = "";
	    
	    /* 고객정보 유무로 분기 처리 */
	    if(loginUser != null) {
	    	
	    	/* 고객정보 일치시 */
	    	/* Service와 연결하여 로그인 정보 받아오기 */
		    UserService userServiceInfo = new UserService();
		    UserDTO loginUserInfo = userServiceInfo.loginInfo(requestUser);
		    System.out.println("Servlet 고객코드 : " + loginUserInfo.getUserCode());
		    
		    if(loginUserInfo.getUserBlock() != 1) {

	            /* 로그인 성공시 */ 
				/* Session에 조회한 회원정보를 loginUserInfo로 넣어줌 */
				HttpSession session = request.getSession();
	            session.setAttribute("loginUserInfo", loginUserInfo);
				response.sendRedirect("/baekgu/user/toMain");
				
				System.out.println("로그인 성공");		    
		    
		    } else {
		    	
		    	/* 차단된 유저일 경우 */
		        errorPage="/WEB-INF/views/customer/common/errorBlockUser.jsp";
		        System.out.println("차단 유저");
		        request.setAttribute("errorMessage", "고객님의 이력서 신고 접수가 승인되어 백구 이용이 제한되었습니다.");
		        request.getRequestDispatcher(errorPage).forward(request, response);

		    }
	    	
	    } else {
	    	
	    	/* 고객정보가 없을시 */
	    	System.out.println("Servlet : 회원정보를 찾을 수 없습니다.");
			
			errorPage="/WEB-INF/views/customer/common/errorWrongId.jsp";
        	request.setAttribute("errorMessage", "회원정보를 찾을 수 없습니다. 다시 로그인 해주세요.");
        	request.getRequestDispatcher(errorPage).forward(request, response);
	    	
	    }

	}
}