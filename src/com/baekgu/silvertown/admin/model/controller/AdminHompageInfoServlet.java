package com.baekgu.silvertown.admin.model.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminHompageInfoServlet
 */
@WebServlet("/admin/homepage")
public class AdminHompageInfoServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/WEB-INF/views/admin/main/HomePageInfo.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	}
	

}
