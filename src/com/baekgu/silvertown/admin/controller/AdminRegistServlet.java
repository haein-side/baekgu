package com.baekgu.silvertown.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.admin.model.dto.AdminDTO;
import com.baekgu.silvertown.admin.model.service.AdminRegistService;

/**
 * Servlet implementation class AdminRegistServlet
 */
@WebServlet("/admin/signup")
public class AdminRegistServlet extends HttpServlet {

	/**
	 * 등록하기를 눌렀을 때 넘어가게하려고 ! 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = "/WEB-INF/views/admin/main/Registration.jsp";
		request.getRequestDispatcher(path).forward(request, response);
		
	}
	/**
	 * 관리자 등록용
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		String adminId = request.getParameter("adminId");
		String adminPwd = request.getParameter("enteredPwd");
		String adminName = request.getParameter("adminName");
		String adminEmail = request.getParameter("adminEmail");
		String adminRole = request.getParameter("adminRole");	
		
		
		AdminDTO requestadmin = new AdminDTO();

		requestadmin.setAdminId(adminId);
		requestadmin.setAdminPwd(adminPwd);
		requestadmin.setAdminName(adminName);
		requestadmin.setAdminEmail(adminEmail);
		requestadmin.setAdminRole(adminRole);
		
		System.out.println(requestadmin);

		int result = new AdminRegistService().adminRegist(requestadmin);	
		
		
		String path = "";
		if(result > 0) {
			path = "/baekgu/admin/list";
			response.sendRedirect(path);
		} else {
			path = "/WEB-INF/views/admin/common/erroPage.jsp";
			request.setAttribute("message", "등록 실패!");
			request.getRequestDispatcher(path).forward(request, response);
		}
		
		
		
	}


	
	
	

}
