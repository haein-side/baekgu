<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  </style>
</head>
<body>

<jsp:include page="../common/header.jsp"/>

		<div class="container-fluid text-center">
		
		  <div class="row content">
		
		    <div class="col-sm-3 sidenav">
		    </div>
		    <div class="col-sm-6 text-left">
		        <div> 
		        <br><br><br>
		        <h1> <img src="../resources/images/cat.jpg" style="width :200px; height: 200px;">기업 이름이 들어갈 것입니당<div class=""></div></h1>
		        <ul style="padding-left: 25px;">
		          <li><p style="color: red; font-size: 15px;"><b>[주의]</b> 유료 상품을 이용 중이신 경우, 광고를 조기 마감하더라도 남은 기간에 대한 차액은 환불되지 않습니다.</p></li>
		          </ul>
		          <br>
		        <div  class="container">
		          <div  style="background-color: orange; width: 1000px; height: 800px; padding-top: 1%;">
		            <div style="display: flex; margin: 1%;">
		            <div  class="item" style="width: 30%; height: 25%;  background-color: orange;">
		              <h2 align="center">진행중 공고</h2>
		              <span style="font-size: xx-large; padding-left: 100px;">n</span><label>건</label><br>
		            </div>
		              <div class="item" style="width: 100%; background-color: orange;">
		              </div>
		            </div>
		            <div style="width: 100%; height:300px; background-color: orange; display: flex;">
		              <div style="width: 50%; height: 100%; background-color: orange; padding-top: 80px;">
		                <h2  align="center">등록된 공고 현황</h2>
		                <span style="font-size: xx-large; padding-left: 250px;" align="center" >n</span><label>건</label>
		              </div>
		              <div style="width: 50%; height: 100%; background-color: orange; padding-top: 80px;">
		                <h2  align="center">총 지원자 수 현황</h2>
		                <span style="font-size: xx-large; padding-left: 250px;" align="center" >n</span><label>명</label>
		              </div>
		            </div>
		              <div style="width: 1000px; display:inline-flex; margin: 1%; margin-left: 26px;" align="center">
		                <div id="gopostinsert" class="item1" style=" width: 19%; height: 300px; background-color: orange;">
		                  <h3>공고 등록</h3>
		                  <p>공고를 등록해 원하는 사람들을 만나보세요!</p>
		                  <input type="button" value="공고등록"/>
		                </div>
		                <div class="item1" style=" width: 19%; height: 300px; background-color: orange;">
		                  <h3>지원자 관리</h3>
		                  <p>당신의 기업을 원하는 사람들을 만나보세요!</p>
		                  <button>여기를 눌러</button>
		                </div>
		                <div class="item1" style=" width: 19%; height: 300px; background-color: orange;">
		                  <h3>공고 관리</h3>
		                  <p>등록하신 공고를 한눈에 보세요!</p>
		                  <button>여기를 눌러</button>
		                </div>
		                <div class="item1" style=" width: 19%; height: 300px; background-color: orange;">
		                  <h3>결제 관리</h3>
		                  <p>돈을 얼마나 썻는지 한눈에 알수 있어요!</p>
		                  <button>여기를 눌러</button>
		                </div>
		                <div class="item1" style=" width: 19%; height: 300px; background-color: orange;">
		                  <h3>상품 안내</h3>
		                  <p>돈을 주면 사람들에게 더 눈에 잘 띄이게 해줘요!</p>
		                  <button>여기를 눌러</button>
		                </div>
		              </div>
		            </div>
		        </div>
		    </div>
		    <div class="col-sm-3 sidenav">
		    </div>
		  </div>
		</div>
		<br><br><br>
		      <div class="col-sm-1 sidenav">
		      </div>
		    </div>
	<br><br><br>

		<jsp:include page="../common/footer.jsp"/>
		
 		<script>
		$("#gopostinsert").click(function(){
			
			alert("안녕 클릭이 되니?");
			location.replace="${ pageContext.servletContext.contextPath }/business/insertpost";
			
			
		});
		
		</script>


</body>
</html>
