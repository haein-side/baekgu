<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="RESOURCES/CSS/CUSTOMER/styleMa.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <<!-- script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
    <link rel="stylesheet" href="RESOURCES/CSS/CUSTOMER/YJCSS/header2.css"
	type="text/css">
    <title>입사지원관리페이지</title>
    <style>
    	h1 {
    	color:orange;
    	}
        /* .container {
            position:absolute;
            top: 30%;
            left: 30%;
        } */
        thead {background : orange}
    </style>
</head>


<body class="body">

<%@ include file="../common/header2.jsp"%>

    <div class="container-fluid text-center">    
  <div class="row content" style="margin-top: 250px; z-index: 1;">
    <div class="col-sm-2 sidenav">
    </div>
    <div class="col-sm-6 text-left" style="padding-left: 70px;"> 
      <h1 style="font-family:BME;">입사지원관리</h1>
        <table border="1" width="800">
          <br>
          <br>
          <br>
            <thead style= "font-family: icomoon; font-size:20px; font-weight: lighter;">
                <tr height="40">
                    <th style="text-align: center;">지원일</th>
                    <th style="text-align: center;">회사명</th>
                    <th style="text-align: center;">모집공고</th>
                    <th style="text-align: center;">지원취소</th>
                    <th style="text-align: center;">열람여부</th>
                </tr>
            </thead>
            <tbody align="center" style="font-family: icomoon; font-size:20px;">
                <tr height="40">
                    <td>2020.05.02</td>
                    <td>크린토피아</td>
                    <td><a href="https://www.naver.com/">세탁소 직원 모집합니다</td>
                    <td>
                        <form>
                            <input type="button" name="cancel" onclick="alert('정말 지원을 취소하시겠습니까?');" value="지원취소"
                           style="height:32px; width: 110px; font-size: 22px; background: orange; color: white;"/>
                        </form>
                    </td>
                    <td>미열람</td>
                </tr>
            </tbody>
        </table>
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
	<br>
	<br>
	<br>
	<br>
	<h1 style="font-family:BME;">신고내역관리</h1>
        <table border="1" width="800">
          <br>
          <br>
            <thead style= "font-family: icomoon; font-size:20px; font-weight: lighter;">
                <tr height="40">
                    <th style="text-align: center;">신고일자</th>
                    <th style="text-align: center;">신고제목</th>
                    <th style="text-align: center;">신고결과</th>
                </tr>
            </thead>
            <tbody align="center" style="font-family: icomoon; font-size:20px;">
                <tr height="40">
                    <td>2020.05.02</td>
                    <td>크린토피아 공고 신고</td>
                    <td>접수중</td><!-- 심사상태 가져오면 됨 -->
                </tr>
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
    </div>
    <div class="col-sm-3 sidenav">
    </div>
  </div>
</div>


 <!-- 푸터 시작 -->


<%@include file ="../common/footer.jsp" %>

   
</body>
</html>