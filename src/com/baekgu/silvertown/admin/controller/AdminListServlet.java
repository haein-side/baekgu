package com.baekgu.silvertown.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.admin.model.dto.AdminDTO;
import com.baekgu.silvertown.admin.model.service.AdminService;
import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.common.paging.PageNation;

/**
 * Servlet implementation class AdminSearchListServletr
 */
@WebServlet("/admin/list")
public class AdminListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String currentPage = request.getParameter("currentPage");
		int pageNo = 1;
		
		if(currentPage != null && !"".equals(currentPage)) {
			pageNo = Integer.parseInt(currentPage);
		}
		
		if(pageNo <= 0) {
			pageNo = 1;
		}

		/* 전체 게시물 수가 필요 */
		/* 데이터베이스에서 먼저 전체 게시물 수를 조회 */
		AdminService adminService = new AdminService();
		int totalCount = adminService.selectTotalCount();
		
		/* 한 페이지에 보여 줄 게시물 수 */
		int limit = 5;
		/* 한 번에 보여질 페이징 버튼의 수*/
		int buttonAmount = 5;
		
		System.out.println("currentPage : " + currentPage);
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, totalCount, limit, buttonAmount);
		
		/* 조회해온다 */
		List<AdminDTO> adminList = adminService.searchAdminList(pageInfo);
		System.out.println(pageInfo);
		
		System.out.println("adminList : " + adminList);
		
		String path = "";
		if(adminList != null) {
			
			path = "/WEB-INF/views/admin/main/Manager.jsp";
			request.setAttribute("adminList", adminList);
			request.setAttribute("pageInfo", pageInfo);
		} else {
			path = "/WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("message", "게시물 목록 조회 실패!");
		}
		request.getRequestDispatcher(path).forward(request, response);
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
