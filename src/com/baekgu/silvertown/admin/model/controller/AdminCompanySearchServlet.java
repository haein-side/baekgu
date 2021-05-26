package com.baekgu.silvertown.admin.model.controller;

import java.io.IOException;
import java.util.List;

import javax.print.attribute.SetOfIntegerSyntax;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.admin.model.dto.CompanyDTO;
import com.baekgu.silvertown.admin.model.service.AdminCompanyService;
import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.common.paging.PageNation;

/**
 * Servlet implementation class AdminCompanySearchServlet
 */
@WebServlet("/admin/companySearch")
public class AdminCompanySearchServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//검색하려 선택하는 셀렉트 옵션의 값이다
		String condition = request.getParameter("searchCondition");
		//사용자가 입력한 값이다
		String value = request.getParameter("searchValue");
		int realValue = 0;
		
		System.out.println("셀렉트 옵션 : " + condition);
		System.out.println("사용자 입력 값 : " + value);
		System.out.println("------------------------------");
	
		/* 셀렉트 옵션이 기업분류라면 value의 값을 기업분류 코드로 정제한다 */
		if(condition.equals("category")) {
			
			//contains로 문자열과 문자를 매치해서 기업분류 코드 값을 얻는다
			if(value.contains("미")) {
				realValue = 1;
				value = Integer.toString(realValue);
				System.out.println("쿼리에 들어갈 카테고리 값 : " + value);
				
			} else if(value.contains("일")) {
				realValue = 2;
				value = Integer.toString(realValue);
				System.out.println("쿼리에 들어갈 카테고리 값 : " + value);
				
			} else if(value.contains("공공")) {
				
				realValue = 5;
				value = Integer.toString(realValue);
				System.out.println("쿼리에 들어갈 카테고리 값 : " + value);
				
			} else if(value.contains("사")) {
				realValue = 4;
				value = Integer.toString(realValue);
				System.out.println("쿼리에 들어갈 카테고리 값 : " + value);
				
			} else if(value.contains("공")) {
				realValue = 3;
				value = Integer.toString(realValue);
				System.out.println("쿼리에 들어갈 카테고리 값 : " + value);
			}
			
		}
		
	
		
		//검색을하고 처음 나오는 페이지는 1페이지다. 파라미터로 전달되는 페이지가 있는 경우 currentPage는 파라미터로 전달 받은 페이지 수다.
		String currentPage = request.getParameter("currentPage");
		int pageNo = 1;
		
		if(currentPage != null && "".equals(currentPage)) {
			pageNo = Integer.parseInt(currentPage);
		}
		
		//pageNo가 0이거나 0보다 작다면 1페이지를 보여준다
		if(pageNo <= 0) {
			pageNo = 1;
		}
					
		AdminCompanyService companyService = new AdminCompanyService();
		int count = companyService.searchCompanyListCount(condition, value);
		
		int limit = 10;
		int buttonAmount = 5;
	
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, pageNo, limit, buttonAmount);
		
		List<CompanyDTO> companyList = companyService.searchCompanyListCount(condition, value, pageInfo);
	
		String path = "";
		if(companyList != null) {
			path = "/WEB-INF/views/admin/main/CompanyInfo.jsp";
			request.setAttribute("companyList", companyList);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("searchCondition", condition);
			request.setAttribute("searchValue", value);
		} else {
			path = "/WEB-INF/views/admin/common/errorPage.jsp";
			request.setAttribute("message", "회원 검색에 실패했습니다. 관련 문의는 개발자에게 문의해주세요.");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	
	
	}	

}



















