package com.baekgu.silvertown.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.user.model.dto.SearchPostDTO;
import com.baekgu.silvertown.user.model.service.SearchPostService;
import com.google.gson.Gson;

@WebServlet("/user/searchPost")
public class SearchPost extends HttpServlet {
   
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
    
    	  
    	  // 마지막 선택 값이 "무관"일 때 location[0]을 30이란 특이값으로 만들어줌 
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
      
      // 기간 (하나 혹은 0개 입력받음)
      String period = "";
      
      if (array[2] != null && array[2].length() > 0) {
	      
	         period = array[2].replace("&", "");
	         System.out.println("period : " + period);
	         
	         // 마지막 선택 값이 "무관"일 때 period를 30이란 특이값으로 만들어줌 
	    	  if (period.equals("1")) {
	    		   
	    			  System.out.println("마지막 선택값이 무관인 경우");
	    			  
	    				  period = "30";
	    		
	    			  System.out.println("period가 바뀌었는지 보기 : " + period);
	    	  }
	         
	         
	   }
      
      
      
      // DTO에 입력받은 값들을 set해줌
      SearchPostDTO searchPost = new SearchPostDTO();
      
      // location 문자열 배열을 int 배열로 만들어줌
      locationCode = Arrays.stream(location).mapToInt(Integer::parseInt).toArray();
      // 업종 String을 int로 바꿔줌
      int industryCode = Integer.parseInt(industry);
      System.out.println("locationCode가 단순검색에선 어떻게 나오나.. : " + locationCode);
      searchPost.setLocationCode(locationCode); 
      searchPost.setIndustryCode(industryCode);
      searchPost.setPeriodCode(Integer.parseInt(period));
   
      // 서비스로 넘기기
      SearchPostService searchService = new SearchPostService();
      
      // 단순검색 비즈니스 로직 처리
      List<SearchPostDTO> selectPost = searchService.selectPost(searchPost);
      
      // 업종광고 공고 비즈니스 로직 처리
      List<SearchPostDTO> selectInAdPost = searchService.selectInAdPost(industryCode);
      
      System.out.println("컨트롤러에서 받은 업종광고 공고 : " + selectInAdPost);
      
      // 응답페이지 처리
	  String path = "";
	    if(selectPost != null) {
	    	System.out.println("서블렛에서 받은 공고들 : " + selectPost);
			
			
			
			 path = "/WEB-INF/views/customer/main/postlist.jsp";
			 request.setAttribute("selectPost", selectPost);
			 request.setAttribute("selectInAdPost", selectInAdPost);
			 
			 
			 
			
			
				/*
				 * String jsonString = new Gson().toJson(selectPost);
				 * 
				 * System.out.println(jsonString);
				 * 
				 * response.setContentType("application/json; charset=utf-8");
				 * 
				 * PrintWriter out = response.getWriter();
				 * 
				 * out.print(jsonString);
				 * 
				 * out.flush(); out.close();
				 */
			 
			 
	    	
	    	
		} else {
			path = "/WEB-INF/views/user/common/errorPage.jsp";
			request.setAttribute("message", "공고조회를 실패했습니다.");
		}
		
	    request.getRequestDispatcher(path).forward(request, response);
   
   
   }
      


 }

   
