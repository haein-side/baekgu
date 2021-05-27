<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/styleMa.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/YJCSS/header2.css"
	type="text/css">
    <title>입사지원관리페이지</title>
    
</head>


<body class="body">

<%@ include file="../common/header2.jsp"%>

    <div class="container-fluid text-center"  style="margin-top: 250px; z-index: 1;">    
  <div class="row content" style=" z-index: 1;">
    <div class="col-sm-3 sidenav">
    </div>
    
    <div class="col-sm-6 text-left"> 
    <h1 style="text-align: center; color : black; margin-top: 43px;">나의 공간</h1>
    <hr>
      <h2 style="font-family:BME; color : orange;">입사지원관리</h1>
        <table border="1" width="950" style="margin:auto;">
          <br>
          <br>
          <br>
          <!-- <div class="text-center"> -->
            <thead style= "font-family: icomoon; font-size:20px; font-weight: lighter; color : white; background-color: orange;">
                <tr height="40">
                    <th style="text-align: center;">지원일</th>
                    <th style="text-align: center;">회사명</th>
                    <th style="text-align: center;">모집공고</th>
                    <th style="text-align: center;">지원취소</th>
                    <th style="text-align: center;">열람여부</th>
                </tr>
            </thead>
            <tbody align="center" style="font-family: icomoon; font-size:20px;">
            
            <c:forEach var="app" items="${ allApply }">
                <tr height="40">
                    <td>${ app.applyDate }</td> 
                    <td>${ app.bName }</td>
                    <td>${ app.postTitle }</td>
                    <td>
                           <c:choose>
							    <c:when test="${app.applyRead eq 0 }">
							    <!-- 지원취소 클릭시 value인 "applyCode"가 서블릿에 post 방식으로 전송됨 -->
							      <form action="${ pageContext.servletContext.contextPath }/user/manageApply" method="post">
								      <input type="hidden" name="cancel" value="${ app.applyCode }"> 
								      <input type="submit" value="지원취소" name="cancel" id="btn1"  style="height:32px; width: 110px; font-size: 22px; background: orange; color: white;">
							      </form>
							    </c:when>
							    <c:when test="${app.applyRead eq 1 }">
							        <input type="text" value="취소불가" name="cancel" style="height:32px; width: 110px; font-size: 22px; background: gray; color: white; text-align: center;">
							    </c:when>
							</c:choose>
                    </td>
                    <td>
                     <c:choose>
					    <c:when test="${app.applyRead eq 0 }">
					       미열람
					    </c:when>
					    <c:when test="${app.applyRead eq 1}">
					        열람
					    </c:when>
					</c:choose>
                    </td>
                </tr>
				</c:forEach>
				
				
            </tbody>
        </table>
       <!--  </div> -->
        <br>
        <br>
        <!-- <div class="text-center">
        <ul class="pagination">
		  <li><a href="#">1</a></li>
		  <li><a href="#">2</a></li>
		  <li><a href="#">3</a></li>
		  <li><a href="#">4</a></li>
		  <li><a href="#">5</a></li>
		</ul> 
		</div> -->
		
		<%-- 입사지원내역 페이지 처리 --%>
		<div class= "text-center">
			<c:choose>
			    <c:when test="${ empty requestScope.searchValue }">
				    <button id="startPage1"><<</button>
	
					<c:if test="${ requestScope.applyPageInfo.pageNo <= 1 }">
						<button disabled><</button>
					</c:if>
					<c:if test="${ requestScope.applyPageInfo.pageNo > 1 }">
						<button id="prevPage1"><</button>
					</c:if>
		
					<c:forEach var="p" begin="${ requestScope.applyPageInfo.startPage }" end="${ requestScope.applyPageInfo.endPage }" step="1">
						<c:if test="${ requestScope.applyPageInfo.pageNo eq p }">
							<button disabled><c:out value="${ p }"/></button>
						</c:if>
						<c:if test="${ requestScope.applyPageInfo.pageNo ne p }">
							<button onclick="pageButtonAction1(this.innerText);"><c:out value="${ p }"/></button>
						</c:if>
					</c:forEach>
					
					<c:if test="${ requestScope.applyPageInfo.pageNo >= requestScope.applyPageInfo.maxPage }">
						<button disabled>></button>
					</c:if>
					<c:if test="${ requestScope.applyPageInfo.pageNo < requestScope.applyPageInfo.maxPage }">
						<button id="nextPage1">></button>
					</c:if>
					
					<button id="maxPage1">>></button> 
			     </c:when>
			    <c:otherwise>
   				    <button id="searchStartPage1"><<</button>
	
					<c:if test="${ requestScope.applyPageInfo.pageNo <= 1 }">
						<button disabled><</button>
					</c:if>
					<c:if test="${ requestScope.applyPageInfo.pageNo > 1 }">
						<button id="searchPrevPage1"><</button>
					</c:if>
		
					<c:forEach var="p" begin="${ requestScope.applyPageInfo.startPage }" end="${ requestScope.applyPageInfo.endPage }" step="1">
						<c:if test="${ requestScope.applyPageInfo.pageNo eq p }">
							<button disabled><c:out value="${ p }"/></button>
						</c:if>
						<c:if test="${ requestScope.applyPageInfo.pageNo ne p }">
							<button onclick="seachPageButtonAction1(this.innerText);"><c:out value="${ p }"/></button>
						</c:if>
					</c:forEach>
					
					<c:if test="${ requestScope.applyPageInfo.pageNo >= requestScope.applyPageInfo.maxPage }">
						<button disabled>></button>
					</c:if>
					<c:if test="${ requestScope.applyPageInfo.pageNo < requestScope.applyPageInfo.maxPage }">
						<button id="searchNextPage1">></button>
					</c:if>
					
					<button id="searchMaxPage1">>></button> 
			    </c:otherwise>
			</c:choose>   
		</div>
		
	<br>
	<br>
	<br>
	<br>
	<h2 style="font-family:BME; color : orange;">신고내역관리</h1>
        <table border="1" width="950" style="margin:auto;">
          <br>
          <br>
            <thead style= "font-family: icomoon; font-size:20px; font-weight: lighter; color : white; background-color: orange;">
                <tr height="40">
                    <th style="text-align: center;">신고일자</th>
                    <th style="text-align: center;">신고제목</th>
                    <th style="text-align: center;">신고결과</th>
                </tr>
            </thead>
            <tbody align="center" style="font-family: icomoon; font-size:20px;">
            <c:forEach var = "rpt" items="${ allReport }">
                <tr height="40">
                    <td>${ rpt.reportDate }</td>
                    <td>${ rpt.postTitle }</td>
                    <td>
                    <c:choose>
					    <c:when test="${rpt.decisionCode eq 1 }">
					       접수
					    </c:when>
					    <c:when test="${rpt.decisionCode eq 2 }">
					       승인
					    </c:when>
					    <c:when test="${rpt.decisionCode eq 3 }">
					       거절
					    </c:when>
					</c:choose>
                    
                    
                    </td><!-- 심사상태 가져오면 됨 -->
                </tr>
             </c:forEach>
            </tbody>
        </table>
       <!--  <div class="text-center" >
        <ul class="pagination">
		  <li><a href="#">1</a></li>
		  <li><a href="#">2</a></li>
		  <li><a href="#">3</a></li>
		  <li><a href="#">4</a></li>
		  <li><a href="#">5</a></li>
		</ul>
		</div> -->
    <br>
	<br>
	
	
	<%-- 페이지 처리 --%>
		<div class="text-center">
			<c:choose>
			    <c:when test="${ empty requestScope.searchValue }">
				    <button id="startPage2"><<</button>
	
					<c:if test="${ requestScope.blockPageInfo.pageNo <= 1 }">
						<button disabled><</button>
					</c:if>
					<c:if test="${ requestScope.blockPageInfo.pageNo > 1 }">
						<button id="prevPage2"><</button>
					</c:if>
		
					<c:forEach var="p" begin="${ requestScope.blockPageInfo.startPage }" end="${ requestScope.blockPageInfo.endPage }" step="1">
						<c:if test="${ requestScope.blockPageInfo.pageNo eq p }">
							<button disabled><c:out value="${ p }"/></button>
						</c:if>
						<c:if test="${ requestScope.blockPageInfo.pageNo ne p }">
							<button onclick="pageButtonAction2(this.innerText);"><c:out value="${ p }"/></button>
						</c:if>
					</c:forEach>
					
					<c:if test="${ requestScope.blockPageInfo.pageNo >= requestScope.blockPageInfo.maxPage }">
						<button disabled>></button>
					</c:if>
					<c:if test="${ requestScope.blockPageInfo.pageNo < requestScope.blockPageInfo.maxPage }">
						<button id="nextPage2">></button>
					</c:if>
					
					<button id="maxPage2">>></button> 
			     </c:when>
			    <c:otherwise>
   				    <button id="searchStartPage2"><<</button>
	
					<c:if test="${ requestScope.blockPageInfo.pageNo <= 1 }">
						<button disabled><</button>
					</c:if>
					<c:if test="${ requestScope.blockPageInfo.pageNo > 1 }">
						<button id="searchPrevPage2"><</button>
					</c:if>
		
					<c:forEach var="p" begin="${ requestScope.blockPageInfo.startPage }" end="${ requestScope.blockPageInfo.endPage }" step="1">
						<c:if test="${ requestScope.blockPageInfo.pageNo eq p }">
							<button disabled><c:out value="${ p }"/></button>
						</c:if>
						<c:if test="${ requestScope.blockPageInfo.pageNo ne p }">
							<button onclick="seachPageButtonAction2(this.innerText);"><c:out value="${ p }"/></button>
						</c:if>
					</c:forEach>
					
					<c:if test="${ requestScope.blockPageInfo.pageNo >= requestScope.blockPageInfo.maxPage }">
						<button disabled>></button>
					</c:if>
					<c:if test="${ requestScope.blockPageInfo.pageNo < requestScope.blockPageInfo.maxPage }">
						<button id="searchNextPage2">></button>
					</c:if>
					
					<button id="searchMaxPage2">>></button> 
			    </c:otherwise>
			</c:choose>   
		</div>
		<br>
		<br>
		<br>
		<br>
    </div>
    <div class="col-sm-3 sidenav">
    </div>
  </div>
