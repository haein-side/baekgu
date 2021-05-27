package com.baekgu.silvertown.admin.model.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.admin.model.dto.PaymentDTO;
import com.baekgu.silvertown.admin.model.service.AdminPaymentService;
import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.common.paging.PageNation;

/**
 * Servlet implementation class AdminPaymentSearchServlet
 */
@WebServlet("/admin/paymentSearch")
public class AdminPaymentSearchServlet extends HttpServlet {



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 검색하려 선택하는 셀렉트 옵션의 값이다
		String searchSelect = request.getParameter("searchSelect");
		// 사용자가 입력한 값이다
		String searchInput = request.getParameter("searchInput");

		System.out.println("searchSelect : " + searchSelect);
		System.out.println("searchInput  : " + searchInput);
		
		System.out.println("재무재무잼쥬매쥼ㅈㅁ잼ㅈㅁ쥼쥼");
		/* 목록보기를 눌렀을 시 가장 처음에 보여지는 페이지는 1페이지이다.
		 * 파라미터로 전달되는 페이지가 있는 경우 currentPage는 파라미터로 전달받은 페이지 수 이다.
		 * */
		String currentPage = request.getParameter("currentPage");
		int pageNo = 0;
		
		if(currentPage != null && !"".equals(currentPage)) {
			pageNo = Integer.parseInt(currentPage);
		}
		
		/* 0보다 작은 숫자값을 입력해도 1페이지를 보여준다 */
		if(pageNo <= 0) {
			pageNo = 1;
		}
		
		AdminPaymentService paymentService = new AdminPaymentService();
		int totalCount = paymentService.paymentSearchTotalCount(searchSelect,searchInput);
		
		System.out.println("totalCount 컨트롤러 : " + totalCount);
		
		int limit = 10;
		int buttonAmount = 5;
		
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, totalCount, limit, buttonAmount);
		
		List<PaymentDTO> paymentList = paymentService.paymentSearchList(searchSelect, searchInput, pageInfo);
		
		String path = "";
		if (paymentList != null) {
			path = "/WEB-INF/views/admin/main/Payment.jsp";
			request.setAttribute("paymentList", paymentList);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("searchSelect", searchSelect);
			request.setAttribute("searchInput", searchInput);
		} else {
			path = "/WEB-INF/views/admin/common/errorPage.jsp";
			request.setAttribute("message", "재무 검색에 실패했습니다. 관련 문의는 개발자에게 문의해주세요.");
		}

		request.getRequestDispatcher(path).forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
