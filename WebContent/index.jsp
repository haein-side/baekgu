<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<%-- 	<!-- 고객페이지 테스트 -->
	<jsp:forward page="/WEB-INF/views/customer/main/main.jsp"></jsp:forward>
	
	<!-- 기업페이지 테스트 -->
	<jsp:forward page="/WEB-INF/views/business/main/main.jsp"></jsp:forward> --%>
		
	<!-- 관리자페이지 테스트 -->
	<%-- <jsp:forward page="/WEB-INF/views/admin/main/index.jsp"></jsp:forward> --%>

	
	<!-- 상세공고페이지 테스트 -->
	<jsp:forward page="/WEB-INF/views/customer/main/searchView.jsp"></jsp:forward>
	
	<jsp:forward page="WEB-INF/views/customer/main/signup.jsp"></jsp:forward>
</body>
</html>