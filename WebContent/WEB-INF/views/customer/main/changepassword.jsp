<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/YJCSS/header2.css" type="text/css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/findpassword.css" type="text/css">
<style> {


}</style>

</head>
<body>

 	<div class="form-group" style="z-index 1;">
	<%@ include file="../common/header2.jsp" %>
 	</div>
	
	<div class="wrapper">
    <form class="form-signin" action="${ pageContext.servletContext.contextPath }/user/newPassword"  method="post" style="margin-top: 15%; height: 650px;">        
      <h1 class="form-signin-heading" style="height: 100px; margin-top: 100px; color: orange;">비밀번호 재설정</h1>
        <input type="hidden" id="userPhone" name="userPhone" value="${ requestScope.userPhone }" >
        
        <div style="margin-bottom: 25px;">
			<label class="text-label"><b>변경할 비밀번호</b></label>
        	<input type="password" class="form-control" name="enteredPwd" id="enteredPwd" placeholder="" required="" autofocus=""/>
        	<small id="passwordHelp" class="form-text text-muted">
        	영어와 숫자를 사용하여 8자리 이상 15자리 이하 입력하세요.<br>(대문자, 소문자 사용에 주의하세요.)
			</small>	
        </div>
        <div>
        	<label class="text-label"><b>비밀번호 확인 (다시 입력해주세요.)</b></label>
        	<input type="password" class="form-control" name="pwdconfirm" id="pwdconfirm" placeholder="" required="">
			<!-- js에서 비밀번호가 일치하는지 검증 후 텍스트 띄우기? modal/alert창 띄우기? -->
        </div>

        <div class="form-group">
        
        <!-- <button class="btn btn-lg btn-primary btn-block" type="submit" id="btnSubmit" style="height: 55px; width: 150px; font-size: 28px; margin-top: 70px; margin-bottom: 30px;">확인</button> -->
      
      <input class="btn btn-lg btn-primary btn-block" type="submit" id="btnSubmit"
                  style="height: 55px; width: 150px; font-size: 28px; margin-top: 70px; margin-bottom: 30px;" value="확인">
      
        </div>
      </form>
    </div>

	<!-- footer -->
	<%@ include file="../main/footerHW.jsp" %>
	
	<!-- 비밀번호가 일치하는지 유효성 검사 -->
	 <script type="text/javascript">
	 $("#btnSubmit").click(function(){
	    	validate();
	 });
	 
	 function validate(){
		 
		 var enteredPwd = document.getElementById("enteredPwd");
		 var pwdconfirm = document.getElementById("pwdconfirm");
		 
		 console.log(enteredPwd);
		 
		  // changepwd 유효성 검사
         if(!chk(/^[a-zA-Z0-9]{8,15}$/,enteredPwd,"비밀번호는 영어와 숫자를 사용하여 8자리 이상 15자리 이하 입력하세요.")){
            return false;
         }
		 
         var checkNum = document.getElementById("enteredPwd").value.search(/[0-9]/g);
         var checkEng = document.getElementById("enteredPwd").value.search(/[a-z]/ig);
         // i: case insensitive, 대소문자 구별 안함
         
         if(checkNum < 0 || checkEng < 0){
            alert("비밀번호는 숫자와 영문자를 혼용하여야 합니다.");
            enteredPwd.value="";
            enteredPwd.focus();
            return false;
         }
		 
         // enteredPwd와 userPwd1 일치하는지 확인
         if(enteredPwd.value != pwdconfirm.value){
            alert("비밀번호가 다릅니다. 다시 확인해주세요.");
            pwdconfirm.value="";
            pwdconfirm.focus();
            return false;
         }
         
         // 유효성 검사 alert창 띄워주는 것
         function chk(re, ele, msg){
             if(!re.test(ele.value)){
                alert(msg);
                ele.value="";
                ele.focus();   
                return false;
             }
             
             return true;
          }
		 
	 }
	 
	 </script>
</body>
</html>