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
      <h1>공고관리</h1>
      <ul style="padding-left: 25px;">
        <li> 해당 공고의 지원자 정보를 보시려면 '상세보기' 버튼을 눌러주세요</li>
        <li> 대기 목록에는 미승인 공고 또는 게시되지 않은 공고가 표시됩니다 </li>
        <li> 진행중인 공고는 수정이 불가능합니다</li>
      </ul>
      
      <hr>
      
      <div class="btn-group btn-group-justified">
        <a id="totalCategory" onclick="MyFunction(); return false;" href="#" class="btn btn-primary">전체 ( ${ requestScope.total }건 )</a>
        <a id="holdCategory" onclick="MyFunction(); return false;" href="#" class="btn btn-primary">접수 ( ${ requestScope.hold }건 )</a>
        <a id="approveCategory" onclick="MyFunction(); return false;" href="#" class="btn btn-primary">승인 ( ${ requestScope.approved }건 )</a>
        <a id="rejectCategory" onclick="MyFunction(); return false;" href="#" class="btn btn-primary">거절 ( ${ requestScope.rejected }건 )</a>
      </div>
       
      <br>
      <br>

        <table class="table table-bordered">
          <thead>
            <tr>
              <th>공고심사결과</th>
              <th>공고등록일</th>
              <th>공고제목</th>
              <th>광고위치(상품)</th>
              <th>공고시작일</th>
              <th>공고마감일</th>
              <th>지원자수</th>
            </tr>
          </thead>

          <!-- for-loop 을 이용하여 공고 리스트 출력 -->
          <tbody>
           <c:forEach var="post" items="${ requestScope.postList }">
			<tr> 
				<td><c:out value="${ post.decisionStatus }"/></td>
				<td><c:out value="${ post.postDate }"/></td>
				<td><c:out value="${ post.postTitle }"/></td>
				<td><c:out value="${ post.adName }"/></td>
				<td><c:out value="${ post.postStart }"/></td>
				<td><c:out value="${ post.postEnd }"/></td>
				<td><c:out value="${ post.countOfApplicants }"/></td>
			</tr>
			</c:forEach>
          </tbody>
          <!-- for loop 끝-->
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


  <div class="col-sm-1 sidenav">
  </div>
</div>
	<script>
		const link = "${ pageContext.servletContext.contextPath }/business/postlist";
		const categoryLink = "${ pageContext.servletContext.contextPath }/business/postlist";
			
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
		
		// category paging - 전체
		if(document.getElementById("totalCategory")) {
			const $totalCategory = document.getElementById("totalCategory");
			$totalCategory.onclick = function() {
				location.href = categoryLink;
			}
		}
		
		// category paging - 접수
		if(document.getElementById("holdCategory")) {
			const $holdCategory = document.getElementById("holdCategory");
			$holdCategory.onclick = function() {
				location.href = categoryLink + "?currentPage=1&category=접수";
			}
		}
		
		// category paging - 승인
		if(document.getElementById("approveCategory")) {
			const $approveCategory = document.getElementById("approveCategory");
			$approveCategory.onclick = function() {
				location.href = categoryLink + "?currentPage=1&category=승인";
			}
		}
		
		// category paging - 거절 
		if(document.getElementById("rejectCategory")) {
			const $rejectCategory = document.getElementById("rejectCategory");
			$rejectCategory.onclick = function() {
				location.href = categoryLink + "?currentPage=1&category=거절";
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
			}
			
		}
		
		function pageButtonAction(text) {
			location.href = link + "?currentPage=" + text + "&category=${ requestScope.pageInfo.category}";
		}

	</script>
	



	<jsp:include page="../common/footer.jsp"/>


</body>
</html>
