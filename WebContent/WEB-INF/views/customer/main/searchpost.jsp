<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>단순 검색</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/YJCSS/header2.css"type="text/css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/styleSP.css">
    
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

	<!--광고 -->
	window.onload = function(){
		
		
		
		
		
		
	}
    
	
         $(".btn1 lo").click(function() {
		    if ($(this).hasClass("btnSelected")) {
		      $(this).removeClass("btnSelected");
		    } else {
		      $(".btn1 lo").removeClass("btnSelected");
		      $(this).addClass('btnSelected');
		    }
		  });


		$(".btn1").click(function() {
		     $(".btn1").removeClass("btnSelected");
		     $(this).addClass("btnSelected");
		  });
		
		$(".btn1 lo").click(function() {
		     $(".btn1 lo").removeClass("active");
		     $(this).addClass("active");
		  });
		
		jQuery('button.account').click(function() {
		   jQuery(this).toggleClass("btn-success");
		  //  jQuery(this).addClass("btn-success");
		});

 
	    jQuery(document).ready(function() {
	        $('.btn1').click(function() {
	           /* $('.btn1').removeClass("btnSelected");
	            $(this).addClass("btnSelected")  */
	
	             jQuery(this).toggleClass("active");
	            
	             
	    	});    
	        
	        <!-- 검색하기 버튼 클릭 시 -->
	        $("#btnSubmit").click(function(){
		    	
	        	 var location = "";
	       
	        	
	        	// 지역
	        	if (document.getElementsByClassName("btn1 lo")) {
	        		for (var i = 1; i <= 26; i++){
	        			console.log(document.getElementById("l" + i));
	        			if(document.getElementById("l" + i).checked == true){
	        				location += document.getElementById("l" + i).value + "&";
	        			} else {
	        				location += "";
	        			}
							        		
	        		}
	        		location += "!";
	        	}
	        	
	        	console.log(location);
	        	
	        	// 업종
	        	if (document.getElementsByClassName("btn1 in")) {
	        		for (var i = 1; i <= 9; i++){
	        			console.log(document.getElementById("i" + i));
	        			if(document.getElementById("i" + i).checked == true){
	        				location += document.getElementById("i" + i).value + "&";
	        				console.log(location);
	        			} else {
	        				location += "";
	        			}
							        		
	        		}
	        		 location += "!";
	        	}
	        	
	        	console.log(location); 
	        	
	        	// 기간
	        	 if (document.getElementsByClassName("btn1 pe")) {
	        		for (var i = 1; i <= 7; i++){
	        			console.log(document.getElementById("p" + i));
	        			if(document.getElementById("p" + i).checked == true){
	        				location += document.getElementById("p" + i).value + "&";
	        				console.log(location);
	        			} else {
	        			    location += "";
	        			}
							        		
	        		}
	        	
	        	}
	        	
	        	console.log(location); 
	        	
	        /* ajax가 있던 자리 */
				     
	        	document.getElementById("location").value = location;
			}); 
		});  
    	/* btnSubmit 종료 */
	    
	    
       $(".btn1").click(function() {
        	  if ($(this).hasClass("active")) {
        	  /*   $(this).removeClass("active");
        	  } else { */
        	    $(".active").removeClass("active");
        	    $(this).addClass('active');
        	  }
        });
	        
	        /* function update(location){
	          document.form1.action = "${ pageContext.servletContext.contextPath }/user/detailedSearchPost?location=" + location;
	          document.form1.submit();
	       }  */

	        


    $(".btn1 in").click(function() {
		
    	(this).attr
    	
    	const industry = $(".btn1 in").val();
    	
    	console.log("button 동작");
    	
    	$.ajax({
    		url: "/baekgu/jobSearch",
    		type: "get",
    		data:{ industry : industry },
    		success: function(data,textStatus,xhr){
    			console.log(data);
    			var jobArray = "";
    			
    		},
    		error: function(xhr, status, message){
    			console.log(message);
    		}
    		
    	});
	});
    
    
 
	 
    </script>
<!-- script 끝남 -->
</head>

