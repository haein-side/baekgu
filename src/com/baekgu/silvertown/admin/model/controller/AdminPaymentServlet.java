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
 * Servlet implementation class AdminPaymentServlet
 */
@WebServlet("/admin/payment")
public class AdminPaymentServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String currentPage = request.getParameter("currentPage");
		int pageNo = 0;
		
		if(currentPage != null && !"".equals(currentPage)) {
			pageNo = Integer.parseInt(currentPage);
		}
		
		if(pageNo <= 0) {
			pageNo = 1;
		}
		
		System.out.println("currentPage : "+currentPage);
		System.out.println("pageNo : " + pageNo);
		
		AdminPaymentService paymentService = new AdminPaymentService();
		
		int totalCount = paymentService.selectPaymentTotalCount();
		
		int limit = 10;
		int buttonAmount = 5;
		
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, totalCount, limit, buttonAmount);
		
		List<PaymentDTO> paymentList = paymentService.SelectpaymentList(pageInfo);
		
		System.out.println("servlet paymentList : " + paymentList);
		
		String path = "";
		if(paymentList != null) {
			path = "/WEB-INF/views/admin/main/Payment.jsp";
			request.setAttribute("paymentList", paymentList);
			request.setAttribute("pageInfo", pageInfo);
		} else {
			path = "/WEB-INF/views/admin/common/errorPage.jsp";
			request.setAttribute("message", "결제내역 목록 조회를 실패했습니다. 관련 오류는 개발자에게 문의해주세요.");
		}
		
		
		request.getRequestDispatcher(path).forward(request, response);
		
		
	}


}


















