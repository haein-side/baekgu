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

import oracle.net.resolver.NavServiceAlias;


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
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String bId = request.getParameter("bId");
		String bPwd = request.getParameter("bPwd");
			
		BusinessMemberDTO bMember = new BusinessMemberDTO();
		
		
		bMember.setbId(bId);
		BusinessService bService = new BusinessService();
		
		String checkId = bService.selectId(bId);	
						
		String path = "";
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
			
		BusinessMemberDTO loginBusinessMember = bService.loginCheck(bMember);
		
		System.out.println(loginBusinessMember);
		/* 기업 가입승인 코드 셀랙 해오기 */
		String decisionCode = bService.selectDecisionCode(loginBusinessMember.getbId());
		
		if(!checkId.equals("")) {
						
				// 비밀번호 매칭 성공
				if(passwordEncoder.matches(bPwd, loginBusinessMember.getbPwd())) {
					
					// 기업 가입 승인
					if(decisionCode.equals("2")) {
					
						//기업 차단 확인 0 인경우
						if(loginBusinessMember.getBlockStatus() == 0) {
							
							/* Session이 없으면 생성 */
							HttpSession session = request.getSession();
							session.setAttribute("loginBusinessMember", loginBusinessMember);	
							response.sendRedirect(request.getContextPath() + "/business/main");
							
							
						} else {
							
							/* 차단 상태가 1인경우 */
							request.setAttribute("message", "해당 아이디는 신고에 의해 차단당하셨습니다. 관리자에게 문의 하세요 (02-XXX-XXXX)");
							path = "/WEB-INF/views/business/main/signinB.jsp";
							request.getRequestDispatcher(path).forward(request, response);
						}
					
						// 기업 승인이 안난 경우
				 	} else {
				 		
				 		request.setAttribute("message", "해당 아이디는 아직 관리자에 의해 가입승인이 나지 않았습니다. 잠시만 기다려주세요.");
				 		path = "/WEB-INF/views/business/main/signinB.jsp";
				 		request.getRequestDispatcher(path).forward(request, response);
				 		
				 	}
					
				} else  {

					/* 비밀번호 매칭 실패 */
					request.setAttribute("message", "비밀번호를 잘못 입력하셨습니다.");
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




