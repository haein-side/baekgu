package com.baekgu.silvertown.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.user.model.dto.PostDTO;
import com.baekgu.silvertown.user.model.service.PostService;

@WebServlet("/user/post")
public class PostServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int postCode = Integer.parseInt(request.getParameter("POST_CODE")); 
		
		System.out.println("상세공고 서블릿 도착" );
		System.out.println("선택된 공고 번호 : " + postCode );
		
		PostDTO requestPost = new PostDTO();
		requestPost.setPostCode(postCode);
		
		PostService postService = new PostService();
		
		// 차단여부에 대해서는 query으로 처리하기 (where절에서 차단여부 0 인것 검색하기)
	    PostDTO postInfo = postService.getPostInfo(postCode);
		
		
	}

}
