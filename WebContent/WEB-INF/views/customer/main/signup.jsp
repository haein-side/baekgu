<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/YJCSS/header2.css" type="text/css">
<link href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/signupbootstrap.css" rel="stylesheet">
<script>
$(function(){
	// ajax 필수로 하게 어떻게 하나..?
	$("#duplicationCheck").click(function(){
		var userPhone = $('#userPhone').val();
		
		 if (userPhone == '') {
		      alert('휴대폰번호를 입력해주세요.')
		      return;
		    }
		
		$.ajax({
			url: "/baekgu/user/signup",
			type: "get",
			data:{ userPhone : userPhone },
			success: function(data,textStatus,xhr){
				console.log(data);
				if (data == "fail"){

					$("#checkMessage").html("사용할 수 없는 아이디입니다.");
					alert("사용불가아이디");
					$("#checkMessage").html("사용할 수 없는 휴대폰번호입니다.");
					$("#idCheck").value("fail");
					return;

				} else if(data == "success") {
				    $("#checkMessage").html("사용할 수 있는 휴대폰번호입니다.");
				    /* $("#duplicationCheck").attr("checkResult","success"); */
				   /*  $("#idCheck").value == "success";
				    $("#idCheck").value("success"); */
				    $("#idCheck").attr("value", "success");
				    console.log(idCheck);
				    return;
				}
			},
			error: function(xhr, status, error){
				console.log(xhr);
				console.log(status);
				console.log(error);
			}
			
		});
		
	});
});
</script>
<style>

/*연두색 버튼*/
.btn-yg {
   background:yellowgreen;
}

/*오렌지레드색 버튼*/
.btn-or {
   background:orangered;
}
.btn-danger {
   background:orange;
}



</style>


<title>백세구인구직 백구</title>
 
</head>

<body class="bg-light">
   <!-- 헤더 부분 -->

   <%@ include file="../common/header2.jsp"%>
   
	