</div>

<!-- 스크립트 시작 -->
	<script>
	/* 지원 취소를 위한 스크립트 시작 */
	
	
	/* 페이징처리를 위한 스크립트 시작 */
		const link = "${ pageContext.servletContext.contextPath }/user/manageApply";
		/* const searchLink = "${ pageContext.servletContext.contextPath }/board/search"; */
		
		// 분리되게 움직이려면 여기서 무언가 대책이 필요할 듯
		 if(document.getElementById("startPage1")) {
         const $startPage = document.getElementById("startPage1");
         $startPage.onclick = function() {
            location.href = link + "?currentPage1=1";
         }
      }

		 if(document.getElementById("startPage2")) {
	         const $startPage = document.getElementById("startPage2");
	         $startPage.onclick = function() {
	            location.href = link + "?currentPage2=1";
	         }
	      }

		 if(document.getElementById("prevPage1")) {
	         const $prevPage = document.getElementById("prevPage1");
	         $prevPage.onclick = function() {
	            location.href = link + "?currentPage1=${ requestScope.pageInfo.pageNo - 1 }";
	         }
	      }
		
		if(document.getElementById("prevPage2")) {
			const $prevPage = document.getElementById("prevPage2");
			$prevPage.onclick = function() {
				location.href = link + "?currentPage2=${ requestScope.blockPageInfo.pageNo - 1 }";
			}
		}
		
		if(document.getElementById("nextPage1")) {
			const $nextPage = document.getElementById("nextPage1");
			$nextPage.onclick = function() {
				location.href = link + "?currentPage1=${ requestScope.applyPageInfo.pageNo + 1 }";
			}
		}
		
		if(document.getElementById("nextPage2")) {
			const $nextPage = document.getElementById("nextPage2");
			$nextPage.onclick = function() {
				location.href = link + "?currentPage2=${ requestScope.blockPageInfo.pageNo + 1 }";
			}
		}
		
		if(document.getElementById("maxPage1")) {
			const $maxPage = document.getElementById("maxPage1");
			$maxPage.onclick = function() {
				location.href = link + "?currentPage1=${ requestScope.applyPageInfo.maxPage }";
			}
		}
		
		if(document.getElementById("maxPage2")) {
			const $maxPage = document.getElementById("maxPage2");
			$maxPage.onclick = function() {
				location.href = link + "?currentPage2=${ requestScope.blockPageInfo.maxPage }";
			}
		}
		
		if(document.getElementById("searchStartPage1")) {
			const $searchStartPage = document.getElementById("searchStartPage1");
			$searchStartPage.onclick = function() {
				location.href = searchLink + "?currentPage1=1&searchCondition1=${ requestScope.searchCondition}&searchValue1=${ requestScope.searchValue}";
			}
		}
		
		if(document.getElementById("searchStartPage2")) {
			const $searchStartPage = document.getElementById("searchStartPage2");
			$searchStartPage.onclick = function() {
				location.href = searchLink + "?currentPage2=1&searchCondition2=${ requestScope.searchCondition}&searchValue2=${ requestScope.searchValue}";
			}
		}
		
		if(document.getElementById("searchPrevPage1")) {
			const $searchPrevPage = document.getElementById("searchPrevPage1");
			$searchPrevPage.onclick = function() {
				location.href = searchLink + "?currentPage1=${ requestScope.pageInfo.pageNo - 1 }&searchCondition1=${ requestScope.searchCondition}&searchValue1=${ requestScope.searchValue}";
			}
		}
		
		if(document.getElementById("searchPrevPage2")) {
			const $searchPrevPage = document.getElementById("searchPrevPage2");
			$searchPrevPage.onclick = function() {
				location.href = searchLink + "?currentPage2=${ requestScope.pageInfo.pageNo - 1 }&searchCondition2=${ requestScope.searchCondition}&searchValue2=${ requestScope.searchValue}";
			}
		}
		
		if(document.getElementById("searchNextPage1")) {
			const $searchNextPage = document.getElementById("searchNextPage1");
			$searchNextPage.onclick = function() {
				location.href = searchLink + "?currentPage1=${ requestScope.pageInfo.pageNo + 1 }&searchCondition1=${ requestScope.searchCondition}&searchValue1=${ requestScope.searchValue}";

			}
		}
		
		if(document.getElementById("searchNextPage2")) {
			const $searchNextPage = document.getElementById("searchNextPage2");
			$searchNextPage.onclick = function() {
				location.href = searchLink + "?currentPage2=${ requestScope.pageInfo.pageNo + 1 }&searchCondition2=${ requestScope.searchCondition}&searchValue2=${ requestScope.searchValue}";

			}
		}
		
		if(document.getElementById("searchMaxPage1")) {
			const $searchMaxPage = document.getElementById("searchMaxPage1");
			$searchMaxPage.onclick = function() {
				 location.href = searchLink + "?currentPage1=${ requestScope.pageInfo.maxPage }&searchCondition1=${ requestScope.searchCondition}&searchValue1=${ requestScope.searchValue}";
			}
		}
		
		if(document.getElementById("searchMaxPage2")) {
			const $searchMaxPage = document.getElementById("searchMaxPage2");
			$searchMaxPage.onclick = function() {
				 location.href = searchLink + "?currentPage2=${ requestScope.pageInfo.maxPage }&searchCondition2=${ requestScope.searchCondition}&searchValue2=${ requestScope.searchValue}";

			}
		}
		
		function pageButtonAction1(text) {
			location.href = link + "?currentPage1=" + text;
		}
		function seachPageButtonAction1(text) {
	         location.href = searchLink + "?currentPage1=" + text + "&searchCondition1=${ requestScope.searchCondition}&searchValue1=${ requestScope.searchValue}";

		}
		
		function pageButtonAction2(text) {
			location.href = link + "?currentPage2=" + text;
		}
		function seachPageButtonAction2(text) {
	         location.href = searchLink + "?currentPage2=" + text + "&searchCondition2=${ requestScope.searchCondition}&searchValue2=${ requestScope.searchValue}";

		}
	</script>

 <!-- 푸터 시작 -->


<%@include file ="../common/footer.jsp" %>

   
</body>
</html>