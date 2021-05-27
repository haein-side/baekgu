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
	
<!-- 	<script src="../RESOURCES/JS/BUSINESS/event.js"></script>
 -->	
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
		  
		      <a class="navbar-brand" href="${ pageContext.servletContext.contextPath }/user/signupResult">백구</a>
		  
		    </div>
		  
		    <div class="collapse navbar-collapse" id="myNavbar">
		    
		    
		    <%-- <c:choose>
							    <c:when test="${resumeInfo.degreeCode eq 1 }">
							    <p>학력사항 없음</p>
							    </c:when>
							    <c:when test="${resumeInfo.degreeCode eq 2 }">
								<p>초등학교 졸업</p>
							    </c:when>
							    <c:when test="${resumeInfo.degreeCode eq 3 }">
								<p>중학교 졸업</p>
							    </c:when>
							    <c:when test="${resumeInfo.degreeCode eq 4 }">
								<p>고등학교 졸업</p>
							    </c:when>
							    <c:when test="${resumeInfo.degreeCode eq 5 }">
								<p>대학교 2-3년제 졸업</p>
							    </c:when>
							    <c:when test="${resumeInfo.degreeCode eq 6 }">
								<p>대학교 4년제 졸업</p>
							    </c:when>
							    <c:when test="${resumeInfo.degreeCode eq 7 }">
							    <p>대학원 이상</p>
							    </c:when>
							</c:choose> --%>
		    
		  
		      <ul class="nav navbar-nav">
		     	<c:choose>
		     		<c:when test="${not empty sessionScope.loginBusinessMember }">
		     			<li><a href="${ pageContext.servletContext.contextPath }/business/main">홈</a></li>
		        		<li><a href="${ pageContext.servletContext.contextPath }/business/insertpost">공고등록</a></li>
		        		<li><a href="${ pageContext.servletContext.contextPath }/business/postlist">공고관리</a></li>
		        		<li><a href="${ pageContext.servletContext.contextPath }/business/paymentlist">결제관리</a></li>
		        		<li><a href="${ pageContext.servletContext.contextPath }/business/applicablePostlist">지원자관리</a></li>
		        		<li><a href="${ pageContext.servletContext.contextPath }/business/report">신고내역</a></li>
		        		<li><a href="#">상품안내</a></li>
		     		</c:when>
		     		<c:otherwise>
		     			<li><p style="color:white; margin-top:15px; margin-left:400px">백구 기업페이지에 오신걸 환영합니다! 기다리고 있었습니다!</p></li>
		     		</c:otherwise>
		     	</c:choose>
		        
		      </ul>
		  	
		  	<c:if test="${ empty sessionScope.loginBusinessMember }">
		  	
		      <ul class="nav navbar-nav navbar-right"> 
		        <li><a href="${ pageContext.servletContext.contextPath }/business/login">로그인</a></li>
		        <li><a href="${ pageContext.servletContext.contextPath }/business/signup">회원가입</a></li>
		      </ul>
		  	
		  	</c:if>
		  	
		  	<c:if test="${ !empty sessionScope.loginBusinessMember }">
		  	
		      <ul class="nav navbar-nav navbar-right"> 
		        <li><a href="${ pageContext.servletContext.contextPath }/business/editInfo">${ sessionScope.loginBusinessMember.CName }</a></li>
		        <li><a href="#">${ sessionScope.loginBusinessMember.bName }</a></li>
		        <li><a href="${ pageContext.servletContext.contextPath }/business/logout">로그아웃</a></li>
		      </ul>
		  	
		  	</c:if>
		  
		    </div>
		  
		  </div>
		
		</nav>
	</body>
</html>