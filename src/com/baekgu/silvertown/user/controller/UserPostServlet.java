package com.baekgu.silvertown.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baekgu.silvertown.user.model.dto.PostDTO;
import com.baekgu.silvertown.user.model.service.PostService;

@WebServlet("/user/post")
public class UserPostServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int postCode = Integer.parseInt(request.getParameter("postCode"));
		
		System.out.println("상세공고 서블릿 도착" );
		System.out.println("선택된 공고 번호 : " + postCode );
		
		PostDTO requestPost = new PostDTO();
		requestPost.setPostCode(postCode);
		
		PostService postService = new PostService();
		
		// 차단여부에 대해서는 query으로 처리하기 (where절에서 차단여부 0 인것 검색하기)
	    PostDTO postInfo = postService.getPostInfo(postCode);
	    
	    /* 우대사항 특수문자 제거 */
	    String changeAdv =  postInfo.getAdvantage();
	    if(changeAdv != null && changeAdv != "") {
	    	
	    	postInfo.setAdvantage(changeAdv.replaceAll("&", ", "));
	    }
	    /* 복리후생 특수문자 제거	*/   
	    String changeBen = postInfo.getBenefit();
	    if(changeBen != null && changeBen != "") {
	    	
	    	postInfo.setBenefit(changeBen .replaceAll("&", ", "));
	    }
	    /* 주소 특수문자 제거 */	
	    String changePostAddress = postInfo.getPostAddress();
	    if(changePostAddress != null && changePostAddress != "") {
	    	
	    	postInfo.setPostAddress(changePostAddress.replaceAll("&", " "));
	    }

	    /* request에 공고정보 담아서 보내기 */ 
	    request.setAttribute("postInfo", postInfo);
	    System.out.println(postInfo.getLogoPath());
	    
	    /* forward 방식 */
	    String path = "/WEB-INF/views/customer/main/searchView.jsp";
	    request.getRequestDispatcher(path).forward(request, response);
	    
	    System.out.println("컨트롤러 postInfo : " + postInfo);
	}

}
