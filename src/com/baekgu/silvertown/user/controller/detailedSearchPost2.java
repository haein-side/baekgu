package com.baekgu.silvertown.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class detailedSearchPost2
 */
@WebServlet("user/detailedSearchPost2")
public class detailedSearchPost2 extends HttpServlet {
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("get");
		
		
		
		String select = request.getParameter("location");
		
		System.out.println("selectedList : " + select);	
		
		String[] array = select.split("!");
		
		for(int i=0; i<array.length;i++) {
					System.out.println("array[" + i + "] : " + array[i]);
					}
		
		System.out.println("========");
		
		// 지역
		String[] location = array[0].split("&");
		
		for(int i=0 ; i < location.length;i++) {
			System.out.println("location[" + i + "] : " + location[i]);
			}
		
		String location1 = location[0];
		String location2 = location[1];
		
		// 업종
		String industry = array[1].replace("&", "");
		
		// 직종
		String job = array[2].replace("&", "");
		
		// 경력
		String exp = array[3].replace("&", "");
		
		// 기간
		String period = array[4].replace("&", "");
		
		// 시간
		String time = array[5].replace("&","");
		
		System.out.println(location1);
		System.out.println(location2);
		System.out.println(industry);
		System.out.println(job);
		System.out.println(exp);
		System.out.println(period);
		System.out.println(time);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post");
		
		
		String select = request.getParameter("location");
		
		System.out.println("selectedList : " + select);	
		
		String[] array = select.split("!");
		
		for(int i=0; i<array.length;i++) {
					System.out.println("array[" + i + "] : " + array[i]);
					}
		
		System.out.println("========");
		
		// 지역
		String[] location = array[0].split("&");
		
		for(int i=0 ; i < location.length;i++) {
			System.out.println("location[" + i + "] : " + location[i]);
			}
		
		String location1 = location[0];
		String location2 = location[1];
		
		// 업종
		String industry = array[1].replace("&", "");
		
		// 직종
		String job = array[2].replace("&", "");
		
		// 경력
		String exp = array[3].replace("&", "");
		
		// 기간
		String period = array[4].replace("&", "");
		
		// 시간
		String time = array[5].replace("&","");
		
		System.out.println(location1);
		System.out.println(location2);
		System.out.println(industry);
		System.out.println(job);
		System.out.println(exp);
		System.out.println(period);
		System.out.println(time);
	}

}
