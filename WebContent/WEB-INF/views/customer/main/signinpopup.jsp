<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백구 개인회원 로그인</title>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/YJCSS/header2.css" type="text/css">
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/signin.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- 로그인 AJAX -->
<script>
	$(function(){
		$("#btnLogin").click(function(){
			
			const userPhone = $("#userPhone").val();
			const userPwd = $("#userPwd").val();
			$.ajax({
				url:"${ pageContext.servletContext.contextPath }/loginCheck",
				type:"post",
				data :{
					userPhone : userPhone,
					userPwd : userPwd
				},
				success:function(data, status, xhr){
					
					window.close();
					window.onunload = refreshParent;
						function refreshParent() {
							window.opener.location.reload();
					    }
				},
				error:function(xhr, status, error){
					

				}
			});
		});
	});
	
</script>
</head>

<body>
	<!-- <form class="form-signin" action="${ pageContext.servletContext.contextPath }/user/loginCheck" method="post" style="margin-top:0px;"> -->
		<div class="container">
			<div class="wrapper">

        	<h1 class="form-signin-heading">개인회원 로그인</h1>
        	
        <div>
		    <label class="text-label"><b>휴대폰 번호 (아이디로 사용됩니다.)</b></lable>
		    <input type="text" id="userPhone" class="form-control" name="userPhone" placeholder="(예 : 01012345678)" required="" autofocus=""/>
		    <small id="passwordHelp" class="form-text text-muted">특수문자(-) 없이 숫자만 10자리 혹은 11자리를 입력하세요.</small><br><br><br>
		    <label class="text-label"><b>비밀번호</b></label>
		    <input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="비밀번호" required=""/>
		    <small id="passwordHelp" class="form-text text-muted" style="margin-bottom: 10px">영어와 숫자를 사용하여 8자리 이상 입력하세요.<br>(대문자, 소문자 사용에 주의하세요.)</small><br><br>
		    </label><br>
		    <input type="hidden" id="postCode" value="${ postInfo.postCode }"/>
		    <button id="btnLogin" class="btn btn-lg btn-primary btn-block" type="submit" style="height: 50px; margin-left: 110px; margin-top: 30px;">들어가기</button><br><br>
        </div>
        <div class="atag">
            <p style="padding-right: 5px;">아직 백구 회원이 아니세요?&nbsp;<a href="${ pageContext.servletContext.contextPath }/user/toSignup">백구 회원가입하러 가기</a></p>
            <p style="padding-right: 5px;">비밀번호가 기억나지 않으시나요?&nbsp;<a href="${ pageContext.servletContext.contextPath }/user/toFindpassword">비밀번호 찾으러 가기</a></p>
            <p style="padding-right: 5px;">기업회원이세요?&nbsp;<a href="${ pageContext.servletContext.contextPath }/business/login">기업회원 로그인하러 가기</a></p><br>            

        </div><br><br><br>
        <div class="buttontype">
        	<input type="button" value="관리자 로그인" class="signinbutton" style="margin-top: 80px;" onclick="location.href='${ pageContext.servletContext.contextPath }/admin/login'">
        </div>
    </div>
  </div> 

	<!-- </form> -->
</body>
</html>