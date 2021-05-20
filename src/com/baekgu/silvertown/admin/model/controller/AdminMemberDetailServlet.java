package com.baekgu.silvertown.admin.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.admin.model.dto.MemberDTO;
import com.baekgu.silvertown.admin.model.service.AdminMemberService;

/**
 * Servlet implementation class AdminMemberDetailServlet
 */
@WebServlet("/admin/memberdetail")
public class AdminMemberDetailServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				
		int no = Integer.parseInt(request.getParameter("no"));

		System.out.println("글번호(user code) : " + no);
		
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
		
	}

}
