package com.baekgu.silvertown.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baekgu.silvertown.admin.model.dto.PostDTO;
import com.baekgu.silvertown.admin.model.service.PostApproveService;

/**
 * Servlet implementation class PostApproveDetail
 */
@WebServlet("/admin/postapprovedetail")
public class PostApproveDetailServlet extends HttpServlet {
	
	private final PostApproveService postService;
	
	public PostApproveDetailServlet() {
		
		postService = new PostApproveService();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		int postCode = Integer.parseInt(request.getParameter("postCode"));
		
		System.out.println("공고 코드 컨트롤러: " + postCode);
		
		// 공고 상세정보용 
		PostDTO postDTO = postService.selectPostDetail(postCode);
		
		System.out.println("상세 정보 컨트롤러 : " + postDTO);
		
		List<PostDTO> payment = null;
		
		if(postDTO != null) {
			// 광고 상세정보용
		  payment = postService.selectAdDetail(postCode);
		  System.out.println("광고 상세 정보 컨트롤러 : " + payment);
		
		}
		
		/*
		 * int dday = (int)(postDTO.getPostDate().getTime() -
		 * System.currentTimeMillis()) / 1000/ 60 /60 / 24;
		 */
		
		/* 비지니스 로직 실행 결과에 따른 뷰 연결 */
		String path  = "";
	
		if(postDTO != null)  {
			System.out.println("들어오니?");
			path = "/WEB-INF/views/admin/main/PostApproveDetail.jsp";
			request.setAttribute("postDTO", postDTO);
			request.setAttribute("payment", payment);
			/* request.setAttribute("dday", dday); */
			
		} else {
			path = "/WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("message", " 상세 정보 조회 실패!");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}

		
	/**
	 *	
	 * 공고 승인시 decision-code , d_list_type_code 바뀌게 업데이트용
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int postCode = Integer.parseInt(request.getParameter("postCode"));
		
		// 들어온 버튼의 value를 확인해서 조건문으로 승인, 거절을 판별
		String button = request.getParameter("Button");
		// 공고 거절일 때만 사유 적음. 승인일 때는 default처리
		String reason = request.getParameter("reason");
		
		// loginAdmin에 담겨있는 세션값을 가져온다. (관리자 이름)
	     HttpSession session = request.getSession();
		 String adminId = (String) session.getAttribute("loginAdminId");
		
		 PostDTO postDTO = new PostDTO();
		 postDTO.setListReason(reason);
		 postDTO.setPostCode(postCode);
		 postDTO.setAdminId(adminId);
		 
		 System.out.println("공고 업데이트용 컨트롤러 " + postDTO);
		 
		 int result = 0;
		 String path = "";
		 
			if (button.equals("공고 승인")) {
				// 공고 승인 누를 시

				System.out.println("컨트롤러 공고 승인");
				result = postService.postSubmitUpdate(postDTO);

				if (result > 0) {
					path = "/baekgu/admin/postapprove";
					response.sendRedirect(path);
				} else {
					path = "/WEB-INF/views/common/errorPage.jsp";
					request.setAttribute("message", "공고 승인 업데이트 실패 !");
					request.getRequestDispatcher(path).forward(request, response);

				}

			} else if (button.equals("공고 거절")) {
				// 공고 거절 누를시
				System.out.println("컨트롤러 공고 거절 ");
				result = postService.postBlockUpdate(postDTO);
				if (result > 0) {
					path = "/baekgu/admin/postapprove";
					response.sendRedirect(path);

				} else {
					path = "/WEB-INF/views/common/errorPage.jsp";
					request.setAttribute("message", "공고 거절 업데이트 실패 !");
					request.getRequestDispatcher(path).forward(request, response);

				}

			}
		 
		 
		
	}

}
