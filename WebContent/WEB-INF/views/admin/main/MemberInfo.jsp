<jsp:directive.page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link href="RESOURCES/CSS/ADMIN/jquery-ui-1.10.4.min.css"rel="stylesheet">
<!-- <link href="RESOURCES/CSS/ADMIN/common.css"rel="stylesheet"> -->
</head>
<body style="overflow-x: hidden">
	<jsp:include page="../common/header.jsp" />

	<!--main content start-->
	<section id="main-content">
		<section class="wrapper">
			<!--overview start-->
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header">
						<i class="fa fa-laptop"></i> 회원정보
					</h3>
				</div>
			</div>
		</section>


		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<header class="panel-heading">
						이력서 리스트 <a class="btn btn-success" data-toggle="modal"
							href="#myModal" style="margin-left: 30px;"> 정상유저 모아보기 </a> <a
							class="btn btn-warning" data-toggle="modal" href="#myModal2"
							style="margin-left: 30px;"> 차단유저 모아보기 </a>
					</header>
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>유저코드</th>
									<th>이름</th>
									<th>연락처</th>
									<th>생년월일</th>
									<th>차단상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="member" items="${ requestScope.memberList }">
									<tr>
										<td><c:out value="${ member.code }" /></td>
										<td><c:out value="${ member.name }" /></td>
										<td><c:out value="${ member.phone }" /></td>
										<td><c:out value="${ member.bday }" /></td>
										<td><c:out value="${ member.block }" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

	<%-- 페이지 처리 --%>
		<div class="pagingArea" align="center">
			<c:choose>
			    <c:when test="${ empty requestScope.searchValue }">
				    <button id="startPage"><<</button>
	
					<c:if test="${ requestScope.pageInfo.pageNo <= 1 }">
						<button disabled><</button>
					</c:if>
					<c:if test="${ requestScope.pageInfo.pageNo > 1 }">
						<button id="prevPage"><</button>
					</c:if>
		
					<c:forEach var="p" begin="${ requestScope.pageInfo.startPage }" end="${ requestScope.pageInfo.endPage }" step="1">
						<c:if test="${ requestScope.pageInfo.pageNo eq p }">
							<button disabled><c:out value="${ p }"/></button>
						</c:if>
						<c:if test="${ requestScope.pageInfo.pageNo ne p }">
							<button onclick="pageButtonAction(this.innerText);"><c:out value="${ p }"/></button>
						</c:if>
					</c:forEach>
					
					<c:if test="${ requestScope.pageInfo.pageNo >= requestScope.pageInfo.maxPage }">
						<button disabled>></button>
					</c:if>
					<c:if test="${ requestScope.pageInfo.pageNo < requestScope.pageInfo.maxPage }">
						<button id="nextPage">></button>
					</c:if>
					
					<button id="maxPage">>></button> 
			     </c:when>
			    <c:otherwise>
   				    <button id="searchStartPage"><<</button>
	
					<c:if test="${ requestScope.pageInfo.pageNo <= 1 }">
						<button disabled><</button>
					</c:if>
					<c:if test="${ requestScope.pageInfo.pageNo > 1 }">
						<button id="searchPrevPage"><</button>
					</c:if>
		
					<c:forEach var="p" begin="${ requestScope.pageInfo.startPage }" end="${ requestScope.pageInfo.endPage }" step="1">
						<c:if test="${ requestScope.pageInfo.pageNo eq p }">
							<button disabled><c:out value="${ p }"/></button>
						</c:if>
						<c:if test="${ requestScope.pageInfo.pageNo ne p }">
							<button onclick="seachPageButtonAction(this.innerText);"><c:out value="${ p }"/></button>
						</c:if>
					</c:forEach>
					
					<c:if test="${ requestScope.pageInfo.pageNo >= requestScope.pageInfo.maxPage }">
						<button disabled>></button>
					</c:if>
					<c:if test="${ requestScope.pageInfo.pageNo < requestScope.pageInfo.maxPage }">
						<button id="searchNextPage">></button>
					</c:if>
					
					<button id="searchMaxPage">>></button> 
			    </c:otherwise>
			</c:choose>   

							<!-- 검색 폼 -->
		<form id="loginForm" action="${ pageContext.servletContext.contextPath }/board/search" method="get">		
			<div class="search-area" align="center">
				<c:choose>
				    <c:when test="${ !empty requestScope.searchValue }">
   					    <select id="searchCondition" name="searchCondition">
							<option value="name" <c:if test="${requestScope.searchCondition eq 'name'}">selected</c:if>>이름</option>
							<option value="code" <c:if test="${requestScope.searchCondition eq 'code'}">selected</c:if>>유저코드</option>
							<option value="yaer" <c:if test="${requestScope.searchCondition eq 'year'}">selected</c:if>>생년월일(년도)</option>
							<option value="month" <c:if test="${requestScope.searchCondition eq 'month'}">selected</c:if>>생년월일(월)</option>
							<option value="day" <c:if test="${requestScope.searchCondition eq 'day'}">selected</c:if>>생년월일(일)</option>
						</select>
				        <input type="search" id="searchValue" name="searchValue" value="${ requestScope.searchValue }">
				    </c:when>
				    <c:otherwise>
					    <select id="searchCondition" name="searchCondition">
							<option value="category">이름</option>
							<option value="writer">유저코드</option>
							<option value="content">생일(년도)</option>
							<option value="content">생일(월)</option>
						</select>
				        <input type="search" id="searchValue" name="searchValue" >
				    </c:otherwise>
				</c:choose>
				<button type="submit">검색하기</button>
				<c:if test="${ !empty requestScope.loginMember }">
					<button id="writeBoard">작성하기</button>
				</c:if>
			</div>
		</form>
		<script>
		const link = "${ pageContext.servletContext.contextPath }/admin/memberList";
		const searchLink = "${ pageContext.servletContext.contextPath }/board/search";
			
		if(document.getElementById("startPage")) {
			const $startPage = document.getElementById("startPage");
			$startPage.onclick = function() {
				location.href = link + "?currentPage=1";
			}
		}
		
		if(document.getElementById("prevPage")) {
			const $prevPage = document.getElementById("prevPage");
			$prevPage.onclick = function() {
				location.href = link + "?currentPage=${ requestScope.pageInfo.pageNo - 1 }";
			}
		}
		
		if(document.getElementById("nextPage")) {
			const $nextPage = document.getElementById("nextPage");
			$nextPage.onclick = function() {
				location.href = link + "?currentPage=${ requestScope.pageInfo.pageNo + 1 }";
			}
		}
		
		if(document.getElementById("maxPage")) {
			const $maxPage = document.getElementById("maxPage");
			$maxPage.onclick = function() {
				location.href = link + "?currentPage=${ requestScope.pageInfo.maxPage }";
			}
		}
		
		if(document.getElementById("searchStartPage")) {
			const $searchStartPage = document.getElementById("searchStartPage");
			$searchStartPage.onclick = function() {
				location.href = searchLink + "?currentPage=1&searchCondition=${ requestScope.searchCondition}&searchValue=${ requestScope.searchValue}";
			}
		}
		
		if(document.getElementById("searchPrevPage")) {
			const $searchPrevPage = document.getElementById("searchPrevPage");
			$searchPrevPage.onclick = function() {
				location.href = searchLink + "?currentPage=${ requestScope.pageInfo.pageNo - 1 }&searchCondition=${ requestScope.searchCondition}&searchValue=${ requestScope.searchValue}";
			}
		}
		
		if(document.getElementById("searchNextPage")) {
			const $searchNextPage = document.getElementById("searchNextPage");
			$searchNextPage.onclick = function() {
				location.href = searchLink + "?currentPage=${ requestScope.pageInfo.pageNo + 1 }&searchCondition=${ requestScope.searchCondition}&searchValue=${ requestScope.searchValue}";
			}
		}
		
		if(document.getElementById("searchMaxPage")) {
			const $searchMaxPage = document.getElementById("searchMaxPage");
			$searchMaxPage.onclick = function() {
				location.href = searchLink + "?currentPage=${ requestScope.pageInfo.maxPage }&searchCondition=${ requestScope.searchCondition}&searchValue=${ requestScope.searchValue}";
			}
		}
		
		if(document.getElementsByTagName("td")) {
			
			const $tds = document.getElementsByTagName("td");
			for(let i = 0; i < $tds.length; i++) {
				
				$tds[i].onmouseenter = function() {
					this.parentNode.style.cursor = "pointer";
				}
				
				
				$tds[i].onclick = function() {
					/* 게시물 번호까지 알아왔으니 이제 상세보기는 할 수 있겠지? */
					alert(this.parentNode.children[0].innerText);
				}
				
			}
			
		} 
		
		function pageButtonAction(text) {
			location.href = link + "?currentPage=" + text;
		}
		function seachPageButtonAction(text) {
			location.href = searchLink + "?currentPage=" + text + "&searchCondition=${ requestScope.searchCondition}&searchValue=${ requestScope.searchValue}";
		}
	</script>
