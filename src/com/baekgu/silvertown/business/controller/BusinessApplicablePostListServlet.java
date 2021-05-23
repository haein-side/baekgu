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
import com.baekgu.silvertown.business.model.dto.BusinessApplicablePostDTO;
import com.baekgu.silvertown.business.model.dto.BusinessMemberDTO;
import com.baekgu.silvertown.business.model.serivce.BusinessService;
import com.baekgu.silvertown.common.paging.PageNation;

/**
 * Servlet implementation class BusinessApplicablePostListServlet
 */
@WebServlet("/business/applicablePostlist")
public class BusinessApplicablePostListServlet extends HttpServlet {
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
		
		/* 세션에 저장된 기업회원 가져오기 */
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
		
		/* 한 페이지에 보여 줄 게시물 수 */
		int limit = 10;
		/* 한 번에 보여질 페이징 버튼의 수*/
		int buttonAmount = 5;
		
		/* 페이징 처리를 위한 로직 호출 후 페이징 처리에 관한 정보를 담고 있는 인스턴스를 반환받는다. */
		/* JDBC 시작 - 공고 조회 */
		
		// 승인된 공고 갯수를 기준으로 리스트를 시작한다 - 최댓값 
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, approved, limit, buttonAmount);
		
		List<BusinessApplicablePostDTO> postList = (List<BusinessApplicablePostDTO>) businessService.selectPostList(loggedInUser.getbId(), pageInfo);
		
		// 실제 리스트의 갯수를 가지고 페이징 처리를 한다.
		pageInfo = PageNation.getPageInfo(pageNo, postList.size(), limit, buttonAmount);
		
		String path = "";

		if(postList != null) {
			path = "/WEB-INF/views/business/main/applicablePostlist.jsp";
						
			request.setAttribute("postList", postList);
			request.setAttribute("pageInfo", pageInfo); 
			request.setAttribute("approved", approved);
		} 
	

		request.getRequestDispatcher(path).forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
	}

}
