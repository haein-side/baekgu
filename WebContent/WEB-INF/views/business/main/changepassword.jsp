<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>백구 기업회원가입</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
      background: darkslategrey;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      /* background-color: #f1f1f1; */
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }

    thead {
      background-color: lightgrey;
    }

    h1, h2 {
      text-align: center;
    }

    /* submi 버튼 설정 */
    .btn-submit {
      background-color: orange;
      border: orange;
      width: 150px;
      height: 50px;
      font-size: 25px;
    }

    .btn-submit:hover {
      background-color: orange;
      border: orange;
      width: 150px;
      height: 50px;
      font-size: 25px;
    }

    .btn-submit:active {
      background-color: orange;
      border: orange;
      width: 150px;
      height: 50px;
      font-size: 25px;
    }

    .btn-submit:visited {
      background-color: orange;
      border: orange;
      width: 150px;
      height: 50px;
      font-size: 25px;
    }

  </style>
</head>
<body>
<jsp:include page="../common/header.jsp" />

<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-3 sidenav">
    </div>
    <div class="col-sm-6 text-left" style="padding-top: 30px;">
      <h1 style="margin-bottom: 40px;">비밀번호 찾기</h1>
    </div>

<form action="${ pageContext.servletContext.contextPath }/business/changepwd" method="post" onsubmit="return validate()">
    <div class="col-sm-6 text-left" style="margin-left: 370px;">
      <div class="col-xs-3">
      <div class="form-group" style="padding-top: 30px;">
        <label for="user">비밀번호 변경</label>
        <input name="enteredPwd" type="text" class="form-control" id="user" placeholder="비밀번호 변경" required>
      </div>
      
      <div class="form-group">
        <label for="cfm">비밀번호 변경 확인</label>
        <input name="passwordcheck" type="text" class="form-control" id="user" placeholder="비밀번호 변경 확인" required>
        <input type="hidden" value="${ requestScope.hrId }" name="hrId"/>
      </div>
      
      <div class="form-group" style="text-align: center; padding-top: 80px; padding-bottom: 80px;">
        <input type="submit" id="bregsubmit" class="btn btn-info btn-submit" value="확인">
      </div>
    </div>
  </div>
 </form>
</div>

      </div>
      <div class="col-sm-1 sidenav">
      </div>
      
<jsp:include page="../common/footer.jsp" />
<script>

function validate(){
	
	var enteredPwd = document.getElementById("enteredPwd");
	var passwordcheck = document.getElementById("passwordcheck");
	
	if(!chk(/^[a-zA-Z0-9]{8,15}$/,enterPwd,"비밀번호는 영어와 숫자를 사용하여 8자리 이상 15자링 이하로 입력해주세요.")){
	
	return false;
	
	}
	
	var checkNum = document.getElementById("enteredPwd").value.search(/[0-9]/g);
	var checkEng = document.getElementById("enteredPwd").value.search(/[a-z]/ig);
	
	if(checkNum < 0 || checkEng <0 ){
		alert("비밀번호는 숫자와 영문자를 혼합하여야 합니다.");
		enteredPwd.value= "";
		enteredPwd.focus();
		return false;
	}
	
	if(enteredPwd.value != passwordcheck.value){
		aler("비밀번호가 다릅니다. 다시 입력해주세요");
		passwordcheck.value="";
		passwordcheck.focus();
		return false;
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
}
</script>
</body>
</html>
