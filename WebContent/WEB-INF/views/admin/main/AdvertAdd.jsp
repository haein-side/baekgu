<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Creative - Bootstrap 3 Responsive Admin Template">
<meta name="author" content="GeeksLabs">
<meta name="keyword"
	content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">

<title>백구 관리자페이지</title>


<link href="RESOURCES/CSS/ADMIN/bootstrap-theme.css" rel="stylesheet">


<!-- owl carousel -->
<link rel="stylesheet" href="RESOURCES/CSS/ADMIN/owl.carousel.css"
	type="text/css">
<link href="RESOURCES/CSS/ADMIN/jquery-jvectormap-1.2.2.css"
	rel="stylesheet">
<!-- Custom styles -->
<link href="RESOURCES/CSS/ADMIN/widgets.css" rel="stylesheet">
<link href="RESOURCES/CSS/ADMIN/style.css" rel="stylesheet">
<link href="RESOURCES/CSS/ADMIN/style-responsive.css" rel="stylesheet" />
<link href="RESOURCES/CSS/ADMIN/jquery-ui-1.10.4.min.css"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="../common/header.jsp" />
<c:if test="${ empty sessionScope.loginAdminName }">
		<section id="main-content">
			<section class="wrapper">
			</section>
		</section>
</c:if>
<c:if test="${ !empty sessionScope.loginAdminName }">



	<!--main content start-->
	<section id="main-content">
		<section class="wrapper">

			<!-- page start-->
			<div class="row">
				<div class="col-lg-12">
					<section class="panel">
						<header class="panel-heading tab-bg-info">
							<ul class="nav nav-tabs">
								<li class="active"><a data-toggle="tab"> 
								<i class="icon-home"></i> 광고관리
								</a></li>
							</ul>
						</header>
					</section>
						<!-- 기업정보 -->
				 <form id="feedback_form" method="post" action="${ pageContext.servletContext.contextPath }/admin/advertadd">
						<div id="profile" class="tab-pane">
							<section class="panel">
								<div class="panel-body bio-graph-info">
									<h2>광고추가</h2>
									<div class="row">
										<div class="bio-row" style="margin-top: 50px;">
											<p>광고명 :</p>
											<input type="text" name="advertName" id="advertName"></input>
										</div>
										<div class="bio-row" style="margin-top: 50px;">
											<p>광고비용 :</p>
											<input type="number" name="advertPrice" id="advertPrice" ></input>
										</div>
										<button type="submit" onclick="advertlist()" style="width: 100px; height: 50px;">
											추가하기</button>
									 </div>
								  </div>
							</section>
						</div>
					</form>
				</div>
			</div>
		</section>
		
	</section>
	 
	<script>
	/*  추가하기 클릭 시  */
           function advertlist(){
                const link = "${ pageContext.servletContext.contextPath }/admin/adverlist";
                location.href = link;
          }
    </script>
</c:if>


</body>
</html>
