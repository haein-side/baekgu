package com.baekgu.silvertown.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.admin.model.dto.AdminDTO;
import com.baekgu.silvertown.admin.model.service.AdminRegistService;

@WebServlet("/admin/admindelete")
public class DeleteAdminServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	public void forwardError(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = "/WEB-INF/views/common/errorPage.jsp";
		request.setAttribute("message", "삭제 실패 !");
		request.getRequestDispatcher(path).forward(request, response);
	}

	/**
	 * 아이디를 통한 관리자 삭제용
	 */
	ArrayList<String> adminList = new ArrayList<>();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		boolean isDelete = Boolean.valueOf(request.getParameter("isDelete"));

		if (isDelete) {

			if (adminList.size() == 0) {
				forwardError(request, response);
			}
			
			AdminRegistService adminService = new AdminRegistService();
			int result = adminService.adminDelete(adminList);

			if (result > 0) { // ajax처리하려고 
				response.getWriter().write("refresh");
			} else {
				response.getWriter().write("error");
			}

		} else {  // 체크되면 false임. 배열에 담긴걸 삭제하기 버튼 눌렀을 때 실행되도록 
			boolean str = Boolean.valueOf(request.getParameter("sendData"));
			String id = request.getParameter("adminId");

			if (str) {
				// true일 때 여기에 담고
				adminList.add(id);
			} else {
				// false일 때 꺼내서 제거는 것.
				for (int i = 0; i < adminList.size(); i++) {
					String adminId = adminList.get(i);

					if (adminId.equalsIgnoreCase(id)) {
						adminList.remove(i);
						break;
					}
				}
			}

			for (int i = 0; i < adminList.size(); i++) {
				String adminId = adminList.get(i);
				System.out.println("체크 된 아이디 : " + adminId);
			}
		}

	}

}
