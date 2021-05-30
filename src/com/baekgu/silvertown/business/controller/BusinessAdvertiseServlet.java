package com.baekgu.silvertown.business.controller;

import java.io.IOException;
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
import com.baekgu.silvertown.business.model.dto.BusinessPostDTO;
import com.baekgu.silvertown.business.model.dto.PaymentDTO;
import com.baekgu.silvertown.business.model.serivce.BusinessService;
import com.baekgu.silvertown.common.paging.PageNation;

/**
 * Servlet implementation class BusinessAdvertiseServlet
 */
@WebServlet("/business/advertise")
public class BusinessAdvertiseServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* paging 처리 */
		String currentPage = request.getParameter("currentPage");
		int pageNo = 1;
		
		if(currentPage != null && !"".equals(currentPage)) {
			pageNo = Integer.parseInt(currentPage);
		}
		
		if(pageNo <= 0) {
			pageNo = 1;
		}
		
		/* 해당 기업에 대한 공고의 전체 수 조회하기
		 * 현재 로그인된 유저의 아이디로 공고의 전체 가져오기.
		 *   */
		HttpSession session = request.getSession();
		BusinessMemberDTO loggedInUser = (BusinessMemberDTO)session.getAttribute("loginBusinessMember");
		
		/* 공고 심사 상태별 갯수 구하기 + 전체 게시물 수 구하기  */
		BusinessService businessService = new BusinessService();
		Map<Integer, Integer> counts = businessService.selectTotalCount(loggedInUser.getbId());
		
		
		int hold = 0; // 접수
		int approved = 0; // 승인 
		int rejected = 0; // 거절
		
		
		for (Map.Entry<Integer, Integer> entry : counts.entrySet()) {
            switch(entry.getKey()) {
                case 1: 
                	hold = entry.getValue();
                	break;
                case 2:
                	approved = entry.getValue();
                	break;
                case 3:
                	rejected = entry.getValue();
                	break;
            }
        }
		
		int limit = 10;
		
		int buttonAmount = 5;
		
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, hold, limit, buttonAmount, "광고접수");

		List<?> postAdList = (List<BusinessPostDTO>)businessService.selectPostList(loggedInUser.getbId(), pageInfo);
		
		System.out.println("JINSEO JJANG"+postAdList);
		
		String path = "";

		if(postAdList != null) {
			path = "/WEB-INF/views/business/main/advertise.jsp";
						
			request.setAttribute("postAdList", postAdList);
			request.setAttribute("pageInfo", pageInfo); 
			
		}
//			else {
//			path = "/WEB-INF/views/common/failed.jsp";
//			request.setAttribute("message", "게시물 목록 조회 실패!");
//		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("test doPost method");
		
		PaymentDTO postAd = new PaymentDTO();
		postAd.setPostCode(Integer.parseInt(request.getParameter("selectedPostCode")));
		postAd.setAdCode(Integer.parseInt(request.getParameter("selectedAdCode")));
		postAd.setWeeks(Integer.parseInt(request.getParameter("selectedWeeks")));
		
		int result = new BusinessService().insertPostAdPayment(postAd);
		
		String path = "";

		if(result > 0 ) {
			request.setAttribute("adName", request.getParameter("selectedAd"));
			request.setAttribute("postTitle", request.getParameter("selectedPostTitle"));
			request.setAttribute("postManager", request.getParameter("selectedManager"));
			
			path = "/WEB-INF/views/business/main/advertise.jsp";
		}
	
		request.getRequestDispatcher(path).forward(request, response);

	}

}
