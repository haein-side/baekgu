<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
	background: darkslategrey;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 450px
}

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
	.row.content {
		height: auto;
	}
}

@font-face {
	src: url("../fonts/BMEuljiro10yearslater.ttf");
	font-family: "jua";
}

h1 {
	font-family: "jua";
}
</style>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">백구</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="home.html">홈</a></li>
					<li class="active"><a href="">공고등록</a></li>
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
	<form>
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-3 sidenav"></div>
			<div class="col-sm-6 text-left">
				<br>
				<br>
				<br>
				<h1 class="big">공고 등록</h1>
				<br>
				<br>
				<br> <label style="font-size: x-large;">인사 담당자님의 정보를
					입력해주세요.</label><br>
				<hr>
				<br>
				<br> <label for="inputPassword3" style="font-size: 20px;">모집시작일
					모집 마감일(필수)</label><br>
				<br> <input type="date">
				<button class="btn btn-primary dropdown-toggle" type="button"
					data-toggle="dropdown">
					시간 선택 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a href="#">00시</a></li>
					<li><a href="#">01시</a></li>
					<li><a href="#">02시</a></li>
					<li><a href="#">03시</a></li>
					<li><a href="#">04시</a></li>
					<li><a href="#">05시</a></li>
					<li><a href="#">06시</a></li>
					<li><a href="#">07시</a></li>
					<li><a href="#">08시</a></li>
					<li><a href="#">09시</a></li>
					<li><a href="#">10시</a></li>
					<li><a href="#">11시</a></li>
					<li><a href="#">12시</a></li>
					<li><a href="#">13시</a></li>
					<li><a href="#">14시</a></li>
					<li><a href="#">15시</a></li>
					<li><a href="#">16시</a></li>
					<li><a href="#">17시</a></li>
					<li><a href="#">18시</a></li>
					<li><a href="#">19시</a></li>
					<li><a href="#">20시</a></li>
					<li><a href="#">21시</a></li>
					<li><a href="#">22시</a></li>
					<li><a href="#">23시</a></li>
				</ul>
				<label>~</label> <input type="date">
				<button class="" type="button" data-toggle="dropdown">
					시간 선택 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a href="#">0시</a></li>
					<li><a href="#">01시</a></li>
					<li><a href="#">02시</a></li>
					<li><a href="#">03시</a></li>
					<li><a href="#">04시</a></li>
					<li><a href="#">05시</a></li>
					<li><a href="#">06시</a></li>
					<li><a href="#">07시</a></li>
					<li><a href="#">08시</a></li>
					<li><a href="#">09시</a></li>
					<li><a href="#">10시</a></li>
					<li><a href="#">11시</a></li>
					<li><a href="#">12시</a></li>
					<li><a href="#">13시</a></li>
					<li><a href="#">14시</a></li>
					<li><a href="#">15시</a></li>
					<li><a href="#">16시</a></li>
					<li><a href="#">17시</a></li>
					<li><a href="#">18시</a></li>
					<li><a href="#">19시</a></li>
					<li><a href="#">20시</a></li>
					<li><a href="#">21시</a></li>
					<li><a href="#">22시</a></li>
					<li><a href="#">23시</a></li>
				</ul>
				<br>
				<br>
				<hr>
				<h3>인사 담당자님의 정보를 입력해주세요.</h3>
				<br>
				<br>
				<div class="dropdown">
					<label for="inputPassword3" style="font-size: 20px;">임금 지급
						방법(필수)</label>
					<button class="btn btn-primary dropdown-toggle" type="button"
						data-toggle="dropdown">
						지급 방법 <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="#">시급</a></li>
						<li><a href="#">일급</a></li>
						<li><a href="#">월급</a></li>
						<li><a href="#">연봉</a></li>
					</ul>
					<br>
					<br> <label style="font-size: 15px;">급여<input
						type="text" class="l" placeholder="정확한 임금을 적어주세요."
						style="margin-left: 100px;"></label><br>
					<br> <label for="inputPassword3" style="font-size: 20px;">근무
						형식를 선택해주세요. </label><br>
					<br> <label style="font-size: 20px;"><input
						type="radio" name="1" style="width: 20px; height: 20px;">&nbsp;&nbsp;비정규직</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label style="font-size: 20px;"><input type="radio"
						name="1" style="width: 20px; height: 20px;">&nbsp;&nbsp;정규직</label>
				</div>
				<br>
				<br>
				<div class="dropdown">
					<label for="inputPassword3" style="font-size: 20px;">근무요일</label>
					<button class="btn btn-primary dropdown-toggle" type="button"
						data-toggle="dropdown" style="margin-left: 50px;">
						선택 <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="#">월요일</a></li>
						<li><a href="#">화요일</a></li>
						<li><a href="#">수요일</a></li>
						<li><a href="#">목요일</a></li>
						<li><a href="#">금요일</a></li>
						<li><a href="#">토요일</a></li>
						<li><a href="#">일요알</a></li>
					</ul>
				</div>
				<br>
				<br>
				<div class="dropdown">
					<label for="inputPassword3" style="font-size: 20px;">근무시간</label>
					<button class="btn btn-primary dropdown-toggle" type="button"
						data-toggle="dropdown" style="margin-left: 50px;">
						선택 <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="#">오후오전 일단 만들어</a></li>
						<li><a href="#">오후오전 일단 만들어</a></li>
						<li><a href="#">오후오전 일단 만들어</a></li>
						<li><a href="#">오후오전 일단 만들어</a></li>
						<li><a href="#">오후오전 일단 만들어</a></li>
						<li><a href="#">오후오전 일단 만들어</a></li>
						<li><a href="#">오후오전 일단 만들어</a></li>
					</ul>
				</div>
				<br>
				<br>
				<div class="dropdown">
					<label for="inputPassword3" style="font-size: 20px;">성별</label>
					<button class="btn btn-primary dropdown-toggle" type="button"
						data-toggle="dropdown" style="margin-left: 89px;">
						선택 <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="#">성별 무관</a></li>
						<li><a href="#">남자</a></li>
						<li><a href="#">여자</a></li>
					</ul>
				</div>
				<br>
				<br>
				<div class="dropdown">
					<label for="inputPassword3" style="font-size: 20px;">연령</label>
					<button class="btn btn-primary dropdown-toggle" type="button"
						data-toggle="dropdown" style="margin-left: 89px;">
						선택 <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="#">연령 무관</a></li>
						<li><a href="#">50세 ~ 60세</a></li>
						<li><a href="#">60세 ~ 70세</a></li>
						<li><a href="#">70세 ~ 80세</a></li>
						<li><a href="#">80 이상</a></li>
					</ul>
				</div>
				<div align="center">
					<button type="button"
						style="width: 100px; height: 50px; font-size: 25px;"
						class="btn btn-warning">등록</button>
				</div>
			</div>
		</div>
		<div class="col-sm-3 sidenav"></div>
	</div>
	<footer class="container-fluid text-center">
		<p>Footer Text</p>
	</footer>
</body>
</html>
