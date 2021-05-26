package com.baekgu.silvertown.business.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baekgu.silvertown.business.model.dto.BusinessMemberDTO;
import com.baekgu.silvertown.business.model.dto.PostInsertDTO;
import com.baekgu.silvertown.business.model.serivce.BusinessService;

@WebServlet("/business/insertpost")
public class BusinessInsertPostServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		BusinessMemberDTO loggedInUser = (BusinessMemberDTO)session.getAttribute("loginBusinessMember");
		
		String path = "";
		
		if(loggedInUser != null) {
			
			path = "/WEB-INF/views/business/main/addpost.jsp";

		}else {

			path = "/WEB-INF/views/business/main/signinB.jsp";

		}
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}
		

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String[] industryArr = {"식당/서빙", "매장관리", "상담/영업", "건설/생산/기술", "간호/요양","교사/강사", "운전/배달", "사무/경리", "기타" };
		
		String[] jobArr = { "요리사", "주방보조", "찬모", "설거지", "서빙", "커운터", "편의점",
		    				"슈퍼/마트/대형마트", "쇼핑몰/아울렛/백화점", "찜질방/사우나", "농수산/청과/축산", "물류/재고",
		    				"기타/매장", "인바운드/CS", "아웃바운드/TM", "일반/기술영업", "보험/금융상담", "방문판매",
		    				"부동산상담", "홍보/마켓팅", "제조/조립", "미싱/재단/섬유", "노무현장/조선소", "건설/공사/보수",
		    				"전기/시설관리", "배관/용접/머시닝", "식품제조/가공", "자동차정비/튜닝", "설치/수리",
		    				"생산/포장/검사", "가구/목공", "금형/프레스/성형", "간호사/간호조무사", "간병/요양보호소",
		    				"의료기사", "기타의료직", "어린이집/유치원", "방문/학습지", "외국어", "기타교사/학원관리",
		    				"이사/택배/퀵/배송", "대리운전/승용차/일반", "버스/택시/승합차", "지입/차량용역",
		    				"화물/중장비/특수차", "음식점/식음료배달", "경리/회계/인사", "일반사무/내근직", "기획/총무/관리",
		    				"구매/자재/물류", "서비스/안내", "미화/청소/세탁", "생활도우미/파출부", "경비/보안",
		    				"주유/세차/광택", "헤어피부/미용/애견", "웨딩/이벤트/스튜디오", "호텔/모텔/숙박",
		    				"주차관리/대리주차"};

		
		
		
		// 로그인 유저 세션 가져오기
		HttpSession session = request.getSession();
		BusinessMemberDTO loggedInUser = (BusinessMemberDTO)session.getAttribute("loginBusinessMember");

		// 인사담당자님의 정보를 입력해주세요
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("zipCode") + "&" + request.getParameter("address1") + "&"
				+ request.getParameter("address2").replace(" ", "");
		
		// 업종 값
		String industry = request.getParameter("industry");
		
		int industryNum = 0; 
		
		for(int i = 0; i < industryArr.length; i++) {
			
			if(industry.equals(industryArr[i])) {
				
				industryNum = i + 1;				
			}
			
		}
		System.out.println("업종의 값 벨류는 " + industryNum);
		
		// 직종 값
		String job = request.getParameter("job");
		
		int jobNum = 0;
		
		for(int i = 0; i < jobArr.length; i++) {
			
			if(job.equals(jobArr[i])) {
				
				jobNum = i + 1;
				
			}
		}
		
		System.out.println("직종의 벨류는 " + jobNum);
		
		int exp = Integer.parseInt(request.getParameter("exp"));
		int degree = Integer.parseInt(request.getParameter("degree"));
		
		// 공고 정보
		String postTitle = request.getParameter("postTitle");
		String postContent = request.getParameter("postContent");
		int postTo = Integer.parseInt(request.getParameter("postTo"));
		int online = Integer.parseInt(request.getParameter("online"));
		java.sql.Date startDate = java.sql.Date.valueOf(request.getParameter("startDate"));
		java.sql.Date endDate = java.sql.Date.valueOf(request.getParameter("endDate"));
		int pay = Integer.parseInt(request.getParameter("pay"));
		int payment = Integer.parseInt(request.getParameter("payment"));
		int contract = Integer.parseInt(request.getParameter("contract"));
		int period = Integer.parseInt(request.getParameter("period"));
		int location = Integer.parseInt(request.getParameter("location"));
	
		// 근무 요일
		String[] days = request.getParameterValues("days");
		String day = "";
		for(int i = 0 ; i < days.length; i++) {
			
			day += days[i];
			if(i < days.length -1) {
				
				day += "&";
			}
		}
		
		String[] priorityArr = request.getParameterValues("priority");
		String priority = "";
		for (int i = 0; i < priorityArr.length; i++) {
			priority += priorityArr[i];
			if(i < priorityArr.length - 1) {
				priority += "&";
			}
		}
		
		String benefit = request.getParameter("benefit").replace(" ", "&");	
		int hours = Integer.parseInt(request.getParameter("hours"));
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));

		PostInsertDTO post = new PostInsertDTO();

		post.setName(name);
		post.setPhone(phone);
		post.setEmail(email);
		post.setAddress(address);
		post.setIndustry(industryNum);
		post.setJob(jobNum);
		post.setExp(exp);
		post.setPriority(priority);
		post.setBenefit(benefit);
		post.setPostTitle(postTitle);
		post.setPostContent(postContent);
		post.setPostTo(postTo);
		post.setOnline(online);
		post.setStartDate(startDate);
		post.setEndDate(endDate);
		post.setPay(pay);
		post.setPayment(payment);
		post.setPostContent(postContent);
		post.setPeriodCode(period);
		post.setDays(day);
		post.setGender(gender);
		post.setAge(age);
		post.setHours(hours);
		post.setFullTimeYn(contract);
		post.setDegree(degree);
		post.setHrId(loggedInUser.getbId());
		post.setLocationCode(location);

		BusinessService service = new BusinessService();

		int result = service.insertNewPost(post);
		
		
	}

}



























