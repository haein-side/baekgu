package com.baekgu.silvertown.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.user.model.service.UserService;

/**
 * Servlet implementation class SmsCheck
 */
@WebServlet("/user/smsCheck")
public class SmsCheck extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 입력한 인증번호 받아오기
		String check = request.getParameter("check");
		
		System.out.println("입력한 인증번호 : " + check);
		
		// 입력된 휴대폰번호 받아오기
		String num = request.getParameter("num");
		
		System.out.println("입력된 휴대폰번호 : " + num);
		
		/* 입력된 휴대폰번호에 해당되는 인증번호 조회 */
		UserService userService = new UserService();
		
		String numStr = userService.selectVerifiedNum(num);
		
		System.out.println("컨트롤러에서 받은 인증번호 조회결과 : " + numStr);
		
		/* 입력한 인증번호와 조회한 인증번호가 일치하는지 여부 분기처리 */
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String data = "";
		
		if (check.equals(numStr)) {
		// 일치하는 경우
			System.out.println("인증번호 일치함");
			data = "ok";
			System.out.println("ajax로 돌아가는 data : " + data);
			
		} else { // 일치하지 않는 경우 
			System.out.println("인증번호 일치하지 않음"); 
			data = "fail";
			System.out.println("ajax로 돌아가는 data : " + data); 
		}
		
		out.print(data);
		out.flush();
		out.close();
		
	}

}
