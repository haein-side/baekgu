<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>상세 검색</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/YJCSS/header2.css"
	type="text/css">
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/styleSP.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
.btn1 {
	background-color: black;
}

.active {
	background-color: orange;
}

.btn1.active {
	background-color: orange;
}

/* .btn1.active {
      background-color: orange;
    }

    .btn1 {
     background-color:black;
    } */
</style>

<!-- script 시작 -->
<script type="text/javascript">
    
         $(".btn1").click(function() {
		    if ($(this).hasClass("btnSelected")) {
		      $(this).removeClass("btnSelected");
		    } else {
		      $(".btn1").removeClass("btnSelected");
		      $(this).addClass('btnSelected');
		    }
		  });


		$(".btn1").click(function() {
		     $(".btn1").removeClass("btnSelected");
		     $(this).addClass("btnSelected");
		  });
		
		$(".btn1").click(function() {
		     $(".btn1").removeClass("active");
		     $(this).addClass("active");
		  });
		
		jQuery('button.account').click(function() {
		   jQuery(this).toggleClass("btn-success");
		  //  jQuery(this).addClass("btn-success");
		});

 
	    jQuery(document).ready(function() {
	        $('.btn1').click(function() {
	          /*  $('.btn1').removeClass("btnSelected");
	            $(this).addClass("btnSelected") */; 
	
	             jQuery(this).toggleClass("active");
	             
	    	});    
	        
	        
	        $("#btnSubmit").click(function(){
		    	
	        	/* var location =  */
	        	/* var result = document.getElementById("l1").value;
	        	console.log(result); */
	        	 
	        	
	        	 var location = "";
	        	
	        	/* if(document.getElementById("l2").checked == true){
	        		resultString +=  document.getElementById("l2").value;
	        		console.log(resultString);
	        	} */
	        	
	        	
	        	if (document.getElementsByClassName("btn1 lo")) {
	        		for (var i = 1; i <= 2; i++){
	        			console.log(document.getElementById("l" + i));
	        			if(document.getElementById("l" + i).checked == true){
	        				location += document.getElementById("l" + i).value + "&";
	        			}
	        		}
	        	}
	        	
	        	console.log(location);
	        	
	        	// 서블릿으로 보내기
	        	
	        	// 선생님이 해주신 것
	        	/* var path = '${ pageContext.servletContext.contextPath }';
				   $("#fm1").attr("action",path+"/user/detailedSearchPost").submit(); */
				   
				   // 내가 하는 것
				  /*  $.ajax({
						url: "/baekgu/user/detailedSearchPost",
						method : "get",
						data:{ location : location },
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
							    $("#duplicationCheck").attr("checkResult","success"); 
							    $("#idCheck").value == "success";
							    $("#idCheck").value("success"); 
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
				    */
				   $.ajax({
					   
		                url: "/baekgu/user/detailedSearchPost",
		                type: "get",
		                data:{ location : location },
		                success: function(data,textStatus,xhr){
		                   console.log(data);
		                   var jobArray = "";
		                   
		                   
		                },
		                error: function(xhr, status, message){
		                   console.log(message);
		                }
		                
		             });

				   
				  
			}); 
		});  
    
       $(".btn1").click(function() {
        	  if ($(this).hasClass("active")) {
        	  /*   $(this).removeClass("active");
        	  } else { */
        	    $(".active").removeClass("active");
        	    $(this).addClass('active');
        	  }
        });
	        
	        function update(location){
	          document.form1.action = "${ pageContext.servletContext.contextPath }/user/detailedSearchPost?location=" + location;
	          document.form1.submit();
	       } 

	        

	       
    
 
	 
    </script>
<!-- script 끝남 -->



