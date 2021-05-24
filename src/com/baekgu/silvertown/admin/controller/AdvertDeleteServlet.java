package com.baekgu.silvertown.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.admin.model.service.AdvertService;

/**
 * Servlet implementation class AdvertDeleteServlet
 */
@WebServlet("/admin/advertdelete")
public class AdvertDeleteServlet extends HttpServlet {

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
	 * 광고 코드를 이용한 광고 상품 삭제용
	 */
	ArrayList<Integer> advertlist = new ArrayList<>();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	

		boolean isDelete = Boolean.valueOf(request.getParameter("isDelete"));

		if (isDelete) {

			if (advertlist.size() == 0) {
				forwardError(request, response);
			}

			AdvertService advertService = new AdvertService();
			int result = advertService.advertDelete(advertlist);

			if (result > 0) { // ajax처리하려고
				response.getWriter().write("refresh");
			} else {
				response.getWriter().write("error");
			}

		} else { // 체크되면 false임. 배열에 담긴걸 삭제하기 버튼 눌렀을 때 실행되도록
			
			boolean str = Boolean.valueOf(request.getParameter("sendData"));
			int code = Integer.parseInt(request.getParameter("code"));

			if (str) {
				// true일 때 여기에 담고
				advertlist.add(code);
			} else {
				// false일 때 꺼내서 제거는 것.
				for (int i = 0; i < advertlist.size(); i++) {
					int advertCode = advertlist.get(i);

					if (advertCode == code) {
						advertlist.remove(i);
						break;
					}
				}
			}

			for (int i = 0; i < advertlist.size(); i++) {
				int advertCode = advertlist.get(i);
				System.out.println("체크 된 광고 " + advertCode);
			}
		}

	}

}
