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
 * Servlet implementation class AdvertAddServlet
 */
@WebServlet("/admin/advertadd")
public class AdvertAddServlet extends HttpServlet {


	/**
	 * 광고상품관리에서 추가하기 눌렀을 댸 오게 하려고 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		  String path = "/WEB-INF/views/admin/main/AdvertAdd.jsp";
		  request.getRequestDispatcher(path).forward(request, response);
		 
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String advertName = request.getParameter("advertName");
		int advertPrice = Integer.parseInt(request.getParameter("advertPrice"));
		
		AdvertDTO advertdto = new AdvertDTO();
		advertdto.setAdvertName(advertName);
		advertdto.setAdvertPrice(advertPrice);
		
		System.out.println("광고 컨트롤러 : " + advertdto);
		
		int result = new AdvertService().advertAdd(advertdto);
		
		
		String path = "";
		
		if(result > 0) {
			path = "/baekgu/admin/advertlist";
			response.sendRedirect(path);
		} else {
			path = "/WEB-INF/views/admin/common/erroPage.jsp";
			request.setAttribute("message", "광고 추가 실패!");
			request.getRequestDispatcher(path).forward(request, response);
		}
		
		
	
	}

}
