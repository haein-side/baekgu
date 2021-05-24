package com.baekgu.silvertown.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ToResumeServlet
 */
@WebServlet("/user/toResume")
public class ToResumeServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("resume으로 가는 서블릿 도착");
		String path = "/WEB-INF/views/customer/main/resume.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	}

}
