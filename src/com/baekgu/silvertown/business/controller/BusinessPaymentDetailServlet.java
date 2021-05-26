package com.baekgu.silvertown.business.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baekgu.silvertown.business.model.dto.BusinessMemberDTO;
import com.baekgu.silvertown.business.model.dto.PaymentDetailDTO;
import com.baekgu.silvertown.business.model.serivce.BusinessService;


@WebServlet("/business/paymentdetail")
public class BusinessPaymentDetailServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// 로그인중인 아이디 불러오기
		HttpSession session = request.getSession();
		BusinessMemberDTO loginMember = (BusinessMemberDTO)session.getAttribute("loginBusinessMember");
		
		
		int postAdCode = Integer.parseInt(request.getParameter("detail"));
		
		System.out.println(postAdCode);
		
		BusinessService service = new BusinessService();
		
		// 상세 보기 목록 가져오기
		PaymentDetailDTO  paymentdetail = service.selectPaymentDetail(loginMember.getbId(), postAdCode);
		

		// 결제가능 일수 구하기
		
		int dday = (int)(paymentdetail.getPostStart().getTime() - System.currentTimeMillis()) / 1000/ 60 /60 / 24;
		
		
		
		System.out.println("이 공고의 남은 날"  + dday);
	
		System.out.println(paymentdetail);
		

		
		request.setAttribute("paymentdetail", paymentdetail);
		request.setAttribute("dday", dday);
		request.setAttribute("name", paymentdetail.getPostMName());
		request.setAttribute("total", paymentdetail.getTotalPrice());

		
		
		String path = "/WEB-INF/views/business/main/paymentdetail.jsp";
		
		request.getRequestDispatcher(path).forward(request, response);		
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
