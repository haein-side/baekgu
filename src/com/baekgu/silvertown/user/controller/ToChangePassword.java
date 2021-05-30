package com.baekgu.silvertown.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ToChangePassword
 */
@WebServlet("/user/toChangePassword")
public class ToChangePassword extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("새 비밀번호 입력으로 가는 서블릿 도착");
		
		String userPhone = request.getParameter("phoneNumber");
		// 일단 임의의 값 넣어둠 (수정필요)
		request.setAttribute("userPhone", userPhone);
		
		System.out.println("userPhone : " + userPhone);
		
		String path = "/WEB-INF/views/customer/main/changepassword.jsp";
		request.getRequestDispatcher(path).forward(request, response);
		
		
		
		
	}

}
