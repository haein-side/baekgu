<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <li><a href="#">공고등록</a></li>
        <li><a href="#">지원자관리</a></li>
        <li><a href="#">공고관리</a></li>
        <li><a href="payment.html">결제관리</a></li>
        <li><a href="ad.html">상품안내</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">회사명</a></li>
        <li><a href="#">담당자명</a></li>
        <li><a href="#">로그아웃</a></li>
      </ul>
    </div>
  </div>
</nav> 

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

    <div class="col-sm-6 text-left">\
    
    <form id="login" action="${ pageContext.servletContext.contextPath }/business/login" method="POST">
      <div class="form-group" style="padding-top: 30px;">
        <label for="id">아이디</label>
        <input type="text" class="form-control" id="id" placeholder="아이디" name="bId">
      </div>

        <div class="form-group">
          <label for="pwd">비밀번호</label>
          <input type="text" class="form-control" id="pwd" placeholder="비밀번호" name="bPwd">
          <small id="passwordHelp" class="form-text text-muted">영어와 숫자를 사용하여 8자리 이상 입력하세요.<br>(대문자, 소문자 사용에 주의하세요.)</small>
        </div>
     
        <div class="form-group" style="text-align: center; padding-top: 80px; padding-bottom: 80px;">
          <input type="submit" id="bregsubmit" class="btn btn-info btn-submit" value="확인">
        </div>

        <div class="buttontype">
          <input type="button" value="관리자 로그인" class="signinbutton" style="margin-top: 80px;" onclick=""/>
            <a href=""></a>
        </div>
        </form>
     </div>

  </div>
</div>

      </div>
      <div class="col-sm-1 sidenav" style="height: 0px;">
      </div>
    </div>
  </div>
<%@ include file="../common/footer2.jsp" %>

</body>
</html>
