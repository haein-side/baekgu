package com.baekgu.silvertown.admin.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baekgu.silvertown.admin.model.dto.AdminDTO;
import com.baekgu.silvertown.admin.model.service.AdminLoginService;

/**
 * Servlet implementation class AdminLoginController
 */
@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/admin/main/main.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String adminId = request.getParameter("adminId");
		String adminPwd = request.getParameter("adminPwd");
		
		System.out.println("adminId : " + adminId);
		System.out.println("adminPwd : " + adminPwd);
		
		AdminDTO requestAdmin = new AdminDTO();
		requestAdmin.setAdminId(adminId);
		requestAdmin.setAdminPwd(adminPwd);
		
		AdminLoginService adminService = new AdminLoginService();
		
		AdminDTO loginAdmin = adminService.loginCheck(requestAdmin);
		
		if(loginAdmin != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginAdmin", loginAdmin);
			
			System.out.println("request.getContextPath() : " + request.getContextPath());
			response.sendRedirect(request.getContextPath()+"/admin/main");
		} else{
			request.setAttribute("message", "아이디 또는 비밀번호에 오류가 있습니다.");
			request.getRequestDispatcher("/WEB-INF/views/admin/main/signin.jsp").forward(request, response);
			
		}
		
		
	}

}























