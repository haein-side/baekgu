<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
    <link rel="stylesheet" href="RESOURCES/CSS/CUSTOMER/YJCSS/header2.css" type="text/css">
    <link rel="stylesheet" href="RESOURCES/CSS/CUSTOMER/findpassword.css" type="text/css">
<style> {


}</style>

</head>
<body>

 	<div class="form-group" style="z-index 1;">
	<%@ include file="../common/header2.jsp" %>
 	</div>
	
	<div class="wrapper">
    <form class="form-signin" style="margin-top: 15%; height: 650px;">        
      <h1 class="form-signin-heading" style="height: 100px; margin-top: 100px; color: orange;">비밀번호 찾기</h1>
        <lable class="text-label"><b>이름</b></lable>
        <input type="text" class="form-control" name="name" placeholder="(예 : 홍길동)" required="" autofocus=""/>
        <small id="inputname" class="form-text text-muted"></small><br><br>
        <lable class="text-label"><b>전화번호 (고객 아이디)</b></lable><br>
        
        <div class="form-group">
          <input class="form-control" type="text" name="phone" placeholder="(예 : 01012345678)" style="width: 62%; float: left;" required=""> </input>
          <button class="btn btn-block-1 btn-lg-1 btn-primary-1" data-toggle="modal" data-target="#myModal" style="margin-left: 10px; width: 35%; float:left; height: 43px; font-size: 20px;">인증번호 요청
<!--           	모달
          	<div class="modal-content">
        		<div class="modal-header">
          		<button type="button" class="close" data-dismiss="modal">&times;</button>
          		<h4 class="modal-title">Modal Header</h4>
        		</div>
        		<div class="modal-body">
          		<p>Some text in the modal.</p>
        		</div>
        		<div class="modal-footer">
          		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        	</div>
      		</div> -->
          </button><br><br>
          
          
          <p style="margin-bottom: 35px;"><small>특수문자(-)를 제외한 숫자만 입력하세요.</small></p>
        </div>
          <lable class="text-label"><b>인증번호</b></lable><br>
          <input type="text" class="form-control" name="phone" placeholder="(예 : 01012345678)" required=""/>
        
        <div class="form-group">
        <button class="btn btn-lg btn-primary btn-block" type="submit" style="height: 55px; width: 150px; font-size: 28px; margin-top: 70px; margin-bottom: 30px;" onclick=apply();>확인</button>
          <script>
              function apply(){
                  //로그인 회원일 경우 바로 지원하기로 넘어간다
                  window.open("password.html", "a", "width=500, height=300, left=500, top=250");
              }
          </script>
        </div>
      </form>
    </div>

	<!-- footer -->
	<%@ include file="../main/footerHW.jsp" %>
	
</body>
</html>