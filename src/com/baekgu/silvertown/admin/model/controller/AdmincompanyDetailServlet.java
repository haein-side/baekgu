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

/**
 * Servlet implementation class companyDetailServlet
 */
@WebServlet("/admin/companydetail")
public class AdmincompanyDetailServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		System.out.println("기업코드 : " + no);
		
		AdminCompanyService companyService = new AdminCompanyService();
		CompanyDTO company = companyService.selectCompanyDetail(no);
		
		List<CompanyDTO> hrList = null;
		
		if(company != null) {
			
			hrList = companyService.selectHrList(no);
			
		}
		
		
		
		String path = "";
		
		if(company != null) {
			path = "/WEB-INF/views/admin/main/CompanyInfoDetail.jsp";
			request.setAttribute("company", company);
			request.setAttribute("hrList", hrList);
		} else {
			path = "/WEB-INF/views/admin/common/errorPage.jsp";
			request.setAttribute("message", "기업 상세 정보를 조회할 수 없습니다. 관련 오류는 개발자에게 문의해주세요.");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}



















