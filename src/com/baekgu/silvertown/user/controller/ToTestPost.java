package com.baekgu.silvertown.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/testPost")
public class ToTestPost extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//		System.out.println("지원하기로 가는 서블릿 도착");
//		request.getSession().invalidate();
//		response.sendRedirect(request.getContextPath());
		
		System.out.println("testPost로 가는 서블릿 도착");
		String path = "/WEB-INF/views/customer/main/testPost.jsp";
		request.getRequestDispatcher(path).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
