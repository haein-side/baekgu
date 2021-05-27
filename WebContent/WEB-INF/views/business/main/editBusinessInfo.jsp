<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>백구 기업정보 관리</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

    /* 계정정보, Q&A 글씨 */
    h4{
      font-weight: bold;
      padding-top: 10px;
      padding-bottom: 10px;
    }

    /* 테이블 설정 */
    table {
      margin-left: auto;
      margin-right: auto;
      
    }

    th {
      /* margin-left: 5px;
      margin-top: 1px; */
      background: #dcdcdc;
      border: 1px solid grey;
      
    }

    tr {
      width: 30%;
      border: 1px solid grey;
      
    }

    /* 변경 버튼 설정 */
    .btn-change {
      float: right;
      
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

    /* 변경하기 버튼 설정 */
    

    /* 기업정보 Q&A 패널 */
    .panel-heading {
      padding-left: 20px;
    }

    .panel-body{
      padding: 20px;
    }

  </style>
</head>
<body>


	<jsp:include page="../common/header.jsp" />
<div class="container-fluid text-center">    
  <div class="row content">
  <form action="${ pageContext.servletContext.contextPath }/business/editInfo" method="POST" onsubmit="return validate();">
    <div class="col-sm-3 sidenav">
    </div>
    <div class="col-sm-6 text-left" style="padding-top: 30px;">
      <h1 style="padding-bottom: 30px;">기업정보 관리</h1>

        <h4>계정정보</h4>
        <table class="table table-bordered">
            <tr>
              <th class="th">
                기업 회원 ID</th>
              <td>
                <input style="border: 0px" value="${ sessionScope.loginBusinessMember.bId }" readonly>
              </td>
            </tr>
            <tr>
              <th class="th">사업자등록번호</th>
              <td>
                <input style="border: 0px" value="${ requestScope.str2 }"readonly>
              </td>        
            </tr>
<!--             <tr>
              <th class="th">개인 정보 보유 기간</th>
              <td>
                <label class="radio-inline" style="margin-left: 15px;"><input type="radio" name="radio1y" checked >1년</label>
                <label class="radio-inline"><input type="radio" name="radio3y">3년</label>
                <label class="radio-inline"><input type="radio" name="radio5y">5년</label>
                <label class="radio-inline"><input type="radio" name="radio">탈퇴시삭제</label>
                <button type="button" class="btn-change">변경하기</button>
              </td>
            </tr> -->
            <tr>
              <th class="th">인사 담당자 이름</th>
              <td>
                <input style="border: 1px" value="${ sessionScope.loginBusinessMember.bName }" id="name" name="name">
<!--                 <button type="button" class="btn-change">변경하기</button> -->
              </td>
            </tr>
            <tr>
              <th class="th">인사 담당자 연락처</th>
              <td>
                <input style="border: 1px" value="${ sessionScope.loginBusinessMember.bPhone }" id="phone" name="phone">
<!--                 <button type="button" class="btn-change">변경하기</button> -->
              </td>
            </tr>
            <tr>
              <th class="th">인사 담당자 이메일</th>
              <td>
                  <input id="email" name="email" type="text" style="border: 1px" value="${ sessionScope.loginBusinessMember.bEmail }">
<!--                 <button type="button" class="btn-change">변경하기</button> -->
              </td>
            </tr>
        </table>

        <h4>기업정보 Q&A</h4>
        
        <div class="panel-group" id="accordion">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
                Q. 기업정보 수정은 어떻게 하나요?
                </a>
              </h4>
            </div>
            <div id="collapse1" class="panel-collapse collapse in">
              <div class="panel-body">
                대부분의 기업정보는 기업회원이 직접 수정이 가능합니다.
                
                기업정보의 경우,
                대부분 직접 수정이 가능하지만, 일부 항목은 요청을 통해 관리자가 수정한 정보를 반영합니다.
                또한, 외부기관(NICE평가정보, 이크레더블, 금융감독원(DART))에서 기업 정보를 제공하는 기업인 경우,
                기업정보 수정은 해당 고객센터로 요청해주시기 바랍니다.
            </div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
                Q. 기업정보 삭제 또는 일부 항목 삭제가 가능한가요?
              </a>
              </h4>
            </div>
            <div id="collapse2" class="panel-collapse collapse">
              <div class="panel-body">
                기업정보 탭에서 전체 또는 일부 항목에 대한 기업정보 삭제 요청이 가능합니다.
                단, 동일한 사업자등록번호를 사용하는 모든 기업회원의 기업정보에 반영되오니, 신중한 요청을 진행해주시기 바랍니다.
            </div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
                Q. 직접 수정 및 수정 요청을 하지 않았는데, 정보 변경이 되어 있어요. 왜 그럴까요?
              </a>
              </h4>
            </div>
            <div id="collapse3" class="panel-collapse collapse">
              <div class="panel-body">
                동일한 사업자등록번호를 사용하는 기업회원이 직접 수정을 진행하였거나,
                증빙자료 제출 후 수정/삭제 요청에 의해, 기업정보가 변경될 수 있습니다.
                
                또한, 외부기관(NICE평가정보, 이크레더블, 금융감독원(DART))에서 기업 정보를 제공하는 기업인 경우,
                외부기관에서 제공하는 기업정보가 변경되면 자동으로 반영되거나,
                기존에 사람인에 등록된 기업정보가 외부기관 기준으로 변경될 수 있습니다.
            </div>
            </div>
          </div>
        </div>

        <div class="form-group" style="text-align: center; padding-top: 80px; padding-bottom: 80px;">
          <input type="submit" id="bregsubmit" class="btn btn-info btn-submit" value="확인">
       </div>
      
      </div>
      
      </form>
      <div class="col-sm-1 sidenav">
      </div>
    </div>
  </div>

  <jsp:include page="../common/footer.jsp"/>
  
  <!-- 유효성 검사 -->
 <script>
 	
 function validate(){
	 
	 var name = document.getElementById("name");
	 var phone = document.getElementById("phone");
	 var email = document.getElementById("email");
	 
	 if(!chk(/^[가-힣]{1,}$/,name,"성함은 한글로 한글자 이상 입력하세요.")){
		 return false;
	 }
	 
	 if(!chk(/^[0-9]{10,11}$/,phone,"휴대폰 번호는 특수문자(-) 없이 숫자로만 10자리 혹은 11자리를 입력하세요.")){
		 return false;
	 }
	 
	 if(!chk(/^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/,email,"이메일 형식에 맞춰 입력하세요.")){
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
 


</body>
</html>
