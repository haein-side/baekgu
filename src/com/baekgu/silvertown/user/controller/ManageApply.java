package com.baekgu.silvertown.user.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baekgu.silvertown.user.model.dto.ApplyDTO;
import com.baekgu.silvertown.user.model.dto.ReportDTO;
import com.baekgu.silvertown.user.model.dto.UserDTO;
import com.baekgu.silvertown.user.model.service.UserService;

@WebServlet("/user/manageApply")
public class ManageApply extends HttpServlet {
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   // 세션에 담긴 정보를 받아옴
	   HttpSession session = request.getSession();
	   
	   UserDTO requestUser = new UserDTO();
	   
	   // session에 담긴 객체는 Object 타입이므로 UserDTO 형태로 다운캐스팅 시켜줌
	   int userCode = (int) session.getAttribute("loginUserCode");
	   session.getAttribute("loginUserCode");
	   
	   System.out.println("userCode : " + userCode);
	   
	   UserService applyService = new UserService();
	   
	   // 입사지원관리 비즈니스 로직 처리
	   List<ApplyDTO> allApply = applyService.selectApply(userCode);
	   
	   // 신고내역관리 비즈니스 로직 처리
	   List<ReportDTO> allReport = applyService.selectReport(userCode);
	   
	   // 응답페이지 처리
	    String path = "";
		if(allApply != null) {
			path = "/WEB-INF/views/customer/main/manageApply.jsp";
			request.setAttribute("allApply", allApply);
			request.setAttribute("allReport", allReport);
			System.out.println(allApply);
			System.out.println(allReport);
			
		} else {
			path = "/WEB-INF/views/user/common/errorPage.jsp";
			request.setAttribute("message", "입사관리내역조회를 실패했습니다.");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	   
	   
	   
	   
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      
   }

}