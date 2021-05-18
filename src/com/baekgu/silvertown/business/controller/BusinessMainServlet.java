package com.baekgu.silvertown.business.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baekgu.silvertown.business.model.dto.BusinessMemberDTO;


@WebServlet("/business/main")
public class BusinessMainServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		String path = "";
		request.getRequestDispatcher("/WEB-INF/views/business/main/BusinessMainPage.jsp").forward(request, response);
		
		HttpSession session = request.getSession();
		BusinessMemberDTO bDTO = (BusinessMemberDTO)session.getAttribute("loginBusinessMember");
		
		
		
		
		System.out.println(bDTO.getbName() + " 멍청이 과자 그만먹어라 살찐다.");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
