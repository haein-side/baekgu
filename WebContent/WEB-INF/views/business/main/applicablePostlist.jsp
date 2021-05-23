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
      <h1>지원자관리</h1>
      <ul style="padding-left: 25px;">
        <li>공고를 누르면 이력서 조회가 가능합니다.</li>
      </ul>
       
      <br>
      <br>
      
        <table class="table table-bordered">
          <thead>
            <tr>
              <th>공고담당자</th>
              <th>공고제목</th>
              <th>모집인원</th>
              <th>지원자수</th>
              <th>미열람 지원자 수</th>
              <th>마감일</th>
            </tr>
          </thead>
          <tbody>
           <%-- <c:forEach var="post" items="${ requestScope.postList }">
			<tr> 
				<td><c:out value="${ post.decisionStatus }"/></td>
				<td><c:out value="${ post.postDate }"/></td>
				<td><c:out value="${ post.postTitle }"/></td>
				<td><c:out value="${ post.adName }"/></td>
				<td><c:out value="${ post.postStart }"/></td>
				<td><c:out value="${ post.postEnd }"/></td>
				<td><c:out value="${ post.countOfApplicants }"/></td>
			</tr>
			</c:forEach> --%>
          </tbody>
        </table>
  
      <br>
      <br>
      
      <div class="text-center">
        <ul class="pagination" align="center">
          <li><a href="#">1</a></li>
          <li><a href="#">2</a></li>
          <li><a href="#">3</a></li>
          <li><a href="#">4</a></li>
          <li><a href="#">5</a></li>
        </ul>
      </div>
    
  </div>
</div>
</div>


  

	<jsp:include page="../common/footer.jsp"/>


</body>
</html>