package com.baekgu.silvertown.admin.model.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baekgu.silvertown.admin.model.dto.BlockDTO;
import com.baekgu.silvertown.admin.model.dto.PostDTO;
import com.baekgu.silvertown.admin.model.service.AdminCompanyService;
import com.baekgu.silvertown.admin.model.service.AdminPostService;

/**
 * Servlet implementation class AdminPostDetailServlet
 */
@WebServlet("/admin/postDetail")
public class AdminPostDetailServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int code = Integer.parseInt(request.getParameter("no"));
		
		System.out.println("공고코드 : " + code);
		
		AdminPostService postService = new AdminPostService();
		PostDTO post = postService.selectPostDetail(code);
		
		System.out.println("상세 공고 : " + post);
		
		List<PostDTO> adList = null;
		
		if(post != null) {
			
			adList = postService.selectAdList(code);
			
		}
		
		
		String path = "";
		
		if(post != null) {
			path = "/WEB-INF/views/admin/main/PostDetail.jsp";
			request.setAttribute("post", post);
			request.setAttribute("adList", adList);
		} else {
			path = "/WEB-INF/views/admin/common/errorPage.jsp";
			request.setAttribute("message", "공고 상세 정보를 조회할 수 없습니다. 관련 오류는 개발자에게 문의해주세요.");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bCode = Integer.parseInt(request.getParameter("bCode"));
		int code = Integer.parseInt(request.getParameter("no"));
		String reason = request.getParameter("reason");
		HttpSession session = request.getSession();
		String adminId = (String)session.getAttribute("loginAdminId");
		String state = request.getParameter("blockButton");
		
		
		BlockDTO block = new BlockDTO();
		block.setbReason(reason);
		block.setAdmin(adminId);
		block.setPostCode(code);
		block.setCompanyCode(bCode);
		
		System.out.println("심사사유 : " + block.getbReason());
		System.out.println("관리자ID : " + block.getAdmin());
		System.out.println("공고코드 : " + block.getPostCode());
		System.out.println("기업코드 : " + block.getCompanyCode());
		System.out.println("눌린 버튼 : " + state);
		
		int result = 0;
		
		//1. 기업코드와 일치하는 신고내역 조회
		AdminCompanyService companyService = new AdminCompanyService();
		int decisionCode = companyService.selectDecisionCode(block);
		
		if(decisionCode > 0) {
			
			//버튼값이 신고승인일때
			if(state.equals("기업 신고 승인")) {
				
				System.out.println("신고 승인 시작합니다");
				
				result = companyService.updateBlockCompany(block);
				
				if(result > 0) {
					response.sendRedirect(request.getContextPath() + "/admin/postDetail?no="+bCode);
				} else {
					String path ="/WEB-INF/views/admin/common/errorPage.jsp";
					request.setAttribute("message", "신고가 들어온 기업이 맞는지 불확실 합니다. 신고내역에서 확인 후, 차단해주세요!");
					request.getRequestDispatcher(path).forward(request, response);
				}
				
				//버튼값이 거부일때	
			}else {
				
				System.out.println("신고 거절 시작합니다");
				
				result = companyService.updateNoBlockCompany(block);
				
				if(result > 0) {
					response.sendRedirect(request.getContextPath() + "/admin/reportlist");
				} else {
					String path ="/WEB-INF/views/admin/common/errorPage.jsp";
					request.setAttribute("message", "신고가 들어온 기업이 맞는지 불확실 합니다. 신고내역에서 확인 후, 차단해주세요!");
					request.getRequestDispatcher(path).forward(request, response);
				}
				
			}
		}
		
		
	}

}































