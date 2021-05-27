package com.baekgu.silvertown.admin.model.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baekgu.silvertown.admin.model.dto.BlockDTO;
import com.baekgu.silvertown.admin.model.service.AdminReportService;
import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.common.paging.PageNation;
import com.baekgu.silvertown.user.model.dto.ReportDTO;

/**
 * Servlet implementation class AdminReportSearchServlet
 */
@WebServlet("/admin/reportSearch")
public class AdminReportSearchServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 검색하려 선택하는 셀렉트 옵션의 값이다
		String searchSelect = request.getParameter("searchSelect");
		// 사용자가 입력한 값이다
		String searchInput = request.getParameter("searchInput");

		System.out.println("searchSelect : " + searchSelect);
		System.out.println("searchInput  : " + searchInput);


		// 검색을하고 처음 나오는 페이지는 1페이지다. 파라미터로 전달되는 페이지가 있는 경우 currentPage는 파라미터로 전달 받은 페이지
		// 수다.
		String currentPage = request.getParameter("currentPage");
		int pageNo = 0;

		if (currentPage != null && "".equals(currentPage)) {
			pageNo = Integer.parseInt(currentPage);
		}

		// pageNo가 0이거나 0보다 작다면 1페이지를 보여준다
		if (pageNo <= 0) {
			pageNo = 1;
		}

		AdminReportService reportService = new AdminReportService();

		int totalCount = reportService.SearhCount(searchSelect, searchInput);

		int limit = 10;
		int buttonAmount = 5;

		// 페이징 처리를 위한 로직 호출 후, 페이징 처리에 관한 정보를 담고 있는 인스턴스 리턴 받기
		PageInfoDTO pageInfo = PageNation.getPageInfo(pageNo, totalCount, limit, buttonAmount);
		System.out.println("searchSelect : " + searchSelect);
		
		List<BlockDTO> reportList = reportService.selectSearchReport(searchSelect, searchInput, pageInfo);

	
		String path = "";
		if (reportList != null) {
			path = "/WEB-INF/views/admin/main/Report.jsp";
			request.setAttribute("reportList", reportList);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("searchSelect", searchSelect);
			request.setAttribute("searchInput", searchInput);
		} else {
			path = "/WEB-INF/views/admin/common/errorPage.jsp";
			request.setAttribute("message", "신고 검색에 실패했습니다. 관련 문의는 개발자에게 문의해주세요.");
		}

		request.getRequestDispatcher(path).forward(request, response);

	}

}
