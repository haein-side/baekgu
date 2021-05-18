<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>

		var errorMessage = "${ requestScope.errorMessage }";
		movePath = "${ pageContext.servletContext.contextPath }";
	
		alert(errorMessage);
		location.replace(movePath);
	
	
		/* 현우 수정
 
 		(function(){
	
			const errorMessage = "${ requestScope.errorMessage }";
			
			let errorMessage="";
			let movePath="";
			
			switch(errorMessage){
			case "failSignup";
				errorMessage = "회원가입을 실패했습니다.";
				movePath = "${ pageContext.servletContext.contextPath }";

			}
			
			switch(errorMessage){
			case "wrongPwd";
				errorMessage = "입력하신 비밀번호가 틀렸습니다. 다시 로그인 해주세요.";
				movePath = "${ pageContext.servletContext.contextPath }";
				break;
			}
			
			switch(errorMessage){
			case "blockUser";
				errorMessage = "고객님은 백구 사이트의 사용이 제한되었습니다.";
				movePath = "${ pageContext.servletContext.contextPath }";
				break;
			}
			
			switch(errorMessage){
			case "checkagin";
				errorMessage = "입력하신 정보가 등록되어 있지 않습니다. 로그인 정보를 다시 입력하시거나 회원 가입을 해주세요.";
				movePath = "${ pageContext.servletContext.contextPath }";
				break;
			} 
			
			alert(errorMessage);
			location.replace(movePath);*/
		
		})();
		
	
	</script>
	
</body>
</html>