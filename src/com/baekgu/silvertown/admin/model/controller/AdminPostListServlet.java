package com.baekgu.silvertown.admin.model.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.admin.model.dto.PostDTO;
import com.baekgu.silvertown.admin.model.service.AdminPostService;
import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.common.paging.PageNation;

/**
 * Servlet implementation class AdminPostListServlet
 */
@WebServlet("/admin/postList")
public class AdminPostListServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String currentPage = request.getParameter("currentPage");
		int pageNo = 0;
		
		if(currentPage != null && !"".equals(currentPage)) {
			pageNo = Integer.parseInt(currentPage);
		}
		
		if(pageNo <= 0) {
			pageNo = 1;
		}
		
		System.out.println("currentPage : " + currentPage);
		System.out.println("pageNo : " + pageNo);

		AdminPostService postService = new AdminPostService();
		int count = postService.selectTotalCount();
		

		int limit = 10;
		int buttonAmount = 5;
		
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, count, limit, buttonAmount);
		
		List<PostDTO> postList = postService.selectPostList(pageInfo);
		
		String path = "";
		
		if(postList != null) {
			path = "/WEB-INF/views/admin/main/Post.jsp";
			request.setAttribute("postList", postList);
			request.setAttribute("pageInfo", pageInfo);
		} else {
			path = "/WEB-INF/views/admin/common/errorPage.jsp";
			request.setAttribute("message", "공고 목록 조회를 실패했습니다. 관련 오류는 개발자에게 문의해주세요.");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}

}


















