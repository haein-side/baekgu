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
 * Servlet implementation class BusinessJoinSearchServlet
 */
@WebServlet("/admin/joinSearch")
public class BusinessJoinSearchServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 검색폼
		String searchSelect = request.getParameter("searchSelect");
		String searchInput = request.getParameter("searchInput");

		System.out.println("searchselect : " + searchSelect);
		System.out.println("searchInput : " + searchInput);

		/*
		 * 목록보기를 눌렀을 시 가장 처음에 보여지는 페이지는 1페이지이다. 파라미터로 전달되는 페이지가 있는 경우 currentPage는 파라미터로
		 * 전달받은 페이지 수 이다.
		 */
		String currentPage = request.getParameter("currentPage");
		int pageNo = 1;

		if (currentPage != null && !"".equals(currentPage)) {
			pageNo = Integer.parseInt(currentPage);
		}

		/* 0보다 작은 숫자값을 입력해도 1페이지를 보여준다 */
		if (pageNo <= 0) {
			pageNo = 1;
		}

		BusinessJoinService joinService = new BusinessJoinService();
		int totalCount = joinService.joinSearch(searchSelect, searchInput);

		System.out.println("totalCount : " + totalCount);

		int limit = 10;
		int buttonAmount = 5;

		// 페이징 처리를 위한 로직 호출 후, 페이징 처리에 관한 정보를 담고 있는 인스턴스 리턴 받기
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, totalCount, limit, buttonAmount);

		List<BusinessJoinDTO> joinDTO = joinService.joinSearchSelect(searchSelect, searchInput, pageInfo);

		String path = "";
		if (joinDTO != null) {
			path = "/WEB-INF/views/admin/main/Sign-up.jsp";
			request.setAttribute("businessList", joinDTO);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("searchSelect", searchSelect);
			request.setAttribute("searchInput", searchInput);
		} else {
			path = "/WEB-INF/views/admin/common/errorPage.jsp";
			request.setAttribute("message", "공고 검색에 실패했습니다. 관련 문의는 개발자에게 문의해주세요.");
		}

		request.getRequestDispatcher(path).forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
