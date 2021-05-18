<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백구 관리자 로그인</title>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/YJCSS/header2.css" type="text/css">
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/signin.css" type="text/css">
</head>
<body style="height:0%;">

	<div class="wrapper" style="margin-top: 0px;">
    	<form class="form-signin" action="${ pageContext.servletContext.contextPath }/admin/login" method="post">
        	<h1 class="form-signin-heading">관리자 로그인</h1>
        <div>
		    <lable class="text-label"><b>아이디</b></lable>
		    <input type="text" class="form-control" name="adminId" placeholder="아이디" required="" autofocus=""/>
		   	<br>
		    <lable class="text-label"><b>비밀번호</b></lable>
		    <input type="password" class="form-control" name="adminPwd" placeholder="비밀번호" required=""/>
		   
	<%
	String message = (String)request.getAttribute("message");
	if(message != null){
	%>
	<font color="red" size="2"><%=message %></font>
	<%} %>
		    <button class="btn btn-lg btn-primary btn-block" type="submit" style="height: 50px; margin-left: 110px; margin-top: 30px;">로그인</button><br><br>
        </div>
		
      </form>
    </div>

 

</body>
</html>