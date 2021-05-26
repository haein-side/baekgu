
package com.baekgu.silvertown.admin.model.controller;

import java.io.IOException; import javax.servlet.ServletException; import
javax.servlet.annotation.WebServlet; import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest; import
javax.servlet.http.HttpServletResponse; import
javax.servlet.http.HttpSession;

/**
* Servlet implementation class AdminLogout
*/
@WebServlet("/admin/logout") 

public class AdminLogout extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//loginAdmin에 담겨있는 세션값을 가져온다. (관리자 이름)
		HttpSession session = request.getSession();
		
		session.invalidate();
		String path = "/WEB-INF/views/customer/main/main.jsp";
		request.getRequestDispatcher(path).forward(request, response);
		
		
		
	
	}

}
		 