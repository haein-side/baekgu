<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		var errorMessage = "${ requestScope.errorMessage }";
		movePath = "${ pageContext.servletContext.contextPath }/user/toMain";
		<%-- movePath = "${ pageContext.servletContext.contextPath }"; --%>
		
		alert(errorMessage);
		location.replace(movePath);
	</script>
</body>
</html>