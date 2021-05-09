<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
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
        <li class="active"><a href="home.html">홈</a></li>
        <li><a href="addad.html">공고등록</a></li>
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
    <div class="col-sm-6 text-left">
        <div> 
        <br><br><br>
        <h1> <img src="../resources/images/cat.jpg" style="width :200px; height: 200px; ">기업 이름이 들어갈 것입니당<div class=""></div></h1>
        <ul style="padding-left: 25px;">
          <li style="font-size: 15px;">백구백구백구백구백구백구백구백구백구백구백구백구백구백구백구백구백구백구.</li>
          <li><p style="color: red; font-size: 15px;"><b>[주의]</b> 유료 상품을 이용 중이신 경우, 광고를 조기 마감하더라도 남은 기간에 대한 차액은 환불되지 않습니다.</p></li>
          </ul>
          <br><br><br><br>
       </div>
       <div>
        <div style="background-color: orange; width: 600px; height: 600px;  float: left;">
          <div style="width: 40%; height: 100%; background-color: orange; float: left;" align="center">
            <br><br><br><br><br><br><br>
            <h3>진행중 공고</h3>
            <span style="font-size: xx-large;">n</span><label>건</label><br>
            <button>전체보기</button>
          </div>
          <div style="width: 40%; height: 100%; background-color: orange; float: left;" align="CENTER">
            <br><br><br><br><br><br><br><br>
            <h4>공고 제목</h4>
            <h4>업무 내용</h4>
          </div>
        </div>
        <div style="background-color: orange; width: 200px; height: 600px;  float: left; border: 1px solid black;">
          <div style="background-color: orange; width: 100%; height: 25%; border: 1px solid black; " align="center">
            <h3> 공고 등록</h3>
            <P> 공고를 등록해 원하는 사람들을 만나보세요!</P>
            <button>여기를 눌러라</button>
          </div>
          <div style="background-color: orange; width: 100%; height: 25%; border: 1px solid black;"  align="center">
            <h3>지원자 관리</h3>
            <p> 당신의 기업을 원하는 사람들을 만나보세요!</p>
            <button>여기를 눌러라</button>
          </div>
          <div style="background-color: orange; width: 100%; height: 25%; border: 1px solid black;"  align="center">
            <h3>공고 관리</h3>
            <p>등록 하신 공고를 한눈에 보세요!</p>
            <button>여기를 눌러라</button>
          </div>
          <div style="background-color: orange; width: 100%; height: 25%; border: 1px solid black;"  align="center">
            <h3>결제 관리</h3>
            <p>돈을 주면 더 잘 꾸며줘요!</p>
            <button>여기를 눌러라</button>
          </div>

        </div>
       </div>
    </div>
    <div class="col-sm-3 sidenav">
    </div>
  </div>
</div>
<br><br><br>
      <div class="col-sm-1 sidenav">
      </div>
    </div>
  </div>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>
