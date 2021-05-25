package com.baekgu.silvertown.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.admin.model.dto.AdvertDTO;
import com.baekgu.silvertown.admin.model.service.AdvertService;

/**
 * Servlet implementation class AdvertDetailServlet
 */
@WebServlet("/admin/detail")
public class AdvertDetailServlet extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       
		/* 파라미터 꺼내기  -> 여기서 code는 Advert.jsp에 있음. */
			int code = Integer.parseInt(request.getParameter("code"));
			System.out.println("code : " + code);
			
			AdvertDTO advertDTO = new AdvertService().advertDetail(code);
		
			/* 비지니스 로직 실행 결과에 따른 뷰 연결 */
			String path  = "";
			if(advertDTO != null) {
				path = "/WEB-INF/views/admin/main/AdvertDetail.jsp";
				request.setAttribute("advertDTO", advertDTO);
				
			} else {
				path = "/WEB-INF/views/common/errorPage.jsp";
				request.setAttribute("message", "광고 상세 정보 조회 실패!");
			}
			
			request.getRequestDispatcher(path).forward(request, response);
			
			
		
	}


	/**
	 * 광고 정보 업데이트용 
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int code = Integer.parseInt(request.getParameter("code"));
		String advertName = request.getParameter("advertName");
		int advertPrice = Integer.parseInt(request.getParameter("advertPrice"));
		
		
		AdvertDTO advertDTO = new AdvertDTO();
		advertDTO.setCode(code);
		advertDTO.setAdvertName(advertName);
		advertDTO.setAdvertPrice(advertPrice);
		
		System.out.println("컨트롤러 업데이트용 : " + advertDTO);
		
		int result = new AdvertService().advertUpdate(advertDTO);
		
		   String path = "";
			if (result > 0) {
				// 보여주려는 곳으로 경로 지정.
				path = "/baeckgu/admin/advertlist";
				response.sendRedirect(path);
				
			} else {
				// 에러페이지로 보내려고 함.
				path = "/WEB-INF/views/common/errorPage.jsp";
				request.setAttribute("message", "업데이트 실패 !");
				request.getRequestDispatcher(path).forward(request, response);
			}

		
		
		
	}

}
