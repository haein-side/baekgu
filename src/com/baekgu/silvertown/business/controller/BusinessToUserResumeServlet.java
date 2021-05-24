package com.baekgu.silvertown.business.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baekgu.silvertown.business.model.dto.BusinessMemberDTO;
import com.baekgu.silvertown.business.model.serivce.BusinessService;
import com.baekgu.silvertown.user.model.dto.UserDTO;

/**
 * Servlet implementation class BusinessToUserResumeServlet
 */
@WebServlet("/business/userresume")
public class BusinessToUserResumeServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int applyCode = Integer.parseInt(request.getParameter("applyCode"));
		
		/* 1. 들어온 applycode를 이용하여 미열람 -> 열람 바꾸기  */
		/* 1.1 반드시 로그인된 회사의 지원서만 업데이트 가능하게 만들기. */
		HttpSession session = request.getSession();
		BusinessMemberDTO loggedInUser = (BusinessMemberDTO)session.getAttribute("loginBusinessMember");
		
		BusinessService businessService = new BusinessService();
		int result = businessService.updateResumeRead(loggedInUser.getbId(), applyCode);
		
		System.out.println("RESULT UPDATE : " + result);
		
		
		/* 2. 세션에 해당 유저의 정보를 담아서(applycode이용) 해당 resume로 포워드 시킨다.  */
		if(result > 0 ) {
			UserDTO userInfo = businessService.lookResume(applyCode);
			
			session.setAttribute("loginUserInfo", userInfo);
		} else {
			System.out.println("잘못된 접근");
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
