package com.baekgu.silvertown.business.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.business.model.dto.BusinessApplicationDTO;
import com.baekgu.silvertown.business.model.dto.BusinessMemberDTO;
import com.baekgu.silvertown.business.model.serivce.BusinessService;
import com.baekgu.silvertown.common.paging.PageNation;

/**
 * Servlet implementation class BusinessApplicantListServlet
 */
@WebServlet("/business/applicantlist")
public class BusinessApplicantListServlet extends HttpServlet {

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
		
		int postCode = Integer.parseInt(request.getParameter("postCode"));
		
		/* 세션에 저장된 기업회원 가져오기 */
		HttpSession session = request.getSession();
		BusinessMemberDTO loggedInUser = (BusinessMemberDTO)session.getAttribute("loginBusinessMember");
		
		/* 공고 심사 상태별 갯수 구하기 + 전체 게시물 수 구하기  */
		BusinessService businessService = new BusinessService();
		int counts = businessService.selectTotalApplicants(loggedInUser.getbId(), postCode);
		
		
		
		/* 한 페이지에 보여 줄 게시물 수 */
		int limit = 10;
		/* 한 번에 보여질 페이징 버튼의 수*/
		int buttonAmount = 5;
		
		/* 페이징 처리를 위한 로직 호출 후 페이징 처리에 관한 정보를 담고 있는 인스턴스를 반환받는다. */
		/* JDBC 시작 - 공고 조회 */
		
		// 승인된 공고 갯수를 기준으로 리스트를 시작한다 - 최댓값 
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, counts, limit, buttonAmount);
		
		List<BusinessApplicationDTO> applicationList =  businessService.selectApplicationList(loggedInUser.getbId(), postCode , pageInfo);
		
		
		String path = "";
		
		if(applicationList != null) {
			path = "/WEB-INF/views/business/main/applicantlist.jsp";
						
			request.setAttribute("applicationList", applicationList);
			request.setAttribute("pageInfo", pageInfo); 
			
			System.out.println(applicationList);
		} 
		

		request.getRequestDispatcher(path).forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
	}

}