<form action = "${ pageContext.servletContext.contextPath }/user/searchPost" method="get">
<body>
<%@ include file="../common/header2.jsp" %>

    <div style="z-index:1;">
        <div class="container-fluid text-center"  style="margin-top: 13%;">
            <div class="row content">
                <div class="col-sm-2 sidenav">
                </div>
                <div class="col-sm-8 text-left">
                    <div align="center">
                    	<div  style="width:1000px">
	                        <h1>공고&nbsp;검색</h1>
	                        <hr>
                        </div>
                    </div>
                    <div align="center" id="btn_group" style="padding:50px;">
                        <input type="button" class="btn1" id="category" style="width:200pt;height:60pt;font-size:
							x-large;text-align:center;" value="단순 검색"></input>
                    	<input type="button" class="btn1" id="category1" style="width:200pt;height:60pt;font-size:
                        x-large; margin-left: 160px;x-large;text-align:center;"value="상세 검색" onclick="location.href='${ pageContext.servletContext.contextPath }/user/toDetailedSearchPost'"></input>
                    	<%--  <a href="${ pageContext.servletContext.contextPath }/user/toDetailedSearchPost" type="button" class="btn1" id="category" style="width:200pt;height:60pt;font-size:
                        x-large; margin-left: 160px;x-large;text-align:center;" >상세 검색</a>  --%>
                    </div>
                    <div class="container">
                        <div class="section_title text-center">
                            <hr>                    	
                    		<h2 style="color: orange;">희망 지역을 선택해주세요.</h2>
							<p>여러 개 선택이 가능합니다.</p><br>
                            <div align="center" style="margin-bottom: 70px;">
                                <div style="width: 1000px;">
                                	
                                	<!-- label의 for로 input의 id를 바로보기 -->
                                	<!-- document.-->
									<!-- hidden -->                               	
                                	<input type="hidden" id="location" name="location" value=""/>
                                	
									<label for="l1" class="btn1 lo" name="location1" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">강남구</p></label> 
                           			<input type="checkbox" id="l1" name = "location1" style="display: none" value="2"> 
									
									<label for="l2" class="btn1 lo" name="location1" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">강동구</p></label> 
                           			<input type="checkbox" id="l2" name = "location1" style="display: none" value="3">                                 	
									
									<label for="l3" class="btn1 lo" name="location1" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">강북구</p></label> 
                           			<input type="checkbox" id="l3" name = "location1" style="display: none" value="4">                                 	
									
									<label for="l4" class="btn1 lo" name="location1" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">강서구</p></label> 
                           			<input type="checkbox" id="l4" name = "location1" style="display: none" value="5">                                 	
									
									<label for="l5" class="btn1 lo" name="location1" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">관악구</p></label> 
                           			<input type="checkbox" id="l5" name = "location1" style="display: none" value="6">                                 	
									
									<label for="l6" class="btn1 lo" name="location1" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">광진구</p></label> 
                           			<input type="checkbox" id="l6" name = "location1" style="display: none" value="7">                                 	
									
									<label for="l7" class="btn1 lo" name="location1" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">구로구</p></label> 
                           			<input type="checkbox" id="l7" name = "location1" style="display: none" value="8">                                 	
									
									<label for="l8" class="btn1 lo" name="location1" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">금천구</p></label> 
                           			<input type="checkbox" id="l8" name = "location1" style="display: none" value="9">                                 	
									
									<label for="l9" class="btn1 lo" name="location1" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">노원구</p></label> 
                           			<input type="checkbox" id="l9" name = "location1" style="display: none" value="10">                                 	
									
									<label for="l10" class="btn1 lo" name="location1" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">도봉구</p></label> 
                           			<input type="checkbox" id="l10" name = "location1" style="display: none" value="11">                                 	
									
									<label for="l11" class="btn1 lo" name="location1" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">동대문구</p></label> 
                           			<input type="checkbox" id="l11" name = "location1" style="display: none" value="12">   

									<label for="l12" class="btn1 lo" name="location1" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">동작구</p></label> 
                           			<input type="checkbox" id="l12" name = "location1" style="display: none" value="13">                           			                              	
									
									<label for="l13" class="btn1 lo" name="location1" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">마포구</p></label> 
                           			<input type="checkbox" id="l13" name = "location1" style="display: none" value="14">                                 	
									
									<label for="l14" class="btn1 lo" name="location1" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">서대문구</p></label> 
                           			<input type="checkbox" id="l14" name = "location1" style="display: none" value="15">                                 	
									
									<label for="l15" class="btn1 lo" name="location1" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">서초구</p></label> 
                           			<input type="checkbox" id="l15" name = "location1" style="display: none" value="16">                                 	
									
									<label for="l16" class="btn1 lo" name="location1" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">성동구</p></label> 
                           			<input type="checkbox" id="l16" name = "location1" style="display: none" value="17">                                 	
									
									<label for="l17" class="btn1 lo" name="location1" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">성북구</p></label> 
                           			<input type="checkbox" id="l17" name = "location1" style="display: none" value="18">                                 	
									
									<label for="l18" class="btn1 lo" name="location1" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">송파구</p></label> 
                           			<input type="checkbox" id="l18" name = "location1" style="display: none" value="19">                                 	
									
									<label for="l19" class="btn1 lo" name="location1" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">양천구</p></label> 
                           			<input type="checkbox" id="l19" name = "location1" style="display: none" value="20">                                 	
									
									<label for="l20" class="btn1 lo" name="location1" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">영등포구</p></label> 
                           			<input type="checkbox" id="l20" name = "location1" style="display: none" value="21">                                 	
									
									<label for="l21" class="btn1 lo" name="location1" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">용산구</p></label> 
                           			<input type="checkbox" id="l21" name = "location1" style="display: none" value="22">                                 	
									
									<label for="l22" class="btn1 lo" name="location1" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">은평구</p></label> 
                           			<input type="checkbox" id="l22" name = "location1" style="display: none" value="23">                                 	
									
									<label for="l23" class="btn1 lo" name="location1" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">종로구</p></label> 
                           			<input type="checkbox" id="l23" name = "location1" style="display: none" value="24">                                 	
									
									<label for="l24" class="btn1 lo" name="location1" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">중구</p></label> 
                           			<input type="checkbox" id="l24" name = "location1" style="display: none" value="25">                                 	
									
									<label for="l25" class="btn1 lo" name="location1" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">중랑구</p></label> 
                           			<input type="checkbox" id="l25" name = "location1" style="display: none" value="26">                                 	
									
									<label for="l26" class="btn1 lo" name="location1" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">무관</p></label> 
                           			<input type="checkbox" id="l26" name = "location1" style="display: none" value="1">                                 	
					
								</div>
							</div>
						</div>		
                        <div class="section_title text-center">
                            <hr>
                            <h2 style="color: orange;"> 희망 업종을 선택해주세요.</h2>
                            <p>한 가지만 선택이 가능합니다.</p><br>
                            <div align="center" style="margin-bottom: 70px;">
                                <div style="width: 1000px;">

									<label for="i1" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">식당/서빙</p></label> 
                           			<input type="checkbox" id="i1" name = "industry1" style="display: none" value="1">  
									<label for="i2" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">매장관리</p></label> 
                           			<input type="checkbox" id="i2" name = "industry1" style="display: none" value="2">  
									<label for="i3" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">상담/영업</p></label> 
                           			<input type="checkbox" id="i3" name = "industry1" style="display: none" value="3">  
									<label for="i4" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">건설/생산/기술</p></label> 
                           			<input type="checkbox" id="i4" name = "industry1" style="display: none" value="4">  
									<label for="i5" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">간호/요양</p></label> 
                           			<input type="checkbox" id="i5" name = "industry1" style="display: none" value="5">  
									<label for="i6" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">교사/강사</p></label> 
                           			<input type="checkbox" id="i6" name = "industry1" style="display: none" value="6">  
									<label for="i7" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">운전/배달</p></label> 
                           			<input type="checkbox" id="i7" name = "industry1" style="display: none" value="7">  
									<label for="i8" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">사무/경리</p></label> 
                           			<input type="checkbox" id="i8" name = "industry1" style="display: none" value="8">  
									<label for="i9" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">기타</p></label> 
                           			<input type="checkbox" id="i9" name = "industry1" style="display: none" value="9">  
                                </div>
                            </div>
                        </div><hr>
                    </div>
                </div>
                    <div class="container">
                        <div class="section_title text-center">
                            <hr>
                            <h2 style="color: orange;">일하고 싶은 기간을 선택하세요.</h2>
                            <p>한 가지만 선택이 가능합니다.</p><br>
                            <div align="center" style="margin-bottom: 70px;">
                                <div style="width: 1000px;">                  
									<label for="p1" class="btn1 pe" name="period" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">일주일 이하</p></label> 
                           			<input type="checkbox" id="p1" name = "period1" style="display: none" value="2">  
									<label for="p2" class="btn1 pe" name="period" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">일주일 이상</p></label> 
                           			<input type="checkbox" id="p2" name = "period1" style="display: none" value="3">  
									<label for="p3" class="btn1 pe" name="period" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">1개월 이상</p></label> 
                           			<input type="checkbox" id="p3" name = "period1" style="display: none" value="4">  
									<label for="p4" class="btn1 pe" name="period" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">3개월 이상</p></label> 
                           			<input type="checkbox" id="p4" name = "period1" style="display: none" value="5">                             			
 									<label for="p5" class="btn1 pe" name="period" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">6개월 이상</p></label> 
                           			<input type="checkbox" id="p5" name = "period1" style="display: none" value="6">                            			
									<label for="p6" class="btn1 pe" name="period" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">1년 이상</p></label> 
                           			<input type="checkbox" id="p6" name = "period1" style="display: none" value="7">  
									<label for="p7" class="btn1 pe" name="period" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">무관</p></label> 
                           			<input type="checkbox" id="p7" name = "period1" style="display: none" value="1">  	                           			                                	                                   
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container" align="center"><hr>
                        <button class="btn1" id="btnSubmit" type = "submit" 
                            style="width: 180pt; height:60pt; font-size: x-large;">검색하기</button>
                    </div>
                    <br><br><br>
                <div class="col-sm-2 sidenav">
                </div>
            </div>
        </div>
      </div>

<%@ include file="../common/footer.jsp" %>

</body>
</form>
</html>