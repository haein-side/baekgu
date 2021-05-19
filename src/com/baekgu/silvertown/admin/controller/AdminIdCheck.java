package com.baekgu.silvertown.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.admin.model.service.AdminRegistService;

/**
 * Servlet implementation class AdminIdCheck
 */
@WebServlet("/adminIdCheck")
public class AdminIdCheck extends HttpServlet {

	/**
	 * 관리자 아이디 중복 체크용 
	 * @see 
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String adminId = request.getParameter("adminId");
		System.out.println(adminId);
	
		int result = new AdminRegistService().adminIdSelect(adminId);
		
		
		String str = "";
		
		if (result > 0) {
			str = "fail";
			
		} else {
			str = "success";
	
		}
		
		System.out.println(result);
		System.out.println(str);
		
		response.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();
		out.print(str);
		
	}

}
