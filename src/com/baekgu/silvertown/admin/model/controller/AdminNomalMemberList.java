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
 * Servlet implementation class AdminNomalMemberList
 */
@WebServlet("/admin/nomalmember")
public class AdminNomalMemberList extends HttpServlet {
	
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
		
		/* 전체 게시물의 갯수가 필요 */
		/* DB에서 전체 게시물의 수를 조회 */
		AdminMemberService nomalListService = new AdminMemberService();
		nomalListService.searchNomalMemberList();
		
		/* 한 페이지에서 보여주는 게시물의 수 */
		int limit = 10;
		
		/* 한번에 보여지는 페이징 버튼 수 */
		int buttonAmount = 5;
		
		/* 페이징 처리를 위한 로직 호출 후, 페이징 처리에 관한 정보를 담고 있는 인스턴스 리턴 */
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, pageNo, limit, buttonAmount);
		
		/* 조회 */
		List<MemberDTO> nomalList = nomalListService.searchNomalMemberList(pageInfo);
		
		String path = "";
		if(nomalList != null) {
			path = "/WEB-INF/views/admin/main/MemberInfo.jsp";
			request.setAttribute("memberList", nomalList);
			request.setAttribute("pageInfo", pageInfo);
		} else {
			path = "/WEB-INF/views/admin/common/errorPage.jsp";
			request.setAttribute("message", "회원 목록 조회를 실패했습니다. 관련 오류는 개발자에게 문의해주세요.");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
		
		
	}


}




















