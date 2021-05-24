package com.baekgu.silvertown.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.admin.model.dto.BusinessJoinDTO;
import com.baekgu.silvertown.admin.model.service.BusinessJoinService;
import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.common.paging.PageNation;

/**
 * Servlet implementation class BusinessJoinServlet
 */
@WebServlet("/admin/businessjoinList")
public class BusinessJoinListServlet extends HttpServlet {

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
		BusinessJoinService joinService = new BusinessJoinService();
		int totalCount = joinService.selectTotalCount();
		
		/* 한 페이지에 보여 줄 게시물 수 */
		int limit = 5;
		/* 한 번에 보여질 페이징 버튼의 수*/
		int buttonAmount = 5;
		
		System.out.println("currentPage : " + currentPage);
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, totalCount, limit, buttonAmount);
		
		/* 조회해온다 */
		List<BusinessJoinDTO> businessList = joinService.selectJoinList(pageInfo);
		System.out.println(pageInfo);
		
		System.out.println("businessList : " + businessList);
		
		String path = "";
		if(businessList != null) {
			
			path = "/WEB-INF/views/admin/main/Sign-up.jsp";
			request.setAttribute("businessList", businessList);
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
