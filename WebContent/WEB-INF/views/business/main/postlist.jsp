<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
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
        <li><a href="home.html">홈</a></li>
        <li><a href="#">공고등록</a></li>
        <li><a href="#">지원자관리</a></li>
        <li class="active"><a href="#">공고관리</a></li>
        <li ><a href="payment.html">결제관리</a></li>
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
  
<div class="container-fluid text-center" style="padding-left: 0%;">    
  <div class="row content" style="height: auto;">
    <div class="col-sm-1 sidenav">
    </div>
    <div class="col-sm-10 text-left"> 
      <h1>공고관리</h1>
      <ul style="padding-left: 25px;">
        <li> 해당 공고의 지원자 정보를 보시려면 '상세보기' 버튼을 눌러주세요</li>
        <li> 대기 목록에는 미승인 공고 또는 게시되지 않은 공고가 표시됩니다 </li>
        <li> 진행중인 공고는 수정이 불가능합니다</li>
        <li> 마감된 공고는 연장버튼을 통해 재등록 할 수 있습니다</li>
      </ul>
      <hr>
      <!-- <h3>Test</h3>
      <p>Lorem ipsum...</p> -->
      <div class="btn-group btn-group-justified">
        <a href="#" class="btn btn-primary active">전체 (n건)</a>
        <a href="#" class="btn btn-primary">대기 (n건)</a>
        <a href="#" class="btn btn-primary">반려 (n건)</a>
        <a href="#" class="btn btn-primary">진행 (n건)</a>
        <a href="#" class="btn btn-primary">마감 (n건)</a>
      </div>
       
      <br>
      <br>

        
        <table class="table table-bordered">
          <thead>
            <tr>
              <th>공고제목</th>
              <th>상품구매</th>
              <th>공고기간</th>
              <th>공고등록일</th>
              <th>공고업종</th>
              <th>지원자수</th>
              <th>승인여부</th>
            </tr>
          </thead>

          <!-- for-loop 을 이용하여 공고 리스트 출력 -->
          <tbody>
            <tr>
              <td>백앤드 자바 개발자를 구합니다</td>
              <td style="text-align: center;"> 미구매 <input type="button" value="구매하러가기"/></td>
              <td>시작일 : 2021-02-10<br>마감일 : 2021-02-20</td>
              <td>2021-02-08</td>
              <td>IT</td>
              <td style="text-align: center;">12 <input type="button" value="상세보기"/></td>
              <td><a href="#">반려</a></td>

            </tr>
          </tbody>
          <!-- for loop 끝-->
        </table>
        

      <br>
      <br>
      <div class="text-center">
        <ul class="pagination"  align="center">
          <li><a href="#">1</a></li>
          <li><a href="#">2</a></li>
          <li><a href="#">3</a></li>
          <li><a href="#">4</a></li>
          <li><a href="#">5</a></li>
        </ul>
      </div>

   

  </div>



  <div class="col-sm-1 sidenav">
  </div>
</div>

<footer class="container-fluid text-center">
  <!-- <footer class="footer navbar-fixed-bottom text-center"> -->
  <!-- <div class="footer fixed-bottom"> -->
    <p>Footer Text</p>

  <!-- </div> -->
</footer>

</body>
</html>
