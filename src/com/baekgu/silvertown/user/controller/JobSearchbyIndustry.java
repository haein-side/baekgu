package com.baekgu.silvertown.user.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.user.model.dto.UserDTO;
import com.baekgu.silvertown.user.model.service.UserService;


@WebServlet("/jobSearch")
public class JobSearchbyIndustry extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("접속t");
		String industry1 = request.getParameter("industry1");
		System.out.println(industry1);
//		String industry2 = request.getParameter("industry2");
//		String industry3 = request.getParameter("industry3");
//		String industry4 = request.getParameter("industry4");
//		String industry5 = request.getParameter("industry5");
//		String industry6 = request.getParameter("industry6");
//		String industry7 = request.getParameter("industry7");
//		String industry8 = request.getParameter("industry8");
//		String industry9 = request.getParameter("industry9");

//		System.out.println("in : " + industry1);
//		System.out.println(industry2);
//		System.out.println(industry3);
//		System.out.println(industry4);
//		System.out.println(industry5);
//		System.out.println(industry6);
//		System.out.println(industry7);
//		System.out.println(industry8);
//		System.out.println(industry9);
//		System.out.println(industry);
//		
		// DTO타입 객체에 값 넣어주기
//		UserDTO industryInfo = new UserDTO();
//		industryInfo.setIndustryName(industry1);
//		
//		// 서비스 연결
//		UserService userService = new UserService();
//		
//		UserDTO jobInfo = userService.jobInfo(industryInfo);
//		
//		
//		
//		response.setContentType("text/plain; charset=utf-8");
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
