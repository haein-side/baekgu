<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta
            name="description"
            content="Creative - Bootstrap 3 Responsive Admin Template">
        <meta name="author" content="GeeksLabs">
        <meta
            name="keyword"
            content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">

        <title>백구 관리자페이지</title>

        
        <link href="RESOURCES/CSS/ADMIN/bootstrap-theme.css" rel="stylesheet">

 
        <!-- owl carousel -->
        <link rel="stylesheet" href="RESOURCES/CSS/ADMIN/owl.carousel.css" type="text/css">
        <link href="RESOURCES/CSS/ADMIN/jquery-jvectormap-1.2.2.css" rel="stylesheet">
        <!-- Custom styles -->
        <link href="RESOURCES/CSS/ADMIN/widgets.css" rel="stylesheet">
        <link href="RESOURCES/CSS/ADMIN/style.css" rel="stylesheet">
        <link href="RESOURCES/CSS/ADMIN/style-responsive.css" rel="stylesheet"/>
        <link href="RESOURCES/CSS/ADMIN/jquery-ui-1.10.4.min.css" rel="stylesheet">
       
    </head>
 <body style="overflow-x:hidden">
 <jsp:include page="../common/header.jsp"/>

	<!-- 로그인 세션 값이 비었을시 아무것도 보이지 않는다 -->
	<c:if test="${ empty sessionScope.loginAdminName }">
		<section id="main-content">
			<section class="wrapper">
				<div class="row">
					<div class="col-lg-12">
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
                                기업 정보</h3> 
                        </div>
                    </div>
                 <div class="row">
                    <div class="col-lg-12">
                      <section class="panel">
                        <header class="panel-heading">
                          기업 리스트
                          <a class="btn btn-success" href="${ pageContext.servletContext.contextPath }/admin/nomalCompany" style="margin-left: 30px;">
                            정상기업 모아보기
                        </a>
                        <a class="btn btn-warning" href="${ pageContext.servletContext.contextPath }/admin/blockCompany" style="margin-left: 30px;">
                            차단기업 모아보기
                        </a>
                        </header>
                        <div class="table-responsive">
                          <table class="table">
                            <thead>
                              <tr>
                                <th>기업코드</th>
                                <th>기업명</th>
                                <th>연락처</th>
                                <th>기업분류</th>
                                <th>차단상태</th>
                                <th>가입승인여부</th>
                              </tr>
                            </thead>
                            <tbody>
                              <c:forEach var="company" items="${ requestScope.companyList }">
									<tr>
										<td><c:out value="${ company.code }" /></td>
										<td><c:out value="${ company.name }" /></td>
										<td><c:out value="${ company.phone }" /></td>
										<td>
										<c:choose>
			                              <c:when test="${ company.category eq 1 }">
			                              <c:out value="미분류"/>
			                              </c:when>
			                              <c:when test="${ company.category eq 2 }">
			                              <c:out value="일반기업"/>
			                              </c:when>
			                              <c:when test="${ company.category eq 3 }">
			                              <c:out value="공기업"/>
			                              </c:when>
			                              <c:when test="${ company.category eq 4 }">
			                              <c:out value="사회적기업"/>
			                              </c:when>
			                              <c:when test="${ company.category eq 5 }">
			                              <c:out value="공공기관"/>
			                              </c:when>
			                             </c:choose>
										</td>
										<td>
										<c:choose>
			                              <c:when test="${ company.block eq 0 }">
			                              <c:out value="미차단"/>
			                              </c:when>
			                              <c:when test="${ company.block eq 1 }">
			                              <c:out value="차단"/>
			                              </c:when>
			                            </c:choose>
										</td>
										<td>
										<c:choose>
											<c:when test="${ company.dCode eq 3 &&  company.dCode eq 3 }">
											<c:out value="거절"/>
											</c:when>
										<c:otherwise>
											<c:out value="승인"/>
										</c:otherwise>
										</c:choose>
										</td>
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
		<form id="loginForm" action="${ pageContext.servletContext.contextPath }/admin/companySearch" method="get">		
			<div class="search-area" align="center">
				<c:choose>
				    <c:when test="${ !empty requestScope.searchValue }">
   					    <select id="searchCondition" name="searchCondition">
							<option value="name" <c:if test="${requestScope.searchCondition eq 'name'}">selected</c:if>>기업명</option>
							<option value="code" <c:if test="${requestScope.searchCondition eq 'code'}">selected</c:if>>기업코드</option>
							<option value="category" <c:if test="${requestScope.searchCondition eq 'category'}">selected</c:if>>기업분류</option>
							<option value="state" <c:if test="${requestScope.searchCondition eq 'state'}">selected</c:if>>승인여부</option>
						</select>
				        <input type="search" id="searchValue" name="searchValue" value="${ requestScope.searchValue }">
				    </c:when>
				    <c:otherwise>
					    <select id="searchCondition" name="searchCondition">
							<option value="name">기업명</option>
							<option value="code">기업코드</option>
							<option value="category">기업분류</option>
							<option value="state">승인여부</option>
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
		const link = "${ pageContext.servletContext.contextPath }/admin/companyList";
		const searchLink = "${ pageContext.servletContext.contextPath }/admin/companySearch";
			
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
					
					/* alert(this.parentNode.children[0].innerText); */ //유저코드를 알럿으로 띄워 알 수 있다.
					const no = this.parentNode.children[0].innerText;
					location.href = "${ pageContext.servletContext.contextPath }/admin/companydetail?no=" + no;
					
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
                    <!--main content end-->
</c:if>


  </body> 
</html> 