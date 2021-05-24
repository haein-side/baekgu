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
      <h1>지원자관리 - 이력서</h1>
      <ul style="padding-left: 25px;">
        <li>지원자 이름을 누르면 이력서 조회가 가능합니다.</li>
        <li>우대사항 적합성을 통하여 등록하신 공고와 지원자간의 적합성을 비교하실 수 있습니다</li>
        <li>합격여부를 선택하여 지원자를 관리할 수 있습니다</li>
        <li>지원자의 이력서 내용에 따라 신고하기가 가능합니다. 신고 사항은 접수 후 규정에 따라 처리됩니다.</li>
      </ul>
      <hr>
       
      <br>
      <br>
      
      <h3><i><c:out value="${ requestScope.applicationList.get(0).postTitle }"/></i></h3>
      <p><i><b>공고 시작일</b> <c:out value="${ requestScope.applicationList.get(0).postStart }"/> ~ <b>공고 마감일 </b><c:out value="${ requestScope.applicationList.get(0).postEnd }"/></i></p>
      
      
        <table class="table table-bordered">
          <thead>
            <tr>
              <th style="display:none">지원코드</th>
              <th style="display:none">이력서코드</th>
              <th>이력서 열람여부</th>
              <th>이름</th>
              <th>지원일</th>
              <th>우대사항 적합성</th>
              <th>합격여부</th>
              <th>신고하기</th>
            </tr>
          </thead>
          
          <tbody>
            <c:forEach var="application" items="${ requestScope.applicationList }">
            <tr>
                <td style = "display:none"><c:out value="${ application.applyCode }"/></td>
            
                <td style = "display:none"><c:out value="${ application.resumeCode }"/></td>
            
            	<c:if test="${ application.resumeRead eq 0 }">
            	    <td style="color:red;">미열람</td>
            	</c:if>
            	<c:if test="${ application.resumeRead eq 1 }">
            	    <td style="color:blue;">열람</td>
            	</c:if>
            	
            	<td><c:out value="${ application.applicantName }"/></td>
            	
            	<td><c:out value="${ application.applyDate }"/></td>
            	
            	<td><c:out value="${ application.postAdvantages }"/></td>
            	
                <td style="width: 250px;">
               		<select class="form-control" name="applicant">
                    	<option value="none">미분류</option>
                    	<option value="yes">합격</option>
                    	<option value="no">불합격</option>
                	</select>
              	</td>
              	
	            <td>
	              <input type="button" class="btn btn-primary" style="width: 100px;" data-toggle="modal" data-target="#report" value="신고하기"/>
	                    <!-- 지원자 신고하기 모달창 만들어놓았음 -->
	                    <div class="modal fade" id="report" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	                        <div class="modal-dialog" role="document">
	                        <div class="modal-content">
	                            <div class="modal-header">
	                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	                            <h4 class="modal-title" id="myModalLabel">신고하시겠습니까?</h4>
	                            </div>
	                            <div class="modal-body">
	                            신중한 신고 부탁드립니다.
	                            </div>
	                            <div class="modal-footer">
	                            <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	                            <button type="button" class="btn btn-default"><a href="home.html">신고하기</a></button>
	                            </div>
	                        </div>
	                        </div>
	                    </div>
                 </td>
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
					const no = this.parentNode.children[0].innerText;
					location.href = "${ pageContext.servletContext.contextPath }/business/userresume?applyCode="+no;
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