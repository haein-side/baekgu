<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
    <link rel="stylesheet" href="RESOURCES/CSS/CUSTOMER/findpassword.css" type="text/css">
</head>
<body>

<%-- <%@ include file="../common/header1.jsp" %> --%>
	
	<div class="wrapper">
    <form class="form-signin">        
      <h2 class="form-signin-heading">비밀번호 찾기</h2>
        <lable class="text-label"><b>이름</b></lable>
        <input type="text" class="form-control" name="name" placeholder="(예 : 홍길동)" required="" autofocus=""/>
        <small id="inputname" class="form-text text-muted"></small><br><br>
        <lable class="text-label"><b>전화번호 (고객 아이디)</b></lable><br>
        
        <div class="form-group">
          <input class="form-control" type="text" name="phone" placeholder="(예 : 01012345678)" style="width: 62%; float: left;" required=""> </input>
          <button class="btn btn-block-1 btn-lg-1 btn-primary-1" style="margin-left: 10px; width: 35%; float:left;">인증번호 요청</button><br><br>
          <p style="margin-bottom: 35px;"><small>특수문자(-)를 제외한 숫자만 입력하세요.</small></p>
        </div>
          <lable class="text-label"><b>인증번호</b></lable><br>
          <input type="text" class="form-control" name="phone" placeholder="(예 : 01012345678)" required=""/>
        
        <div class="form-group">
        <button class="btn btn-lg btn-primary btn-block" type="submit" onclick=apply();>확인</button>
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
	<%-- <%@ include file="../common/footer.jsp" %> --%>
	
</body>
</html>