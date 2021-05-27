<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%  // import 변수 설정
    String name = (String)request.getAttribute("name");
    String email = (String)request.getAttribute("email");
    String phone = (String)request.getAttribute("phone");
    String address = (String)request.getAttribute("address");
    int total = (int)request.getAttribute("total");    
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
              <th>남은 결제 가능 날짜</th>
            </tr>
          </thead>
          <tbody>
			<tr> 
				<td>${ paymentdetail.postAdCode }</td>
				<td>${ paymentdetail.postAdDate }</td>
				<td><c:if test="${ paymentdetail.pMethodCode eq 1 }">신용 카드</c:if></td>
				<td><c:if test="${ paymentdetail.postAdPaid eq 0 }">${ requestScope.dday } 일</c:if>
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
    <input type="hidden" id="postadcode" value="${ paymentdetail.postAdCode }"/>
    
<!--     <button type="button" id="dopay" >결제하기</button> -->
     
    
            <!-- 결제하기 버튼 누른 후 모달창 만들어놓음 -->
            <c:if test="${ paymentdetail.postAdPaid eq 0 }"><button id="dopay" type="button" class="btn-primary"  style="height: 50px; width: 150px;">결제하기</button>
             </c:if>
             <c:if test="${ paymentdetail.postAdPaid eq 1 }"><button type="button" class="btn-primary" style="height: 50px; width: 150px;">영수증 출력하기</button>
             </c:if>
<%--             <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
                      <button id="doPay" type="button" class="btn btn-default">결제하기</button>
                    </div>
                  </div>
                </div>


    </div> --%>
    </div>
    </div>
    <div class="col-sm-1 sidenav">
    </div>
  </div>
</div>
<br><br><br><br>
	<jsp:include page="../common/footer.jsp"/>
	
	
	   <script>
	   
	   
    $('#dopay').click(function(){
    	
	   const postadcode = document.getElementById("postadcode").value;
    	var success;
    	console.log(postadcode);
        var IMP = window.IMP; // 생략가능
        IMP.init('imp36587437'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '백구 (백세구인구직)',
            amount : <%=100000%>,
            buyer_email : '<%=email%>',
            buyer_name : '<%=name%>',
            buyer_tel : '<%=phone%>',
            buyer_addr : '<%=address%>',
            buyer_postcode : '123-456',
            //m_redirect_url : 'http://www.naver.com'
            
        }, function(rsp) {
        	
            if ( rsp.success ) {
            	
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                
                jQuery.ajax({
                	
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                      success = 1;
                        
                        $.ajax({
                        	
                        	url:"/baekgu/business/paycomplate",
                        	type:"GET",
                        	data:{ success : success,
                        		postadcode : postadcode
                        	},
                        	success:function(data, textStatus, xhr){
                        		
                        		
                        		location.replace("${ pageContext.servletContext.contextPath }/business/paymentlist")
                                              	}
                        
                        });	
                        
<%--                 location.href='<%=request.getContextPath()%>/order/paySuccess?msg='+msg; --%>
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
             <%--    location.href="<%=request.getContextPath()%>/order/payFail"; --%>
                alert(msg);
            }
        });
        
    });
   </script>

</body>
</html>