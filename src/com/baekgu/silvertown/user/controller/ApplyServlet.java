package com.baekgu.silvertown.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baekgu.silvertown.user.model.dto.ApplyPostDTO;
import com.baekgu.silvertown.user.model.dto.PostDTO;
import com.baekgu.silvertown.user.model.dto.UserDTO;
import com.baekgu.silvertown.user.model.service.ApplyService;
import com.baekgu.silvertown.user.model.service.PostService;

@WebServlet("/user/apply")
public class ApplyServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 공고 번호 받아오기 (String 타입)
		String postCode = request.getParameter("postCode");
		System.out.println("Servlet의 postCode : " + postCode);
		int ChangedPostCode = Integer.parseInt(postCode);
		
		// Session에 담긴 고객 번호 받기
		HttpSession session = request.getSession();	
		UserDTO userInfo = (UserDTO) session.getAttribute("loginUserInfo");
		int userCode = userInfo.getUserCode();
		
		System.out.println("서블릿 ChangedPostCode : " + ChangedPostCode);
		System.out.println("서블릿 userCode : " + userCode);
		
		// 공고 번호, 고객 번호를 DTO타입 객체에 넣기
		ApplyPostDTO userPostCode = new ApplyPostDTO();
		userPostCode.setUserCode(userCode);
		userPostCode.setPostCode(ChangedPostCode);
		userPostCode.setUserCode(userCode);
		
		// Service로 값 보내기
		ApplyService applyService = new ApplyService(); 
		int applyResult = applyService.insertApply(userPostCode);
		
		// forwarding 경로를 저장할 변수 선언
		String path = "";
		
		if (applyResult != 0) {
		
			System.out.println("Insert 성공");
			/* 지원하기 팝업의 ajax에서 창닫기 실행 */
		
		} else {
		
			System.out.println("Insert 실패");
		
		}

	}
	
}
