package com.baekgu.silvertown.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baekgu.silvertown.user.model.dto.PostDTO;
import com.baekgu.silvertown.user.model.service.PostService;

@WebServlet("/apply")
public class ApplyServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/*
		 * System.out.println("지원하기 servlet 도착 : Get 방식"); 공고 번호 받기 int postCode =
		 * Integer.parseInt(request.getParameter("postCode"));
		 * System.out.println("postCode : " + postCode);
		 * 
		 * 고객 번호 받기 HttpSession session = request.getSession(); int userCode = (Integer)
		 * session.getAttribute("userCode");
		 * 
		 * System.out.println("서블릿 postCode : " + postCode);
		 * System.out.println("서블릿 userCode : " + userCode);
		 * 
		 * // 공고 번호, 고객 번호를 DTO타입 객체에 넣기 PostDTO userPostCode = new PostDTO();
		 * userPostCode.setUserCode(userCode); userPostCode.setPostCode(postCode);
		 * 
		 * // Service에서 이력서 번호 조회해서 받아오기 PostService postService = new PostService();
		 * PostDTO resumeCode = postService.selectResume(userPostCode);
		 * System.out.println("이력서 번호 출력 : " + resumeCode);
		 * 
		 * // 검색해온 정보를 담아서 다시 전달하기 PostService applyService = new PostService(); PostDTO
		 * applyInfo = new PostDTO(); applyInfo.setResumeCode((int) userCode);
		 * applyInfo.setPostCode(postCode); System.out.println("inser할 applyInfo : " +
		 * applyInfo);
		 * 
		 * int applyResult = applyService.insertApply(applyInfo); String path = "";
		 * 
		 * if (applyResult != 0) {
		 * 
		 * System.out.println("Insert 성공");
		 * 
		 * path = "/WEB-INF/views/customer/main/searchView.jsp";
		 * request.setAttribute("applyInfo", applyInfo);
		 * request.getRequestDispatcher(path).forward(request, response);
		 * 
		 * } else {
		 * 
		 * System.out.println("Insert 실패");
		 * 
		 * path = "/WEB-INF/views/customer/main/searchView.jsp";
		 * request.setAttribute("applyInfo", applyInfo);
		 * request.getRequestDispatcher(path).forward(request, response); }
		 */

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("지원하기 servlet 도착 : Post 방식"); // 공고 번호 받기 int postCode =
		int postCode = Integer.parseInt(request.getParameter("postCode"));
		System.out.println("postCode : " + postCode);
		
		// 고객 번호 받기 HttpSession session = request.getSession(); int userCode =
		HttpSession session = request.getSession();
		int userCode = (Integer) session.getAttribute("userCode");
		
		System.out.println("서블릿 postCode : " + postCode);
		System.out.println("서블릿 userCode : " + userCode);
		
		// 공고 번호, 고객 번호를 DTO타입 객체에 넣기
		PostDTO userPostCode = new PostDTO();
		userPostCode.setUserCode(userCode); 
		userPostCode.setPostCode(postCode);
		
		// Service에서 이력서 번호 조회해서 받아오기
		PostService postService = new PostService();
		PostDTO resumeCode = postService.selectResume(userPostCode);
		System.out.println("이력서 번호 출력 : " + resumeCode);
		
		// 검색해온 정보를 담아서 다시 전달하기
		PostService applyService = new PostService(); PostDTO
		applyInfo = new PostDTO(); applyInfo.setResumeCode((int) userCode);
		applyInfo.setPostCode(postCode); System.out.println("inser할 applyInfo : " + applyInfo);
		
		int applyResult = applyService.insertApply(applyInfo); String path = "";
		
		if (applyResult != 0) {
		
		System.out.println("Insert 성공");
		
		path = "/WEB-INF/views/customer/main/searchView.jsp";
		request.setAttribute("applyInfo", applyInfo);
		request.getRequestDispatcher(path).forward(request, response);
		
		} else {
		
		System.out.println("Insert 실패");
		
		path = "/WEB-INF/views/customer/main/searchView.jsp";
		request.setAttribute("applyInfo", applyInfo);
		request.getRequestDispatcher(path).forward(request, response); }
		 

	}
}
