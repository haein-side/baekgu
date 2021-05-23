<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
  <link href="css/style.css" rel="stylesheet"/>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
      background: darkslategrey;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
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
      .row.content {height:auto;} 
    }
  </style>
</head>
<body>

<jsp:include page="../common/header.jsp"/>
  
<div class="container-fluid text-center" style="padding-left: 0%;">    
  <div class="row content" style="height: auto;">
    <div class="col-sm-1 sidenav">
    </div>
    <div class="col-sm-10 text-left"> 
      <h1>지원자관리 - 공고</h1>
      <ul style="padding-left: 25px;">
      	<li>등록하신 공고 중, 지원자가 있는 공고만 표시됩니다</li>
        <li>공고를 누르면 지원자 조회가 가능합니다</li>
      </ul>
       
      <br>
      <br>
      
        <table class="table table-bordered">
          <thead>
            <tr>
              <th style="display:none">공고코드</th>
              <th>공고담당자</th>
              <th>공고제목</th>
              <th>모집인원</th>
              <th>지원자수</th>
              <th>미열람 지원자 수</th>
              <th>마감일</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="post" items="${ requestScope.postList }">
			<tr> 
 				<td style = "display:none"><c:out value="${ post.postCode }"/></td>
 				<td><c:out value="${ post.managerName }"/></td>
				<td><c:out value="${ post.postTitle }"/></td>
				<td><c:out value="${ post.postTO }"/></td>
				<td><c:out value="${ post.countOfApplicants }"/></td>
				<td><c:out value="${ post.countOfUnreadResume }"/></td>
				<td><c:out value="${ post.postEnd }"/></td>
			</tr>
			</c:forEach> 
          </tbody>
        </table>
  
      <br>
      <br>
      <%-- 페이지 처리 --%>
	 <div class="text-center">
	 	<div class="pagination" align="center">
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
		</div>
  </div>
      
    
  </div>
</div>


</div>
	<script>
		const link = "${ pageContext.servletContext.contextPath }/business/applicablePostlist";
		const categoryLink = "${ pageContext.servletContext.contextPath }/business/applicablePostlist";
			
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
		
		
		if(document.getElementsByTagName("td")) {
			
			const $tds = document.getElementsByTagName("td");
			for(let i = 0; i < $tds.length; i++) {
				
				$tds[i].onmouseenter = function() {
					this.parentNode.style.backgroundColor = "green";
					this.parentNode.style.cursor = "pointer";
				}
				
				$tds[i].onmouseout = function() {
					this.parentNode.style.backgroundColor = "white";
				}
				
				$tds[i].onclick = function() {
					location.href = "${ pageContext.servletContext.contextPath }/business/applicantlist?postCode="
							         +  this.parentNode.children[0].innerText;
				}
			}
			
		}
		
		function pageButtonAction(text) {
			location.href = link + "?currentPage=" + text;
		}

	</script>
	

  

	<jsp:include page="../common/footer.jsp"/>


</body>
</html>