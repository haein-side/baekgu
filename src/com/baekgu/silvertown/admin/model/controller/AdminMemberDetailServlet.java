package com.baekgu.silvertown.admin.model.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baekgu.silvertown.admin.model.dto.BlockDTO;
import com.baekgu.silvertown.admin.model.dto.MemberDTO;
import com.baekgu.silvertown.admin.model.service.AdminMemberService;

/**
 * Servlet implementation class AdminMemberDetailServlet
 */
@WebServlet("/admin/memberdetail")
public class AdminMemberDetailServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				
		int no = Integer.parseInt(request.getParameter("no"));

		System.out.println("유저코드 : " + no);
		
		AdminMemberService memberService = new AdminMemberService();
		MemberDTO memberDetail = memberService.selectMemberDetail(no);
		
		System.out.println("memberDetail : " + memberDetail);
		
		String path = "";
		if(memberDetail != null) {
			path = "/WEB-INF/views/admin/main/MemberInfoDetail.jsp";
			request.setAttribute("member", memberDetail);
		} else {
			path = "/WEB-INF/views/admin/common/errorPage.jsp";
			request.setAttribute("message", "회원 정보를 조회할 수 없습니다. 관련 오류는 개발자에게 문의해주세요.");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
		

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userCode = Integer.parseInt(request.getParameter("no"));
		String reason = request.getParameter("reason");
		//loginAdmin에 담겨있는 세션값을 가져온다. (관리자 이름)
		HttpSession session = request.getSession();
		String adminId = (String)session.getAttribute("loginAdminId");
		
		//들어온 버튼의 value를 확인해서 조건문으로 승인, 거절을 판별한다
		String state = request.getParameter("blockButton");
		
		BlockDTO block = new BlockDTO();
		block.setbReason(reason);
		block.setAdmin(adminId);
		block.setUserCode(userCode);
		
		System.out.println("유저코드 : " + userCode);
		System.out.println("block : " + block);
		System.out.println("차단 사유 : " + block.getbReason());
		System.out.println("관리자ID : " + block.getAdmin());
		System.out.println("눌린 버튼 : " + state);
		
		int result = 0;
		
		//1. 고객코드와 일치하는 신고내역 조회
		AdminMemberService memberService = new AdminMemberService();
		int searchResult = memberService.selectReportCode(block);
		
		if(searchResult > 0) {
			
			//버튼의 값이 승인일시
			if(state.equals("사용자 신고 승인")) {
				
				System.out.println("신고 승인 시작합니다");
				
				//2. 가져온 신고코드를 이용하여 블락 업데이트 실행
				result = memberService.updateBlockMember(block);
				
				if(result > 0) {
					response.sendRedirect(request.getContextPath() + "/admin/reportlist");

				} else {
					String path ="/WEB-INF/views/admin/common/errorPage.jsp";
					request.setAttribute("message", "신고가 들어온 회원이 맞는지 불확실 합니다. 신고내역에서 확인 후, 차단해주세요!");
					request.getRequestDispatcher(path).forward(request, response);
				}
				
			}
			
			//버튼의 값이 거절일시
			if(state.equals("사용자 신고 거절")) {
				
				System.out.println("신고 거절 실행합니다");
				//2. 가져온 신고코드를 이용하여 신고 거절 실행
				result = memberService.updateNoBlock(block);
				
				if(result > 0) {
					
					response.sendRedirect(request.getContextPath() + "/admin/reportlist");
					
				} else {
					String path = "/WEB-INF/views/admin/common/errorPage.jsp";
					request.getRequestDispatcher(path).forward(request, response);
				}
				
				
				
			}
			
		}
		
		
		
		
	}

}
