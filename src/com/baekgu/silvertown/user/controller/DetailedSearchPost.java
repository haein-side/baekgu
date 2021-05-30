package com.baekgu.silvertown.user.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.admin.model.dto.MemberDTO;
import com.baekgu.silvertown.admin.model.service.AdminMemberService;
import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.common.paging.PageNation;
import com.baekgu.silvertown.user.model.dto.DetailedSearchPostDTO;
import com.baekgu.silvertown.user.model.dto.SearchPostDTO;
import com.baekgu.silvertown.user.model.service.SearchPostService;

/**
 * Servlet implementation class DetailedSearchPost
 */
@WebServlet("/user/detailedSearchPost")
public class DetailedSearchPost extends HttpServlet {
  
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 System.out.println("searchPost의 post로 도착");
	      
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
		         
		         // 마지막 선택 값이 "무관"일 때 period를 30이란 특이값으로 만들어줌 
		    	  if (period.equals("1")) {
		    		   
		    			  System.out.println("마지막 선택값이 무관인 경우");
		    			  
		    				  period = "30";
		    		
		    			  System.out.println("period가 바뀌었는지 보기 : " + period);
		    	  }
		         
		         
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
			/* selectPost - 일반공고 */
			List<DetailedSearchPostDTO> selectPostFirst = searchService.selectBestPost(dSearchPost);
			
			/* selectInAdPost - 업종광고 */
			List<SearchPostDTO> selectInAdPost = searchService.selectInAdPost(industryCode);
			
			/* selectJobAdPost - 직종광고 */
			List<SearchPostDTO> selectJobAdPost = searchService.selectJobAdPost(jobCode);
			
			
			// 페이징 처리
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
			
			/* 전체 게시물의 갯수 필요 */
			int totalCount = selectPostFirst.size();
			
			System.out.println("상세 검색 일반 공고의 총 개수 : " + totalCount);
			
			System.out.println("totalCount : " + totalCount);
			
			/* 한 페이지에서 보여 줄 게시물의 수 */
			int limit = 3;
			
			/* 한 번에 보여질 페이징 버튼 수 */
			int buttonAmount = 5;
			
			/* 페이징 처리를 위한 로직 호출 후, 페이징 처리에 관한 정보를 담고 있는 인스턴스 리턴 */
			PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, totalCount, limit, buttonAmount);
			
			System.out.println("pageInfo : " + pageInfo);
			
			/* 페이징처리 정보 담고 조회 */
			List<DetailedSearchPostDTO> selectPost = searchService.selectDPostPaging(dSearchPost, pageInfo);
			
			// 응답페이지 처리
			String path = "";
		    if(selectInAdPost != null) {
		    	
				 path = "/WEB-INF/views/customer/main/postlist.jsp";
				 request.setAttribute("selectInAdPost", selectInAdPost);
				 request.setAttribute("selectJobAdPost", selectJobAdPost);
				 request.setAttribute("selectPost", selectPost);
				 request.setAttribute("pageInfo", pageInfo);
				 
				 // 상세검색인 것을 알려줌
				 request.setAttribute("type", 2);
				 
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
