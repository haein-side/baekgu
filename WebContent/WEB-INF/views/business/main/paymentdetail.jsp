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

<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-1 sidenav">
    </div>
    <div class="col-sm-10 text-left"> 
      <h1>결제내역 상세조회 및 결제하기</h1>
      <p style="font-weight: bold;">결제 내역 상세보기</p>
      <p>결제 번호 : ${ paymentdetail.postAdCode }</p>
      <br>
      <br>
      <hr>
      <h3 style="font-weight: bold;">1) 결제 정보</h3>
      <br>
        <table class="table table-bordered">
          <thead>
            <tr>
              <th>결제 번호</th>
              <th>결제 날짜</th>
              <th>결제 수단</th>
              <th>결제 상태</th>
            </tr>
          </thead>
          <tbody>
			<tr> 
				<td>${ paymentdetail.postAdCode }</td>
				<td>${ paymentdetail.postAdDate }</td>
				<td><c:if test="${ paymentdetail.pMethodCode eq 1 }">신용 카드</c:if></td>
				<td><c:if test="${ paymentdetail.postAdPaid eq 0 }">미결제 (결제 진행중)</c:if>
				    <c:if test="${ paymentdetail.postAdPaid eq 1 }">결제 완료</c:if>
				    </td>			
			</tr>
          </tbody>
        </table>

        <br>
        <br>
        <br>

         <h3 style="font-weight: bold;">2) 구매 상품 정보</h3>
        <br>
            <table class="table table-bordered">
            <thead>
                <tr>
                <th>상품 이름(위치)</th>
                <th>이용 이간(주)</th>
                <th>상품 금액</th>
                <th>총결제 금액</th>
                </tr>
            </thead>
            <tbody>
                <tr>
				<td>${ paymentdetail.adName }</td>
				<td>${ paymentdetail.postAdWeek }</td>
				<td>${ paymentdetail.adPrice }</td>
				<td>${ paymentdetail.totalPrice }</td>	
                </tr>
            </tbody>
            </table>

         <br>
        <br>
        <br>    
        <h3 style="font-weight: bold;">3) 공고 정보</h3>
        <br>
            <table class="table table-bordered">
            <thead>
                <tr>
                <th>공고 번호</th>
                <th>공고 시작일</th>
                <th>공고 마감일</th>
                <th>공고 담당자 이름</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${ paymentdetail.postCode }</td>
                    <td>${ paymentdetail.postStart }</td>
                    <td>${ paymentdetail.postEnd }</td>
                    <td>${ paymentdetail.postMName }</td>
                </tr>
            </tbody>
            </table>
            <br> 
            <br>
            <br>
    <div align="center">
            <!-- 결제하기 버튼 누른 후 모달창 만들어놓음 -->
            <c:if test="${ paymentdetail.postAdPaid eq 0 }"><button type="button" class="btn-primary"  style="height: 50px; width: 150px;" data-toggle="modal" data-target="#myModal">결제하기</button>
             </c:if>
             <c:if test="${ paymentdetail.postAdPaid eq 1 }"><button type="button" class="btn-primary" style="height: 50px; width: 150px;">영수증 출력하기</button>
             </c:if>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title" id="myModalLabel">결제하시겠습니까?</h4>
                    </div>
                    <div class="modal-body">
                      총 ${ paymentdetail.totalPrice } 원이 결제됩니다
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                      <button type="button" class="btn btn-default">결제하기</button>
                    </div>
                  </div>
                </div>


    </div>
    </div>
    </div>
    <div class="col-sm-1 sidenav">
    </div>
  </div>
</div>
<br><br><br><br>
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>