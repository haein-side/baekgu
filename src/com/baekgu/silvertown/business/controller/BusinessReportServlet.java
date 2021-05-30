package com.baekgu.silvertown.business.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

<<<<<<< HEAD
import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
=======
>>>>>>> branch 'master' of https://github.com/109SilverTown/baekgu.git
import com.baekgu.silvertown.business.model.dto.BusinessMemberDTO;
import com.baekgu.silvertown.business.model.dto.BusinessReportDTO;
import com.baekgu.silvertown.business.model.dto.BusinessReportListDTO;
import com.baekgu.silvertown.business.model.serivce.BusinessService;
import com.baekgu.silvertown.common.paging.PageNation;

/**
 * Servlet implementation class BusinessReportServlet
 */
@WebServlet("/business/report")
public class BusinessReportServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
<<<<<<< HEAD
		HttpSession session = request.getSession();
	    BusinessMemberDTO loggedInUser = (BusinessMemberDTO)session.getAttribute("loginBusinessMember");
	      
		
		/* paging 처리 */
		String currentPage = request.getParameter("currentPage");
		int pageNo = 1;
		
		if(currentPage != null && !"".equals(currentPage)) {
			pageNo = Integer.parseInt(currentPage);
		}
		
		if(pageNo <= 0) {
			pageNo = 1;
		}
		
		/* 한 페이지에 보여 줄 게시물 수 */
		int limit = 10;
		/* 한 번에 보여질 페이징 버튼의 수*/
		int buttonAmount = 5;
		
	    BusinessService service = new BusinessService();

		int totalCount = service.selectReportCount(loggedInUser.getbId());
		
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, totalCount, limit, buttonAmount);

	    List<BusinessReportListDTO> reportList = new ArrayList<>();
	      
	    reportList  = service.selectReportList(loggedInUser.getbId(), pageInfo);
	    
	    request.setAttribute("reportList", reportList);
	    String path = "/WEB-INF/views/business/main/reportlist.jsp";
	      
	    request.getRequestDispatcher(path).forward(request, response);
		

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
		
			response.sendRedirect(request.getContextPath() + "/business/applicantlist?postCode="+postCode+"&resumeCode="+resumeCode);
		}
//		else {
//			
//		}
		
//		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
