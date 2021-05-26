package com.baekgu.silvertown.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baekgu.silvertown.admin.model.dto.BusinessJoinDTO;
import com.baekgu.silvertown.admin.model.service.BusinessJoinService;

/**
 * Servlet implementation class BusinessJoinCodeServlet
 */
@WebServlet("/admin/businesscode")
public class BusinessJoinCodeServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int bCode = Integer.parseInt(request.getParameter("bCode"));
		System.out.println("bCode : " + bCode);

		BusinessJoinDTO bJoinDTO = new BusinessJoinService().BusinessJoinDetail(bCode);

		String path = "";
		if (bJoinDTO != null) {
			path = "/WEB-INF/views/admin/main/Sign-upDetail.jsp";
			request.setAttribute("bJoinDTO", bJoinDTO);
		} else {
			path = "/WEB-INF/views/admin/common/errorPage.jsp";
			request.setAttribute("message", "기업 가입 승인 카테고리 상세 정보 조회 실패!");
		}

		request.getRequestDispatcher(path).forward(request, response);

	}

	/**
	 * 가입 승인시 decision-code , d_list_type_code 바뀌게 업데이트용
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int bCode = Integer.parseInt(request.getParameter("bCode"));

		// 들어온 버튼의 value를 확인해서 조건문으로 승인, 거절을 판별
		String button = request.getParameter("Button");
		// 가입 거절일 때만 사유 적음. 승인일 때는 default처리
		String reason = request.getParameter("reason");

		// loginAdmin에 담겨있는 세션값을 가져온다. (관리자 이름)
		HttpSession session = request.getSession();
		String adminId = (String) session.getAttribute("loginAdminId");

		BusinessJoinDTO JoinDTO = new BusinessJoinDTO();
		JoinDTO.setdListReason(reason);
		JoinDTO.setbCode(bCode);
		JoinDTO.setAdminId(adminId);

		System.out.println(JoinDTO);

		int result = 0;
		String path = "";
		BusinessJoinService joinService = new BusinessJoinService();

		if (button.equals("가입 승인")) {
			// 가입 승인 누를 시

			System.out.println("컨트롤러 가입 승인");
			result = joinService.joinSubmitUpdate(JoinDTO);

			if (result > 0) {
				path = "/baekgu/admin/businessjoinList";
				response.sendRedirect(path);
			} else {
				path = "/WEB-INF/views/common/errorPage.jsp";
				request.setAttribute("message", "가입 승인 업데이트 실패 !");
				request.getRequestDispatcher(path).forward(request, response);

			}

		} else if (button.equals("가입 거절")) {
			// 가입 거절 누를시
			System.out.println("컨트롤러 가입 거절 ");
			result = joinService.joinBlockUpdate(JoinDTO);
			if (result > 0) {
				path = "/baekgu/admin/businessjoinList";
				response.sendRedirect(path);

			} else {
				path = "/WEB-INF/views/common/errorPage.jsp";
				request.setAttribute("message", "가입 거절 업데이트 실패 !");
				request.getRequestDispatcher(path).forward(request, response);

			}

		}


	}

}
