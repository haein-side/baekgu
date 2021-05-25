package com.baekgu.silvertown.admin.model.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.admin.model.dto.PaymentDTO;
import com.baekgu.silvertown.admin.model.service.AdminPaymentService;

/**
 * Servlet implementation class AdminTaxSerlvet
 */
@WebServlet("/admin/tax")
public class AdminTaxSerlvet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int no = Integer.parseInt(request.getParameter("no"));

		System.out.println("공고코드 : " + no);
		
		AdminPaymentService taxService = new AdminPaymentService();
		PaymentDTO tax = taxService.selectTax(no);
		
		int totalPrice = tax.getAdPrice();
		int a = 0;
		
		Map<String, Integer> taxprices = new HashMap<>();
		taxprices.put("1000000", 0);
		taxprices.put("100000", 0);
		taxprices.put("10000", 0);
		taxprices.put("1000", 0);
		taxprices.put("100", 0);
		taxprices.put("10", 0);
		taxprices.put("1", 0);
		
		for(int i = 1000000; i >= 10; i /=10) {
			
			if( totalPrice / i > 0) {
				a = (totalPrice / i);
				totalPrice -= a * i;
				String ci = Integer.toString(i);
				taxprices.put(ci, a);
			}
			
		}
		System.out.println("잘되니 : " + taxprices);
		System.out.println(taxprices.get(1000000));
		
		String path = "";
		if(tax != null) {
			path = "/WEB-INF/views/admin/main/tax.jsp";
			request.setAttribute("tax", tax);
			System.out.println("충격 너무 잘 나옴.....");
			request.setAttribute("taxprices", taxprices);
		} else {
			path = "/WEB-INF/views/admin/common/errorPage.jsp";
			request.setAttribute("message", "세금계산서 발행을 할 수 없습니다. 관련 오류는 개발자에게 문의해주세요.");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
		
		
	}

	

}
