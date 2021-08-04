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

import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.business.model.dto.BusinessMemberDTO;
import com.baekgu.silvertown.business.model.dto.PaymentDTO;
import com.baekgu.silvertown.business.model.serivce.BusinessService;
import com.baekgu.silvertown.common.paging.PageNation;


@WebServlet("/business/paymentlist")
public class BusinessPaymentAdServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* paging 처리 */
		String currentPage = request.getParameter("currentPage");
		int pageNo = 1;
		if(currentPage != null && !"".equals(currentPage)) pageNo = Integer.parseInt(currentPage);
		if(pageNo <= 0) pageNo = 1;
		String category = request.getParameter("category");
		String pageCategory = "전체";
		if(category != null && !category.equals("")) pageCategory = category;
		if(!pageCategory.equals("전체") && !pageCategory.equals("결제완료") && !pageCategory.equals("미결제"))	pageCategory = "전체";
		// 현재 로그인중인 아이디 세션 불러오기
		HttpSession session = request.getSession();
		BusinessMemberDTO loginMember = (BusinessMemberDTO)session.getAttribute("loginBusinessMember");
		BusinessService service = new BusinessService();
		// 심사 상태에 따른 값 가져오기
		Map<Integer, Integer> counts = service.selectpayCount(loginMember.getbId());
		int paid = 0;
		int nonepaid = 0;
		for(Map.Entry<Integer, Integer> entry : counts.entrySet()) {
			switch(entry.getKey()){
			case 1 : paid = entry.getValue(); break;
			case 0 : nonepaid = entry.getValue(); break;
		    default : System.out.println("error by category selection"); break;	
			}			
		}
		int totalCount = paid + nonepaid;
		int selection = 0;
		switch(pageCategory) {
		    case "전체": selection = totalCount; break;
		    case "결제완료": selection = paid;	break;
		    case "미결제": selection = nonepaid; break;
		    default : 	System.out.println("error by category selection"); break;
		}
		/* 한 페이지에 보여 줄 게시물 수 */
		int limit = 10;
		/* 한 번에 보여질 페이징 버튼의 수*/
		int buttonAmount = 5;
		/* 페이징 처리를 위한 로직 호출 후 페이징 처리에 관한 정보를 담고 있는 인스턴스를 반환받는다. */
		/* JDBC 시작 - 결제 조회 */
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, selection, limit, buttonAmount, pageCategory);
		List<PaymentDTO> payList = service.selectAllpayList(loginMember.getbId(), pageInfo);
		// 결제 미결제 조건
		int payStatus = 0;
		for(int i = 0; i < payList.size(); i++) {
			if(payList.get(i).getPostAdPaid() == 0) {
				payStatus = 0;
			}
			if(payList.get(i).getPostAdPaid() == 1) {
				payStatus = 1;
			}
			request.setAttribute("payStatus", payStatus);
		}
		String path = "";
		if(pageInfo != null) {
			path = "/WEB-INF/views/business/main/paymentAdList.jsp";
			request.setAttribute("payList", payList);
			request.setAttribute("pageInfo", pageInfo); // page category도 담겨있다.
			request.setAttribute("total", totalCount);
			request.setAttribute("paid", paid);
			request.setAttribute("nonepaid", nonepaid);
		} 
		request.getRequestDispatcher(path).forward(request, response);
	}
}
