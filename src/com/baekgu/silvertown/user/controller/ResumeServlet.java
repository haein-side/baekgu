package com.baekgu.silvertown.user.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baekgu.silvertown.user.model.dto.ResumeDTO;
import com.baekgu.silvertown.user.model.dto.UserDTO;
import com.baekgu.silvertown.user.model.service.ResumeService;

/**
 * Servlet implementation class ResumeServlet
 */
@WebServlet("/user/resume")
public class ResumeServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // 세션에 담긴 정보를 받아옴
		   HttpSession session = request.getSession();
		   
		   UserDTO requestUser = (UserDTO) session.getAttribute("loginUserInfo");
		   int userCode = requestUser.getUserCode();
		   System.out.println("resume에서 받은 userCode : " + userCode);
		   
		   // 이력서에 수정한 값을 받아서 넣어줌
		   String userPhone1 = request.getParameter("HPhone1");
		   String userPhone2 = request.getParameter("txtPhone1");
		   String userPhone3 = request.getParameter("txtPhone2");
		   
		   // 연락처
		   String userPhone = userPhone1 + userPhone2 + userPhone3;
		   
		   String resumeSubphone1 = request.getParameter("HPhone2");
		   String resumeSubphone2 = request.getParameter("txtSubPhone1");
		   String resumeSubphone3 = request.getParameter("txtSubPhone2");
		   
		   // 비상연락망
		   String resumeSubphone = resumeSubphone1 + resumeSubphone2 + resumeSubphone3;
		
		   // 성별
		   String userGender = request.getParameter("gender");
		   
		   // 생년월일
		   java.sql.Date userBday = java.sql.Date.valueOf(request.getParameter("userBday1") + "-" + request.getParameter("userBday2") + "-"+ request.getParameter("userBday3"));		    
		  
		   // 거주지
		   String userAddress = request.getParameter("userAddress");
		   
		   // 간단 자기소개
		   String resumeLetter = request.getParameter("resumeLetter");
		   
		   // 특이사항
		   String[] resumeAdvantage1 = request.getParameterValues("chkAdvantage");
		   System.out.println("resumeAdvantage1 체크박스 선택한 리스트들 : " + resumeAdvantage1);
		   
		   String resumeAdvantage  = "";
		   if (resumeAdvantage1 != null) {
			   
			   for (int i = 0; i < resumeAdvantage1.length; i++) {
				   resumeAdvantage += resumeAdvantage1[i];
				   if(i < resumeAdvantage1.length - 1) {
					   resumeAdvantage += "&";
				   }
				   
			   }
			   
		   }
		   
		   // 학력사항
		   int degreeCode = 0;
		   if (request.getParameter("degree") != null) {			   
			   degreeCode = Integer.parseInt(request.getParameter("degree"));
		   }
		   
		   // 경력사항
		   int expCode = 0;
		   if (request.getParameter("exp") != null) {
			   expCode = Integer.parseInt(request.getParameter("exp"));
		   }
		   
		   
		   // 작성일 --> db 쿼리문에서 넣어주면 됨
		   
		   // 작성자 = userName
		   String userName = requestUser.getUserName();
		   
		   // update 비즈니스 로직처리
		   ResumeDTO updateResume = new ResumeDTO();
		   
		   updateResume.setUserCode(userCode);
		   updateResume.setUserPhone(userPhone);
		   updateResume.setResumeSubphone(resumeSubphone);
		   updateResume.setUserGender(userGender);
		   updateResume.setUserBday(userBday);
		   updateResume.setUserAddress(userAddress);
		   updateResume.setResumeLetter(resumeLetter);
		   updateResume.setResumeAdvantage(resumeAdvantage);
		   updateResume.setDegreeCode(degreeCode);
		   updateResume.setExpCode(expCode);
		   
		   ResumeService resumeService = new ResumeService();
		   
		   int reviseResume = resumeService.fixResume(updateResume);
		   System.out.println("reviseResume : " + reviseResume);
		   
		   // 비즈니스 로직 실행 결과에 따른 뷰 연결
		   
		   String path = "";
	         
	         if(reviseResume != 0) {
					/*
					 * path = "/WEB-INF/views/customer/common/resumeenter.jsp";
					 * request.setAttribute("requestUser", requestUser);
					 * request.setAttribute("reviseResume", reviseResume);
					 */
	        	 path = "/user/resumeEnter";
	        	 response.sendRedirect(path);
	        	 
	        	 
	         } else {
	        	 
	         }
		   
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
