package com.baekgu.silvertown.user.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.user.model.dto.SearchPostDTO;
import com.baekgu.silvertown.user.model.service.SearchPostService;

@WebServlet("/user/searchPost")
public class SearchPost extends HttpServlet {
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
	   System.out.println("searchPost의 get으로 도착");
      
      String select = request.getParameter("location");
      
      System.out.println("selectedList : " + select);   
   
      // 카테고리별 스플릿 - String[] array에 담아줌
      String[] array = select.split("!"); // 반드시 3을 확인
      
      for(int i=0; i<array.length;i++) {
        
    	  System.out.println("array[" + i + "] : " + array[i]);
      
    	  
    	  
      }
              
      
      System.out.println("========");
      
      
      // 지역별 스플릿 - array[0]을 스플릿해서 각각 String[] location에 담아줌
      String[] location = null;
      
      if (array[0] != null && array[0].length() > 0) {
    	  
    	  location = array[0].split("&");
    	  
    	  for(int i=0 ; i < location.length;i++) { 
    		  System.out.println("location[" + i +"] : " + location[i]);
    	  }
    	  
    	  // 마지막 선택 값이 "무관"일 때 location을 null로 만들어줌 (위치 조건 삭제를 위해)
    	  if (location[location.length - 1].equals("1")) {
    		  
    		  for(int i=0 ; i < location.length;i++) { 
    			  location[i] = null; 
    		  }
    		  System.out.println("비워진 location : " + location);
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
      }
      
      // DTO에 입력받은 값들을 set해줌
      SearchPostDTO searchPost = new SearchPostDTO();
      
      // location 문자열 배열을 int 배열로 만들어줌
      int[] locationCode = Arrays.stream(location).mapToInt(Integer::parseInt).toArray();
      
      searchPost.setLocationCode(locationCode); 
      searchPost.setIndustryCode(Integer.parseInt(industry));
      searchPost.setPeriodCode(Integer.parseInt(period));
   
      // 서비스로 넘기기
      SearchPostService searchService = new SearchPostService();
      
      // 단순검색 비즈니스 로직 처리
      List<SearchPostDTO> selectPost = searchService.selectPost(searchPost);
      
   
   
   
   }
      


 }

   

