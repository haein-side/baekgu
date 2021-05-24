package com.baekgu.silvertown.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baekgu.silvertown.admin.model.dto.AdminDTO;
import com.baekgu.silvertown.admin.model.service.AdminRegistService;

/**
 * Servlet implementation class SelectOneAdminIdServlet
 */
@WebServlet("/admin/adminid") 
public class SelectOneAdminIdServlet extends HttpServlet {
	
	
	private final AdminRegistService idService;
	
	public SelectOneAdminIdServlet() {
		/**
		 * 위 URL을 타고 들어오면 이 Servlet 객체가 생성된다
		 * 객체가 생성하려면 무조건 먼저 생성자를 호출하기 때문에
		 * doGet, doPost에서 사용할 서비스 객체를 여기서 인스턴스화를 하게 되면
		 * doGet, doPost에서 각각 인스턴스화를 할 필요가 없어진다
		 * 따라서 객체 생성, 소멸의 반복을 할 필요가 없기 때문에 가비지 컬렉터의 일을 줄일 수 있고,
		 * 메모리와 시스템 적으로 효율적이다 
		 */
		/* 관리자 아이디를 이용해서 비즈니스 로직 호출 -> 아이디를 통해서 상세정보 하는 것 , 업데이트도 함께 사용  */
		idService = new AdminRegistService();
	}

	/**
	 * 관리자 아이디로 상세정보 조회용 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
         /* 파라미터 꺼내기  -> 여기서 id는 manager.jsp에 있음. */
		String adminId = request.getParameter("id");
		System.out.println("adminId : " + adminId);
		
		/* 관리자 아이디를 통해 전체 상세정보 조회 */
		AdminDTO  adminDTO = idService.selectOneAdminId(adminId);
	
		
		/* 비지니스 로직 실행 결과에 따른 뷰 연결 */
		String path  = "";
		if(adminDTO != null) {
			path = "/WEB-INF/views/admin/main/ManagerDetail.jsp";
			request.setAttribute("adminDTO", adminDTO);
			
		} else {
			path = "/WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("message", "관리자 상세 정보 조회 실패!");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}


	/**
	 * 관리자 정보 업데이트용 
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		 String id = request.getParameter("id");
		 String name = request.getParameter("name");
		 String password = request.getParameter("password");
		 String email = request.getParameter("email");
		 java.sql.Date confirm = java.sql.Date.valueOf(request.getParameter("confirm"));
		 String beakre = request.getParameter("beakre");
		 
		 AdminDTO adminDTO =  new AdminDTO();
		 adminDTO.setAdminId(id);
		 adminDTO.setAdminName(name);
		 adminDTO.setAdminPwd(password);
		 adminDTO.setAdminEmail(email);
		 adminDTO.setAdminDate(confirm);
		 adminDTO.setAdminRole(beakre);
		 
		 System.out.println(" 컨트롤러 :  " + adminDTO);
		 
		/* 업데이트하려고 서비스 */
	   int result = idService.updateAdmin(adminDTO);
	
	   String path = "";
		if (result > 0) {
			// 보여주려는 곳으로 경로 지정.
			path = "/baeckgu/admin/search";
			response.sendRedirect(path);
			
		} else {
			// 에러페이지로 보내려고 함.
			path = "/WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("message", "업데이트 실패 !");
			request.getRequestDispatcher(path).forward(request, response);
		}

	   
		
	}

}