</head>
<body>
	<%@ include file="../common/header2.jsp"%>
	<div style="z-index: 1;">
		<div class="container-fluid text-center" style="margin-top: 15%;">
			<div class="row content">
				<div class="col-sm-2 sidenav"></div>
				<div class="col-sm-8 text-left">
					<div align="center">
						<div style="width: 1000px">
							<h1>공고&nbsp;검색</h1>
							<hr>
						</div>
					</div>
					<div align="center" id="btn_group" style="padding: 50px;">
						<button class="btn1"
							style="width: 200pt; height: 60pt; font-size: x-large;">단순&nbsp;검색</button>
						<button class="btn1"
							style="width: 200pt; height: 60pt; font-size: x-large; margin-left: 160px;"
							disabled>상세&nbsp;검색</button>
					</div>

					<!-- 폼 시작 -->
					<form id="fm1" name="form1" method="post">

						<div class="section_title text-center">
							<hr>
							<h2 style="color: orange;">희망 지역을 선택해주세요.</h2>
							<p>두 지역까지 선택이 가능합니다.</p>
							<br>
							<div align="center" style="margin-bottom: 70px;">
								<div style="width: 1000px;">

									<label for="l1" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;" value="강남구">강남구</label> 
									
									<input type="checkbox" id="l1" name = "location1" style="display: none" value="강남구"> 
									
									<label for="l2" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;" value="강동구">강동구</label> 
									
									<input type="checkbox" id="l2" name = "location1" style="display: none" value="강동구"> 
									
									<input type="button" class="btn1 l1" name="location" style=" margin: 15px; width : 120pt;height: 60pt;font-size:x-large;text-align:center;"
                                        value="강동구"></input>                                       
                                    <input type="button"class="btn1" name="location" style=" margin: 15px; width : 120pt;height: 60pt;font-size:x-large;text-align:center;"
                                        value="강북구"></input> 
                                    <input type="button"class="btn1" name="location" style=" margin: 15px; width : 120pt;height: 60pt;font-size:x-large;text-align:center;"
                                        value="강서구"></input>    
                                    <input type="button"class="btn1" name="location" style=" margin: 15px; width : 120pt;height: 60pt;font-size:x-large;text-align:center;"
                                        value="관악구"></input>    
                                    <input type="button"class="btn1" name="location" style=" margin: 15px; width : 120pt;height: 60pt;font-size:x-large;text-align:center;"
                                        value="광진구"></input>                        
                           <input type="button"class="btn1" name="location" style=" margin: 15px; width : 120pt;height: 60pt;font-size:x-large;text-align:center;"
                                        value="구로구"></input> 
                           <input type="button"class="btn1" name="location" style=" margin: 15px; width : 120pt;height: 60pt;font-size:x-large;text-align:center;"
                                        value="금천구"></input> 
                           <input type="button"class="btn1" name="location" style=" margin: 15px; width : 120pt;height: 60pt;font-size:x-large;text-align:center;"
                                        value="노원구"></input> 
                           <input type="button"class="btn1" name="location" style=" margin: 15px; width : 120pt;height: 60pt;font-size:x-large;text-align:center;"
                                        value="도봉구"></input> 
                                    <input type="button"class="btn1" name="location" style=" margin: 15px; width : 120pt;height: 60pt;font-size:x-large;text-align:center;"
                                        value="동대문구"></input>
                                    <input type="button"class="btn1" name="location" style=" margin: 15px; width : 120pt;height: 60pt;font-size:x-large;text-align:center;"
                                        value="동작구"></input>                
                                    <input type="button"class="btn1" name="location" style=" margin: 15px; width : 120pt;height: 60pt;font-size:x-large;text-align:center;"
                                        value="마포구"></input>                                       
                                    <input type="button"class="btn1" name="location" style=" margin: 15px; width : 120pt;height: 60pt;font-size:x-large;text-align:center;"
                                        value="서대문구"></input> 
                                    <input type="button"class="btn1" name="location" style=" margin: 15px; width : 120pt;height: 60pt;font-size:x-large;text-align:center;"
                                        value="서초구"></input>    
                                    <input type="button"class="btn1" name="location" style=" margin: 15px; width : 120pt;height: 60pt;font-size:x-large;text-align:center;"
                                        value="성동구"></input>    
                                    <input type="button"class="btn1" name="location" style=" margin: 15px; width : 120pt;height: 60pt;font-size:x-large;text-align:center;"
                                        value="성북구"></input>                        
                           <input type="button"class="btn1" name="location" style=" margin: 15px; width : 120pt;height: 60pt;font-size:x-large;text-align:center;"
                                        value="송파구"></input> 
                           <input type="button"class="btn1" name="location" style=" margin: 15px; width : 120pt;height: 60pt;font-size:x-large;text-align:center;"
                                        value="양천구"></input> 
                           <input type="button"class="btn1" name="location" style=" margin: 15px; width : 120pt;height: 60pt;font-size:x-large;text-align:center;"
                                        value="영등포구"></input> 
                           <input type="button"class="btn1" name="location" style=" margin: 15px; width : 120pt;height: 60pt;font-size:x-large;text-align:center;"
                                        value="용산구"></input>                           
                           <input type="button"class="btn1" name="location" style=" margin: 15px; width : 120pt;height: 60pt;font-size:x-large;text-align:center;"
                                        value="은평구"></input> 
                           <input type="button"class="btn1" name="location" style=" margin: 15px; width : 120pt;height: 60pt;font-size:x-large;text-align:center;"
                                        value="종로구"></input> 
                           <input type="button"class="btn1" name="location" style=" margin: 15px; width : 120pt;height: 60pt;font-size:x-large;text-align:center;"
                                        value="중구"></input> 
                           <input type="button"class="btn1" name="location" style=" margin: 15px; width : 120pt;height: 60pt;font-size:x-large;text-align:center;"
                                        value="중랑구"></input>   
                                    <input type="button"class="btn1" name="location" style=" margin: 15px; width : 120pt;height: 60pt;font-size:x-large;text-align:center;"
                                        value="무관"></input>                           

								</div>
							</div>
						</div>

						<input type="hidden" id="hd1">
						
						<div class="container">
							<div class="section_title text-center">
								<hr>
								<h2 style="color: orange;">희망 업종을 선택해주세요.</h2>
								<p>한 가지만 선택이 가능합니다.</p>
								<br>
								<br>
								<div align="center" style="margin-bottom: 70px;">
									<div style="width: 1000px;">
										<input type="button" class="btn1 ind" name="industry"
											style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"
											id="restaurant" value="식당/서빙"></input> <input type="button"
											class="btn1" name="industry"
											style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"
											id="storemanagement" value="매장관리"></input> <input
											type="button" class="btn1" name="industry"
											style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"
											id="sales" value="상담/영업"></input> <input type="button"
											class="btn1" name="industry"
											style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"
											id="construction" value="건설/생산/기술"></input> <input
											type="button" class="btn1" name="industry"
											style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"
											id="nursing" value="간호/요양"></input> <input type="button"
											class="btn1" name="industry"
											style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"
											id="teaching" value="교사/강사"></input> <input type="button"
											class="btn1" name="industry"
											style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"
											id="delivery" value="운전/배달"></input> <input type="button"
											class="btn1" name="industry"
											style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"
											id="admin" value="사무/경리"></input> <input type="button"
											class="btn1" name="industry"
											style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"
											id="etc" value="기   타"></input>
									</div>
								</div>
							</div>
						</div>
						<div class="container">
							<div class="section_title text-center">
								<hr>
								<h2 style="color: orange;">희망 직종을 더 상세하게 선택해주세요.</h2>
								<p>두 가지만 선택이 가능합니다.</p>
								<br>
								<br>
								<div align="center" style="margin-bottom: 70px;">
									<div style="width: 1000px;">
										<!-- for loop 으로 직종에대한 상세 카테고리 -->
										<input type="button" class="btn1"
											style="margin: 8px; width: 150pt; height: 60pt; font-size: x-large;"
											value="주방장"></input> <input type="button" class="btn1"
											style="margin: 8px; width: 150pt; height: 60pt; font-size: x-large;"
											value="서빙"></input> <input type="button" class="btn1"
											style="margin: 8px; width: 150pt; height: 60pt; font-size: x-large;"
											value="설거지"></input> <input type="button" class="btn1"
											style="margin: 8px; width: 150pt; height: 60pt; font-size: x-large;"
											value="계산"></input> <input type="button" class="btn1"
											style="margin: 8px; width: 150pt; height: 60pt; font-size: x-large;"
											value="찬모"></input>
									</div>
								</div>
							</div>
						</div>
						<div class="container">
							<div class="section_title text-center">
								<hr>
								<h2 style="color: orange;">해당 직종에 대해 경력이 있으신가요?</h2>
								<p>한 가지만 선택이 가능합니다.</p>
								<br>
								<br>
								<div align="center" style="margin-bottom: 70px;">
									<div style="width: 1000px;">
										<!-- for loop 으로 직종에대한 상세 카테고리 -->
										<input type="button" class="btn1"
											style="margin: 8px; width: 150pt; height: 60pt; font-size: x-large;"
											value="경력 없음"></input> <input type="button" class="btn1"
											style="margin: 8px; width: 150pt; height: 60pt; font-size: x-large;"
											value="1년 이하"></input> <input type="button" class="btn1"
											style="margin: 8px; width: 150pt; height: 60pt; font-size: x-large;"
											value="1년 이상"></input> <input type="button" class="btn1"
											style="margin: 8px; width: 150pt; height: 60pt; font-size: x-large;"
											value="2년 이상"></input> <input type="button" class="btn1"
											style="margin: 8px; width: 150pt; height: 60pt; font-size: x-large;"
											value="3년 이상"></input> <input type="button" class="btn1"
											style="margin: 8px; width: 150pt; height: 60pt; font-size: x-large;"
											value="4년 이상"></input> <input type="button" class="btn1"
											style="margin: 8px; width: 150pt; height: 60pt; font-size: x-large;"
											value="5년 이상"></input>
									</div>
								</div>
							</div>
						</div>
						<div class="container">
							<div class="section_title text-center">
								<hr>
								<h2 style="color: orange;">일하고 싶은 기간을 선택하세요.</h2>
								<p>한 가지만 선택이 가능합니다.</p>
								<br>
								<br>
								<div align="center" style="margin-bottom: 70px;">
									<div style="width: 1000px;">
										<input type="button" id="btn_1" class="btn1"
											style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large;"
											value="일주일 이하"></input> <input type="button" class="btn1"
											style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large;"
											value="한달 이하"></input> <input type="button" class="btn1"
											style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large;"
											value="3개월 이하"></input> <input type="button" class="btn1"
											style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large;"
											value="6개월 이하"></input> <input type="button" class="btn1"
											style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large;"
											value="1년 이상"></input> <input type="button" class="btn1"
											style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large;"
											value="무   관"></input>
									</div>
								</div>
							</div>
						</div>
						<div class="container">
							<div class="section_title text-center">
								<hr>
								<h2 style="color: orange;">원하시는 근무 시간이 있으신가요?</h2>
								<p>한 가지만 선택이 가능힙니다.</p>
								<br>
								<br>
								<div align="center" style="margin-bottom: 70px;">
									<div style="width: 1000px;">
										<!-- for loop 으로 직종에대한 상세 카테고리 -->
										<input type="button" class="btn1"
											style="margin: 8px; width: 150pt; height: 60pt; font-size: x-large;"
											value="시간 협의"></input> <input type="button" class="btn1"
											style="margin: 8px; width: 150pt; height: 60pt; font-size: x-large;"
											value="종 일"></input> <input type="button" class="btn1"
											style="margin: 8px; width: 150pt; height: 60pt; font-size: x-large;"
											value="새 벽"></input> <input type="button" class="btn1"
											style="margin: 8px; width: 150pt; height: 60pt; font-size: x-large;"
											value="오 전"></input> <input type="button" class="btn1"
											style="margin: 8px; width: 150pt; height: 60pt; font-size: x-large;"
											value="오 후"></input> <input type="button" class="btn1"
											style="margin: 8px; width: 150pt; height: 60pt; font-size: x-large;"
											value="저 녁"></input>
									</div>
								</div>
							</div>
						</div>
						<div class="container" align="center">
							<hr>
							<button id="btnSubmit" class="btn1" type="submit"
								style="width: 180pt; height: 60pt; font-size: x-large;">검색하기</button>
						</div>


					</form>
					<!-- 폼 끝남 -->

					<br>
					<br>
					<br>
				</div>
				<div class="col-sm-2 sidenav"></div>
			</div>
		</div>
	</div>



	<%@ include file="../common/footer.jsp"%>
</body>
</html>