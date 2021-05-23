<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/styleMa.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/YJCSS/header2.css"
	type="text/css">
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <title>입사지원관리페이지</title>
    
</head>


<body class="body">

<%@ include file="../common/header2.jsp"%>

    <div class="container-fluid text-center"  style="margin-top: 250px; z-index: 1;">    
  <div class="row content" style=" z-index: 1;">
    <div class="col-sm-3 sidenav">
    </div>
    
    <div class="col-sm-6 text-left"> 
    <h1 style="text-align: center; color : orange;">나의 공간</h1>
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
                    <td><a href="https://www.naver.com/"/>${ app.postTitle }</td>
                    <td>
                        </a><form>
                        <%-- <c:if test="${ app.applyRead eq 0 }">
                            <!-- <input type="button" name="cancel" onclick="alert('정말 지원을 취소하시겠습니까?');" value="지원취소"
                           style="height:32px; width: 110px; font-size: 22px; background: orange; color: white;"/> -->
                               <button style="height:32px; width: 110px; font-size: 22px; background: orange; color: white;">
                               지원취소</button>
                           </c:if> --%>
                           <c:choose>
							    <c:when test="${app.applyRead eq 0 }">
							    <!-- 지원취소는 나중에 해보자.. -->
							      <input type="button" value="지원취소" id="btn1" name="cancel" style="height:32px; width: 110px; font-size: 22px; background: orange; color: white;">
                               
							    </c:when>
							    <c:when test="${app.applyRead eq 1 }">
							        <input type="text" value="취소불가" name="cancel" style="height:32px; width: 110px; font-size: 22px; background: gray; color: white; text-align: center;">
							    </c:when>
							</c:choose>
                           
                        </form>
                    </td>
                    <td>
                     <c:choose>
					    <c:when test="${app.applyRead eq 0 }">
					       미열람
					    </c:when>
					    <c:when test="${app.applyRead eq 1 }">
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
        <div class="text-center">
        <ul class="pagination">
		  <li><a href="#">1</a></li>
		  <li><a href="#">2</a></li>
		  <li><a href="#">3</a></li>
		  <li><a href="#">4</a></li>
		  <li><a href="#">5</a></li>
		</ul> 
		</div>
		
		<%-- 페이지 처리 --%>
		<div class="pagination" align="center">
			<c:choose>
			    <c:when test="${ empty requestScope.searchValue }">
				    <button id="startPage"><<</button>
	
					<c:if test="${ requestScope.applyPageInfo.pageNo <= 1 }">
						<button disabled><</button>
					</c:if>
					<c:if test="${ requestScope.applyPageInfo.pageNo > 1 }">
						<button id="prevPage"><</button>
					</c:if>
		
					<c:forEach var="p" begin="${ requestScope.applyPageInfo.startPage }" end="${ requestScope.applyPageInfo.endPage }" step="1">
						<c:if test="${ requestScope.applyPageInfo.pageNo eq p }">
							<button disabled><c:out value="${ p }"/></button>
						</c:if>
						<c:if test="${ requestScope.applyPageInfo.pageNo ne p }">
							<button onclick="pageButtonAction(this.innerText);"><c:out value="${ p }"/></button>
						</c:if>
					</c:forEach>
					
					<c:if test="${ requestScope.applyPageInfo.pageNo >= requestScope.applyPageInfo.maxPage }">
						<button disabled>></button>
					</c:if>
					<c:if test="${ requestScope.applyPageInfo.pageNo < requestScope.applyPageInfo.maxPage }">
						<button id="nextPage">></button>
					</c:if>
					
					<button id="maxPage">>></button> 
			     </c:when>
			    <c:otherwise>
   				    <button id="searchStartPage"><<</button>
	
					<c:if test="${ requestScope.applyPageInfo.pageNo <= 1 }">
						<button disabled><</button>
					</c:if>
					<c:if test="${ requestScope.applyPageInfo.pageNo > 1 }">
						<button id="searchPrevPage"><</button>
					</c:if>
		
					<c:forEach var="p" begin="${ requestScope.applyPageInfo.startPage }" end="${ requestScope.applyPageInfo.endPage }" step="1">
						<c:if test="${ requestScope.applyPageInfo.pageNo eq p }">
							<button disabled><c:out value="${ p }"/></button>
						</c:if>
						<c:if test="${ requestScope.applyPageInfo.pageNo ne p }">
							<button onclick="seachPageButtonAction(this.innerText);"><c:out value="${ p }"/></button>
						</c:if>
					</c:forEach>
					
					<c:if test="${ requestScope.applyPageInfo.pageNo >= requestScope.applyPageInfo.maxPage }">
						<button disabled>></button>
					</c:if>
					<c:if test="${ requestScope.applyPageInfo.pageNo < requestScope.applyPageInfo.maxPage }">
						<button id="searchNextPage">></button>
					</c:if>
					
					<button id="searchMaxPage">>></button> 
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
        <br>
        <br>
        <div class="text-center" >
        <ul class="pagination">
		  <li><a href="#">1</a></li>
		  <li><a href="#">2</a></li>
		  <li><a href="#">3</a></li>
		  <li><a href="#">4</a></li>
		  <li><a href="#">5</a></li>
		</ul>
		</div>
    <br>
	<br>
	<br>
	<br>
	
	<%-- 페이지 처리 --%>
		<div class="pagination" align="center">
			<c:choose>
			    <c:when test="${ empty requestScope.searchValue }">
				    <button id="startPage"><<</button>
	
					<c:if test="${ requestScope.blockPageInfo.pageNo <= 1 }">
						<button disabled><</button>
					</c:if>
					<c:if test="${ requestScope.blockPageInfo.pageNo > 1 }">
						<button id="prevPage"><</button>
					</c:if>
		
					<c:forEach var="p" begin="${ requestScope.blockPageInfo.startPage }" end="${ requestScope.blockPageInfo.endPage }" step="1">
						<c:if test="${ requestScope.blockPageInfo.pageNo eq p }">
							<button disabled><c:out value="${ p }"/></button>
						</c:if>
						<c:if test="${ requestScope.blockPageInfo.pageNo ne p }">
							<button onclick="pageButtonAction(this.innerText);"><c:out value="${ p }"/></button>
						</c:if>
					</c:forEach>
					
					<c:if test="${ requestScope.blockPageInfo.pageNo >= requestScope.blockPageInfo.maxPage }">
						<button disabled>></button>
					</c:if>
					<c:if test="${ requestScope.blockPageInfo.pageNo < requestScope.blockPageInfo.maxPage }">
						<button id="nextPage">></button>
					</c:if>
					
					<button id="maxPage">>></button> 
			     </c:when>
			    <c:otherwise>
   				    <button id="searchStartPage"><<</button>
	
					<c:if test="${ requestScope.blockPageInfo.pageNo <= 1 }">
						<button disabled><</button>
					</c:if>
					<c:if test="${ requestScope.blockPageInfo.pageNo > 1 }">
						<button id="searchPrevPage"><</button>
					</c:if>
		
					<c:forEach var="p" begin="${ requestScope.blockPageInfo.startPage }" end="${ requestScope.blockPageInfo.endPage }" step="1">
						<c:if test="${ requestScope.blockPageInfo.pageNo eq p }">
							<button disabled><c:out value="${ p }"/></button>
						</c:if>
						<c:if test="${ requestScope.blockPageInfo.pageNo ne p }">
							<button onclick="seachPageButtonAction(this.innerText);"><c:out value="${ p }"/></button>
						</c:if>
					</c:forEach>
					
					<c:if test="${ requestScope.blockPageInfo.pageNo >= requestScope.blockPageInfo.maxPage }">
						<button disabled>></button>
					</c:if>
					<c:if test="${ requestScope.blockPageInfo.pageNo < requestScope.blockPageInfo.maxPage }">
						<button id="searchNextPage">></button>
					</c:if>
					
					<button id="searchMaxPage">>></button> 
			    </c:otherwise>
			</c:choose>   
		</div>
		
    </div>
    <div class="col-sm-3 sidenav">
    </div>
  </div>
