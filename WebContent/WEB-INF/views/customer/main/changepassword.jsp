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
      <h1 class="form-signin-heading" style="height: 100px; margin-top: 100px; color: orange;">비밀번호 변경하기</h1>
        <div style="margin-bottom: 25px;">
			<lable class="text-label"><b>변경할 비밀번호</b></lable>
        	<input type="text" class="form-control" name="changepassword" placeholder="" required="" autofocus=""/>
        	<small id="passwordHelp" class="form-text text-muted">
        	영어와 숫자를 사용하여 8자리 이상 입력하세요.<br>(대문자, 소문자 사용에 주의하세요.)
			</small>	
        </div>
        <div>
        	<lable class="text-label"><b>비밀번호 확인 (다시 입력해주세요.)</b></lable>
        	<input type="text" class="form-control" name="changepasswordconfirm" placeholder="" required="">
			<!-- js에서 비밀번호가 일치하는지 검증 후 텍스트 띄우기? modal/alert창 띄우기? -->
        </div>

        <div class="form-group">
        <button class="btn btn-lg btn-primary btn-block" type="submit" style="height: 55px; width: 150px; font-size: 28px; margin-top: 70px; margin-bottom: 30px;" onclick=apply();>확인</button>
          <script>
              function apply(){
                  //비밀번호 변경여부 알림
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