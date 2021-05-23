package com.baekgu.silvertown.user.controller;


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
import com.baekgu.silvertown.common.paging.PageNation;
import com.baekgu.silvertown.user.model.dto.ApplyDTO;
import com.baekgu.silvertown.user.model.dto.ReportDTO;
import com.baekgu.silvertown.user.model.dto.UserDTO;
import com.baekgu.silvertown.user.model.service.ManageApplyService;
import com.baekgu.silvertown.user.model.service.UserService;

@WebServlet("/user/manageApply")
public class ManageApply extends HttpServlet {
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   // 세션에 담긴 정보를 받아옴
	   HttpSession session = request.getSession();
	   
	   UserDTO requestUser = (UserDTO) session.getAttribute("loginUserInfo");
	   
	   int userCode = requestUser.getUserCode();
	   
	   System.out.println("manageApply에서 받은 userCode : " + userCode);
	   
	   // 페이징 처리
	   // 아마 두 페이지의 currentPage를 나눠줘야 할 듯
	   String currentPage1 = request.getParameter("currentPage1");
	   int pageNo1 = 1;
	   
	   String currentPage2 = request.getParameter("currentPage1");
	   int pageNo2 = 1;
	   
	   if(currentPage1 != null && !"".equals(currentPage1)) {
			pageNo1 = Integer.parseInt(currentPage1);
		}
		
		if(pageNo1 <= 0) {
			pageNo1 = 1;
		}
		
		if(currentPage2 != null && !"".equals(currentPage2)) {
				pageNo2 = Integer.parseInt(currentPage2);
		}
			
		if(pageNo2 <= 0) {
				pageNo2 = 1;
		}
		
		// 전체 게시물 수가 필요
	   ManageApplyService manageApplyService = new ManageApplyService();
	   
	   // 입사지원내역 전체
	   int applytotalCount = manageApplyService.applySelectTotalCount(userCode);
	   
	   System.out.println("입사지원내역 totalCount 체크 : " + applytotalCount);
	   
	   // 신고내역 전체
	   int blocktotalCount = manageApplyService.blockSelectTotalCount(userCode);
	   
	   System.out.println("신고내역 totalCount 체크 : " + blocktotalCount);
	   
	   // 한 페이지에 보여줄 게시물 수
	   int limit = 3;
	   
	   // 한 번에 보여질 페이징 버튼의 수
	   int buttonAmount = 3;
	   
	   // 페이징 처리를 위한 로직 호출 후 페이징 처리에 관한 정보를 담고 있는 인스턴스를 반환받음
	   
	   // 입사지원내역
		PageInfoDTO applyPageInfo = PageNation.getPageInfo(pageNo1, applytotalCount, limit, buttonAmount);
		
		System.out.println("applypageInfo : " + applyPageInfo);
	   
		// 신고내역
		PageInfoDTO blockPageInfo = PageNation.getPageInfo(pageNo2, blocktotalCount, limit, buttonAmount);
		
		System.out.println("blockpageInfo : " + blockPageInfo);
		
		
	   /* 입사지원관리 비즈니스 로직 처리*/
	   List<ApplyDTO> allApply = manageApplyService.selectApply(userCode, applyPageInfo);
	   
	   /* 신고내역관리 비즈니스 로직 처리*/
	   List<ReportDTO> allReport = manageApplyService.selectReport(userCode, blockPageInfo);
	   
	   // 응답페이지 처리
	    String path = "";
		if(allApply != null) {
			path = "/WEB-INF/views/customer/main/manageApply.jsp";
			request.setAttribute("allApply", allApply);
			request.setAttribute("allReport", allReport);
			request.setAttribute("applyPageInfo", applyPageInfo);
			request.setAttribute("blockPageInfo", blockPageInfo);
			System.out.println(allApply);
			System.out.println(allReport);
			System.out.println(applyPageInfo);
			System.out.println(blockPageInfo);
			
		} else {
			path = "/WEB-INF/views/user/common/errorPage.jsp";
			request.setAttribute("message", "입사관리내역조회를 실패했습니다.");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	   
	   
	   
	   
   }

   /* 지원 취소 */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
	   int applycode = Integer.parseInt(request.getParameter("cancel"));
	   
	   System.out.println("지원취소 : " + applycode); // value인 "applyCode"가 전송됨
	   
	   // 서비스 선언
	   ManageApplyService manageApplyService = new ManageApplyService();
	   
	   // 지원 취소 (delete) 비즈니스 로직 처리
	   int cancelApply = manageApplyService.cancelApply(applycode);
	   System.out.println(request.getParameter("allApply"));
	   
	   // 응답페이지 처리
	    String path = "";
		if(cancelApply != 0) {
			System.out.println("들어옴");
			path = "/baekgu/user/manageApply";
			response.sendRedirect(path);
			
		} else {
			path = "/WEB-INF/views/user/common/errorPage.jsp";
			request.setAttribute("message", "지원취소를 실패했습니다.");
			request.getRequestDispatcher(path).forward(request, response);
		}
		
	   
      
   }

}