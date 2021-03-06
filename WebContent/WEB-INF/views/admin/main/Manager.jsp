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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
	<jsp:include page="../common/header.jsp" />
	<c:if test="${ empty sessionScope.loginAdminName }">
		<section id="main-content">
			<section class="wrapper"></section>
		</section>
	</c:if>
	<c:if test="${ !empty sessionScope.loginAdminName }">



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
							관리자 및 직원관리
							<c:if test="${ sessionScope.adminRole eq '대표관리자' }">
								<button class="btn btn-success" id="btnsubmit"
									style="margin-left: 30px;" type="button"
									onClick="Registration()">등록하기</button>

								<button class="btn btn-warning" id="btnDelete"
									data-toggle="modal" type="button" onClick="deleteClick()"
									style="margin-left: 30px;">삭제하기</button>
							</c:if>
						</header>
						<div class="table-responsive">
							<table align="center" class="table">
								<thead>
									<tr>
										<th></th>
										<th>아이디</th>
										<!-- 	<th>비밀번호</th> -->
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
											<th><input class="check" type="checkbox"
												id="${admin.adminId }" onClick="checkClick(this)"></th>
											<td><c:out value="${ admin.adminId }" /></td>
											<%-- 	<td><c:out value="${ admin.adminPwd }" /></td> --%>
											<td><c:out value="${ admin.adminName }" /></td>
											<td><c:out value="${ admin.adminEmail }" /></td>
											<td><c:out value="${ admin.adminDate }" /></td>
											<td><c:out value="${ admin.adminRole }" /></td>
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

										<c:forEach var="p"
											begin="${ requestScope.pageInfo.startPage }"
											end="${ requestScope.pageInfo.endPage }" step="1">
											<c:if test="${ requestScope.pageInfo.pageNo eq p }">
												<button disabled>
													<c:out value="${ p }" />
												</button>
											</c:if>
											<c:if test="${ requestScope.pageInfo.pageNo ne p }">
												<button onclick="pageButtonAction(this.innerText);">
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


										<!-- 검색 폼 -->
										<form id="loginForm"
											action="${ pageContext.servletContext.contextPath }/admin/adminsearch"
											method="get">
											<div class="search-area" align="center">
												<c:choose>
													<c:when test="${ !empty requestScope.searchValue }">
														<!-- 검색 카테고리  -->
														<!-- name으로 키값을 전달한다. -->
														<select id="searchSelect" name="searchSelect">
															<option value="adminId"
																<c:if test="${requestScope.searchCondition eq 'adminId'}">selected</c:if>>아이디</option>
															<option value="adminName"
																<c:if test="${requestScope.searchCondition eq 'adminName'}">selected</c:if>>이름</option>
														</select>
														<!-- 입력한 값 , name으로 키값을 전달한다.  -->
														<input type="search" id="searchInput" name="searchInput"
															value="${ requestScope.searchValue }">
													</c:when>
													<c:otherwise>
														<select id="searchSelect" name="searchSelect">
															<option value="adminId">아이디</option>
															<option value="adminName">이름</option>
														</select>
														<!-- 어떤 검색을 했는지 넘겨주는 것   -->
														<input type="search" id="searchInput" name="searchInput">
													</c:otherwise>
												</c:choose>
												<button type="submit">검색하기</button>
												<c:if test="${ !empty requestScope.loginMember }">
													<button id="writeBoard">작성하기</button>
												</c:if>
											</div>
										</form>
									</div>
						</section>
					</section>
		</section>



		<script>
			/*  등록하기 버튼 클릭 시  */
			function Registration() {
				const link = "${ pageContext.servletContext.contextPath }/admin/signup";
				location.href = link;
			}
		</script>

		<script>
			/* 삭제하기 버튼 클릭했을 시   -> 삭제하기할 때도 delete컨트롤러로 가는게 맞나 ?*/
			function deleteClick() {
				$.ajax({
					url : "${ pageContext.servletContext.contextPath }/admin/admindelete",
					data : {
						isDelete : true
					},
					type : "post",
					success : function(data, textStatus, xhr) {
						console.log(xhr);
						if (xhr.responseText == "refresh") {
							location.reload(true)
						} else if (xhr.responseText == "error") {
							console.log("error")
							location.reload(true)
						}

					},
					error : function(xhr, status, error) {
						console.log(error);
					}

				});
			}
		</script>

		<script>
			/*  체크박스 클릭 했을 시  */
			function checkClick(checkBox) {
				$.ajax({
					url : "${ pageContext.servletContext.contextPath }/admin/admindelete",
					data : {
						sendData : checkBox.checked,
						adminId : checkBox.id,
						isDelete : false
					},
					type : "post",
					success : function(data, textStatus, xhr) {
						console.log(data);
					},
					error : function(xhr, status, error) {
						console.log(error);
					}

				});
			}
		</script>



		<!--  	/* 체크박스 삭제하기 눌렀을 때 삭제되도록 하는 것  */
	/*	window.onload = function() {
			var deleteManager = document.getElementById("btnDelete");
			deleteManager.onclick = function() {
				// 1. check박스 중에 체크된 값을 일단 찾아온다
				var chkBtn = document.getElementsByClassName("check");
				// 여기서부터 체크된값을 뭘로 구분할지 일단 찾자
				// htmlColloction[0] -> length 
				var adminDelete = '';
				// 배열로 하려다가 복잡해져서 다른 방향으로감.   var adminDelete = new Array(); , adminDelete[i] = 
				for (var i = 0; i < chkBtn.length; i++) {
					if (chkBtn[i].checked) {
						// 체크됐을 때 삭제되게 할거고, 필요한 값이 무엇 ? -> id 
						// id가 체크되었을 때 체크가되
						어있으면 체크되어있는 값 중에서 같은 위치에 있는 id를 가져오려면 어떻게 해야돼 ? 
					    // += 를 넣었을까 ? ',' 왜 ?? 
						adminDelete +=  chkBtn[i].parentElement.parentElement.children[1].innerText + ",";
					}
				}
				///////////////////////////////////////////
				// 2. 그리고 필요한 값을 보내준다. 
				// AJAX하자
				$.ajax({
					url: "/baekgu/admin/admindelete",
					data: { sendData : adminDelete },
					type: "post",
					success: function(data,textStatus,xhr){
						console.log(data);
					},
					error : function(xhr,status,error) {
	   					console.log(error);
	   				}
				
				});
		    
			};
		}; */ -->

		<script>
			const link = "${ pageContext.servletContext.contextPath }/admin/list";
			const searchLink = "${ pageContext.servletContext.contextPath }/admin/adminsearch";

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
				const $searchStartPage = document
						.getElementById("searchStartPage");
				$searchStartPage.onclick = function() {
					location.href = searchLink
							+ "?currentPage=1&searchCondition=${ requestScope.searchCondition}&searchValue=${ requestScope.searchValue}";
				}
			}

			if (document.getElementById("searchPrevPage")) {
				const $searchPrevPage = document
						.getElementById("searchPrevPage");
				$searchPrevPage.onclick = function() {
					location.href = searchLink
							+ "?currentPage=${ requestScope.pageInfo.pageNo - 1 }&searchCondition=${ requestScope.searchCondition}&searchValue=${ requestScope.searchValue}";
				}
			}

			if (document.getElementById("searchNextPage")) {
				const $searchNextPage = document
						.getElementById("searchNextPage");
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

					$tds[i].onmouseenter = function() {
						/* this.parentNode.style.backgroundColor = "orangered"; */
						this.parentNode.style.cursor = "pointer";
					}

					/* 	 $tds[i].onmouseout = function() {
							this.parentNode.style.backgroundColor = "gray"; 
						}  */

					$tds[i].onclick = function() {
						location.href = "${ pageContext.servletContext.contextPath }/admin/adminid?id="
								+ this.parentNode.children[1].innerText;

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
	</c:if>


</body>
</html>
