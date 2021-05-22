package com.baekgu.silvertown.business.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.business.model.dto.PostInsertDTO;
import com.baekgu.silvertown.business.model.serivce.BusinessService;

@WebServlet("/business/insertpost")
public class BusinessInsertPostServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 인사담당자님의 정보를 입력해주세요
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("zipCode") + "&" + request.getParameter("address1") + "&"
				+ request.getParameter("address2").replace(" ", "");
		int industry = Integer.parseInt(request.getParameter("industry"));
		int job = Integer.parseInt(request.getParameter("job"));
		int exp = Integer.parseInt(request.getParameter("exp"));
		int degree = Integer.parseInt(request.getParameter("degree"));
		String[] priorityArr = request.getParameterValues("priority");
		String priority = "";
		for (int i = 0; i < priorityArr.length; i++) {
			priority += priorityArr[i];
			if(i < priorityArr.length - 1) {
				priority += "&";
			}
		}
		String benefit = request.getParameter("benefit").replace(" ", "&");
		String postTitle = request.getParameter("postTitle");
		String postContent = request.getParameter("postContent");
		int postTo = Integer.parseInt(request.getParameter("postTo"));
		int online = Integer.parseInt(request.getParameter("online"));
		java.sql.Date startDate = java.sql.Date.valueOf(request.getParameter("startDate"));
		java.sql.Date endDate = java.sql.Date.valueOf(request.getParameter("endDate"));
		int pay = Integer.parseInt(request.getParameter("pay"));
		int payment = Integer.parseInt(request.getParameter("payment"));
		String fulltime = request.getParameter("fulltime");
		int period = Integer.parseInt(request.getParameter("period"));
		String days = request.getParameter("days");
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));
		int hours = Integer.parseInt(request.getParameter("hours"));


		
		System.out.println(name); System.out.println(phone);
		System.out.println(email); System.out.println(address);
		System.out.println(industry); System.out.println(job);
		System.out.println(exp); System.out.println(postTitle);
		System.out.println(postContent); System.out.println(postTo);
		System.out.println(online); System.out.println(startDate);
		System.out.println(endDate); System.out.println(pay);
		System.out.println(payment); System.out.println(fulltime);
		System.out.println(days); System.out.println(priority);
		System.out.println(benefit); System.out.println(period);
		System.out.println(gender); System.out.println(age);
		

		PostInsertDTO post = new PostInsertDTO();

		post.setName(name);
		post.setPhone(phone);
		post.setEmail(email);
		post.setAddress(address);
		post.setIndustry(industry);
		post.setJob(job);
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
		post.setDays(days);
		post.setGender(gender);
		post.setAge(age);
		post.setHours(hours);
		post.setFullTimeYn(fulltime);
		post.setDegree(degree);

		BusinessService service = new BusinessService();

		int result = service.insertNewPost(post);
		
		if(result > 0 ) {

		}

	}

}
