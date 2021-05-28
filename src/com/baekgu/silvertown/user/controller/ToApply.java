package com.baekgu.silvertown.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/toapply")
public class ToApply extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String postCode1 = request.getParameter("postCode");
		System.out.println("이동 서블릿 : " + postCode1);
		System.out.println("지원하기 servlet 도착 : Post 방식"); 
		
		request.setAttribute("postCode", postCode1);
		
		String path = "/WEB-INF/views/customer/main/apply.jsp?postCode="+postCode1;
		request.getRequestDispatcher(path).forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
