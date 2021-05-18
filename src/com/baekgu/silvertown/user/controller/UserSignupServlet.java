package com.baekgu.silvertown.user.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.user.model.dto.UserDTO;
import com.baekgu.silvertown.user.model.service.UserService;

/**
 * Servlet implementation class UserSignupServlet
 */
@WebServlet("/user/signup")
public class UserSignupServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 나중에
		System.out.println("안녕");
		String userCode = request.getParameter("userCode");
		
		System.out.println("userCode : " + userCode);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		//userBday1,2,3을 날짜타입으로 변환
		SimpleDateFormat date = new SimpleDateFormat("yyyymmdd");
		
		
		 /* 회원가입 폼 작성 후 post 요청할 때 처리하는 역할 */
		 String userPhone = request.getParameter("userPhone");
		 String enteredPwd = request.getParameter("enteredPwd");
		 String userName = request.getParameter("userName");
		 java.sql.Date userBday = java.sql.Date.valueOf(request.getParameter("userBday1") + "-" + request.getParameter("userBday2") + "-"+ request.getParameter("userBday3"));
		 String userGender = request.getParameter("userGender");
         String userAddress = request.getParameter("userAddress1") +"&"+ request.getParameter("userAddress2");
         
         System.out.println(userPhone);
         System.out.println(enteredPwd);
         System.out.println(userName);
         System.out.println(userBday);
         System.out.println(userGender);
         System.out.println(userAddress);
		
         UserDTO requestUser = new UserDTO();
         
         requestUser.setUserPhone(userPhone);
         requestUser.setUserPwd(enteredPwd);
         requestUser.setUserName(userName);
         requestUser.setUserBday(userBday);
         requestUser.setUserGender(userGender);
         requestUser.setUserAddress(userAddress);
		
         UserService userService = new UserService();
         
         int newUser = userService.insertNewUser(requestUser);
         
         
         /* 비즈니스 로직 실행 결과에 따른 뷰 연결(forward) */
         String page = "";
         
         if(newUser != 0) {
//        	 page="/WEB-INF/views/customer/common/successPage.jsp";
//        	 request.setAttribute("successCode", "insertNewUser");        	 

        	 // 이 부분 보완해야 함
        	 System.out.println("request.getContextPath() : " + request.getContextPath());
        	 System.out.println("경축 하산함");
        	 page = "/WEB-INF/views/customer/main/main.jsp";
        	 response.sendRedirect(page);
        	 //request.getContextPath()
         } else {
        	 page = "/WEB-INF/views/customer/common/errorPage.jsp";
        	 // 회원가입 실패 시 어떻게 action해줘야 할 지 모르겠음
        	 request.setAttribute("errorMessage", "회원가입을 실패했습니다.");
        	 System.out.println("하산했으나 실패함");
        	 request.getRequestDispatcher(page).forward(request, response);
         }
         
         
		
	}

}