</section>
</section>


				<!-- javascripts -->
				<script src="RESOURCES/JS/ADMIN/jquery.js"></script>
				<script src="RESOURCES/JS/ADMIN/jquery-ui-1.10.4.min.js"></script>
				<script src="RESOURCES/JS/ADMIN/jquery-1.8.3.min.js"></script>
				<script type="text/javascript"
					src="RESOURCES/JS/ADMIN/jquery-ui-1.9.2.custom.min.js"></script>
				<!-- bootstrap -->
				<script src="RESOURCES/JS/ADMIN/bootstrap.min.js"></script>
				<!-- nice scroll -->
				<script src="RESOURCES/JS/ADMIN/jquery.scrollTo.min.js"></script>
				<script src="RESOURCES/JS/ADMIN/jquery.nicescroll.js"
					type="text/javascript"></script>
				<!-- charts scripts -->
				<script src="RESOURCES/JS/ADMIN/jquery.sparkline.js"
					type="text/javascript"></script>
				<script src="RESOURCES/JS/ADMIN/owl.carousel.js"></script>
				<!-- jQuery full calendar -->
				<script src="RESOURCES/JS/ADMIN/fullcalendar.min.js"></script>
				<!-- Full Google Calendar -
        Calendar -->
				<script src="RESOURCES/JS/ADMIN/jquery.rateit.min.js"></script>
				<!-- custom select -->
				<script src="RESOURCES/JS/ADMIN/jquery.customSelect.min.js"></script>
				<script src="RESOURCES/JS/ADMIN/scripts.js"></script>
				<!-- custom script for this page-->
				<script src="RESOURCES/JS/ADMIN/sparkline-chart.js"></script>
				<script src="RESOURCES/JS/ADMIN/easy-pie-chart.js"></script>
				<script src="RESOURCES/JS/ADMIN/jquery-jvectormap-1.2.2.min.js"></script>
				<script src="RESOURCES/JS/ADMIN/jquery-jvectormap-world-mill-en.js"></script>
				<script src="RESOURCES/JS/ADMIN/jquery.autosize.min.js"></script>
				<script src="RESOURCES/JS/ADMIN/jquery.placeholder.min.js"></script>
				<script src="RESOURCES/JS/ADMIN/gdp-data.js"></script>
				<script src="RESOURCES/JS/ADMIN/morris.min.js"></script>
				<script src="RESOURCES/JS/ADMIN/sparklines.js"></script>
				<script src="RESOURCES/JS/ADMIN/charts.js"></script>
				<script src="RESOURCES/JS/ADMIN/jquery.slimscroll.min.js"></script>
				<script> //knob $(function() {
        $(".knob").knob({ 'draw': function() { $(this.i).val(this.cv + '%') } }) });
        //carousel $(document).ready(function() { $("#owl-slider").owlCarousel({
        navigation: true, slideSpeed: 300, paginationSpeed: 400, singleItem: true });
        }); //custom select box $(function() { $('select.styled').customSelect(); }); /*
        ---------- Map ---------- */ $(function() { $('#map').vectorMap({ map:
        'world_mill_en', series: { regions: [{ values: gdpData, scale: ['#000', '#000'],
        normalizeFunction: 'polynomial' }] }, backgroundColor: '#eef3f7', onLabelShow:
        function(e, el, code) { el.html(el.html() + ' (GDP - ' + gdpData[code] + ')'); }
        }); }); </script>
</body>
</html>
