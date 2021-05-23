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


@WebServlet("/business/editInfo")
public class EditBusinessInfoServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("EditBusinessInfoServlet 서블릿 도착");
		String path = "/WEB-INF/views/business/main/editBusinessInfo.jsp";
		
		request.getRequestDispatcher(path).forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		System.out.println(name); 
		System.out.println(phone); 
		System.out.println(email); 
		
		HttpSession session = request.getSession();
		BusinessMemberDTO loggedInUser = (BusinessMemberDTO)session.getAttribute("loginBusinessMember");
		
		System.out.println(loggedInUser);
		
		BusinessMemberDTO member = new BusinessMemberDTO();
		
		
		member.setbId(loggedInUser.getbId());
		member.setbName(name);
		member.setbPhone(phone);
		member.setbEmail(email);
		
		System.out.println(member);
		
		
		BusinessService service = new BusinessService();
		
		int result = service.updateHrInfo(member);
		
		//System.out.println(result);
		
		String path ="";
		
		if(result > 0 ) {
		
			path = "";
			
		} else {
			
			path = "";
			
		}
	}

}
