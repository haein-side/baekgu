<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
      <form class="form-horizontal">
            <div class="col-sm-1 sidenav">
            </div>
            <div class="col-sm-10 text-left"> 
                <br><br><br>
                <h2 class="big">공고 등록</h2>
                <br><br><br>
            </div>
             <div class="col-sm-0 sidenav">
            </div>
            <div class="form-group">
                <label class="col-sm-8" style="font-size: xx-large;">인사 담당자님의 정보를 입력해주세요.</label>
            </div>
            <hr>
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">담당자 성함(필수)</label>
                <div class="col-sm-3">
                   <input type="email" class="form-control" id="inputEmail3" placeholder="담당자명 입력">
                </div>
            </div>
             <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">전화번호(필수)</label>
                <div class="col-sm-1">
                  <input type="text" class="form-control" id="inputPassword3" placeholder="ex) 010">
                </div>
                <div class="col-sm-1">
                  <input type="text" class="form-control" id="inputPassword3" placeholder="1234">
                </div>
                <div class="col-sm-1">
                  <input type="text" class="form-control" id="inputPassword3" placeholder="1234">
                </div>
              </div>
              <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">이메일 주소(필수)</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="inputPassword3" placeholder="이메일 주소">
                </div>
              </div>
              <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">업종</label>
                <div class="col-sm-6">
                  <textarea class="form-control" rows="2" style="resize: none;" placeholder="원하시는 업종을 추가해 주세요!"></textarea>
                </div>
                <div style="display: flex;">
                  <a href="#" class="btn">수정 추가하기</a>
                </div>
              </div>
              <label for="inputPassword3" class="col-sm-2 control-label">지역</label>
              <div class="col-sm-1">                                    
                <div class="dropdown">
                  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">지역 선택
                  <span class="caret"></span></button>
                  <ul class="dropdown-menu">
                    <li><a href="#">도봉구</a></li>
                    <li><a href="#">노원구</a></li>
                    <li><a href="#">강북구</a></li>
                    <li><a href="#">성북구</a></li>
                    <li><a href="#">중랑구</a></li>
                    <li><a href="#">은평구</a></li>
                    <li><a href="#">종로구</a></li>
                    <li><a href="#">동대문구</a></li>
                    <li><a href="#">광진구</a></li>
                    <li><a href="#">성동구</a></li>
                    <li><a href="#">서대문구</a></li>
                    <li><a href="#">마포구</a></li>
                    <li><a href="#">용산구</a></li>
                    <li><a href="#">강서구</a></li>
                    <li><a href="#">양천구</a></li>
                    <li><a href="#">구로구</a></li>
                    <li><a href="#">금천구</a></li>
                    <li><a href="#">영등포구</a></li>
                    <li><a href="#">동작구</a></li>
                    <li><a href="#">관악구</a></li>
                    <li><a href="#">서초구</a></li>
                    <li><a href="#">강남구</a></li>
                    <li><a href="#">송파구</a></li>
                    <li><a href="#">강동구</a></li>
                  </ul>
              </div>  
            </div>
            <div class="col-sm-3">
              <input type="text" class="form-control" id="inputPassword3" placeholder="상세주소를 입력해주세요.">
            </div>
            <div class="col-sm-0 sidenav">
            </div>
            <br><br><br><br><br>
            <div class="form-group">
                <label class="col-sm-8" style="font-size: xx-large;">이떤일 담당할 직원을 찾으시나요?</label>
            </div>
            <hr>
            <div class="form-group">
              <label for="inputEmail3" class="col-sm-2 control-label">모집분야명(필수)</label>
              <div class="col-sm-3">
                 <input type="email" class="form-control" id="inputEmail3" placeholder="담당자명 입력">
              </div>
          </div>
          <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">경력 기간</label>
            <div class="col-sm-offset-2 col-sm-0">
              <div class="checkbox" style="width: 600px;">
                <label>
                  <input type="checkbox"> 경력&nbsp;없음
                </label>
                <label> 
                  <input type="checkbox"> 1년&nbsp;이하
                </label>
                <label>
                  <input type="checkbox"> 1년&nbsp;이상
                </label>
                <label>
                  <input type="checkbox"> 2년&nbsp;이상
                </label>
                <label>
                  <input type="checkbox"> 3년&nbsp;이상
                </label>
                <label>
                  <input type="checkbox"> 4년&nbsp;이상
                </label>
                <label>
                  <input type="checkbox"> 5년&nbsp;이상
                </label>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">담당업무</label>
            <div class="col-sm-3">
               <input type="email" class="form-control" id="inputEmail3" placeholder="담당업무를 기재할수록 지원률이 높아집니다.">
            </div>
        </div>
          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">필수 / 우대 조건</label>
            <div class="col-sm-3">
               <input type="email" class="form-control" id="inputEmail3" placeholder="우대 조건이 있으신가요?">
            </div>
            <div style="display: flex;">
              <a href="#" class="btn">선택하기</a>
            </div>
        </div>
        <div>
          <button style="width: 100px; height: 50px;"class="btn btn-warning"><a href="WEB-INF/views/business/main/addpost2.jsp">다음</a></button>
        </div>
      </div>
    </div>
  </form>
    <br><br>
    <br><br>

	<jsp:include page="../common/footer.jsp"/>


</body>
</html>
