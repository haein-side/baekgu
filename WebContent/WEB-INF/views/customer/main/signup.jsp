<%@page import="jdk.internal.misc.FileSystemOption"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" href="RESOURCES/CSS/CUSTOMER/YJCSS/header2.css"
   type="text/css">
<link href="RESOURCES/CSS/CUSTOMER/signupbootstrap.css" rel="stylesheet">
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

   <!-- 입력한 값을 전송하기 위해 form 태그를 사용함 -->
   <!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 customer/signup 서블렛 -->
   <form id="signup" action="${ pageContext.servletContext.contextPath }/customer/signup" method="post" onsubmit="return validate();">
   
      <div class="container" style="z-index: 1; margin-top: 15%; margin: auto;">
         <div class="py-5 text-center"
            style="background: white; margin-top: 25%;">
            <h1 class="form-signin-heading">개인회원 가입</h1>
         </div>

         <div class="row">
            <div class="col-md-12">
               <div class="form-group">
            
                  <label for="mobile" class="basiclabel">휴대폰번호 (아이디로 사용됩니다.)</label>
                  
                  <input type="text" class="form-control" id="userCode" name="userCode" placeholder="(예 : 01012345678)" required> 
                 
                  <small id="passwordHelp" class="form-text text-muted">특수문자(-) 없이 숫자로만 10자리 혹은 11자리를 입력하세요.</small>
                  
                  
                  <br>
                 
                  
                    <input type="button" value="중복확인" class="btn btn-or" id="duplicationCheck">
                
                 <button onclick="test1();">실행확인</button>
                   <script>
                       function test1(){
                           alert("다시 입력바랍니다.");
                       }
               
                    </script>
               </div>
               <br>
               <div class="form-group">
                  <label for="password" class="basiclabel">비밀번호</label> 
                  
                  <input type="password" class="form-control" id="userPwd" name ="userPwd" placeholder="(예 : hgd610405)" aria-describedby="" required>
                  
                  <small id="passwordHelp" class="form-text text-muted">
                  영어와 숫자를 사용하여 8자리 이상 15자리 이하 입력하세요.<br>(대문자, 소문자 사용에 주의하세요.)
                  </small>
                  
                  <br>
                  <br>
                  
                 <label for="password1" class="basiclabel">비밀번호 확인</label> 
                  
                  <input type="password" class="form-control" id="userPwd1" name ="userPwd1" placeholder="(비밀번호를 다시 입력해주세요)" aria-describedby="" required>
                  
                  <small id="passwordHelp" class="form-text text-muted">
                  비밀번호를 다시 입력해주세요
                  </small>
                 
               </div>
               <br>
               
               <div class="form-group">
                  <label for="name" class="basiclabel">이름</label> 
                  
                  <input type="text" class="form-control" id="userName" name="userName" placeholder="(예 : 홍길동)" required>
                  
                  <small id="passwordHelp" class="form-text text-muted">이름을 입력해주세요.</small>
               </div>
               <br>
            </div>
         </div>

         <div class="row">
            <div class="col-md-4 mb-3">
               <label for="birthyear" class="basiclabel">태어난 해</label><br> 
               
               <input type="number" class="birthinfo" id="userBday1" name="userBday1" min="1900" max="2021" step="1"  placeholder="연도(4자)"
                  style="width: 150px" maxlength="4" required> 
                  
                  <label>년</label><br> 
                  <small class="form-text text-muted">(예 : 1970)</small>
                  
                  
                  
            </div>

            <div class="col-md-4 mb-3">
               <label for="birthmonth" class="basiclabel">태어난 달</label><br>
               
               <!-- <input type="number" class="birthinfo" id="userBday2" name="userBday2" min="1" max="12" step="1" value="1"
                placeholder="(예 : 08)" style="width: 150px" required>  -->
                
                <select required name="birthmm" style="width: 150px; height:30px; border: 1px solid #ced4da; font-size: 18px; color: #495057;">
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
               
              <input type="number" class="birthinfo" id="userBday3" name="userBday3" min="1" max="31" step="1" value="1" 
                placeholder="(예 : 08)" style="width: 150px" required>
                
            <select required name="birthmm" style="width: 150px; height:30px; border: 1px solid #ced4da; font-size: 18px; color: #495057;">
                     <option value="">일</option>
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
                     <option value="13" >13</option>
                     <option value="14" >14</option>
                     <option value="15" >15</option>
                     <option value="16" >16</option>
                     <option value="17" >17</option>
                     <option value="18" >18</option>
                     <option value="19" >19</option>
                     <option value="20" >20</option>
                     <option value="21" >21</option>
                     <option value="22" >22</option>
                     <option value="23" >23</option>
                     <option value="24" >24</option>
                     <option value="25" >25</option>
                     <option value="26" >26</option>
                     <option value="27" >27</option>
                     <option value="28" >28</option>
                     <option value="29" >29</option>
                     <option value="30" >30</option>
                     <option value="31" >31</option>
                  </select>
                
                
                <label>일</label><br>
                <small class="form-text text-muted">(예 : 31)</small>
            </div>
            <br>
           <label style="margin-left: 12px; color: red; margin-top : 13px;">백구는 50세 이상만 회원가입이 가능합니다.</label>
           <br> 
         </div>
         <br>
         
         

         <div class="form-group" style="margin-left: 10px;">
            <label for="gender" class="basiclabel">성별</label><br>
            <br> 
            
            <input type="radio" name="userGender" value="남" style="font-size: 30px;">
               <label class="genderlabel">남</label> 
   
            <input type="radio" name="userGender" value="여">
               <label class="genderlabel">여</label>
         </div>
         <br>

         <div class="form-group">
            <label for="address" class="basiclabel">주소</label> 
            <input type="text" class="form-control" name="userAddress1" placeholder="(예 : 서울시 서초구 서초동 1310-15)" required> 
               <small id="address" class="form-text text-muted">시, 구, 동까지 입력해주세요.</small>
               
               <br>
               
            <input type="text" class="form-control" name="userAddress2" placeholder="(예 : 서초빌라 302호)"> 
               <small id="address"   class="form-text text-muted">세부 주소(번지, 건물명, 호수)를 입력해주세요.</small>
         </div>
         
         <br>
         
         
         <div>
            <label for="address" class="basiclabel">약관 동의하기</label>
            <div class="form-group">
               <div class="user_join_agree">
                  <input type="checkbox" name="user_all_agree" id="agreeChkAll"
                     class="agrSeletAll" value=""><label for="agreeChkAll"
                     style="font-size: 16px;">[모두 동의] 필수 이용 동의 약관 및 선택 사항에 모두
                     동의합니다.</label>
               </div>
               <div class="join_dot"></div>
               <div class="user_join_agree agrSelect">
                  <input type="checkbox" name="Agree5" id="agreeChk_0"
                     class="agrSelect" value="on"><label for="agreeChk_0"
                     style="font-size: 16px;">[필수] 서비스 이용약관 동의</label>&nbsp;&nbsp;<a
                     href="#" style="font-size: 16px;">내용보기</a>
               </div>
               <div class="user_join_agree agrSelect">
                  <input type="checkbox" name="Agree1" id="agreeChk_0"
                     class="agrSelect" value="on"><label for="agreeChk_0"
                     style="font-size: 16px;">[필수] 개인정보 제 3자 제공 동의(기업 및 고객)</label>&nbsp;&nbsp;<a
                     href="#" style="font-size: 16px;">내용보기</a>
               </div>
               <div class="user_join_agree agrSelect">
                  <input type="checkbox" name="Agree1" id="agreeChk_0"
                     class="agrSelect" value="on"><label for="agreeChk_0"
                     style="font-size: 16px;">[선택] SMS 수신 동의</label>&nbsp;&nbsp;<a
                     href="#" style="font-size: 16px;">내용보기</a>
               </div>
               <button class="btn btn-lg btn-primary btn-block" type="submit"
                  style="font-size: 28px; margin: auto; margin-top: 100px; margin-bottom: 200px; padding-bottom: 55px;">들어가기</button>
            </div>
         </div>
      </div>
      
   </form>  
   <!-- form 끝남 -->      
  
   
   <!-- 회원가입 유효성 검사: 정규식을 통한 alert창 띄우기 --> 
   <script type="text/javascript">
         function validate(){
         
            var userCode = document.getElementById("userCode");
            var userPwd = document.getElementById("userPwd");
            var userPwd1 = document.getElementById("userPwd1");
            var userName = document.getElementById("userName");
            var userBday1 = document.getElementById("userBday1");
            var userBday2 = document.getElementById("userBday2");
            var userBday3 = document.getElementById("userBday3");
            var userGender = document.getElementById("userGender");
            var userAddress1 = document.getElementById("userAddress1");
            var userAddress2 = document.getElementById("userAddress2");
            
            
            // userCode 유효성 검사
            if(!chk(/^[0-9]{10,11}$/,userCode,"휴대폰번호는 특수문자(-) 없이 숫자로만 10자리 혹은 11자리를 입력하세요.")){
              return false;
           }
           
            // userPwd 유효성 검사
           if(!chk(/^[a-zA-Z0-9]{8,15}$/,userPwd,"비밀번호는 영어와 숫자를 사용하여 8자리 이상 15자리 이하 입력하세요.")){
              return false;
           }
           
           var checkNum = document.getElementById("userPwd").value.search(/[0-9]/g);
           var checkEng = document.getElementById("userPwd").value.search(/[a-z]/ig);
           // i: case insensitive, 대소문자 구별 안함
           
           
           if(checkNum < 0 || checkEng < 0){
              alert("비밀번호는 숫자와 영문자를 혼용하여야 합니다.");
              userPwd.value="";
              userPwd.focus();
              return false;
           }
           
           // userPwd와 userPwd1 일치하는지 확인
           if(userPwd.value != userPwd1.value){
              alert("비밀번호가 다릅니다. 다시 확인해주세요.");
              userPwd1.value="";
               userPwd1.focus();
               return false;
           }
         
           // userName 유효성 검사
            if(!chk(/^[가-힣]{1,}$/,userName,"이름은 한글로 1글자 이상 입력하세요")){
              return false;
           }
           
           // userBday1 유효성 검사
           
           
           
        }
        
        
        function chk(re, ele, msg){
           if(!re.test(ele.value)){
              alert(msg);
              ele.value="";
              ele.focus();   
              return false;
           }
           
           return true;
        }
   
        
         
   </script>
   <!-- script 끝남 -->


   
   <!-- footer -->
   <%@ include file="../common/footer2.jsp"%>



</body>
</html>