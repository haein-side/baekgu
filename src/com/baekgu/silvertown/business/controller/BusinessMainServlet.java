 package com.baekgu.silvertown.business.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baekgu.silvertown.business.model.dto.BusinessMemberDTO;
import com.baekgu.silvertown.business.model.dto.MainDTO;
import com.baekgu.silvertown.business.model.serivce.BusinessService;


@WebServlet("/business/main")
public class BusinessMainServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		
		HttpSession session = request.getSession();
		BusinessMemberDTO loggedInUser = (BusinessMemberDTO)session.getAttribute("loginBusinessMember");
		
		BusinessService service = new BusinessService();
		MainDTO main = null;
		
		String path = "";
		
		if(loggedInUser != null) {
			
			
			main = service.selectBusinessInfo(loggedInUser.getbId());
			
			System.out.println(main);
						
			path = "/WEB-INF/views/business/main/BusinessMainPage.jsp";
			
			request.setAttribute("main", main);
			
		}else {

			/* 로그인이 안된 상태에서 홈버튼을 눌렀을시 회원가입페이지로 보낸다. */
			/* 추후 모달창으로 업데이트 예정. */
			path = "/WEB-INF/views/business/main/signupB.jsp";

		}
		
		request.getRequestDispatcher(path).forward(request, response);
		
						
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
