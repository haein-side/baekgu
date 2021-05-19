package com.baekgu.silvertown.admin.model.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.admin.model.dto.AdminDTO;

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
		
		
		
		System.out.println("회사명 : " + baekguName);
		System.out.println("회사 전화번호 : " + baekguPhone);
		System.out.println("회사 팩스번호 : " + fax);
		System.out.println("회사 주소 : " + baekguAdd);
		System.out.println("사업자 등록번호 : " + baekguNum);
		System.out.println("대표자명 : " + ownerName);
		
		AdminDTO newInfo = new AdminDTO();
		newInfo.setBaekguName(baekguName);
		newInfo.setBaekguPhone(baekguPhone);
		newInfo.setFax(fax);
		newInfo.setBaekguAdd(baekguAdd);
		newInfo.setBaekguNum(baekguNum);
		newInfo.setOwnerName(ownerName);
		
		
		
		
	}

}
