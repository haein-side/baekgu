<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>공고 번호로 공고 조회하기</h3>
	<form action="${ pageContext.servletContext.contextPath}/user/post" method="get">
		<label>조회할 공고 번호 : </label>
		<input type="text" name="POST_CODE" id="POST_CODE">
		<button type="submit">조회하기</button>
	</form>

</body>
</html>