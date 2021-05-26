package com.baekgu.silvertown.business.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.business.model.dto.BusinessReportDTO;
import com.baekgu.silvertown.business.model.serivce.BusinessService;

/**
 * Servlet implementation class BusinessReportServlet
 */
@WebServlet("/business/report")
public class BusinessReportServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 값확인 - 성공 
//		System.out.println(request.getParameter("reportReason"));
//		System.out.println(request.getParameter("postCode"));
//		System.out.println(request.getParameter("resumeCode"));
		
		int postCode = Integer.parseInt(request.getParameter("postCode"));
		int resumeCode = Integer.parseInt(request.getParameter("resumeCode"));
		String reportReason = request.getParameter("reportReason");
		
		// reportDTO 생성 및 초기화 
		BusinessReportDTO reportDTO = new BusinessReportDTO(postCode, resumeCode, reportReason);
		List<Object> containDTO = new ArrayList<>();
		containDTO.add(reportDTO);
		
		/* 심사내역 테이블(부모테이블)에 이력을 남긴다.*/
		// 매개변수 1은 지원자 신고에 대한 코드
		int result = new BusinessService().insertDecisionList(1, containDTO);
		String path = "";
		
		if(result > 0) {
			request.setAttribute("postCode", postCode);
//			System.out.println("set up the path");
			
//			path = "/business/applicantlist"; // 다른 서블릿으로 포워드 안됌.
//			path = "/WEB-INF/views/business/main/applicantlist.jsp";
		
			response.sendRedirect(request.getContextPath() + "/business/applicantlist?postCode="+postCode+"&resumeCode="+resumeCode);
		}
//		else {
//			
//		}
		
//		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
