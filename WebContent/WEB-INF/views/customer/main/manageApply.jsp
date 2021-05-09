<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="RESOURCES/CSS/CUSTOMER/styleMa.css" rel="stylesheet">
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>입사지원관리페이지</title>
    <style>
        /* .container {
            position:absolute;
            top: 30%;
            left: 30%;
        } */
        thead {background : orange}
    </style>
</head>


<body class="body">

<%@include file ="../common/header.jsp" %>

    <div class="container" style=" top: 30%; left: 30%;">
     <div class="container-inside">
        <div class="col-sm-1 sidenav">
        </div>
        <div class="col-sm-10 text-left">
        <h1 style="font-family:BME; font-size: 50px;">입사지원관리</h1>
        <table border="0" width="800">
            <thead style= "font-family: BME; font-size:30px; font-weight: lighter;">
                <tr height="40">
                    <th>지원일</th>
                    <th>회사명</th>
                    <th>모집공고</th>
                    <th>지원취소</th>
                    <th>열람여부</th>
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
                           style="height:32px; width: 110px; font-size: 22px;"/>
                        </form>
                    </td>
                    <td>미열람</td>
                </tr>
            </tbody>
        </table>
    </div>
    </div>
    <div class="col-sm-1 sidenav">
    </div>   
</div>


 <!-- 푸터 시작 -->


<%@include file ="../common/footer.jsp" %>

   
</body>
</html>