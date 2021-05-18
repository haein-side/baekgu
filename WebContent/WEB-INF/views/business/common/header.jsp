<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	
	<meta charset="UTF-8">
	<title>백구 - 공고관리</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<style>
		.navbar {
      	margin-bottom: 0;
      	border-radius: 0;
      	background: darkslategrey;
    	}
	</style>

	</head>

	<body>
		<nav class="navbar navbar-inverse">
		  
		  <div class="container-fluid">
		  
		    <div class="navbar-header">
		  
		      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>                        
		      </button>
		  
		      <a class="navbar-brand" href="#">백구</a>
		  
		    </div>
		  
		    <div class="collapse navbar-collapse" id="myNavbar">
		  
		      <ul class="nav navbar-nav">
		        <li class="active"><a href="home.html">홈</a></li>
		        <li><a href="addad.html">공고등록</a></li>
		        <li><a href="#">공고관리</a></li>
		        <li><a href="payment.html">결제관리</a></li>
		        <li><a href="ad.html">상품안내</a></li>
		      </ul>
		  	
		  	<c:if test="${ empty sessionScope.loginBusinessMember }">
		  	
		      <ul class="nav navbar-nav navbar-right"> 
		        <li><a href="#">회사명</a></li>
		        <li><a href="#">담당자명</a></li>
		        <li><a href="#">로그아웃</a></li>
		      </ul>
		  	
		  	</c:if>
		  	
		  	<c:if test="${ !empty sessionScope.loginBusinessMember }">
		  	
		      <ul class="nav navbar-nav navbar-right"> 
		        <li><a href="#">${ sessionScope.loginBusinessMember.bName }</a></li>
		        <li><a href="#">담당자명</a></li>
		        <li><a href="#">로그아웃</a></li>
		      </ul>
		  	
		  	</c:if>
		  
		    </div>
		  
		  </div>
		
		</nav>
	</body>
</html>