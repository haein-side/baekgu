package com.baekgu.silvertown.user.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baekgu.silvertown.user.model.dto.PostDTO;
import com.baekgu.silvertown.user.model.dto.ResumeDTO;
import com.baekgu.silvertown.user.model.dto.UserDTO;
import com.baekgu.silvertown.user.model.service.ResumeService;

/**
 * Servlet implementation class ResumeEnterServlet
 */
@WebServlet("/user/resumeEnter")
public class ResumeEnterServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // 세션에 담긴 정보를 받아옴
		   HttpSession session = request.getSession();
		   
		   UserDTO requestUser = (UserDTO) session.getAttribute("loginUserInfo");
		   int userCode = requestUser.getUserCode();
		   System.out.println("resumeEnter에서 받은 userCode : " + userCode);
		   
		   ResumeService resumeService = new ResumeService();
		  
		   // 이력서에 담긴 값을 조회해서 가져옴
		   ResumeDTO resumeInfo = resumeService.getResumeInfo(userCode);
		  
		
		   String path = "";
			
			  if(requestUser != null) { 
				  path = "/WEB-INF/views/customer/main/resumeenter.jsp";
				  request.setAttribute("resumeInfo", resumeInfo);
			  
			  
			  } else { 
				  path = "/WEB-INF/views/user/common/errorPage.jsp";
				  request.setAttribute("message", "입사관리내역조회를 실패했습니다."); }
			  
			  
			  	  request.getRequestDispatcher(path).forward(request, response);
			 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
