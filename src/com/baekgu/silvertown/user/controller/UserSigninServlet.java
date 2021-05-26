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
		
		// 서비스 객체 생성
		UserService userService = new UserService();
		
		// 서비스에서 주는 값을 DTO형태로 받기
		UserDTO loginUser = userService.loginCheck(requestUser);
	    System.out.println("서블릿의 loginUser : " + loginUser);
	       
	    UserService userServiceInfo = new UserService();
	    UserDTO loginUserInfo = null;
	       
	    String errorPage = "";
	       
	    /* 회원가입 여부 분기처리 */
	    
	    	
	    loginUserInfo = userServiceInfo.loginInfo(requestUser);
		    
		System.out.println("컨트롤러 유저 값 조회 : " + loginUserInfo);
		
		if(loginUser != null) {
			
//		    /* 아이디 매치여부 조회 */
//	    	if(requestUser.getUserPhone() != loginUserInfo.getUserPhone()) {
//	    		
//	    		/* 아이디가 일치하지 않을 경우 */
//		        errorPage="/WEB-INF/views/customer/common/errorWrongId.jsp";
//		        System.out.println("잘못된 아이디");
//		        request.setAttribute("errorMessage", "아이디를 찾을 수 없습니다. 다시 획안해주세요.");
//		        request.getRequestDispatcher(errorPage).forward(request, response);
//	        	
//	    	} else {
	    		
	    		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	    		/* 로그인 요청한 원문 비밀번호와 저장되어 있는 암호화된 비밀번호가 일치하는지 확인 */
	    		if(passwordEncoder.matches(requestUser.getUserPwd(), loginUserInfo.getUserPwd())) {
	    			
					/* 고객 차단여부 분기처리 */
				    if(loginUserInfo.getUserBlock() != 1) {
				    	
				    	HttpSession session = request.getSession();
			            
			            // Session에 조회한 회원정보를 loginUserInfo로 넣어줌
			            session.setAttribute("loginUserInfo", loginUserInfo);
			            System.out.println("loginUser의 usercode : " + loginUserInfo.getUserCode());
						// 서버 연결 후 출력 확인해보기
						System.out.println("로그인 성공");

						/* 로그인 성공 시 메인으로 */
						response.sendRedirect(request.getContextPath() + "/user/toMain");
		    		
				    } else {
				    
				    	/* 차단된 유저일 경우 */
				        errorPage="/WEB-INF/views/customer/common/errorBlockUser.jsp";
				        System.out.println("차단 유저");
				        request.setAttribute("errorMessage", "고객님의 이력서 신고 접수가 승인되어 백구 이용이 제한되었습니다.");
				        request.getRequestDispatcher(errorPage).forward(request, response);
				    	
				    }
					
	    		} else {
	    			
	    			// 비밀번호 틀렸습니다.
					System.out.println("잘못된 비밀번호");
					
					errorPage="/WEB-INF/views/customer/common/errorpwd.jsp";
		        	request.setAttribute("errorMessage", "잘못된 비밀번호 입니다. 다시 확인해주세요.");
		        	request.getRequestDispatcher(errorPage).forward(request, response);
	    		}
	  		
	    	//}
	    		
	    	} else {
	    		
	    		errorPage="/WEB-INF/views/customer/common/errorAgain.jsp";   
			    request.setAttribute("errorMessage", "입력하신 정보를 찾을 수 없습니다. 다시 로그인 해주세요.");    
			    request.getRequestDispatcher(errorPage).forward(request, response);
			    
			    // 잘못된 회원정보
			    System.out.println("잘못된 회원정보");
	    		
	    		
	    		
	    	}

	 	
	}
 
}