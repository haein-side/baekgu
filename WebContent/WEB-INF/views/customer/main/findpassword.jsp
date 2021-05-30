<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>비밀번호 찾기</title>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/YJCSS/header2.css" type="text/css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/findpassword.css" type="text/css">
	
<script>

 
	  function sendSms(){
		  
		  var num = $("#phoneNumber").val();
		  
		  $.ajax({
			  url: "/baekgu/user/sendSms",
			  data : {
				  num : num
			  },
			  type : "post",
			  success : function(data,textStatus,xhr){
				  console.log(data);
				  console.log(data['text'])
				  console.log(data.text)
				  console.log(data['success_count'])
				  if (true){
				  alert("인증번호를 발송했습니다. 인증번호가 오지 않으면 입력하신 휴대폰번호가 회원정보와 일치하는지 확인해주세요.")				  
				  } /* else {
					  alert("인증번호 전송을 실패했습니다.");
				  } */
			  },
			  error : function(xhr, status, error){
				  console.log(error);
			  }
			  
		  });
		    
	  }
	 
	  function smsCheck(){
		  
		  var num = $("#phoneNumber").val();
		  var check = $("#sms").val();
		  
		  console.log(num);
		  
		  $.ajax({
			  url: "/baekgu/user/smsCheck",
			  type : "post",
			  data : {
				  check : check,
				  num : num
			  },
			  dataType : "json",
			  success : function(result,textStatus,xhr){
				  console.log(result);
				 
				 if ($.trim(result) == "ok"){
				  alert("번호 인증이 성공되었습니다.");	
				  $("#checkResult").attr("value", "success");
				  
				  console.log($("#checkResult").innerHTML);
				  
				  } else {
					  alert("번호 인증을 실패했습니다.");
					$("#checkResult").attr("value", "fail");
				  } 
			  },
			  error: function(xhr, status, error){
					console.log(error);
				}
			  /* e.preventDefault(); */
			    /* return false; */
		  }); 
		   
	  }
 
  
  
</script>

</head>
<body>

 	<div class="form-group" style="z-index 1;">
	<%@ include file="../common/header2.jsp" %>
 	</div>

	<div class="wrapper">
  <form class="form-signin" action="${ pageContext.servletContext.contextPath }/user/toChangePassword"  method="post" style="margin-top: 15%; height: 650px;">    
      <h1 class="form-signin-heading" style="height: 100px; margin-top: 100px; color: orange;">비밀번호 찾기</h1>
       
        <!-- <lable class="text-label"><b>이름</b></lable>
        
        <input type="text" class="form-control" name="name" id="name" placeholder="(예 : 홍길동)" required="" autofocus=""/>
        
        <small id="inputname" class="form-text text-muted"></small><br><br> -->
       
        <label class="text-label"><b>전화번호 (고객 아이디)</b></label><br>

        <div class="form-group">
          
          <input class="form-control" type="text" id="phoneNumber" name="phoneNumber" placeholder="(예 : 01012345678)" style="width: 62%; float: left;" required> 
          
          <button class="btn btn-block-1 btn-lg-1 btn-primary-1" onclick="sendSms()" onsubmit="return false" style="margin-left: 10px; width: 35%; float:left; height: 43px; font-size: 20px;">
          인증번호 요청
          </button>
          
          <br><br>
          
          <p style="margin-bottom: 35px;"><small>특수문자(-)를 제외한 숫자만 입력하세요.</small></p>
        </div>
        
       <br>
       <br>
       
        <label class="text-label"><b>인증번호</b></label><br>

        <div class="form-group">
          
          <input class="form-control" type="text" id="sms" name="sms" placeholder="(예 : 2341)" style="width: 62%; float: left;" required> 
          
          <button class="btn btn-block-1 btn-lg-1 btn-primary-1" onclick="smsCheck()" type="button" style="margin-left: 10px; width: 35%; float:left; height: 43px; font-size: 20px;">
          인증번호 확인
          </button>
          
          <br><br>
          
          <!-- 인증확인 결과 히든필드 -->
          <input type="hidden" id="checkResult" name="checkResult" value="fail">
          
        </div>
          
        
        <div class="form-group">
        <button class="btn btn-lg btn-primary btn-block" type="submit" id="btnSubmit" onclick="validate()" style="height: 55px; width: 150px; font-size: 28px; margin-top: 70px; margin-bottom: 30px;">
        확인
        </button>
        

        </div>
	</form>
    </div>

	<!-- footer -->
	<%@ include file="../main/footerHW.jsp" %>
	
	<script type="text/javascript">
	/* window.onload = function() {
	$("#btnSubmit").click(function(){
	    	validate();
	    });
	}
	 */
	 
	function validate(){
		
		if(document.getElementById("checkResult").value != "success"){
  		 	alert("인증번호 확인을 완료해주시기 바랍니다.");
  		    console.log(checkResult);
  		  	/* document.getElementById(checkResult).focus(); */
  		  	document.getElementById("sms").value="";
  		  	document.getElementById("sms").focus();
  		    return false;
  	    } 

	} 
	
	</script>
	
</body>

</html>