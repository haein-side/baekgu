<jsp:directive.page language="java"
   contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
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


<link
	href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/ADMIN/bootstrap-theme.css"
	rel="stylesheet">


<!-- owl carousel -->
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/ADMIN/owl.carousel.css"
	type="text/css">
<link
	href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/ADMIN/jquery-jvectormap-1.2.2.css"
	rel="stylesheet">
<!-- Custom styles -->
<link
	href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/ADMIN/widgets.css"
	rel="stylesheet">
<link
	href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/ADMIN/style.css"
	rel="stylesheet">
<link
	href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/ADMIN/style-responsive.css"
	rel="stylesheet" />
<link
	href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/ADMIN/jquery-ui-1.10.4.min.css"
	rel="stylesheet">

</head>

<body>
<jsp:include page="../common/header.jsp"/>


		<!--main content start-->
		<section id="main-content">
			<section class="wrapper">
				<!--overview start-->
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header">
							<i class="fa fa-laptop"></i> 관리자 및 직원 관리
						</h3>

					</div>
				</div>
			</section>

			<div class="row">
				<div class="col-lg-12">
					<section class="panel">
						<header class="panel-heading">
							관리자 및 직원 관리
							<button class="btn btn-success" style="margin-left: 30px;"
								type="button" onClick="Registration()">등록하기</button>
							<a class="btn btn-warning" data-toggle="modal" href="#myModal2"
								style="margin-left: 30px;"> 삭제하기 </a>
						</header>
						<div class="table-responsive">
							<table align="center" class="table">
								<thead>
									<tr>
										<th></th>
										<th>아이디</th>
										<th>비밀번호</th>
										<th>이름</th>
										<th>이메일</th>
										<th>등록일</th>
										<th>권한</th>
									</tr>
								</thead>
								<tbody>


						<!-- 배열, Collection 또는 Map에 저장되어 있는 값들을 순차적으로 처리할 때 사용  -->
                           <c:forEach var="admin" items="${ requestScope.adminList }">
                              <tr>
                              	 <th><input type="checkbox" id="checkAll"></th>
                                 <td><c:out value="${ admin.adminId }"/></td>
                                 <td><c:out value="${ admin.adminPwd }" /></td>
                                 <td><c:out value="${ admin.adminName }" /></td>
                                 <td><c:out value="${ admin.adminEmail }" /></td>
                                 <td><c:out value="${ admin.adminDate }" /></td>
                                 <td><c:out value="${ admin.adminRole }" /></td>
                              </tr>
                           </c:forEach>
									
								

							</table>
						</div>

						<!--하단 페이지 넘기기-->
						<section class="panel">
							<div class="panel-body">
								<div class="text-center">
									<%-- 페이지 처리 (분기처리한 것) --%>
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

												<!-- 반복 start페이지, end페이지 12345 하고 678910 넘어가게하려고 ->
					<c:forEach var="p" begin="${ requestScope.pageInfo.startPage }" end="${ requestScope.pageInfo.endPage }" step="1">
						<c:if test="${ requestScope.pageInfo.pageNo eq p }">
							<button disabled><c:out value="${ p }"/></button>
						</c:if>
						<!-- 분기처리한 이유는 버튼 페이지 색깔 바꿀려고 한거임.  -->
												<c:if test="${ requestScope.pageInfo.pageNo ne p }">
													<button onclick="pageButtonAction(this.innerText);">
														<c:out value="${ p }" />
													</button>
												</c:if>
												</c:forEach>

												<!-- max페이지에 대한 내용  -->
												<c:if
													test="${ requestScope.pageInfo.pageNo >= requestScope.pageInfo.maxPage }">
													<button disabled>></button>
												</c:if>
												<c:if
													test="${ requestScope.pageInfo.pageNo < requestScope.pageInfo.maxPage }">
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

												<c:forEach var="p"
													begin="${ requestScope.pageInfo.startPage }"
													end="${ requestScope.pageInfo.endPage }" step="1">
													<c:if test="${ requestScope.pageInfo.pageNo eq p }">
														<button disabled>
															<c:out value="${ p }" />
														</button>
													</c:if>
													<c:if test="${ requestScope.pageInfo.pageNo ne p }">
														<button onclick="seachPageButtonAction(this.innerText);">
															<c:out value="${ p }" />
														</button>
													</c:if>
												</c:forEach>

												<c:if
													test="${ requestScope.pageInfo.pageNo >= requestScope.pageInfo.maxPage }">
													<button disabled>></button>
												</c:if>
												<c:if
													test="${ requestScope.pageInfo.pageNo < requestScope.pageInfo.maxPage }">
													<button id="searchNextPage">></button>
												</c:if>

												<button id="searchMaxPage">>></button>
											</c:otherwise>
										</c:choose>
									</div>
										</div>
									<!--  검색창  -->
									<ul class="nav top-menu" style="float: right;">
										<li>
											<form class="navbar-form">
												<input class="form-control" placeholder="Search" type="text">
												<button type="submit" class="btn btn-primary">검색하기</button>
											</form>
										</li>
									</ul>
						</section>
					</section>
		</section>

