package com.baekgu.silvertown.business.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.business.model.serivce.BusinessService;


@WebServlet("/business/paycomplate")
public class payComplateServlet extends HttpServlet {
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BusinessService service = new BusinessService();
		
		String paymentResult = request.getParameter("success");
		
		
		
		
		
	}

}
