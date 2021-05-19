package com.baekgu.silvertown.admin.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.admin.model.dto.BaekguDTO;

/**
 * Servlet implementation class HomeDetailServlet
 */
@WebServlet("/admin/homedetail")
public class HomeDetailServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/WEB-INF/views/admin/main/HomeDetail.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String baekguName = request.getParameter("baekguName");
		String baekguPhone = request.getParameter("baekguPhone");
		String fax = request.getParameter("fax");
		String baekguAdd = request.getParameter("baekguAdd");
		String baekguNum = request.getParameter("baekguNum");
		String ownerName = request.getParameter("ownerName");
		
		
		BaekguDTO baekgudto = new BaekguDTO();
		baekgudto.setBaekguName(baekguName);
		baekgudto.setBaekguPhone(baekguPhone);
		baekgudto.setFax(fax);
		baekgudto.setBaekguAdd(baekguAdd);
		baekgudto.setBaekguNum(baekguNum);
		baekgudto.setOwnerName(ownerName);
		
		System.out.println("디테일에서 들어온 dto : " + baekgudto.getBaekguName());
		
		
	}

}
