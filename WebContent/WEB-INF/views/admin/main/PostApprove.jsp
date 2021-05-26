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
			<section class="wrapper">
			</section>
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
                                <i class="fa fa-laptop"></i>
                                공고 심사 관리</h3>
                            
                        </div>
                    </div>
                </section>
                
                <div class="row">
                    <div class="col-lg-12">
                      <section class="panel">
                        <header class="panel-heading">
                          기업 리스트
                        </header>
                        <div class="table-responsive">
                          <table class="table">
                            <thead>
                              <tr>
                                <th>공고코드</th>
                                <th>공고제목</th>
                                <th>담당자아이디</th>
                                <th>담당자이름</th>
                                <th>담당자이메일</th>
                               <!--  <th>공고등록</th> -->
                              </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="postapprove" items="${ requestScope.postList }">
                              <tr>
                                   <td><c:out value="${ postapprove.postCode }" /></td>
								   <td><c:out value="${ postapprove.postTitle }" /></td>
								   <td><c:out value="${ postapprove.hrId }" /></td>
								   <td><c:out value="${ postapprove.name }" /></td>
								   <td><c:out value="${ postapprove.email }" /></td>
							<%-- 	   <td><c:out value="${ postapprove.dday }"/></td> --%>
                              </tr>
                            </c:forEach>
                            </tbody>
                          </table>
                        </div>

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

											<c:if test="${ requestScope.pageInfo.pageNo ne p }">
												<button onclick="pageButtonAction(this.innerText);">
													<c:out value="${ p }" />
												</button>
											</c:if>


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

            </section>
         
        </section>
                   <script>
						const link = "${ pageContext.servletContext.contextPath }/admin/postapprove";
					/* 	const searchLink = "${ pageContext.servletContext.contextPath }/admin/search"; */

						if (document.getElementById("startPage")) {
							const $startPage = document
									.getElementById("startPage");
							$startPage.onclick = function() {
								location.href = link + "?currentPage=1";
							}
						}

						if (document.getElementById("prevPage")) {
							const $prevPage = document
									.getElementById("prevPage");
							$prevPage.onclick = function() {
								location.href = link
										+ "?currentPage=${ requestScope.pageInfo.pageNo - 1 }";
							}
						}

						if (document.getElementById("nextPage")) {
							const $nextPage = document
									.getElementById("nextPage");
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
							const $searchMaxPage = document
									.getElementById("searchMaxPage");
							$searchMaxPage.onclick = function() {
								location.href = searchLink
										+ "?currentPage=${ requestScope.pageInfo.maxPage }&searchCondition=${ requestScope.searchCondition}&searchValue=${ requestScope.searchValue}";
							}
						}

						if (document.getElementsByTagName("td")) {

							const $tds = document.getElementsByTagName("td");
							for (let i = 0; i < $tds.length; i++) {

								$tds[i].onmouseenter = function() {
									/*  	this.parentNode.style.backgroundColor = "orangered";
										this.parentNode.style.cursor = "pointer";   */
								}

								/* 	 $tds[i].onmouseout = function() {
										this.parentNode.style.backgroundColor = "gray"; 
									}  */

								$tds[i].onclick = function() {
										const postCode =  this.parentNode.children[0].innerText;
									location.href = "${ pageContext.servletContext.contextPath }/admin/postapprovedetail?postCode=" + postCode;

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