<!--  등록하기 버튼 클릭 시  -->
      <script>
           function Registration(){
                const link = "${ pageContext.servletContext.contextPath }/admin/signup";
                location.href = link;
          }
     </script>


	<script>
		const link = "${ pageContext.servletContext.contextPath }/admin/search";
	

		if (document.getElementById("startPage")) {
			const $startPage = document.getElementById("startPage");
			$startPage.onclick = function() {
				location.href = link + "?currentPage=1";
			}
		}

		if (document.getElementById("prevPage")) {
			const $prevPage = document.getElementById("prevPage");
			$prevPage.onclick = function() {
				location.href = link
						+ "?currentPage=${ requestScope.pageInfo.pageNo - 1 }";
			}
		}

		if (document.getElementById("nextPage")) {
			const $nextPage = document.getElementById("nextPage");
			$nextPage.onclick = function() {
				location.href = link
						+ "?currentPage=${ requestScope.pageInfo.pageNo + 1 }";
			}
		}

		if (document.getElementById("maxPage")) {
			const $maxPage = document.getElementById("maxPage");
			$maxPage.onclick = function() {
				location.href = link
						+ "?currentPage=${ requestScope.pageInfo.maxPage }";
			}
		}

		if (document.getElementById("searchStartPage")) {
			const $searchStartPage = document.getElementById("searchStartPage");
			$searchStartPage.onclick = function() {
				location.href = searchLink
						+ "?currentPage=1&searchCondition=${ requestScope.searchCondition}&searchValue=${ requestScope.searchValue}";
			}
		}

		if (document.getElementById("searchPrevPage")) {
			const $searchPrevPage = document.getElementById("searchPrevPage");
			$searchPrevPage.onclick = function() {
				location.href = searchLink
						+ "?currentPage=${ requestScope.pageInfo.pageNo - 1 }&searchCondition=${ requestScope.searchCondition}&searchValue=${ requestScope.searchValue}";
			}
		}

		if (document.getElementById("searchNextPage")) {
			const $searchNextPage = document.getElementById("searchNextPage");
			$searchNextPage.onclick = function() {
				location.href = searchLink
						+ "?currentPage=${ requestScope.pageInfo.pageNo + 1 }&searchCondition=${ requestScope.searchCondition}&searchValue=${ requestScope.searchValue}";
			}
		}

		if (document.getElementById("searchMaxPage")) {
			const $searchMaxPage = document.getElementById("searchMaxPage");
			$searchMaxPage.onclick = function() {
				location.href = searchLink
						+ "?currentPage=${ requestScope.pageInfo.maxPage }&searchCondition=${ requestScope.searchCondition}&searchValue=${ requestScope.searchValue}";
			}
		}

		
		/* td태그 안에 상세 보기 용 '/admin/adminid?id' 경로 지정  */
		if (document.getElementsByTagName("td")) {

			const $tds = document.getElementsByTagName("td");
			for (let i = 0; i < $tds.length; i++) {

				$tds[i].onclick = function() {
	
					location.href = "${ pageContext.servletContext.contextPath }/admin/adminid?id=" + this.parentNode.children[1].innerText;
				}

			}

		}
		
		

		function pageButtonAction(text) {
			location.href = link + "?currentPage=" + text;
		}
		function seachPageButtonAction(text) {
			location.href = searchLink
					+ "?currentPage="
					+ text
					+ "&searchCondition=${ requestScope.searchCondition}&searchValue=${ requestScope.searchValue}";
		}
	</script>

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
