package com.baekgu.silvertown.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserSignupServlet
 */
@WebServlet("/customer/signup")
public class UserSignupServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("안녕");
		String userCode = request.getParameter("userCode");
		
		System.out.println("userCode : " + userCode);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		System.out.println("헬로");
		String userCode = request.getParameter("userCode");
		
		System.out.println("userCode : " + userCode);
		
		String salary1 = request.getParameter("salary");
		System.out.println(salary1);
		
		String salary2 = request.getParameter("salary");
		System.out.println(salary2);
		
		String title = request.getParameter("name");
		System.out.println(title);
		
		
		
		
	}

}
