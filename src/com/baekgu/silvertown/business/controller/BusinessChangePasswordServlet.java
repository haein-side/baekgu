package com.baekgu.silvertown.business.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.business.model.serivce.BusinessService;

/**
 * Servlet implementation class BusinessChangePasswordServlet
 */
@WebServlet("/business/changepwd")
public class BusinessChangePasswordServlet extends HttpServlet {
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		// 비밀변호 변경시 암호화 처리 해워야함
		String enteredPwd = request.getParameter("enteredPwd");
		String hrId = request.getParameter("hrId");
		
		System.out.println("비밀번호 : " + enteredPwd);
		System.out.println("아이디 : " + hrId);
		
		BusinessService service = new BusinessService();
		
		
		int result = service.updatePwd(enteredPwd, hrId);
		
		System.out.println("비밀번호 업데이트 성공 : "  + result);
	}

}
