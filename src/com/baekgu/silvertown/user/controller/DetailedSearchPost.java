package com.baekgu.silvertown.user.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.user.model.dto.DetailedSearchPostDTO;
import com.baekgu.silvertown.user.model.dto.SearchPostDTO;
import com.baekgu.silvertown.user.model.service.SearchPostService;

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
	      
	      
	      // 지역별 스플릿 - array[0]을 스플릿해서 각각 String[] location에 담아줌 (복수선택가능)
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
		  String exp = "";
		  
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
		  
		   // 시간 (복수선택 가능)
		   String[] time = null;
		   int[] hourCode = null;
		   if (array[5] != null && array[5].length() > 0) {
			   	
			   time = array[5].split("&");
			   
			   for(int i=0 ; i < time.length;i++) { 
		    		  System.out.println("time[" + i +"] : " + time[i]);
		    	  }
			}
			
			System.out.println("locationCode : " + location);
			System.out.println("industryCode : " + industry);
			System.out.println("jobCode : " +job);
			System.out.println("expCode : " +exp);
			System.out.println("periodCode : " +period);
			System.out.println("timeCode : " +time);
			
			
			// DTO에 입력받은 값들을 set 해줌
			DetailedSearchPostDTO dSearchPost = new DetailedSearchPostDTO();
			
			// location, time 문자열 배열을 int 배열로 만들어줌
			locationCode = Arrays.stream(location).mapToInt(Integer::parseInt).toArray();
			hourCode = Arrays.stream(time).mapToInt(Integer::parseInt).toArray();
			
			// industry, job, exp, period String을 int로 바꿔줌
			int industryCode = Integer.parseInt(industry);
			int jobCode = Integer.parseInt(job);
			int expCode = Integer.parseInt(exp);
			int periodCode = Integer.parseInt(period);
			
			dSearchPost.setLocationCode(locationCode);
			dSearchPost.setIndustryCode(industryCode);
			dSearchPost.setJobCode(jobCode);
			dSearchPost.setExpCode(expCode);
			dSearchPost.setPeriodCode(periodCode);
			dSearchPost.setHourCode(hourCode);
			
			System.out.println(locationCode);
			System.out.println(industryCode);
			System.out.println(jobCode);
			System.out.println(expCode);
			System.out.println(periodCode);
			System.out.println(hourCode);
			
			// 서비스로 넘기기
			SearchPostService searchService = new SearchPostService();
			
			// 상세검색 비즈니스 로직 처리
			/* selectBestPost - 모든 검색 조건 부합 */
			List<DetailedSearchPostDTO> selectPost = searchService.selectBestPost(dSearchPost);
			
			/* selectNormalPost - 경력 제외 조건 부합 */
			List<DetailedSearchPostDTO> selectNormalPost = searchService.selectNormalPost(dSearchPost);
			
			/* selectInAdPost - 업종광고 */
			List<SearchPostDTO> selectInAdPost = searchService.selectInAdPost(industryCode);
			
			/* selectJobAdPost - 직종광고 */
			List<SearchPostDTO> selectJobAdPost = searchService.selectJobAdPost(jobCode);
			
			// 응답페이지 처리
			String path = "";
		    if(selectNormalPost != null) {
		    	
				 path = "/WEB-INF/views/customer/main/postlist.jsp";
				 request.setAttribute("selectInAdPost", selectInAdPost);
				 request.setAttribute("selectJobAdPost", selectJobAdPost);
				 request.setAttribute("selectPost", selectPost);
				 request.setAttribute("selectNormalPost", selectNormalPost);
				 
		    	
			} else {
				path = "/WEB-INF/views/user/common/errorPage.jsp";
				request.setAttribute("message", "공고조회를 실패했습니다.");
			}
			
		    request.getRequestDispatcher(path).forward(request, response);
			
			
	}

	

}
