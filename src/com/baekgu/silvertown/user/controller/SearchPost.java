package com.baekgu.silvertown.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/searchPost")
public class SearchPost extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("searchPost의 get으로 도착");
		
		String select = request.getParameter("location");
		
		System.out.println("selectedList : " + select);	
	
		
		String[] array = select.split("!");
		
		for(int i=0; i<array.length;i++) {
					System.out.println("array[" + i + "] : " + array[i]);
					}
					/*
					 * System.out.println(array[0].length()); System.out.println(array[1].length());
					 * System.out.println(array[2].length());
					 */
		
		System.out.println("========");
		
		
		// 지역
		String location1 = "";
		String location2 = "";
		String[] location = null;
		
		if (array[0] == "") {
			
		} else {
			location = array[0].split("&");
		
			  for(int i=0 ; i < location.length;i++) 
			  { 
				  System.out.println("location[" + i +"] : " + location[i]);
			  }

			  if (location[location.length - 1].equals("1")) {
					
					 for(int i=0 ; i < location.length;i++) { 
						 location[i] = null; 
					 }
					 System.out.println("비워진 location : " + location);
								
				}
		} 
		
//		System.out.println(location[location.length - 1]);
		
		// 마지막 선택한 값이 "무관"일 때 location을 비워줌
		
		
		
		
		
		// 업종
		String industry = "";
		if (array[1].length() == 0) {
			
		} else {
			
			industry = array[1].replace("&", "");
			
		}
		
		// 기간
		String period = "";
		
		if (array[2].length() == 0) {
			
		} else {
			
			period = array[2].replace("&", "");
			
		}
		

		System.out.println("location1 : " + location1);
		System.out.println("location2 : " + location2);
		System.out.println("industry : " + industry);
		System.out.println("period : " + period);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