</div>


	<script>
		const link = "${ pageContext.servletContext.contextPath }/user/manageApply";
		/* const searchLink = "${ pageContext.servletContext.contextPath }/board/search"; */
			
		if(document.getElementById("startPage")) {
			const $startPage = document.getElementById("startPage");
			$startPage.onclick = function() {
				location.href = link + "?currentPage=1";
			}
		}
		
		if(document.getElementById("prevPage")) {
			const $prevPage = document.getElementById("prevPage");
			$prevPage.onclick = function() {
				location.href = link + "?currentPage=${ requestScope.blockPageInfo.pageNo - 1 }";
			}
		}
		
		if(document.getElementById("nextPage")) {
			const $nextPage = document.getElementById("nextPage");
			$nextPage.onclick = function() {
				location.href = link + "?currentPage=${ requestScope.blockPageInfo.pageNo + 1 }";
			}
		}
		
		if(document.getElementById("maxPage")) {
			const $maxPage = document.getElementById("maxPage");
			$maxPage.onclick = function() {
				location.href = link + "?currentPage=${ requestScope.blockPageInfo.maxPage }";
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
				location.href = searchLink + "?currentPage=${ requestScope.blockPageInfo.pageNo - 1 }&searchCondition=${ requestScope.searchCondition}&searchValue=${ requestScope.searchValue}";
			}
		}
		
		if(document.getElementById("searchNextPage")) {
			const $searchNextPage = document.getElementById("searchNextPage");
			$searchNextPage.onclick = function() {
				location.href = searchLink + "?currentPage=${ requestScope.blockPageInfo.pageNo + 1 }&searchCondition=${ requestScope.searchCondition}&searchValue=${ requestScope.searchValue}";
			}
		}
		
		if(document.getElementById("searchMaxPage")) {
			const $searchMaxPage = document.getElementById("searchMaxPage");
			$searchMaxPage.onclick = function() {
				location.href = searchLink + "?currentPage=${ requestScope.blockPageInfo.maxPage }&searchCondition=${ requestScope.searchCondition}&searchValue=${ requestScope.searchValue}";
			}
		}
		
		/* if(document.getElementsByTagName("td")) {
			
			const $tds = document.getElementsByTagName("td");
			for(let i = 0; i < $tds.length; i++) {
				
				$tds[i].onmouseenter = function() {
					this.parentNode.style.backgroundColor = "orangered";
					this.parentNode.style.cursor = "pointer";
				}
				
				$tds[i].onmouseout = function() {
					this.parentNode.style.backgroundColor = "black";
				}
				
				$tds[i].onclick = function() {
					/* 게시물 번호까지 알아왔으니 이제 상세보기는 할 수 있겠지? */
					/* alert(this.parentNode.children[0].innerText);
				}
				
			} */
			
		/*  } */
		
		function pageButtonAction(text) {
			location.href = link + "?currentPage=" + text;
		}
		function seachPageButtonAction(text) {
			location.href = searchLink + "?currentPage=" + text + "&searchCondition=${ requestScope.searchCondition}&searchValue=${ requestScope.searchValue}";
		}
	</script>

 <!-- 푸터 시작 -->


<%@include file ="../common/footer.jsp" %>

   
</body>
</html>