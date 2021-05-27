package com.baekgu.silvertown.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.admin.model.dto.PostDTO;
import com.baekgu.silvertown.admin.model.service.PostApproveService;
import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.common.paging.PageNation;

/**
 * Servlet implementation class PostApproveServlet
 */
@WebServlet("/admin/postapprove")
public class PostApproveListServlet extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		/* 목록보기를 눌렀을 시 가장 처음에 보여지는 페이지는 1페이지이다.
		 * 파라미터로 전달되는 페이지가 있는 경우 currentPage는 파라미터로 전달받은 페이지 수 이다.
		 * */
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
		PostApproveService postService = new PostApproveService();
		int totalCount = postService.selectTotalCount();
		
		/* 한 페이지에 보여 줄 게시물 수 */
		int limit = 5;
		/* 한 번에 보여질 페이징 버튼의 수*/
		int buttonAmount = 5;
		
		System.out.println("currentPage : " + currentPage);
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, totalCount, limit, buttonAmount);
		
		/* 조회해온다 */
		List<PostDTO> postList = postService.selectPostList(pageInfo);
		System.out.println(pageInfo);
		
		System.out.println("postList 컨트롤러 : " + postList);
		
		String path = "";
		if(postList != null) {
			
			path = "/WEB-INF/views/admin/main/PostApprove.jsp";
			request.setAttribute("postList", postList);
			request.setAttribute("pageInfo", pageInfo);
		} else {
			path = "/WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("message", "게시물 목록 조회 실패!");
		}
		request.getRequestDispatcher(path).forward(request, response);
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
