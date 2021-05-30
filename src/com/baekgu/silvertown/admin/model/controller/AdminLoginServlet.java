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
		
		String path = "/WEB-INF/views/admin/main/signin.jsp";
		request.getRequestDispatcher(path).forward(request, response);
		
	}
		
		
		
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String adminId = request.getParameter("adminId");
		String adminPwd = request.getParameter("adminPwd");
		
		System.out.println("adminId : " + adminId);
		System.out.println("adminPwd : " + adminPwd);
		
		AdminDTO requestAdmin = new AdminDTO();
		//1. 아이디만 dto에 등록된다
		requestAdmin.setAdminId(adminId);
		requestAdmin.setAdminPwd(adminPwd);
		
		AdminLoginService adminService = new AdminLoginService();
		
		AdminDTO loginAdmin = adminService.loginCheck(requestAdmin);
		
		
		if(loginAdmin != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginAdminName", loginAdmin.getAdminName());
			session.setAttribute("loginAdminId", loginAdmin.getAdminId());
			session.setAttribute("adminRole", loginAdmin.getAdminRole());
			
			System.out.println("request.getContextPath() : " + request.getContextPath());
			response.sendRedirect(request.getContextPath()+"/admin/homepage");
		} else{
			
			request.setAttribute("message", "아이디 또는 비밀번호에 오류가 있습니다.");
			request.getRequestDispatcher("/WEB-INF/views/admin/main/signin.jsp").forward(request, response);
		}
		
		
	}

}























