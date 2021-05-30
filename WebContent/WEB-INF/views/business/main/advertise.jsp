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
<c:choose>
    <c:when test="${ not empty requestScope.postTitle }">
          <script>alert('담당자 - ' + '${ requestScope.postManager }' + 
        		       '\n공고제목 - ' + '${ requestScope.postTitle }' + 
        		       '\n광고상품 - ' + '${ requestScope.adName }' + 
        		       '\n\n 공고 심사가 승인 된 후, 결제내역에서 결제를 진행해 주십시오!')</script>
    </c:when>
</c:choose>

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
        <input type="button" class="btn btn-warning" value="이 상품 담기" id="premium1"/>
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
        <input type="button" class="btn btn-warning" value="이 상품 담기"  id="premium2"/>
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
        <input type="button" class="btn btn-warning" value="이 상품 담기" id="premium3"/>
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
        <input type="button" class="btn btn-warning" value="이 상품 담기" id="premium4"/>
      </p>
      </button>

		<div class="col-sm-3 sidenav">
    	
    	</div>
	
	 <hr>	
	 <h3>광고신청 가능한 공고 리스트</h3>
	 <ul style="padding-left: 25px;">
	 	<li>공고를 선택하여 주세요</li>
        <li>광고는 심사중인(접수) 공고에만 신청하실 수 있습니다(이미 승인된 공고에는 신청이 불가합니다)</li>
        <li>공고 시작일로부터 마감일까지의 전체 기간만 가능하며, 부분 기간 설정은 불가합니다</li>
        <li><p style="color: red;">[주의] 유료 상품을 이용 중이신 경우, 광고를 조기 마감하더라도 남은 기간에 대한 차액은 환불되지 않습니다</p></li>
     </ul>
	
	 <table class="table table-bordered">
          <thead>
            <tr>
              <th style="display:none">공고코드</th>
              <th>공고담당자</th>
              <th>업종</th>
              <th>직종</th>
              <th>공고제목</th>
              <th>공고시작일</th>
              <th>공고마감일</th>
              <th>공고기간(단위 : 주)</th>
            </tr>
          </thead>
          <tbody>
          
         
            <c:forEach var="postAd" items="${ requestScope.postAdList }">
			<tr> 
 				<td style="display:none"><c:out value="${ postAd.postCode }"/></td>
 				<td><c:out value="${ postAd.postManager }"/></td>
 				<td><c:out value="${ postAd.industry }"/></td>
 				<td><c:out value="${ postAd.job }"/></td>
				<td><c:out value="${ postAd.postTitle }"/></td>
				<td><c:out value="${ postAd.postStart }"/></td>
				<td><c:out value="${ postAd.postEnd }"/></td>
				<td><c:out value="${ postAd.weeks }"/></td>
			</tr>
			</c:forEach> 
          </tbody>
        </table>

		<hr>
		<h3>선택한 상품과 공고</h3>
		<ul style="padding-left: 25px;">
			<li style="color:red">결제는 해당 공고가 승인이 난 후, 결제관리 페이지에서 가능합니다!</li>
		</ul>
		<form id="advertiseForm" action="${ pageContext.servletContext.contextPath }/business/advertise" method="post" style="margin-bottom: 50px">
			<input style="display:none;" type="text" name="selectedPostCode" id="selectedPostCode" value="" style="margin-left:20px"/>
			<input style="display:none;" type="text" name="selectedAdCode" id="selectedAdCode" value="" style="margin-left:20px" />
			
			<label> 공고 담당자 - </label> <input type="text" name="selectedManager" id="selectedManager" value="" style="margin-left:15px" readonly required/>
			<br>
			<label> 업종 -  </label><input type="text" name="selectedIndustry" id="selectedIndustry" value="" style="margin-left:15px" readonly required/>
			<br>			
			<label> 직종 -  </label><input type="text" name="selectedJob" id="selectedJob" value="" style="margin-left:15px" readonly required/>
			<br>
			<label> 공고 제목 -  </label><input type="text" name="selectedPostTitle" id="selectedPostTitle" value="" style="margin-left:15px" size="70" readonly required>
			<br>
			<label> 공고 기간(단위 : 일주일) -  </label><input type="text" name="selectedWeeks" id="selectedWeeks" value="" style="margin-left:15px" size="3px" readonly required/>
			<br><br>
			<label> 광고 상품 -  </label><input type="text" name="selectedAd" id="selectedAd" value="" style="margin-left:15px" size="40px" readonly required/>
			
			<input type="submit" id="adSubmit" class="btn btn-info btn-submit" value="광고신청">
			<input type="reset" id="adReset" class="btn btn-info btn-submit" value="다시선택하기">
		</form>
    </div>
  </div>
</div>

<jsp:include page="../common/footer.jsp"/>

<script>
window.onload = function(){
	 $( '#advertiseForm' ).submit( function( event ) {

        //validate fields
        var fail = false;
        var fail_log = '';
        var name;
        $( '#advertiseForm' ).find( 'input' ).each(function(){
            if( ! $( this ).prop( 'required' )){

            } else {
                if ( ! $( this ).val() ) {
                    fail = true; 
                     name = $( this ).attr( 'name' );
                     fail_log = "상품과 공고를 선택후 진행하여 주십시오.";
                 }

            }
        });

        if ( fail ) {
            alert( fail_log );
            event.preventDefault();
        } 
        /* else{
        	alert("test");
        }
 */
	}); 
	/* $('#adSubmit').click(function(e) {
		if($('#selectedIndustry').val() == ""){
			alert("test jquery");
			e.preventDefault();
		}
	}); */
	
	
	const link = "${ pageContext.servletContext.contextPath }/business/advertise";
	const categoryLink = "${ pageContext.servletContext.contextPath }/business/advertise";
		
	const $premium1 = document.getElementById("premium1")
	$premium1.onclick = function() {
		
		document.getElementById("selectedAd").value = "프리미엄 업종 상단(₩130,000/1주)";
		document.getElementById("selectedAdCode").value = 1;

	}
	const $premium2 = document.getElementById("premium2")
	$premium2.onclick = function() {
		
		document.getElementById("selectedAd").value = "프리미엄 업종 하단(₩100,000/1주)";
		document.getElementById("selectedAdCode").value = 2;

	}
	const $premium3 = document.getElementById("premium3")
	$premium3.onclick = function() {
		
		document.getElementById("selectedAd").value = "프리미엄 직종 상단(₩70,000/1주)";
		document.getElementById("selectedAdCode").value = 3;


	}
	const $premium4 = document.getElementById("premium4")
	$premium4.onclick = function() {
		
		document.getElementById("selectedAd").value = "프리미엄 직종 하단(₩50,000/1주)";
		document.getElementById("selectedAdCode").value = 4;

	}
	
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
				document.getElementById("selectedPostCode").value = this.parentNode.children[0].innerText;
				
				document.getElementById("selectedManager").value = this.parentNode.children[1].innerText;
				document.getElementById("selectedIndustry").value = this.parentNode.children[2].innerText;
				document.getElementById("selectedJob").value = this.parentNode.children[3].innerText;
				document.getElementById("selectedPostTitle").value = this.parentNode.children[4].innerText;
				document.getElementById("selectedWeeks").value = this.parentNode.children[7].innerText;
				
 			} 
		}
		
		
		
	}
	
	
	function pageButtonAction(text) {
		location.href = link + "?currentPage=" + text;
	}
}

</script>


</body>
</html>
