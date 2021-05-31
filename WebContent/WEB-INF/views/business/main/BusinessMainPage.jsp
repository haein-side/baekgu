<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>기업 - 공고리스트</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      /* background-color: #f1f1f1; */
      height: 100%;
    }
    
   /*  /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    } */
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }

    .item1 {
        margin-right: 50px;
        border-radius: 3%;
        width: 25%;
        height: 250px;
        padding-top: 60px;
        color: snow;
    }
  </style>
</head>
<body>
<c:choose>
    <c:when test="${ not empty requestScope.message }">
    		<script>alert('${ requestScope.message }')</script>
    </c:when>
</c:choose>

<jsp:include page="../common/header.jsp"/>

		<div class="container-fluid text-center">
		
		  <div class="row content">
		
		    <div class="col-sm-2 sidenav">
		    </div>
		    <div class="col-sm-8 text-left">
		        <div style="margin-left: 200px;"> 
		        <br><br><br>
		        <h1 style="margin-left: 50px;"> <img src="${ pageContext.servletContext.contextPath }${ main.logoPath }" style="width :200px; height: 200px; margin-right: 100px; ">${ main.bName }</h1>
		        <ul style="padding-left: 25px;">
		          <li><p style="color: red; font-size: 15px;"><b>[주의]</b> 유료 상품을 이용 중이신 경우, 광고를 조기 마감하더라도 남은 기간에 대한 차액은 환불되지 않습니다.</p></li>
		          </ul>
                  </div>
		          <br>
		        <div  class="container">
		          <div  style="background-color: #ffff99; width: 1200px; height: 750px; padding-top: 1%; border-radius: 3%;">
		            <div style="display: flex; margin: 1%;">

		            <div  class="item" style="width: 30%; height: 25%; border-radius: 3%; margin-left: 400px; color: black;">
		              <h2 align="center">전체 공고현황</h2>
		              <span style="font-size: xx-large; padding-left: 150px;">${ main.totalPost }&nbsp건</span><br>
		            </div>
		            </div>
		            <div style="width: 100%; height:300px; background-color: ; display: flex;">
		              <div style="width: 40%; height: 80%; padding-top: 40px; border-radius: 3%; color: black; margin-left: 100px; margin-top: 40px;">
		                <h2  align="center">진행중인 공고</h2>
		                <span style="font-size: xx-large; padding-left: 230px;" align="center" >${ main.currntPost }</span><label>건</label>
		              </div>
		              <div style="width: 40%; height: 80%; padding-top: 40px; border-radius: 3%; color: black; margin-left: 30px; margin-top: 40px;">
		                <h2  align="center">총 지원자 수 현황</h2>
		                <span style="font-size: xx-large; padding-left: 230px;" align="center" >${ main.totalApplicant }</span><label>명</label>
		              </div>
		            </div>
		              <div style="width: 1200px; display:inline-flex; margin: 1%; margin-left: 26px;" align="center">
		                <div class="item1" style=" background-color: skyblue; cursor:pointer;" onclick="location.href='${ pageContext.servletContext.contextPath }/business/insertpost';">
		                  <h3>공고 등록</h3>
		                  <p>공고를 등록해 원하는 사람들을 만나보세요!</p>
		
		                </div>
		                <div class="item1" style=" background-color:skyblue ; cursor:pointer;" onclick="location.href='${ pageContext.servletContext.contextPath }/business/applicablePostlist';">
		                  <h3>지원자 관리</h3>
		                  <p>당신의 기업을 원하는 사람들을 만나보세요!</p>
		                </div>
		                <div class="item1" style=" background-color: skyblue; cursor:pointer;" onclick="location.href='${ pageContext.servletContext.contextPath }/business/postlist';">
		                  <h3>공고 관리</h3>
		                  <p>등록하신 공고를 한눈에 보세요!</p>
		                </div>
		                <div class="item1" style=" background-color: skyblue; cursor:pointer;" onclick="location.href='${ pageContext.servletContext.contextPath }/business/paymentlist';">
		                  <h3>결제 관리</h3>
		                  <p>결제한 공고들의 정보들을 한눈에 볼 수 있어요!</p>
		                </div>
		                <div class="item1" style=" background-color: skyblue; cursor:pointer;" onclick="location.href='${ pageContext.servletContext.contextPath }/business/advertise';">
		                  <h3>상품 안내</h3>
		                  <p>백구가 준비한 상품을 만나보세요!</p>
		                </div>
		              </div>
		            </div>
		        </div>
		    </div>
		    <div class="col-sm-2 sidenav">
		    </div>
		  </div>
		</div>
		<br><br><br>
		      <div class="col-sm-1 sidenav">
		      </div>
		    </div>
	<br><br><br>
		<jsp:include page="../common/footer.jsp"/>		
</body>
</html>
