package com.baekgu.silvertown.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/logout")
public class ToSignoutServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("로그아웃 후 시작 페이지로 가는 서블릿 도착");
		
		String path = "http://www.baekgu.com";
		
		/* 세션 초기화 및 새창 띄우기 */
		request.getSession().invalidate();
		response.sendRedirect(path);
		// ContextPath로 보내기 하면 "/user/logout"에 갇혀서 하얀 화면 표시됨
		
	}

}
