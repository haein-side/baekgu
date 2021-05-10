<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백구 개인회원 로그인</title>
<link rel="stylesheet" href="RESOURCES/CSS/CUSTOMER/signin.css" type="text/css">
</head>

<body>
   <%-- <%@ include file="../common/header.jsp" %>  --%>
	<div class="container">
    <div class="wrapper">
      <form class="form-signin">

        <h2 class="form-signin-heading">개인회원 로그인</h2>
        <div class="buttontype">
          <input type="button" value="개인회원" class="signinbutton" onclick="" default> &nbsp;&nbsp;
          <input type="button" value="기업회원" class="signinbutton" onclick="">
        </div>
        <div>
          <lable class="text-label"><b>전화번호</b></lable>
          <input type="text" class="form-control" name="mobile" placeholder="(예 : 01012345678)" required="" autofocus=""/>
          <small id="passwordHelp" class="form-text text-muted">특수문자(-) 없이 숫자만 10자리 혹은 11자리를 입력하세요.</small><br><br>
          <lable class="text-label"><b>비밀번호</b></lable>
          <input type="password" class="form-control" name="password" placeholder="비밀번호" required=""/>
          <small id="passwordHelp" class="form-text text-muted">영어와 숫자를 사용하여 8자리 이상 입력하세요.<br>(대문자, 소문자 사용에 주의하세요.)</small><br><br>
          <label class="checkbox">
          <input type="checkbox" id="rememberMe" class="rememberMe" name="rememberMe">내 들어가기 정보 기억하기
          </label><br>
          <button class="btn btn-lg btn-primary btn-block" type="submit">들어가기</button><br><br>
        </div>
        <div class="atag">
            <a href="">비밀번호 찾기</a>
        </div>
        <div class="buttontype">
          <input type="button" value="관리자 로그인" class="signinbutton" style="margin-top: 80px;" onclick="">
        </div>
      </form>
    </div>
  </div> 

<!-- footer -->
<%@ include file="../common/footer.jsp" %> 

</body>
</html>