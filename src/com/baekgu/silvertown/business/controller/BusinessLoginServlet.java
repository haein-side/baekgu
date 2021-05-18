package com.baekgu.silvertown.business.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.business.model.serivce.BusinessService;
import com.baekgu.silvertown.user.model.dto.BusinessDTO;


@WebServlet("/business/login")
public class BusinessLoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String bId = request.getParameter("bId");
		String bPwd = request.getParameter("bPwd");
		
		System.out.println(bId);
		System.out.println(bPwd);
		
		BusinessDTO bMember = new BusinessDTO();
		
		bMember.setbId(bId);
		bMember.setbPwd(bPwd);
		
		BusinessService bService = new BusinessService();
		
		BusinessDTO loginBusinessMember = bService.loginCheck(bMember);
		
	}

}
