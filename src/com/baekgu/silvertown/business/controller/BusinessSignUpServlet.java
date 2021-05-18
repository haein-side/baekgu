package com.baekgu.silvertown.business.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/business/signup")
public class BusinessSignUpServlet extends HttpServlet {
	
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("utf-8");
		
		String businessName = request.getParameter("bName");
		String businessNum = request.getParameter("bNo1") + request.getParameter("bNo2") + request.getParameter("bNo3");
		String ownerName = request.getParameter("ownerName");
		int profit = Integer.parseInt(request.getParameter("profit"));
		String businessPhone = request.getParameter("bPhone");
		String businessAddress = request.getParameter("address1") + request.getParameter("address2");
		String hrId = request.getParameter("hrId");
		String hrPwd = request.getParameter("enteredPwd");
		String hrName = request.getParameter("hrName");
		String hrPhone = request.getParameter("hrPhone");
		String hrEmail = request.getParameter("hrEmail");
		
		System.out.println(businessName);
		System.out.println(businessNum);
		System.out.println(ownerName);
		System.out.println(profit);
		System.out.println(businessPhone);
		System.out.println(businessAddress);
		System.out.println(hrId);
		System.out.println(hrPwd);
		System.out.println(hrName);
		System.out.println(hrPhone);
		System.out.println(hrEmail);
		
			
		

	}

}
