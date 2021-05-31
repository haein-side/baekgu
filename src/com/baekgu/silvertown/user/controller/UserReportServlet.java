package com.baekgu.silvertown.user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baekgu.silvertown.business.model.dto.BusinessReportDTO;
import com.baekgu.silvertown.business.model.serivce.BusinessService;
import com.baekgu.silvertown.user.model.dto.ReportPostDTO;
import com.baekgu.silvertown.user.model.dto.UserDTO;
import com.baekgu.silvertown.user.model.service.ReportService;

@WebServlet("/user/report")
public class UserReportServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 신고하기를 위해 공고 번호, 신고 사유, 고객 코드를 받아옴 */
		int postCode = Integer.parseInt(request.getParameter("postCode")); 
		String reportReason = request.getParameter("reportReason");
		
		HttpSession session = request.getSession();
		UserDTO userInfo = (UserDTO) session.getAttribute("loginUserInfo");
		int userCode = userInfo.getUserCode();
		String userPhone = userInfo.getUserPhone();
	
		System.out.println("postCode : " + postCode);
		System.out.println("reportReason : " + reportReason);
		System.out.println("userCode : " + userCode);
		
		/* Business의 DTO, Service, Mapper 이용하기 */
		/* 전달할 값을 DTO 객체에 담은 뒤 Object타입의 List에 담아주기 */
		ReportPostDTO reportDTO = new ReportPostDTO();
		reportDTO.setPostCode(postCode);
		reportDTO.setReportReason(reportReason);
		reportDTO.setUserCode(userCode);
		
		/* Business의 Service, DTO를 사용하기 위해 타입을 통합 */
		List<Object> containDTO = new ArrayList<>();
		containDTO.add(reportDTO);
		
		/* 공고 신고는 번호 2번 */
		int result = new ReportService().insertDecisionList(2, containDTO);
		
		String path = null;
		
		if(result > 0) {
			
			request.setAttribute("result", result);
			
			path = "/WEB-INF/views/customer/main/searchView.jsp?postCode=" + postCode;
			request.getRequestDispatcher(path).forward(request, response);
			
			//response.sendRedirect(request.getContextPath() + "/user/toPost?postCode=" + postCode);
			
		} else {
			
			request.setAttribute("result", result);
			
			path = "/WEB-INF/views/customer/main/searchView.jsp?postCode=" + postCode;
			request.getRequestDispatcher(path).forward(request, response);
		}
		
	}

}
