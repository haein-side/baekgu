<%@ page contentType="text/html; charset=utf-8"%>            
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>                           
<html>
<head>
</head>
<body>
<c:if test="${ !empty sessionScope.loginAdminName }">
<%
	
    HttpSession userSession = request.getSession();
    userSession.invalidate();
    out.println("<h1>로그아웃 되었습니다.</h1>");
%>
</c:if>
<c:if test="${ empty sessionScope.loginAdminName }">
<%
    out.println("<h1>로그인하고 와주세요!</h1>");
	response.sendRedirect("/WEB-INF/views/customer/main/main.jsp");

%>
</c:if>
</body>
</html>


