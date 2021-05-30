package com.baekgu.silvertown.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baekgu.silvertown.user.model.dto.UserDTO;
import com.baekgu.silvertown.user.model.service.UserService;

@WebServlet("/loginCheck")
public class UserSignupPopupServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("지원하기 로그인 서블릿 도착");	
		response.setCharacterEncoding("utf-8");
		
		// 로그인 정보 받아오기
		String userPhone = request.getParameter("userPhone");
		String userPwd = request.getParameter("userPwd");
				
		// 공고지원하기에서 로그인한 경우 공고 번호 받아오기
		//int postCode = Integer.parseInt(request.getParameter("postCode"));
		
		// 출력 테스트
		System.out.println("입력한 고객 전화번호 : " + userPhone);
		System.out.println("입력한 고객 비밀번호 : " + userPwd);
		
		//System.out.println("공고 번호 : " + postCode);
		
		// DTO타입의 변수로 값 넣어주기
		UserDTO requestUser = new UserDTO();
		requestUser.setUserPhone(userPhone);
		requestUser.setUserPwd(userPwd);
		
		// 서비스 객체 생성
		UserService userService = new UserService();
		
		// 서비스에서 주는 값을 DTO형태로 받기
		UserDTO loginUser = userService.loginCheck(requestUser);
		
		System.out.println("컨트롤러 비밀번호, 차단여부 : " + requestUser);
		
		UserService userServiceInfo = new UserService();
		UserDTO loginUserInfo = null;
		
		
		/* Ajax에 대한 response를 PrintWriter 로 출력해주기 */ 
		
		/* 분기 처리 1. 회원가입 여부 확인 */
		if(loginUser != null) {

			/* 비밀번호 값을 보내서 조회하기 */
			loginUserInfo = userServiceInfo.loginInfo(requestUser);
			
			System.out.println("컨트롤러에서 유저 값 조회 : " + loginUserInfo);
		
		} else {
			
			/* 회원 정보 없음 : 정보 확인 요청하기 */
			System.out.println("회원 정보를 찾을 수 없습니다. 다시 확인해주세요.");
			
			/* 회원 정보 없을 때 값 리턴 (null 처리 필요?) */
			String output = "회원 정보를 찾을 수 없습니다. 다시 확인해주세요.";
			response.setContentType("text/plain; charset=utf-8");
			
			PrintWriter out = response.getWriter();
			
			out.print(output);
			out.flush();
			out.close();
		}
		
		HttpSession session = request.getSession();
        
		int test = 1;
        // Session에 조회한 회원정보를 loginUserInfo로 넣어줌
        session.setAttribute("loginUserInfo", test);
        
        
		
//		/* 회원 정보가 있을 때 차단 여부 확인하기 */
//		if(loginUserInfo.getUserBlock() != 1) {
//			
//			/* 비밀번호 대조 */
//			if(requestUser.getUserPwd().equals(loginUser.getUserPwd())) {
//				
//				/* 로그인 성공시 변수에 값이 담겼는지 재확인 */
//				if(loginUser != null) {
//					
//					/* 조회한 회원정보를 Session의 loginUserInfo라는 이름의 key value 형태로 넣음 */
//					HttpSession session = request.getSession();
//		            session.setAttribute("loginUserInfo", loginUserInfo);
//		            
//		            /* Console 출력 테스트 */
//		            System.out.println("loginUser의 usercode : " + loginUserInfo.getUserCode());
//					System.out.println("로그인 성공");
//
//					/* 로그인 성공 시 Ajax 값 리턴 */
//					PrintWriter out = response.getWriter();
//					
//					out.print(loginUser);
//					out.flush();
//					out.close();
//				}
//
//			} else {
//				
//				/* 비밀번호가 틀렸을 때 */
//				System.out.println("잘못된 비밀번호");
//				
//				String output = "비밀번호가 틀렸습니다. 다시 로그인 해주세요.";
//				response.setContentType("text/plain; charset=utf-8");
//				
//				PrintWriter out = response.getWriter();
//				
//				out.print(output);
//				out.flush();
//				out.close();
//			}
//		} else {
//			
//			/* 차단된 유저일 때 */
//			System.out.println("차단 유저된 유저 입니다.");
//		     	
//			String output = "고객님의 이력서 신고 접수가 승인되어 백구 이용이 제한되었습니다.";
//			response.setContentType("text/plain; charset=utf-8");
//			
//			PrintWriter out = response.getWriter();
//			
//			out.print(output);
//			out.flush();
//			out.close(); 	
		
	}

}
