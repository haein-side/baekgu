package com.baekgu.silvertown.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DetailedSearchPost
 */
@WebServlet("/user/detailedSearchPost")
public class DetailedSearchPost extends HttpServlet {
  
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 System.out.println("searchPost의 get으로 도착");
	      
	      String select = request.getParameter("location");
	      
	      System.out.println("selectedList : " + select);   
	   
	      // 카테고리별 스플릿 - String[] array에 담아줌
	      String[] array = select.split("!"); // 반드시 3이 아님
	      
	      System.out.println("array의 크기 : " + array.length);
	      
	      for(int i=0; i<array.length;i++) {
	        
	    	  System.out.println("array[" + i + "] : " + array[i]);  
	    	  
	      }
	              
	      
	      System.out.println("========");
	      
	      
	      // 지역별 스플릿 - array[0]을 스플릿해서 각각 String[] location에 담아줌
	      String[] location = null;
	      int[] locationCode = null;
	      
	      if (array[0] != null && array[0].length() > 0) {
	    	  
	    	  location = array[0].split("&");
	    	  
	    	  for(int i=0 ; i < location.length;i++) { 
	    		  System.out.println("location[" + i +"] : " + location[i]);
	    	  }
	    	  
	    	  
	    	  // 마지막 선택 값이 "무관"일 때 location을 null로 만들어줌 (위치 조건 삭제를 위해)
	    	  if (location[location.length - 1].equals("1")) {
	    		  
	    		   
	    			  System.out.println("마지막 선택값이 무관인 경우");
	    			  
	    			  for(int i=0 ; i < location.length;i++) { 
	    	    		 location[0] = "30";
	    	    	  }
	    		
	    			  System.out.println("location[0]이 바뀌었는지 보기 : " + location[0]);
	    	  }
	      }  
			
	      // 업종 (하나 혹은 0개 입력받음)
	      String industry = "";
	      if (array[1] != null && array[1].length() > 0) {
	 
	         industry = array[1].replace("&", "");
	         System.out.println("industry : " + industry);
	         
	      }
	      
			
		  // 직종
		  String job = "";
		  
		  if (array[2] != null && array[2].length() > 0) {
		      
			     job = array[2].replace("&", "");
		         System.out.println("job : " + job);
		         
		   }
			
		  // 경력
		  String exp = array[3].replace("&", "");
		  
		  if (array[3] != null && array[3].length() > 0) {
		      
			  	 exp = array[3].replace("&", "");
		         System.out.println("exp : " + exp);
		         
		   }
			
		  // 기간 (하나 혹은 0개 입력받음)
		  String period = "";
		      
		  if (array[4] != null && array[4].length() > 0) {
		      
		         period = array[4].replace("&", "");
		         System.out.println("period : " + period);
		         
		   }
		  
		   // 시간
		   String time = array[5].replace("&","");
		    
		   if (array[5] != null && array[5].length() > 0) {
			      
			   	 time = array[5].replace("&", "");
			     System.out.println("time : " + time);
			         
			}
			
			
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
