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
      <h1>상품 안내</h1>
      <ul style="padding-left: 25px;">
        <li>백구의 상품이 공고를 더욱 효과적으로 노출될 수 있도록 도와드립니다</li>
        <li>명시된 가격은 1주 기간동안의 가격입니다</li>
        <li><p style="color: red;">[주의] 공고 승인이 된 이후, 공고 시작일전에 결제를 완료해주셔야 정상적으로 광고 효과가 적용됩니다</p></li>
      </ul>
      <hr>
		
		<h2>백구 상품 리스트 - <a href="#"> 상품 예시 보러가기 </a></h2>
		<br>
      <button type="button" class="btn btn-default" style="height: 190px; width: 800px;">
      <h3 class ="text-left" style="color:red;"><i>상품 1 - 프리미엄 상단 업종 배치 </i></h3>
      <p style= "text-align: left;">
        단순 검색 + 상세 검색시 일치하는 업종에 최상단(첫번째 줄) 배치
        <br>
        <b>노출 빈도 최대 <span style="color: red;">12배</span> 증가 예상</b>
        <br>
        <b>일반광고 대비 열람수 최대 <span style="color: red;">50배</span> 증가 예상</b>
      </p>
      <p style="text-align: right;">
        130,000원 / 7일
        <br>
        <input type="button" class="btn btn-warning" value="이 상품 담기" />
      </p>
      </button>

      <br>
      <br>

      <button type="button" class="btn btn-default" style="height: 190px; width: 800px;">
      <h3 class ="text-left" style="color:blue;"><i>상품 2 - 프리미엄 하단 업종 배치 </i>
      </h3>      
      <p style= "text-align: left;">
        단순 검색 + 상세 검색시 일치하는 업종에 상단(두번째줄) 배치
        <br>
        <b>노출 빈도 최대 <span style="color: blue;">12배</span> 증가 예상</b>
        <br>
        <b>일반광고 대비 열람수 최대 <span style="color: blue;">45배</span> 증가 예상</b>
      </p>
      <p style="text-align: right;">
        100,000원 / 7일
        <br>
        <input type="button" class="btn btn-warning" value="이 상품 담기" />
      </p>
      </button>

		<div class="col-sm-1 sidenav">
    	</div>
    
      <br>
      <br>
      
      <button type="button" class="btn btn-default" style="height: 190px; width: 800px;">
      <h3 class ="text-left" style="color:green;"><i>상품 3 - 프리미엄 상단 직종 배치 </i></h3>
      <p style= "text-align: left;">
        상세 검색시 일치하는 직종에 상단(세번째줄) 배치
        <br>
        <b>노출 빈도 최대 <span style="color: green;">8배</span> 증가 예상</b>
        <br>
        <b>일반광고 대비 열람수 최대 <span style="color: green;">25배</span> 증가 예상</b>
      </p>
      <p style="text-align: right;">
        70,000원 / 7일
        <br>
        <input type="button" class="btn btn-warning" value="이 상품 담기" />
      </p>
      </button>

		<div class="col-sm-2 sidenav">
    	</div>

      <br>
      <br>

      <button type="button" class="btn btn-default" style="height: 190px; width: 800px;">
      <h3 class ="text-left" style="color:orange;"><i>상품 4 - 프리미엄 하단 업종 배치 </i></h3>
      <p style= "text-align: left;">
        상세 검색시 일치하는 직종에 상단(네번째줄) 배치
        <br>
        <b>노출 빈도 최대 <span style="color: orange;">8배</span> 증가 예상</b>
        <br>
        <b>일반광고 대비 열람수 최대 <span style="color: orange;">20배</span> 증가 예상</b>
      </p>
      <p style="text-align: right;">
        50,000원 / 7일
        <br>
        <input type="button" class="btn btn-warning" value="이 상품 담기" />
      </p>
      </button>

		<div class="col-sm-3 sidenav">
    	
    	</div>
	
	 <hr>	
	 <h3>광고 신청한 공고 리스트</h3>
	 <ul style="padding-left: 25px;">
	 	<li>공고를 선택하여 주세요</li>
        <li>광고는 심사중인(접수) 공고에만 신청하실 수 있습니다(이미 승인된 공고에는 신청이 불가합니다)</li>
        <li>공고 시작일로부터 마감일까지의 전체 기간만 가능하며, 부분 기간 설정은 불가합니다</li>
        <li><p style="color: red;">[주의] 유료 상품을 이용 중이신 경우, 광고를 조기 마감하더라도 남은 기간에 대한 차액은 환불되지 않습니다</p></li>
     </ul>
	
	 <table class="table table-bordered">
          <thead>
            <tr>
              <th>공고담당자</th>
              <th>공고제목</th>
              <th>공고시작일</th>
              <th>공고마감일</th>
              <th>공고기간(단위 : 주)</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="holdPost" items="${ requestScope.holdPostList }">
			<tr> 
 				<td><c:out value="${ report.reportDate }"/></td>
 				<td><c:out value="${ report.managerName }"/></td>
				<td><c:out value="${ report.postTitle }"/></td>
				<td><c:out value="${ report.userName }"/></td>
				<td><c:out value="${ report.reportReason }"/></td>
				<td><c:out value="${ report.decisionStatus }"/></td>
				<td><c:out value="${ report.decisionDate }"/></td>
				<td><c:out value="${ report.decisionReason }"/></td>
			</tr>
			</c:forEach> 
          </tbody>
        </table>

    </div>
    
  </div>
</div>

<jsp:include page="../common/footer.jsp"/>


</body>
</html>
