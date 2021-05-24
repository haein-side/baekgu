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

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">백구</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="home.html">홈</a></li>
        <li><a href="#">공고등록</a></li>
        <li><a href="#">지원자관리</a></li>
        <li><a href="#">공고관리</a></li>
        <li class="active"><a href="payment.html">결제관리</a></li>
        <li><a href="ad.html">상품안내</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">회사명</a></li>
        <li><a href="#">담당자명</a></li>
        <li><a href="#">로그아웃</a></li>
      </ul>
    </div>
  </div>
</nav>
  
<div class="container-fluid text-center" style="padding-left: 0%;">    
  <div class="row content" style="height: auto;">
    <div class="col-sm-1 sidenav">
    </div>
    <div class="col-sm-10 text-left"> 
      <h1>결제관리</h1>
      <ul style="padding-left: 25px;">
        <li>(회사명)님의 최근 5년 이내 결제 내역 조회가 가능합니다.</li>
        <li>할인, 적립 등 상세 정보를 보시려면 '상세보기' 버튼을 눌러주세요.</li>
        <li> 결제하기는 상세보기 안에서 진행하실 수 있습니다.</li>
      </ul>
      <hr>
      <!-- <h3>Test</h3>
      <p>Lorem ipsum...</p> -->
      <div class="btn-group btn-group-justified">
        <a id="totalCategory" onclick="MyFunction(); return false;" href="#" class="btn btn-primary">전체 ( ${ requestScope.total }건 )</a>
        <a id="holdCategory" onclick="MyFunction(); return false;" href="#" class="btn btn-primary">접수 ( ${ requestScope.hold }건 )</a>
        <a id="approveCategory" onclick="MyFunction(); return false;" href="#" class="btn btn-primary">승인 ( ${ requestScope.accepted }건 )</a>
      </div>
       
      <br>
      <br>
      
        <table class="table table-bordered">
          <thead>
            <tr>
              <th>심사 결과</th>
              <th>공고 제목</th>
              <th>상품 이름</th>
              <th>결제 총금액</th>
              <th>광고 기간</th>
              <th>결제 날짜</th>
              <th>결제 수단</th>
              <th>결제 유무</th>
            </tr>
          </thead>
          <tbody>
           <c:forEach var="pay" items="${ requestScope.payList }">
			<tr> 
				<td><c:out value="${ pay.DListStatus }"/></td>
				<td><c:out value="${ pay.postTitle }"/></td>
				<td><c:out value="${ pay.adName }"/></td>
				<td><c:out value="${ pay.totalPrice }"/></td>
				<td><c:out value="${ pay.adWeek }"/>주</td>
				<td><c:out value="${ pay.postadDate }"/></td>
				<td><c:out value="${ pay.methodCode }"/></td>
				<td><c:out value="${ pay.adPaid }"/></td>
			</tr>
			</c:forEach>
          </tbody>
        </table>
  
        
      <br>
      <br>

  </div>

</div>

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
  <div class="col-sm-1 sidenav">
  </div>
</div>

	<script>
		const link = "${ pageContext.servletContext.contextPath }/business/paymentlist";
		const categoryLink = "${ pageContext.servletContext.contextPath }/business/paymentlist";
			
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
				location.href = categoryLink + "?currentPage=${requestScope.pageInfo.pageNo}&category=hold";
			}
		}
		
		// category paging - 승인
		if(document.getElementById("approveCategory")) {
			const $approveCategory = document.getElementById("approveCategory");
			$approveCategory.onclick = function() {
				location.href = categoryLink + "?currentPage=${requestScope.pageInfo.pageNo}&category=accept";
			}
		}
		
		// category paging - 거절 
		if(document.getElementById("rejectCategory")) {
			const $rejectCategory = document.getElementById("rejectCategory");
			$rejectCategory.onclick = function() {
				location.href = categoryLink + "?currentPage=${requestScope.pageInfo.pageNo}&category=reject";
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
		
		/* 고쳐야하는부분  */
		function pageButtonAction(text) {
			location.href = link + "?currentPage=" + text;
		}
		function seachPageButtonAction(text) {
			location.href = searchLink + "?currentPage=" + text + "&searchCondition=${ requestScope.searchCondition}&searchValue=${ requestScope.searchValue}";
		}
	</script>
</body>
</html>
