<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>백구 기업 로그인</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
      background: darkslategrey;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      /* background-color: #f1f1f1; */
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }

    thead {
      background-color: lightgrey;
    }

    h1, h2 {
      text-align: center;
    }

    /* submit 버튼 설정 */
    .btn-submit {
      background-color: orange;
      border: orange;
      width: 150px;
      height: 50px;
      font-size: 25px;
    }

    .btn-submit:hover {
      background-color: orange;
      border: orange;
      width: 150px;
      height: 50px;
      font-size: 25px;
    }

    .btn-submit:active {
      background-color: orange;
      border: orange;
      width: 150px;
      height: 50px;
      font-size: 25px;
    }

    .btn-submit:visited {
      background-color: orange;
      border: orange;
      width: 150px;
      height: 50px;
      font-size: 25px;
    }

  .checkbox {
  margin-bottom: 30px;
  }

  /* 관리자모드 버튼 */
  .signinbutton {
  font-family: "euljiro10years";
  font-size: 25px;
  color: white;
  background-color: orange;
  border: 1px solid orange;
  padding: 10px;
  width: 200px;
  margin-bottom: 5px;
  border-radius: 5px;
  margin-left: 270px;
  }

  </style>
</head>
<body>
<c:choose>
    <c:when test="${ not empty requestScope.message }">
    		<script>alert('${ requestScope.message }')</script>
    </c:when>
</c:choose>


<jsp:include page="../common/header.jsp"/>


<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-3 sidenav">
    </div>
    <div class="col-sm-6 text-left" style="padding-top: 30px;">
      <h1 style="margin-bottom: 40px;">기업회원 로그인</h1>
    </div>

    <div class="col-sm-6 text-left">
      <div class="form-group" style="padding-top: 10px;">

      </div>
    </div>

    <div class="col-sm-6 text-left">
    
    <form id="login" action="${ pageContext.servletContext.contextPath }/business/login" method="POST">
      <div class="form-group" style="padding-top: 30px;">
        <label for="id">아이디</label>
        <input type="text" class="form-control" id="id" placeholder="아이디" name="bId">
      </div>

        <div class="form-group">
          <label for="pwd">비밀번호</label>
          <input type="password" class="form-control" id="pwd" placeholder="비밀번호" name="bPwd">
          <small id="passwordHelp" class="form-text text-muted">(대문자, 소문자 사용에 주의하세요.)</small>
        </div>
     
        <div class="form-group" style="text-align: center; padding-top: 80px; padding-bottom: 80px;">
          <input type="submit" id="bregsubmit" class="btn btn-info btn-submit" value="확인">
        </div>
        <p style="padding-right: 5px;">비밀번호가 기억나지 않으시나요?&nbsp;<a href="${ pageContext.servletContext.contextPath }/business/tochangepwd">비밀번호 찾으러 가기</a></p>
        </form>
     </div>
	<p id="result"></p>
	
	

	
	
	
  </div>
</div>

      <div class="col-sm-1 sidenav" style="height: 0px;">
      </div>

<%@ include file="../common/footer.jsp" %>

</body>
</html>
