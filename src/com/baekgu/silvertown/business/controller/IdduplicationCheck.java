package com.baekgu.silvertown.business.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.business.model.serivce.BusinessService;

/**
 * Servlet implementation class IdduplicationCheck
 */
@WebServlet("/business/checkduplicate")
public class IdduplicationCheck extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String hrId_1 = request.getParameter("hrId_1");
		
		System.out.println("담장다 아이디를 찾아보자 : " + hrId_1);

		BusinessService service = new BusinessService();
		
		String result = service.chekId(hrId_1);
		
		System.out.println("dsafsdf" + result);
		
		PrintWriter out = response.getWriter();
		out.print(result);
		
		out.flush();
		out.close();
	}
}