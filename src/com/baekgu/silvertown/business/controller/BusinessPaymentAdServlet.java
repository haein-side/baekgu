package com.baekgu.silvertown.business.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baekgu.silvertown.business.model.dto.BusinessMemberDTO;
import com.baekgu.silvertown.business.model.dto.PaymentDTO;
import com.baekgu.silvertown.business.model.serivce.BusinessService;


@WebServlet("/business/paymentlist")
public class BusinessPaymentAdServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		
		// 현재 로그인중인 아이디 세션 불러오기
		HttpSession session = request.getSession();
		BusinessMemberDTO loginMember = (BusinessMemberDTO)session.getAttribute("loginBusinessMember");
		
		
		BusinessService service = new BusinessService();
		
		// 심사 상태에 따른 값 가져오기
		Map<Integer, Integer> counts = service.selectTotalCount(loginMember.getbId());
		
		int hold = 0;
		int accepted = 0;
		int rejected = 0;
		
		for(Map.Entry<Integer, Integer> entry : counts.entrySet()) {
			switch(entry.getKey()){
			case 1 :
				hold = entry.getValue(); break;
			case 2 :
				accepted = entry.getValue(); break;
			case 3 : 
				rejected = entry.getValue(); break;
				
			}			
			
		}
		
		int totalCount = hold + accepted + rejected;
		
		// 전체 결제리스트 가져오기 
		List<PaymentDTO> payList = new ArrayList<>();
		
		payList = service.selectAllpayList(loginMember.getbId());
		
		System.out.println(payList);
		
		String path = "";
		
		if(payList != null) {
			path = "/WEB-INF/views/business/main/paymentAdList.jsp";
			
//			request.setAttribute("pageCategory", pageCategory);
			
			request.setAttribute("payList", payList);

		} 
		
		request.getRequestDispatcher(path).forward(request, response);
		
		
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
