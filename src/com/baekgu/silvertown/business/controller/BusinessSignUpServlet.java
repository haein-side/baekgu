package com.baekgu.silvertown.business.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.business.model.dto.BusinessDTO;
import com.baekgu.silvertown.business.model.dto.HrDTO;
import com.baekgu.silvertown.business.model.serivce.BusinessService;



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
		
		
		/* 기업DTO에 값을 담음 */
		BusinessDTO business = new BusinessDTO();
		
		business.setBusinessName(businessName);
		business.setBusinessNum(businessNum);
		business.setOwnerName(ownerName);
		business.setBusinessNo(businessPhone);
		business.setProfit(profit);
		business.setbCategory(profit);
		
		/* 담당자DTO에 값을 담음 */
		HrDTO hr = new HrDTO();
		
		hr.sethId(hrId);
		hr.sethPwd(hrPwd);
		hr.sethName(hrName);
		hr.sethPhone(hrPhone);
		hr.sethEmail(hrEmail);
		
		BusinessService bService = new BusinessService();
		
		/* 받아온 기업 정보를 서비스로  */
		int result = bService.RegistBusinessInfo(business);
		
		/* 받아온 담당자 정보를 서비스로 전달 */
		
		
		
		

	}

}
