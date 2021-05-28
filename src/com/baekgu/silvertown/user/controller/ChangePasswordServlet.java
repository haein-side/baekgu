package com.baekgu.silvertown.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.user.model.service.UserService;

/**
 * Servlet implementation class NewPasswordServlet
 */
@WebServlet("/user/newPassword")
public class ChangePasswordServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userPhone = request.getParameter("userPhone");
		System.out.println("userPhone : " + userPhone);
		
		String enteredPwd = request.getParameter("enteredPwd");
		System.out.println("newPwd : " + enteredPwd);
		
		
		/* 새로운 비밀번호로 업데이트 시켜줌 */
		UserService userService = new UserService();
		
		int updatePwd = userService.updatePwd(userPhone, enteredPwd);
		
		System.out.println("비밀번호 업데이트 결과 : " + updatePwd);
		
		/* 응답페이지 처리 */
		// 응답페이지 처리
	    String path = "";
		if(updatePwd != 0) {
			System.out.println("들어옴");
			response.sendRedirect(request.getContextPath() + "/user/signupResult");
			
		} else {
			path = "/WEB-INF/views/user/common/errorPage.jsp";
			request.setAttribute("message", "새 비밀번호 입력을 실패했습니다.");
			request.getRequestDispatcher(path).forward(request, response);
		}
		
	}

}
