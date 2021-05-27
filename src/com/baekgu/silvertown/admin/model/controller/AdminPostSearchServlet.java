package com.baekgu.silvertown.admin.model.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.admin.model.dto.CompanyDTO;
import com.baekgu.silvertown.admin.model.dto.PostDTO;
import com.baekgu.silvertown.admin.model.service.AdminCompanyService;
import com.baekgu.silvertown.admin.model.service.AdminPostService;
import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.common.paging.PageNation;

/**
 * Servlet implementation class AdminPostSearchServlet
 */
@WebServlet("/admin/postSearch")
public class AdminPostSearchServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//검색하려 선택하는 셀렉트 옵션의 값이다
		String condition = request.getParameter("searchCondition");
		//사용자가 입력한 값이다
		String value = request.getParameter("searchValue");
		int realValue = 0;
		
		System.out.println("셀렉트 옵션 : " + condition);
		System.out.println("사용자 입력 값 : " + value);
		System.out.println("------------------------------");
		
		if(condition.equals("state")) {
			
			if(value.equals("Y") || value.equals("y")) {
				realValue = 1;
				value = Integer.toString(realValue);
			} else if(value.equals("N") || value.equals("n")) {
				realValue = 0;
				value = Integer.toString(realValue);
			}
		}
		
		System.out.println("쿼리에 들어갈 값 : " + value);
		
		String currentPage = request.getParameter("currentPage");
		int pageNo = 1;
		
		if(currentPage != null && "".equals(currentPage)) {
			pageNo = Integer.parseInt(currentPage);
		}
		
		//pageNo가 0이거나 0보다 작다면 1페이지를 보여준다
		if(pageNo <= 0) {
			pageNo = 1;
		}
					
		AdminPostService postSearchService = new AdminPostService();
		int count = postSearchService.searchPostListCount(condition, value);
		
		System.out.println("카운트 값이 잘 오니? : " + count);
		
		int limit = 10;
		int buttonAmount = 5;
	
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, pageNo, limit, buttonAmount);
		
		List<PostDTO> postList = postSearchService.searchPostList(condition, value, pageInfo);
		
		String path = "";
		if(postList != null) {
			path = "/WEB-INF/views/admin/main/Post.jsp";
			request.setAttribute("postList", postList);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("searchCondition", condition);
			request.setAttribute("searchValue", value);
		} else {
			path = "/WEB-INF/views/admin/common/errorPage.jsp";
			request.setAttribute("message", "공고 검색에 실패했습니다. 관련 문의는 개발자에게 문의해주세요.");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	
	

		
		
	}

}













