package com.baekgu.silvertown.admin.model.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.admin.model.dto.CompanyDTO;
import com.baekgu.silvertown.admin.model.service.AdminCompanyService;
import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.common.paging.PageNation;

/**
 * Servlet implementation class AdminCompanyListSevlet
 */
@WebServlet("/admin/companyList")
public class AdminCompanyListSevlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String currentPage = request.getParameter("currentPage");
		int pageNo = 0;
		
		if(currentPage != null && "".equals(currentPage)) {
			pageNo = Integer.parseInt(currentPage);
		}
		
		if(pageNo <= 0) {
			pageNo = 1;
		}
		
		
		//가입신청이 한 번이라도 거절, 승인된 기업만 나타낸다
		AdminCompanyService companyService = new AdminCompanyService();
		int totalCount = companyService.selectTotalCount();
		
		System.out.println("총 기업 수 : " + totalCount);
		
		int limit = 10;
		int buttonAmount = 5;
		
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, totalCount, limit, buttonAmount);
		
		System.out.println("페이지 정보 : " + pageInfo);
		
		List<CompanyDTO> companyList = companyService.companyList(pageInfo);
		
		String path = "";
		
		if(companyList != null) {
			
			path = "/WEB-INF/views/admin/main/CompanyInfo.jsp";
			request.setAttribute("companyList", companyList);
			request.setAttribute("pageInfo", pageInfo);
			
		} else {
			path = "/WEB-INF/views/admin/common/errorPage.jsp";
			request.setAttribute("message", "기업 목록 조회를 실패했습니다. 관련 오류는 개발자에게 문의해주세요.");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

























