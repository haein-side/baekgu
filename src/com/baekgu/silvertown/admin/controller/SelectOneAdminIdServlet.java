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
 * Servlet implementation class SelectOneAdminIdServlet
 */
@WebServlet("/admin/adminid") 
public class SelectOneAdminIdServlet extends HttpServlet {

	/**
	 * 관리자 아이디로 상세정보 조회용 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
         /* 파라미터 꺼내기  -> 여기서 id는 manager.jsp에 있음. */
		String adminId = request.getParameter("id");
		
		System.out.println("adminId : " + adminId);
		
		/* 관리자 아이디를 이용해서 비즈니스 로직 호출 */
		AdminRegistService idService = new AdminRegistService();
		AdminDTO  selectId = idService.selectOneAdminId(adminId);
		
		
		/* 비지니스 로직 실행 결과에 따른 뷰 연결 */
		String path  = "";
		if(selectId != null) {
			path = "/WEB-INF/views/admin/main/ManagerDetail.jsp";
			request.setAttribute("selectId", selectId);
			
		} else {
			path = "/WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("message", "관리자 상세 정보 조회 실패!");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
	}

}
