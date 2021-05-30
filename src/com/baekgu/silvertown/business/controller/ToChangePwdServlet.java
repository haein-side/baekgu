package com.baekgu.silvertown.business.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ToChangePwdServlet
 */
@WebServlet("/business/tochangepwd")
public class ToChangePwdServlet extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String hrId = request.getParameter("hrId");

		
		System.out.println("hrId : " + hrId);
		
		request.setAttribute("hrId", hrId);

		String path = "/WEB-INF/views/business/main/changepassword.jsp";
		
		request.getRequestDispatcher(path).forward(request, response);
	}

}