</form>

   <!-- 입력한 값을 전송하기 위해 form 태그를 사용함 -->
   <!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 customer/signup 서블렛 -->
   <form action="${ pageContext.servletContext.contextPath }/user/signup" method="post">
  
  
   
      <div class="container" style="z-index: 1; margin-top: 15%; margin: auto;">
         <div class="py-5 text-center"
            style="background: white; margin-top: 25%;">
            <h1 class="form-signin-heading">개인회원 가입</h1>
         </div>

         <div class="row">
            <div class="col-md-12">
               <div class="form-group">
            
                  <label for="mobile" class="basiclabel">휴대폰번호 (아이디로 사용됩니다.)</label>
                  
                  <input type="text" class="form-control" id="userPhone" name="userPhone" placeholder="(예 : 01012345678)" value = "01010002000" required> 
                 
                  <small id="passwordHelp" class="form-text text-muted">특수문자(-) 없이 숫자로만 10자리 혹은 11자리를 입력하세요.</small>
                  
                  <br>
                
                   <input type="button" value="중복확인" class="btn btn-or" id="duplicationCheck" style="height: 34px; font-size: 23px; float: right;" required>
                
                  <br>
                  <br>
					<div id="checkMessage" style="font-size : 23px; color: red; text-align: center;">
					</div>     
                	
                	 <input type="hidden" id="idCheck" name="idCheck" value="fail">
                 
               </div>
               <br>
               <div class="form-group">
                  <label for="password" class="basiclabel">비밀번호</label> 
                  
                  <input type="password" class="form-control" id="userPwd" name ="enteredPwd" placeholder="(예 : hgd610405)"  value = "hb2qp5555" required>
                  
                  <small id="passwordHelp" class="form-text text-muted">
                  영어와 숫자를 사용하여 8자리 이상 15자리 이하 입력하세요.<br>(대문자, 소문자 사용에 주의하세요.)
                  </small>
                  
                  <br>
                  <br>
                  
                 <label for="password1" class="basiclabel">비밀번호 확인</label> 
                  
                  <input type="password" class="form-control" id="userPwd1" name ="userPwd1" placeholder="(비밀번호를 다시 입력해주세요)" value = "hb2qp5555" required>
                  
                  <small id="passwordHelp" class="form-text text-muted">
                  비밀번호를 다시 입력해주세요
                  </small>
                 
               </div>
               <br>
               
               <div class="form-group">
                  <label for="name" class="basiclabel">이름</label> 
                  
                  <input type="text" class="form-control" id="userName" name="userName" placeholder="(예 : 홍길동)" value = "홍길이" required>
                  
                  <small id="passwordHelp" class="form-text text-muted">이름을 입력해주세요.</small>
               </div>
               <br>
            </div>
         </div>

         <div class="row">
        <div class="col-md-4 mb-3">
               <label for="birthyear" class="basiclabel">태어난 해</label><br> 
               
               <!--  <input type="number" class="birthinfo" id="userBday1" name="userBday1" min="1900" max="19" step="1"  placeholder="연도(4자)" 
                  style="width: 150px" minlength="4" maxlength="4" value="1921" > -->
                  
                   <input type="number" class="birthinfo" id="userBday1" name="userBday1" min="1900" step="1" placeholder="연도(4자)"
              maxlength="4" style="width: 150px" required  value="1920" >
                  
                  <label>년</label><br> 
                  <small class="form-text text-muted">(예 : 1970)</small>
                 

            </div>

            <div class="col-md-4 mb-3">
               <label for="birthmonth" class="basiclabel">태어난 달</label><br>
                
                <select required id="userBday2" name="userBday2" style="width: 150px; height:30px; border: 1px solid #ced4da; font-size: 18px; color: #495057;"  value="01" >
                     <option value="">월</option>
                     <option value="01" >1</option>
                     <option value="02" >2</option>
                     <option value="03" >3</option>
                     <option value="04" >4</option>
                     <option value="05" >5</option>
                     <option value="06" >6</option>
                     <option value="07" >7</option>
                     <option value="08" >8</option>
                     <option value="09" >9</option>
                     <option value="10" >10</option>
                     <option value="11" >11</option>
                     <option value="12" >12</option>
                  </select>
                
                <label>월</label><br> 
                <small class="form-text text-muted">(예 : 08)</small>
            </div>
            
            <div class="col-md-4 mb-3">
               <label for="birthday" class="basiclabel">태어난 날</label><br> 
               
              <input type="number" class="birthinfo" id="userBday3" name="userBday3" min="1" max="31" step="1" placeholder="일(2자)"
              maxlength="2" style="width: 150px" required  value="11" >
                
                
                <label>일</label><br>
                <small class="form-text text-muted">(예 : 09)</small>
            </div>
            <br>
           <label style="margin-left: 12px; color: red; margin-top : 13px;">백구는 50세 이상만 회원가입이 가능합니다.</label>
           <br> 
         </div>
         <br>
         
         

         <div class="form-group" style="margin-left: 10px;">
            <label for="gender" class="basiclabel">성별</label><br>
            <br> 
            
            <input type="radio" name="userGender" value="남" style="font-size: 30px;" required>
               <label class="genderlabel">남</label> 
   
            <input type="radio" name="userGender" value="여">
               <label class="genderlabel">여</label>
         </div>
         <br>

         <div class="form-group">
            <label for="address" class="basiclabel">주소</label> 
            <input type="text" class="form-control" name="userAddress1" id="userAddress1" placeholder="(예 : 서울시 서초구 서초동 1310-15)" required value="서울시 서초구"> 
               <small id="address" class="form-text text-muted">시, 구, 동까지 입력해주세요.</small>
               
               <br>
               
            <input type="text" class="form-control" name="userAddress2" id="userAddress2" placeholder="(예 : 서초빌라 302호)"  value="반포1동 서초빌라"> 
               <small id="address" class="form-text text-muted">세부 주소(번지, 건물명, 호수)를 입력해주세요.</small>
         </div>
         
         <br>
         
         
         <div>
            <label for="address" class="basiclabel">약관 동의하기</label>
            <div class="form-group">
               <div class="user_join_agree">
               
                  <input type="checkbox" name="agree" id="agreeChkAll" class="agrSeletAll" value="selectAll" onclick="selectAll(this)">
                  <label for="agreeChkAll"
                     style="font-size: 16px;">[모두 동의] 필수 이용 동의 약관 및 선택 사항에 모두
                     동의합니다.</label>
                     
               </div>
               <div class="join_dot"></div>
               <div class="user_join_agree agrSelect">
               
                  <input type="checkbox" name="agree" id="agreeChk_0" class="agrSelect" value="agree0"/>
                     
                     <label for="agreeChk_0" style="font-size: 16px;">[필수] 서비스 이용약관 동의</label>&nbsp;&nbsp;<a
                     href="#" style="font-size: 16px;">내용보기</a>
                     
               </div>
               
               <div class="user_join_agree agrSelect">
                  
                  <input type="checkbox" name="agree" id="agreeChk_1" class="agrSelect" value="agree1"/>
                  
                   <label for="agreeChk_1" style="font-size: 16px;">[필수] 개인정보 제 3자 제공 동의(기업 및 고객)</label>
                   &nbsp;&nbsp;
                   <a href="#" style="font-size: 16px;">내용보기</a>
               </div>
               
               <div class="user_join_agree agrSelect">
                  
                  <input type="checkbox" name="agree" id="agreeChk_2" class="agrSelect" value="agree2"/>
                  
                  <label for="agreeChk_2"
                     style="font-size: 16px;">[선택] SMS 수신 동의</label>&nbsp;&nbsp;<a
                     href="#" style="font-size: 16px;">내용보기</a>
               </div>
               
               <input class="btn btn-lg btn-primary btn-block" type="submit" id="btnSubmit"
                  style="font-size: 28px; margin: auto; margin-top: 100px; margin-bottom: 200px; padding-bottom: 55px;" value="들어가기">
            
            	<button type="submit" id="regist">제출하기</button>
            
            </div>
         </div>
      </div>
      
   </form>  
   <!-- form 끝남 -->      
  
  

  <!-- 회원가입 유효성 검사: 정규식을 통한 alert창 띄우기 --> 
   <script type="text/javascript">
    $("#btnSubmit").click(function(){
    	validate();
    });
    
    window.onload = function(){	    
	    var $item = document.getElementById("duplicationCheck");
		  // 요소의 data-value 속성에 hello world를 설정한다.
		  $item.setAttribute("checkResult", "fail");
		  // 요소의 value 속성에 test를 설정한다.
	};
	
       function validate(){
    	   
    	
       
          var userPhone = document.getElementById("userPhone");
          var enteredPwd = document.getElementById("userPwd");
          var userPwd1 = document.getElementById("userPwd1");
          var userName = document.getElementById("userName");
          var userBday1 = document.getElementById("userBday1");
          var userBday2 = document.getElementById("userBday2");
          var userBday3 = document.getElementById("userBday3");
          var userGender = document.getElementById("userGender");
          var userAddress1 = document.getElementById("userAddress1");
          var userAddress2 = document.getElementById("userAddress2");
          var checkMessage = document.getElementById("checkMessage");
          var duplicationCheck = document.getElementById("duplicationCheck");
          var checkMessage = document.getElementById("checkMessage");
          var idCheck = document.getElementById("idCheck");
          
          userPhone.setAttribute("checkresult", "fail");
          
          console.log(checkMessage);
          console.log(idCheck);
          
          /* if ($("#checkMessage").html("사용할 수 있는 휴대폰번호입니다.")){
    			return true;  
    		} else if ($("#checkMessage").html("사용할 수 없는 휴대폰번호입니다.") || $("#checkMessage").html("")) {
    			alert("아이디 중복체크를 완료해주시기 바랍니다.");
    			return false;
    		} */
          
        /*  if($("#idCheck").attr("value", "fail")){
        	 alert("아이디 중복체크를 완료해주시기 바랍니다.");
        	 userPhone.focus();
        	 userPhone.value = "";
 			return false;
         } */
    		
    	
    	  if(idCheck.value != "success"){
    		  alert("아이디 중복체크를 완료해주시기 바랍니다.");
    		    console.log(idCheck);
    		    userPhone.focus();
    		    userPhone.value = "";
    		    console.log(userPhone);
    		    return false;
    	  }
    		 
          
          /* if (idCheck.value == "fail"){
        	alert("아이디 중복체크를 완료해주시기 바랍니다.");
  		    console.log(idCheck);
  		    userPhone.focus();
  		    userPhone.value = "";
  		    console.log(userPhone);
  		    return false;
  		  }  */
          
          
          // userPhone 유효성 검사
          if(!chk(/^[0-9]{10,11}$/,userPhone,"휴대폰번호는 특수문자(-) 없이 숫자로만 10자리 혹은 11자리를 입력하세요.")){
            return false;
         }
         
          // enteredPwd 유효성 검사
         if(!chk(/^[a-zA-Z0-9]{8,15}$/,enteredPwd,"비밀번호는 영어와 숫자를 사용하여 8자리 이상 15자리 이하 입력하세요.")){
            return false;
         }
         
         var checkNum = document.getElementById("userPwd").value.search(/[0-9]/g);
         var checkEng = document.getElementById("userPwd").value.search(/[a-z]/ig);
         // i: case insensitive, 대소문자 구별 안함
         
         
         if(checkNum < 0 || checkEng < 0){
            alert("비밀번호는 숫자와 영문자를 혼용하여야 합니다.");
            enteredPwd.value="";
            enteredPwd.focus();
            return false;
         }
         
         // enteredPwd와 userPwd1 일치하는지 확인
         if(enteredPwd.value != userPwd1.value){
            alert("비밀번호가 다릅니다. 다시 확인해주세요.");
            userPwd1.value="";
            userPwd1.focus();
             return false;
         }
       
         // userName 유효성 검사
          if(!chk(/^[가-힣]{1,}$/,userName,"이름은 한글로 1글자 이상 입력하세요")){
            return false;
         }
         
         // userBday1 유효성 검사 (4개인지 추가 검증 필요)
          if(isNaN(userBday1.value)){
				alert("년도는 숫자만 입력가능합니다.");
				userBday1.value="";
				userBday1.focus();
				return false;
			}
         
         // userBday3 유효성 검사 (1자리 이상 2자리 이하인지 추가 검증 필요)
          if(isNaN(userBday3.value)){
				alert("날짜는 숫자만 입력가능합니다.");
				userBday3.value="";
				userBday3.focus();
				return false;
			}
         
         
         // 만 50세 이상인지 유효성 검사
         let today = new Date();
         let untilDay = new Date(today.getFullYear()-50, today.getMonth(), today.getDate());
         
         let fullUserBday = new Date(userBday1.value, userBday2.value-1, userBday3.value);
         
         console.log(fullUserBday);
         
         if(fullUserBday > untilDay){
      	   alert("백구는 만 50세 이상만 회원가입이 가능합니다.");
      	   userBday1.value="";
      	   userBday1.focus();
      	   return false;
         } else {
        	 return true;
         }
         
         // userAddress1 유효성 검사
         if(!chk(/^[가-힣0-9\s]{6,}$/,userAddress1,"주소를 시, 구, 동까지 입력해주세요.")){
        	 return false;
          }
         
         // userAddress2 유효성 검사
         if(!chk(/^[가-힣0-9\s]{3,}$/,userAddress2,"세부 주소(번지, 건물명, 호수)를 입력해주세요.")){
			 return false;
          }
         
         if(checkMessage.innerHTML != "사용할 수 있는 아이디입니다."){
        	 duplicationCheck.focus();
        	 alert("휴대폰번호 중복확인을 해주세요.")
        	 return false;
         }
       
        // 유효성 검사 alert 창 띄워주는 것
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
   <!-- script 끝남 -->

   
   <!-- footer -->
   <%@ include file="../common/footer2.jsp"%>



</body>
</html>