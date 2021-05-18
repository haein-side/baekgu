<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백구 개인회원 로그인</title>
<link rel="stylesheet" href="RESOURCES/CSS/CUSTOMER/YJCSS/header2.css" type="text/css">
<link rel="stylesheet" href="RESOURCES/CSS/CUSTOMER/signin.css" type="text/css">

</head>

<body style="height:0%;">

	<div class="wrapper" style="margin-top: 0px;">
    	<form class="form-signin">
        	<h1 class="form-signin-heading">관리자 로그인</h1>
        <div>
		    <lable class="text-label"><b>아이디</b></lable>
		    <input type="text" class="form-control" name="mobile" placeholder="아이디" required="" autofocus=""/>
		    <small id="passwordHelp" class="form-text text-muted"></small><br>
		    <lable class="text-label"><b>비밀번호</b></lable>
		    <input type="password" class="form-control" name="password" placeholder="비밀번호" required=""/>
		    <small id="passwordHelp" class="form-text text-muted" style="margin-bottom: 10px"></small>
		    <button class="btn btn-lg btn-primary btn-block" type="submit" style="height: 50px; margin-left: 110px; margin-top: 30px;">로그인</button><br><br>
        </div>

      </form>
    </div>

 

</body>
</html>