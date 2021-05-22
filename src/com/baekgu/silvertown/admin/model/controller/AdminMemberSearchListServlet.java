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
 * Servlet implementation class AdminMemberSearchListServlet
 */
@WebServlet("/admin/memberSearch")
public class AdminMemberSearchListServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//검색하려 선택하는 셀렉트 옵션의 값이다
		String condition = request.getParameter("searchCondition");
		//사용자가 입력한 값이다
		String value = request.getParameter("searchValue");


		System.out.println("셀렉트 옵션 : " + condition);
		System.out.println("사용자 입력 값 : " + value);
		
		//검색을하고 처음 나오는 페이지는 1페이지다. 파라미터로 전달되는 페이지가 있는 경우 currentPage는 파라미터로 전달 받은 페이지 수다.
		String currentPage = request.getParameter("currentPage");
		int pageNo = 1;
		
		if(currentPage != null && "".equals(currentPage)) {
			pageNo = Integer.parseInt(currentPage);
		}
		
		//pageNo가 0이거나 0보다 작다면 1페이지를 보여준다
		if(pageNo <= 0) {
			pageNo = 1;
		}
		
		//게시물의 개수, DB에서 조회한다
		AdminMemberService memberService = new AdminMemberService();
		int count = memberService.searchMemberListCount(condition, value);
		
		int limit = 10;
		int buttonAmount = 5;
		
		//페이징 처리를 위한 로직 호출 후, 페이징 처리에 관한 정보를 담고 있는 인스턴스 리턴 받기
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, pageNo, limit, buttonAmount);
		
		//조회
		List<MemberDTO> memberList = memberService.searchMemberList(condition, value, pageInfo);
		
		String path = "";
		if(memberList != null) {
			path = "/WEB-INF/views/admin/main/MemberInfo.jsp";
			request.setAttribute("memberList", memberList);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("searchCondition", condition);
			request.setAttribute("searchValue", value);
		} else {
			path = "/WEB-INF/views/admin/common/errorPage.jsp";
			request.setAttribute("message", "회원 검색에 실패했습니다. 관련 문의는 개발자에게 문의해주세요.");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
		

		
	}

}
























