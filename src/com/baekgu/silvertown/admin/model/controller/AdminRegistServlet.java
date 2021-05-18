package com.baekgu.silvertown.admin.model.controller;

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
@WebServlet("/admin/regist")
public class AdminRegistServlet extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
	}
	
	/**
	 * 관리자 등록용
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String adminId = request.getParameter("adminId");
		String adminPwd = request.getParameter("adminPwd");
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
			path = "/WEB-INF/views/admin/main/Manager.jsp";
			request.setAttribute("result", result);
		} else {
			path = "/WEB-INF/views/admin/common/erroPage.jsp";
			request.setAttribute("message", "등록 실패!");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
		
		
	}


	
	
	

}
