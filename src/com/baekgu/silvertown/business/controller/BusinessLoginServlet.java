package com.baekgu.silvertown.business.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.baekgu.silvertown.business.model.dto.BusinessMemberDTO;
import com.baekgu.silvertown.business.model.serivce.BusinessService;


@WebServlet("/business/login")
public class BusinessLoginServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		String transfer = (String)request.getAttribute("transfer");
		
		HttpSession session = request.getSession();
		BusinessMemberDTO loggedInUser = (BusinessMemberDTO)session.getAttribute("loginBusinessMember");
		
		String path = "";
		
		if(loggedInUser != null) {
			
			path = "/WEB-INF/views/business/main/BusinessMainPage.jsp";

		}else {

			path = "/WEB-INF/views/business/main/signinB.jsp";

		}
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}
	
	// 암호화 처리 해야뎀
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String bId = request.getParameter("bId");
		String bPwd = request.getParameter("bPwd");
		
		System.out.println(bId);

		
		BusinessMemberDTO bMember = new BusinessMemberDTO();
		
		bMember.setbId(bId);
		
		BusinessService bService = new BusinessService();
	
		
		BusinessMemberDTO loginBusinessMember = bService.loginCheck(bMember);
		
		System.out.println(loginBusinessMember);
		
		
		String path = "";
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		
		if(bId.equals(loginBusinessMember.getbId())) {
			
			/* 차단여부 확인 */
			if(loginBusinessMember.getBlockStatus() == 0) {
				
				/* passwoard 매칭 */
				// 암호호
				if(passwordEncoder.matches(bPwd, loginBusinessMember.getbPwd())) {
					
					/* 아이디 비번 매칭 성공 */
										
					/* Session이 없으면 생성 */
					HttpSession session = request.getSession();
					session.setAttribute("loginBusinessMember", loginBusinessMember);	
					response.sendRedirect(request.getContextPath() + "/business/main");
					
				} else if(bPwd.equals(loginBusinessMember.getbPwd())) {
					
					HttpSession session = request.getSession();
					session.setAttribute("loginBusinessMember", loginBusinessMember);	
					response.sendRedirect(request.getContextPath() + "/business/main");
					
					
				} 
				
				
				
				
				else if(!bPwd.equals(loginBusinessMember.getbPwd())) {

					/* 비밀번호 매칭 실패 */
					request.setAttribute("message", "비밀번호를 잘못 입력하셨습니다.");
					path = "/WEB-INF/views/business/main/signinB.jsp";
					request.getRequestDispatcher(path).forward(request, response);
		

				}
			} else {
				
				/* 차단 상태가 1인경우 */
				request.setAttribute("message", "해당 아이디는 신고에 의해 차단당하셨습니다. 관리자에게 문의 하세요 (02-XXX-XXXX)");
				path = "/WEB-INF/views/business/main/signinB.jsp";
				request.getRequestDispatcher(path).forward(request, response);
			}
		} else {
			
			/* 매칭되는 아이디가 없는 경우 */
			request.setAttribute("message", "해당아이디는 존재하지 않습니다.");
			path = "/WEB-INF/views/business/main/signinB.jsp";
			request.getRequestDispatcher(path).forward(request, response);
			
		}
		
	}

}
