package com.baekgu.silvertown.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.common.paging.PageNation;
import com.baekgu.silvertown.user.model.dto.DetailedSearchPostDTO;
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
      String[] array = select.split("!"); 
      
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
      List<SearchPostDTO> selectPostFirst = searchService.selectPost(searchPost);
      
      // 업종광고 공고 비즈니스 로직 처리
      List<SearchPostDTO> selectInAdPost = searchService.selectInAdPost(industryCode);
      
      System.out.println("컨트롤러에서 받은 업종광고 공고 : " + selectInAdPost);
      
      /* 페이징 처리 */
   	  String currentPage = request.getParameter("currentPage");
   	  int pageNo = 0;
   			
   	  if(currentPage != null && !"".equals(currentPage)) {
   		 pageNo = Integer.parseInt(currentPage);
   	  }
   			
   	  if(pageNo <= 0) {
   		 pageNo = 1;
   	  }
   			
   	  System.out.println("currentPage : "+ currentPage);
   	  System.out.println("pageNo : " + pageNo);
   			
   	  /* 전체 게시물의 갯수가 필요하다 */
   	  /* DB에서 먼저 전체 게시물의 갯수를 조회한다 */
   	  int totalCount = selectPostFirst.size();
   			
   	  System.out.println("단순 검색 일반 공고의 총 개수 : " + totalCount);
   			
   	   System.out.println("totalCount : " + totalCount);
   			
   	   /* 한 페이지에서 보여 줄 게시물의 수 */
   	   int limit = 3;
   			
   	   /* 한 번에 보여질 페이징 버튼 수 */
   	   int buttonAmount = 5;
   			
   	    /* 페이징 처리를 위한 로직 호출 후, 페이징 처리에 관한 정보를 담고 있는 인스턴스 리턴 */
   		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, totalCount, limit, buttonAmount);
   			
   		System.out.println("pageInfo : " + pageInfo);
   			
   		/* 페이징처리 정보 담고 조회 */
   		List<SearchPostDTO> selectPost = searchService.selectPostPaging(searchPost, pageInfo);
   			
      
      // 응답페이지 처리
	  String path = "";
	    if(selectPost != null) {
	    	System.out.println("서블렛에서 받은 공고들 : " + selectPost);
			
			 path = "/WEB-INF/views/customer/main/postlist.jsp";
			 request.setAttribute("selectPost", selectPost);
			 request.setAttribute("selectInAdPost", selectInAdPost);
			 request.setAttribute("pageInfo", pageInfo);
			 
			 // 단순검색인 것을 알려줌
			 request.setAttribute("type", 1);
			 
			 System.out.println("내가 선택한 값들 : " + select);
			 
			 String encodedselect = URLEncoder.encode(select, "UTF-8");
			 System.out.println("인코딩된 선택값들 : " + encodedselect);

			 // 내가 선택한 값
			 request.setAttribute("location", encodedselect);
			 
			 System.out.println("보내기전 selectPost 확인 : " + selectPost);

	    	
		} else {
			path = "/WEB-INF/views/user/common/errorPage.jsp";
			request.setAttribute("message", "공고조회를 실패했습니다.");
		}
		
	    request.getRequestDispatcher(path).forward(request, response);
   
   
   }
      


 }

   
