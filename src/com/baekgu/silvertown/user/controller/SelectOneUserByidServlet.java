package com.baekgu.silvertown.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.greedy.mvc.employee.model.dto.EmployeeDTO;
import com.greedy.mvc.employee.model.service.EmployeeService;

/**
 * Servlet implementation class SelectOneEmpByidServlet
 */
@WebServlet("/employee/select")
public class SelectOneEmpByidServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		/* 전달한 파라미터 꺼내기 */
		String empId = request.getParameter("empId");

		/* 사번을 이용해 사원정보를 조회하는 비지니스 로직 호출 */
		EmployeeService empService = new EmployeeService();
		
		/* 결과값을 반환 받기 */
		/* 반환값은 어떤 타입? DTO? list? int? void? -> 어떤 작업중인지 고민 */
		EmployeeDTO selectEmp = empService.selectOneEmpById(empId);
		
		
	
		/* 비지니스 로직 실행 결과에 따른 뷰 연결 */
		String path = "";
		if(selectEmp != null) {
			
			path = "/WEB-INF/views/main/showEmpInfo.jsp";
			request.setAttribute("selectEmp", selectEmp);
			
		}else {
			path = "/WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("message", "회원 정보를 조회할 수 없습니다.");
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
		
	}

}

