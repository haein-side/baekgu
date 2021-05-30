package com.baekgu.silvertown.business.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.business.model.serivce.BusinessService;
import com.google.gson.Gson;

/**
 * Servlet implementation class BusinessCheckMessageervlet
 */
@WebServlet("/business/checkmessage")
public class BusinessCheckMessageervlet extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String check = request.getParameter("check");
		String userId = request.getParameter("userId");
		
		System.out.println(check);
		System.out.println(userId);
		
		BusinessService service = new BusinessService();
		
		String numStr = service.selectVerifiedNum(userId);
		
		Gson gson = new Gson();
		
		response.setContentType("application/json; charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		
		String data = "";
		
		if(check.equals(numStr)) {
			
			System.out.println("인증번호 일치함");
			
			data = "ok";
			
		} else {
			
			System.out.println("인증번호 불일치");
			
			data = "fail";
			
		}
		
		String result = gson.toJson(data);
		PrintWriter out = response.getWriter();
		out.print(result);
		
		out.flush();
		out.close();
		
	}

}
