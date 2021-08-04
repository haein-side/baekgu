<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>백구 기업회원가입</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
	background: darkslategrey;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 450px
}

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
	.row.content {
		height: auto;
	}
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
<script>
 	function sendSms(){		
 		var num = $('#buphone').val();
 		var userId = $('#userId').val();
 		console.log(num);
 		console.log(userId);
 		$.ajax({	
 			url:"${ pageContext.servletContext.contextPath }/business/sendsms",
 			data:{
 				num : num,
 				userId : userId
 			},
 			type:"post",
 			success:function(data, textStatus, xhr){		
 			alert("인증번호를 전송했습니다. 인증번호가 오지 않으면 입력하신 휴대폰번호가 회원정보와 일치하는지 확인해주세요.")
 			},
 			error:function(xhr, status, error){
 			}
 		});	
 	} 
 	function smsCheck(){
 		var userId = $('#userId').val();
 		var check = $('#sms').val();
 		$.ajax({
 			url: "${ pageContext.servletContext.contextPath }/business/checkmessage",
 			type:"post",
 			data: {
 				userId : userId,
 				check : check
 			},
 			dataType:"json",
 			success:function(result, textStatus, xhr){
 				console.log(result);
 				if($.trim(result) == "ok"){
 					alert("인증에 성공 하셨습니다.");
 					$('#checking').attr("value", "success");
 				} else {
 					alert("인증에 실패 하셨습니다");
 				}
 			},
 			error:function(xhr, status, error){
 			}
 		});
 	}
  </script>
</head>
<body>
<jsp:include page="../common/header.jsp" />
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-3 sidenav"></div>
			<div class="col-sm-6 text-left" style="padding-top: 30px;">
				<h1 style="margin-bottom: 40px;">비밀번호 찾기</h1>
			</div>

			<form
				action="${ pageContext.servletContext.contextPath }/business/tochangepwd"
				method="post">
				<div class="col-sm-6 text-left" align="center">
					<div class="form-group" style="padding-top: 30px;">
						<label for="userId">아이디</label>
						<div class="form-group row">
							<div class="col-xs-5">
								<input type="text" class="form-control" id="userId" name="hrId"
									placeholder="아이디" required>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="buphone">휴대폰 번호 (필수)</label>
						<div class="form-group row">
							<div class="col-xs-3">
								<input type="text" class="form-control" id="buphone"
									placeholder="휴대폰 번호" required>
							</div>
							<div class="col-xs-5">
								<button onclick="sendSms()" onsubmit="return false"
									type="button" class="btn-change">인증번호 요청</button>
							</div>
						</div>
						<small>특수문자(-)를 제외한 숫자만 입력하세요.</small>
					</div>

					<div class="form-group">
						<label for="buphone">인증 번호</label>
						<div class="form-group row">
							<div class="col-xs-2">
								<input type="text" class="form-control" id="sms"
									placeholder=" 인증번호" required>
							</div>
							<div class="col-xs-3">
								<button  onclick="smsCheck()" type="button" class="btn-change">인증번호
									확인</button>
								<input type="hidden" id="checking" value="fail" />
							</div>
						</div>
					</div>
					<div class="form-group"
						style="text-align: center; padding-top: 80px; padding-bottom: 80px;">
						<input type="submit" id="bregsubmit"
							class="btn btn-info btn-submit" value="확인">
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="col-sm-1 sidenav"></div>

	<script>

	
	
		$('#bregsubmit').click(function(){
			
				validate();
				
		});
			
		function validate(){
				
			if(document.getElementById("check").value != "success"){
				
				alert("인증번호 확인을 완료해주시기 바랍니다.");
				
				document.getElementById("checkResult").focues();
				
				return false;
				
			} else {
				
				return true;
				
			}
					
		}	
</script>
<jsp:include page="../common/footer.jsp" />
</body>
</html>