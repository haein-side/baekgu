package com.baekgu.silvertown.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.admin.model.dto.AdminDTO;
import com.baekgu.silvertown.admin.model.service.AdminRegistService;

@WebServlet("/admin/admindelete")
public class DeleteAdminServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
	}

	/**
	 * 아이디를 통한 관리자 삭제용
	 */
	ArrayList<String> adminList = new ArrayList<>();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		boolean str = Boolean.valueOf(request.getParameter("sendData"));
		String id = request.getParameter("adminId");

		if (str) {
			// tru일 때 여기에 담고
			adminList.add(id);
		} else {
			// false일 때 꺼내서 제거는 것. 
			for (int i = 0; i < adminList.size(); i++) {
				String adminId = adminList.get(i);

				if (adminId.equalsIgnoreCase(id)) {
					adminList.remove(i);
					break;
				}
			}
		}

		for (int i = 0; i < adminList.size(); i++) {
			String adminId = adminList.get(i);
			System.out.println("체크 된 아이디 : " + adminId);
		}

		
		 AdminRegistService adminService = new AdminRegistService(); 
		 int result = adminService.adminDelete(adminList); 
		 
		   String path = "";
				if (result > 0) {
					// 보여주려는 곳으로 경로 지정.
					path = "/baeckgu/admin/search";
					response.sendRedirect(path);
					
				} else {
					// 에러페이지로 보내려고 함.
					path = "/WEB-INF/views/common/errorPage.jsp";
					request.setAttribute("message", "삭제 실패 !");
					request.getRequestDispatcher(path).forward(request, response);
				}

		
	}

}
