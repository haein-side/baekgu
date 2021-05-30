<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>비밀번호 찾기</title>
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

    /* submi 버튼 설정 */
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
      <h1 style="margin-bottom: 40px;">비밀번호 찾기</h1>
    </div>

    <div class="col-sm-6 text-left">
      <div class="form-group" style="padding-top: 30px;">

      </div>
    </div>

    <div class="col-sm-6 text-left">
      <div class="form-group" style="padding-top: 30px;">
        <label for="userId">아이디</label>
        <input type="text" class="form-control" id="userId" placeholder="아이디" autofocus="" required="">
      </div>

      <div class="form-group">
        <label for="regnum">사업자번호</label>
        <div class="form-group row">
          <div class="col-xs-3">
            <input class="form-control" id="ex1" type="text" required="">
          </div>
          <div class="col-xs-6">
            <input class="form-control" id="ex2" type="text" required="">
          </div>
          <div class="col-xs-3">
            <input class="form-control" id="ex3" type="text" required="">
          </div>
          <small style="padding-left: 17px;">특수문자(-)를 제외한 숫자만 입력하세요.</small>
        </div>

        <div class="form-group">
          <label for="buphone">휴대폰 번호 (필수)</label>
          <div class="form-group row">
            <div class="col-xs-9">
              <input type="text" class="form-control" id="buphone" placeholder="휴대폰 번호" required="">
            </div>
            <div class="col-xs-3">
              <button type="button" class="btn-change">인증번호 요청</button>
            </div>
          </div>
          <small>특수문자(-)를 제외한 숫자만 입력하세요.</small>
        </div>

        <div class="form-group">
          <label for="cfm">인증번호 입력</label>
          <input type="text" class="form-control" id="user" placeholder="인증번호" required="">
        </div>
        
        <div class="form-group" style="text-align: center; padding-top: 80px; padding-bottom: 80px;">
          <input type="submit" id="bregsubmit" class="btn btn-info btn-submit" value="확인">
       </div>

  </div>
</div>

      </div>
      <div class="col-sm-1 sidenav">
      </div>
    </div>
  </div>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>
