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
				<a class="navbar-brand" href="#">�鱸</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="home.html">Ȩ</a></li>
					<li class="active"><a href="">������</a></li>
					<li><a href="#">�����ڰ���</a></li>
					<li><a href="#">�������</a></li>
					<li><a href="payment.html">��������</a></li>
					<li><a href="ad.html">��ǰ�ȳ�</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">ȸ���</a></li>
					<li><a href="#">����ڸ�</a></li>
					<li><a href="#">�α׾ƿ�</a></li>
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
				<h1 class="big">���� ���</h1>
				<br>
				<br>
				<br> <label style="font-size: x-large;">�λ� ����ڴ��� ������
					�Է����ּ���.</label><br>
				<hr>
				<br>
				<br> <label for="inputPassword3" style="font-size: 20px;">����������
					���� ������(�ʼ�)</label><br>
				<br> <input type="date">
				<button class="btn btn-primary dropdown-toggle" type="button"
					data-toggle="dropdown">
					�ð� ���� <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a href="#">00��</a></li>
					<li><a href="#">01��</a></li>
					<li><a href="#">02��</a></li>
					<li><a href="#">03��</a></li>
					<li><a href="#">04��</a></li>
					<li><a href="#">05��</a></li>
					<li><a href="#">06��</a></li>
					<li><a href="#">07��</a></li>
					<li><a href="#">08��</a></li>
					<li><a href="#">09��</a></li>
					<li><a href="#">10��</a></li>
					<li><a href="#">11��</a></li>
					<li><a href="#">12��</a></li>
					<li><a href="#">13��</a></li>
					<li><a href="#">14��</a></li>
					<li><a href="#">15��</a></li>
					<li><a href="#">16��</a></li>
					<li><a href="#">17��</a></li>
					<li><a href="#">18��</a></li>
					<li><a href="#">19��</a></li>
					<li><a href="#">20��</a></li>
					<li><a href="#">21��</a></li>
					<li><a href="#">22��</a></li>
					<li><a href="#">23��</a></li>
				</ul>
				<label>~</label> <input type="date">
				<button class="" type="button" data-toggle="dropdown">
					�ð� ���� <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a href="#">0��</a></li>
					<li><a href="#">01��</a></li>
					<li><a href="#">02��</a></li>
					<li><a href="#">03��</a></li>
					<li><a href="#">04��</a></li>
					<li><a href="#">05��</a></li>
					<li><a href="#">06��</a></li>
					<li><a href="#">07��</a></li>
					<li><a href="#">08��</a></li>
					<li><a href="#">09��</a></li>
					<li><a href="#">10��</a></li>
					<li><a href="#">11��</a></li>
					<li><a href="#">12��</a></li>
					<li><a href="#">13��</a></li>
					<li><a href="#">14��</a></li>
					<li><a href="#">15��</a></li>
					<li><a href="#">16��</a></li>
					<li><a href="#">17��</a></li>
					<li><a href="#">18��</a></li>
					<li><a href="#">19��</a></li>
					<li><a href="#">20��</a></li>
					<li><a href="#">21��</a></li>
					<li><a href="#">22��</a></li>
					<li><a href="#">23��</a></li>
				</ul>
				<br>
				<br>
				<hr>
				<h3>�λ� ����ڴ��� ������ �Է����ּ���.</h3>
				<br>
				<br>
				<div class="dropdown">
					<label for="inputPassword3" style="font-size: 20px;">�ӱ� ����
						���(�ʼ�)</label>
					<button class="btn btn-primary dropdown-toggle" type="button"
						data-toggle="dropdown">
						���� ��� <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="#">�ñ�</a></li>
						<li><a href="#">�ϱ�</a></li>
						<li><a href="#">����</a></li>
						<li><a href="#">����</a></li>
					</ul>
					<br>
					<br> <label style="font-size: 15px;">�޿�<input
						type="text" class="l" placeholder="��Ȯ�� �ӱ��� �����ּ���."
						style="margin-left: 100px;"></label><br>
					<br> <label for="inputPassword3" style="font-size: 20px;">�ٹ�
						���ĸ� �������ּ���. </label><br>
					<br> <label style="font-size: 20px;"><input
						type="radio" name="1" style="width: 20px; height: 20px;">&nbsp;&nbsp;��������</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label style="font-size: 20px;"><input type="radio"
						name="1" style="width: 20px; height: 20px;">&nbsp;&nbsp;������</label>
				</div>
				<br>
				<br>
				<div class="dropdown">
					<label for="inputPassword3" style="font-size: 20px;">�ٹ�����</label>
					<button class="btn btn-primary dropdown-toggle" type="button"
						data-toggle="dropdown" style="margin-left: 50px;">
						���� <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="#">������</a></li>
						<li><a href="#">ȭ����</a></li>
						<li><a href="#">������</a></li>
						<li><a href="#">�����</a></li>
						<li><a href="#">�ݿ���</a></li>
						<li><a href="#">�����</a></li>
						<li><a href="#">�Ͽ��</a></li>
					</ul>
				</div>
				<br>
				<br>
				<div class="dropdown">
					<label for="inputPassword3" style="font-size: 20px;">�ٹ��ð�</label>
					<button class="btn btn-primary dropdown-toggle" type="button"
						data-toggle="dropdown" style="margin-left: 50px;">
						���� <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="#">���Ŀ��� �ϴ� �����</a></li>
						<li><a href="#">���Ŀ��� �ϴ� �����</a></li>
						<li><a href="#">���Ŀ��� �ϴ� �����</a></li>
						<li><a href="#">���Ŀ��� �ϴ� �����</a></li>
						<li><a href="#">���Ŀ��� �ϴ� �����</a></li>
						<li><a href="#">���Ŀ��� �ϴ� �����</a></li>
						<li><a href="#">���Ŀ��� �ϴ� �����</a></li>
					</ul>
				</div>
				<br>
				<br>
				<div class="dropdown">
					<label for="inputPassword3" style="font-size: 20px;">����</label>
					<button class="btn btn-primary dropdown-toggle" type="button"
						data-toggle="dropdown" style="margin-left: 89px;">
						���� <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="#">���� ����</a></li>
						<li><a href="#">����</a></li>
						<li><a href="#">����</a></li>
					</ul>
				</div>
				<br>
				<br>
				<div class="dropdown">
					<label for="inputPassword3" style="font-size: 20px;">����</label>
					<button class="btn btn-primary dropdown-toggle" type="button"
						data-toggle="dropdown" style="margin-left: 89px;">
						���� <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="#">���� ����</a></li>
						<li><a href="#">50�� ~ 60��</a></li>
						<li><a href="#">60�� ~ 70��</a></li>
						<li><a href="#">70�� ~ 80��</a></li>
						<li><a href="#">80 �̻�</a></li>
					</ul>
				</div>
				<div align="center">
					<button type="button"
						style="width: 100px; height: 50px; font-size: 25px;"
						class="btn btn-warning">���</button>
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
