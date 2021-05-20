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
import com.baekgu.silvertown.business.model.dto.BusinessMemberDTO;
import com.baekgu.silvertown.business.model.dto.BusinessPostDTO;
import com.baekgu.silvertown.business.model.serivce.BusinessService;
import com.baekgu.silvertown.common.paging.PageNation;

/**
 * Servlet implementation class BusinessPostListServlet
 */
@WebServlet("/business/postlist")
public class BusinessPostListServlet extends HttpServlet {

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
		
		BusinessService businessService = new BusinessService();
		int totalCount = businessService.selectTotalCount(loggedInUser.getbId());
		
		System.out.println("totalCount 체크 : " + totalCount);
		
		/* 한 페이지에 보여 줄 게시물 수 */
		int limit = 10;
		/* 한 번에 보여질 페이징 버튼의 수*/
		int buttonAmount = 5;
		
		/* 페이징 처리를 위한 로직 호출 후 페이징 처리에 관한 정보를 담고 있는 인스턴스를 반환받는다. */
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, totalCount, limit, buttonAmount);
		
		System.out.println(pageInfo);		
				
		/* JDBC 시작 - 조회 */
		List<BusinessPostDTO> postList = businessService.selectPostList(loggedInUser.getbId(), pageInfo);
		
		System.out.println("postList : " + postList);
		
		String path = "";
		if(postList != null) {
			path = "/WEB-INF/views/business/main/postlist.jsp";
			request.setAttribute("postList", postList);
			request.setAttribute("pageInfo", pageInfo);
		} else {
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "게시물 목록 조회 실패!");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
	}
}
