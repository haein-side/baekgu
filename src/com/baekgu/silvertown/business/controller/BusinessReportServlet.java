package com.baekgu.silvertown.business.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.business.model.dto.BusinessMemberDTO;
import com.baekgu.silvertown.business.model.dto.BusinessPostDTO;
import com.baekgu.silvertown.business.model.dto.BusinessReportDTO;
import com.baekgu.silvertown.business.model.serivce.BusinessService;
import com.baekgu.silvertown.common.paging.PageNation;

/**
 * Servlet implementation class BusinessReportServlet
 */
@WebServlet("/business/report")
public class BusinessReportServlet extends HttpServlet {
	
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
		
		/* 공고 심사 상태별 갯수 구하기 + 전체 게시물 수 구하기  */
		BusinessService businessService = new BusinessService();
		int totalCount = businessService.selectReportCount(loggedInUser.getbId());
		
		/* 한 페이지에 보여 줄 게시물 수 */
		int limit = 10;
		/* 한 번에 보여질 페이징 버튼의 수*/
		int buttonAmount = 5;
		
		/* 페이징 처리를 위한 로직 호출 후 페이징 처리에 관한 정보를 담고 있는 인스턴스를 반환받는다. */
		/* JDBC 시작 - 공고 조회 */
		
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, totalCount, limit, buttonAmount);

		List<?> reportList = businessService.selectPostList(loggedInUser.getbId(), pageInfo);
		
		String path = "";

		if(reportList != null) {
			path = "/WEB-INF/views/business/main/reportlist.jsp";
						
			request.setAttribute("reportList", reportList);
			request.setAttribute("pageInfo", pageInfo); 
			request.setAttribute("total", totalCount);
		} 
//			else {
//			path = "/WEB-INF/views/common/failed.jsp";
//			request.setAttribute("message", "게시물 목록 조회 실패!");
//		}
		
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
