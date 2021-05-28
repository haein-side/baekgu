package com.baekgu.silvertown.user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.business.model.dto.BusinessReportDTO;
import com.baekgu.silvertown.business.model.serivce.BusinessService;

@WebServlet("/user/report")
public class Report extends HttpServlet {

	protected void doPosta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int postCode = Integer.parseInt(request.getParameter("postCode")); 
		String reportReason = request.getParameter("reportReason");
		//int userCode = Integer.parseInt(request.getParameter("userCode"));
		// 유저 코드는 Session에 정보가 있으며, 조회에 필요 없음
		
		System.out.println("postCode : " + postCode);
		//System.out.println("reasonCode : " + postCode);
		System.out.println("reportReason : " + reportReason);
		
		/* Business의 DTO, Service, Mapper 이용하기 */
		/* 전달할 값을 DTO 객체에 담은 뒤 Object타입의 List에 담아주기 */
		BusinessReportDTO reportDTO = new BusinessReportDTO();
		reportDTO.setPostCode(postCode);
		reportDTO.setReportReason(reportReason);
		
		/* Business의 Service, DTO를 사용하기 위해 타입을 통합 */
		List<Object> containDTO = new ArrayList<>();
		containDTO.add(reportDTO);
		
		/* 공고 신고는 번호 2번 */
		int result = new BusinessService().insertDecisionList(2, containDTO);
		
		
	}

}
