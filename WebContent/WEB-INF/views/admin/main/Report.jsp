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
    <body>
  <jsp:include page="../common/header.jsp"/>
            <!--main content start-->
            <section id="main-content">
                <section class="wrapper">
                    <!--overview start-->
                    <div class="row">
                        <div class="col-lg-12">
                            <h3 class="page-header">
                                <i class="fa fa-laptop"></i>
                                신고관리
                            </h3>
                        </div>
                        <a class="btn btn-success" href="${ pageContext.servletContext.contextPath }/admin/reportWait" style="margin-left: 30px;">
                            접수대기 모아보기
                        </a>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                          <section class="panel">
                            <div class="table-responsive">
                              <table class="table">
                                <thead>
                                  <tr>
                                  	<th></th>
                                  	<th>신고대상</th>
                                    <th>신고코드</th>
                                    <th>신고명</th>
                                    <th>심사사유</th>
                                    <th>신고날짜</th>
                                    <!-- <th>심사날짜</th> -->
                                    <th>공고코드</th>
                                    <th>유저코드</th>
                                    <th>접수상태</th>
                                    <th>신고 처리 관리자</th>
                                  </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="report" items="${ requestScope.reportList }">
									<tr>
										<td><input id="tCode" type="hidden" value="${ report.bdTCode }"></td>
										<c:set var="tCode" value="${ report.bdTCode }"/>
										<c:choose>
											<c:when test="${ tCode eq 1 }">
												<td>
													<c:out value="일반회원"/>
												</td>
											</c:when>
											<c:when test="${ tCode eq 2 }">
												<td>
													<c:out value="기업회원"/>
												</td>
											</c:when>
										</c:choose>
										<td><c:out value="${ report.rCode }" /></td>
										<td><c:out value="${ report.rReason }" /></td>
										<td><c:out value="${ report.bReason }" /></td>
										<td><c:out value="${ report.rDate }" /></td>
										<%-- <td><c:out value="${ report.bDate }" /></td> --%>
										<td><c:out value="${ report.postCode }" /></td>
										<td><c:out value="${ report.userCode }" /></td>
										<c:set var="bdCode" value="${ report.bdCode }" />
										<c:choose>
												<c:when test="${ report.bdCode eq 1 }">
													<td>
														<c:out value="대기중" />
													</td>
												</c:when>
												<c:when test="${ report.bdCode eq 2 }">
													<td>
														<c:out value="승인" />
													</td>
												</c:when>
												<c:when test="${ report.bdCode eq 3 }">
													<td>
														<c:out value="거절" />
													</td>
												</c:when>
											</c:choose>
										<td><c:out value="${ report.admin }" /></td>
										<td>
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
		<form id="loginForm" action="${ pageContext.servletContext.contextPath }/admin/memberSearch" method="get">		
			<div class="search-area" align="center">
				<c:choose>
				    <c:when test="${ !empty requestScope.searchValue }">
   					    <select id="searchCondition" name="searchCondition">
							<option value="code" <c:if test="${requestScope.searchCondition eq 'userCode'}">selected</c:if>>유저코드</option>
							<option value="yaer" <c:if test="${requestScope.searchCondition eq 'postCode'}">selected</c:if>>공고코드</option>
						</select>
				        <input type="search" id="searchValue" name="searchValue" value="${ requestScope.searchValue }">
				    </c:when>
				    <c:otherwise>
					    <select id="searchCondition" name="searchCondition">
							<option value="code">유저코드</option>
							<option value="name">공고코드</option>
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
		const link = "${ pageContext.servletContext.contextPath }/admin/reportl 6ist";
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
			}3
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

				  /* alert(target); */
				  
				  //0번째 히든처리 되어 있는 값이 1일경우는 고객을 신고하는 것이고 2일경우는 기업을 신고하는 것이다.
				  //그에 따라 1일경우 신고당한 고객의 상세정보로, 아닐경우 기업의 공고 정보로 넘긴다. 
				  if(this.parentElement.children[0].children[0].value == 1){
					const no = this.parentNode.children[7].innerText;
					location.href = "${ pageContext.servletContext.contextPath }/admin/memberdetail?no=" + no;
				  } else{
					 //현재 기업코드로 넘어가게 설정되어 있다. 공고승인 완성시, 공고코드로 넘어가도록 바꿔줘야 한다. 
					 const no = this.parentNode.children[6].innerText;
				     location.href = "${ pageContext.servletContext.contextPath }/admin/companydetail?no=" + no;
				  }
											
					
					
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


</body>
</html> 