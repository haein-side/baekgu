package com.baekgu.silvertown.admin.model.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.admin.model.dto.MemberDTO;
import com.baekgu.silvertown.admin.model.service.AdminMemberService;
import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.common.paging.PageNation;


/**
 * Servlet implementation class AdminMemberBlockListServlet
 */
@WebServlet("/admin/blockmember")
public class AdminMemberBlockListServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String currentPage = request.getParameter("currentPage");
		int pageNo = 0;
		
		if(currentPage != null & !"".equals(currentPage)) {
			pageNo = Integer.parseInt(currentPage);
		}
		
		if(pageNo <= 0) {
			pageNo = 1;
		}
		
		System.out.println("currentPage : " + currentPage);
		System.out.println("pageNo : " + pageNo);
		
		/* 전체 게시물의 갯수 필요 */
		/* DB에서 전체 게시물의 갯수를 조회 */
		AdminMemberService blockListService = new AdminMemberService();
		int totalCount = blockListService.selectBlockTotalCount();
		
		System.out.println("총 블락 수 : " + totalCount);
		
		/* 한 페이지에서 보여 줄 게시물의 수 */
		int limit = 10;
	
		/* 한 페이지에서 보여질 페이징 버튼의 수 */
		int buttonAmount = 5;
		
		/* 페이징 처리를 위한 로직 호출 후, 페이징 처리에 관한 정보를 담고 있는 인스턴스 리턴 */
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, pageNo, limit, buttonAmount);
		
		System.out.println("pageInfo : " + pageInfo);
		
		/* 조회 시작 */
		List<MemberDTO> memberList = blockListService.searchBlockMemberList(pageInfo);
		
		String path = "";
		if(memberList != null) {
			path = "/WEB-INF/views/admin/main/MemberInfo.jsp";
			request.setAttribute("memberList", memberList);
			request.setAttribute("pageInfo", pageInfo);
		} else {
			path = "/WEB-INF/views/admin/common/errorPage.jsp";
			request.setAttribute("message", "회원 목록 조회를 실패했습니다. 관련 오류는 개발자에게 문의해주세요.");
		}
		
		
		request.getRequestDispatcher(path).forward(request, response);
		
		
	
	}

	

}
