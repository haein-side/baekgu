<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>상세 검색</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/YJCSS/header2.css" type="text/css">
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
	        
	        
	        $("#btnSubmit").click(function(){
		    	
	        	 var location = "";
	       
	        	
	        	// 지역
	        	if (document.getElementsByClassName("btn1 lo")) {
	        		for (var i = 1; i <= 26; i++){
	        			console.log(document.getElementById("l" + i));
	        			if(document.getElementById("l" + i).checked == true){
	        				location += document.getElementById("l" + i).value + "&";
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
	        			}
							        		
	        		}
	        		 location += "!";
	        	}
	        	
	        	console.log(location); 
	        	
	        	// 직종
	        	 if (document.getElementsByClassName("btn1 jb")) {
	        		for (var i = 1; i <= 5; i++){
	        			console.log(document.getElementById("j" + i));
	        			if(document.getElementById("j" + i).checked == true){
	        				location += document.getElementById("j" + i).value + "&";
	        				console.log(location);
	        			}
							        		
	        		}
	        		 location += "!";
	        	}
	        	
	        	console.log(location); 
	        	
	        	// 경력
	        	 if (document.getElementsByClassName("btn1 exp")) {
	        		for (var i = 1; i <= 7; i++){
	        			console.log(document.getElementById("e" + i));
	        			if(document.getElementById("e" + i).checked == true){
	        				location += document.getElementById("e" + i).value + "&";
	        				console.log(location);
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
	        			}
							        		
	        		}
	        		 location += "!";
	        	}
	        	
	        	console.log(location); 
	        	
	        	// 시간
	        	 if (document.getElementsByClassName("btn1 ho")) {
	        		for (var i = 1; i <= 6; i++){
	        			console.log(document.getElementById("h" + i));
	        			if(document.getElementById("h" + i).checked == true){
	        				location += document.getElementById("h" + i).value + "&";
	        				console.log(location);
	        			}
							        		
	        		}
	        		 
	        	}
	        	
	        	console.log(location); 
	        	
	        	
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
							style="width: 200pt; height: 60pt; font-size: x-large;"
							onclick="location.href='${ pageContext.servletContext.contextPath }/user/toSearchPost'">단순&nbsp;검색</button>
						<button class="btn1"
							style="width: 200pt; height: 60pt; font-size: x-large; margin-left: 160px;"
							disabled >상세&nbsp;검색</button>
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
									
									<label for="l1" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">강남구</p></label> 
                           			<input type="checkbox" id="l1" name = "location1" style="display: none" value="강남구"> 
									
									<label for="l2" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">강동구</p></label> 
                           			<input type="checkbox" id="l2" name = "location1" style="display: none" value="강동구">                                 	
									
									<label for="l3" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">강북구</p></label> 
                           			<input type="checkbox" id="l3" name = "location1" style="display: none" value="강북구">                                 	
									
									<label for="l4" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">강서구</p></label> 
                           			<input type="checkbox" id="l4" name = "location1" style="display: none" value="강서구">                                 	
									
									<label for="l5" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">관악구</p></label> 
                           			<input type="checkbox" id="l5" name = "location1" style="display: none" value="관악구">                                 	
									
									<label for="l6" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">광진구</p></label> 
                           			<input type="checkbox" id="l6" name = "location1" style="display: none" value="광진구">                                 	
									
									<label for="l7" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">구로구</p></label> 
                           			<input type="checkbox" id="l7" name = "location1" style="display: none" value="구로구">                                 	
									
									<label for="l8" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">금천구</p></label> 
                           			<input type="checkbox" id="l8" name = "location1" style="display: none" value="금천구">                                 	
									
									<label for="l9" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">노원구</p></label> 
                           			<input type="checkbox" id="l9" name = "location1" style="display: none" value="노원구">                                 	
									
									<label for="l10" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">도봉구</p></label> 
                           			<input type="checkbox" id="l10" name = "location1" style="display: none" value="도봉구">                                 	
									
									<label for="l11" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">동대문구</p></label> 
                           			<input type="checkbox" id="l11" name = "location1" style="display: none" value="동대문구">   

									<label for="l12" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">동작구</p></label> 
                           			<input type="checkbox" id="l12" name = "location1" style="display: none" value="동작구">                           			                              	
									<label for="l1" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">강남구</p></label> 
                           			<input type="checkbox" id="l1" name = "location1" style="display: none" value="강남구"> 
									
									<label for="l13" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">마포구</p></label> 
                           			<input type="checkbox" id="l13" name = "location1" style="display: none" value="마포구">                                 	
									<label for="l2" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">강동구</p></label> 
                           			<input type="checkbox" id="l2" name = "location1" style="display: none" value="강동구">                                 	
									
									<label for="l14" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">서대문구</p></label> 
                           			<input type="checkbox" id="l14" name = "location1" style="display: none" value="서대문구">                                 	
									<label for="l3" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">강북구</p></label> 
                           			<input type="checkbox" id="l3" name = "location1" style="display: none" value="강북구">                                 	
									
									<label for="l15" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">서초구</p></label> 
                           			<input type="checkbox" id="l15" name = "location1" style="display: none" value="서초구">                                 	
									<label for="l4" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">강서구</p></label> 
                           			<input type="checkbox" id="l4" name = "location1" style="display: none" value="강서구">                                 	
									
									<label for="l16" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">성동구</p></label> 
                           			<input type="checkbox" id="l16" name = "location1" style="display: none" value="성동구">                                 	
									
									<label for="l17" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">성북구</p></label> 
                           			<input type="checkbox" id="l17" name = "location1" style="display: none" value="성북구">                                 	
									
									<label for="l18" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">송파구</p></label> 
                           			<input type="checkbox" id="l18" name = "location1" style="display: none" value="송파구">                                 	
									
									<label for="l19" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">양천구</p></label> 
                           			<input type="checkbox" id="l19" name = "location1" style="display: none" value="양천구">                                 	
									
									<label for="l20" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">영등포구</p></label> 
                           			<input type="checkbox" id="l20" name = "location1" style="display: none" value="영등포구">                                 	
									
									<label for="l21" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">용산구</p></label> 
                           			<input type="checkbox" id="l21" name = "location1" style="display: none" value="용산구">                                 	
									
									<label for="l22" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">은평구</p></label> 
                           			<input type="checkbox" id="l22" name = "location1" style="display: none" value="은평구">                                 	
									
									<label for="l23" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">종로구</p></label> 
                           			<input type="checkbox" id="l23" name = "location1" style="display: none" value="종로구">                                 	
									
									<label for="l24" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">중구</p></label> 
                           			<input type="checkbox" id="l24" name = "location1" style="display: none" value="중구">                                 	
									
									<label for="l25" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">중랑구</p></label> 
                           			<input type="checkbox" id="l25" name = "location1" style="display: none" value="중랑구">                                 	
									
									<label for="l26" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">무관</p></label> 
                           			<input type="checkbox" id="l26" name = "location1" style="display: none" value="무관">                                 	
									                              

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
									 <label for="i1" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">식당/서빙</p></label> 
                                    <input type="checkbox" id="i1" name = "industry1" style="display: none" value="식당/서빙">  
                           <label for="i2" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">매장관리</p></label> 
                                    <input type="checkbox" id="i2" name = "industry1" style="display: none" value="매장관리">  
                           <label for="i3" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">상담/엉업</p></label> 
                                    <input type="checkbox" id="i3" name = "industry1" style="display: none" value="상담/엉업">  
                           <label for="i4" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">건설/생산/기술</p></label> 
                                    <input type="checkbox" id="i4" name = "industry1" style="display: none" value="건설/생산/기술">  
                           <label for="i5" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">간호/요양</p></label> 
                                    <input type="checkbox" id="i5" name = "industry1" style="display: none" value="간호/요양">  
                           <label for="i6" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">교사/강사</p></label> 
                                    <input type="checkbox" id="i6" name = "industry1" style="display: none" value="교사/강사">  
                           <label for="i7" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">운전/배달</p></label> 
                                    <input type="checkbox" id="i7" name = "industry1" style="display: none" value="운전/배달">  
                           <label for="i8" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">사무/경리</p></label> 
                                    <input type="checkbox" id="i8" name = "industry1" style="display: none" value="사무/경리">  
                           <label for="i9" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">기타</p></label> 
                                    <input type="checkbox" id="i9" name = "industry1" style="display: none" value="기타"> 
										<input type="checkbox" id="i1" name = "industry1" style="display: none" value="식당/서빙">  
                           				<label for="i2" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">매장관리</p></label> 
                                    	<input type="checkbox" id="i2" name = "industry1" style="display: none" value="매장관리">  
                           				<label for="i3" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">상담/엉업</p></label> 
                                    	<input type="checkbox" id="i3" name = "industry1" style="display: none" value="상담/엉업">  
                           				<label for="i4" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">건설/생산/기술</p></label> 
                                    	<input type="checkbox" id="i4" name = "industry1" style="display: none" value="건설/생산/기술">  
                           				<label for="i5" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">간호/요양</p></label> 
                                    	<input type="checkbox" id="i5" name = "industry1" style="display: none" value="간호/요양">  
                           				<label for="i6" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">교사/강사</p></label> 
                                    	<input type="checkbox" id="i6" name = "industry1" style="display: none" value="교사/강사">  
                           				<label for="i7" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">운전/배달</p></label> 
                                    	<input type="checkbox" id="i7" name = "industry1" style="display: none" value="운전/배달">  
                           				<label for="i8" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">사무/경리</p></label> 
                                    	<input type="checkbox" id="i8" name = "industry1" style="display: none" value="사무/경리">  
                           				<label for="i9" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">기타</p></label> 
                                    	<input type="checkbox" id="i9" name = "industry1" style="display: none" value="기타"> 

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
										 <label for="j1" class="btn1 jb" name="job" style="margin: 15px; width: 150pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">주방장</p></label> 
                                    <input type="checkbox" id="j1" name = "job1" style="display: none" value="주방장"> 
                                    <label for="j2" class="btn1 jb" name="job" style="margin: 15px; width: 150pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">주방장</p></label> 
                                    <input type="checkbox" id="j2" name = "job1" style="display: none" value="주방장"> 
                                    <label for="j3" class="btn1 jb" name="job" style="margin: 15px; width: 150pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">주방장</p></label> 
                                    <input type="checkbox" id="j3" name = "job1" style="display: none" value="주방장"> 
                                    <label for="j4" class="btn1 jb" name="job" style="margin: 15px; width: 150pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">주방장</p></label> 
                                    <input type="checkbox" id="j4" name = "job1" style="display: none" value="주방장"> 
                                    <label for="j5" class="btn1 jb" name="job" style="margin: 15px; width: 150pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">주방장</p></label> 
                                    <input type="checkbox" id="j5" name = "job1" style="display: none" value="주방장">           
										<label for="j1" class="btn1 in" name="job" style="margin: 15px; width: 150pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">주방장</p></label> 
	                                    <input type="checkbox" id="j1" name = "job1" style="display: none" value="주방장"> 
	                                    <label for="j2" class="btn1 in" name="job" style="margin: 15px; width: 150pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">주방장</p></label> 
	                                    <input type="checkbox" id="j2" name = "job1" style="display: none" value="주방장"> 
	                                    <label for="j3" class="btn1 in" name="job" style="margin: 15px; width: 150pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">주방장</p></label> 
	                                    <input type="checkbox" id="j3" name = "job1" style="display: none" value="주방장"> 
	                                    <label for="j4" class="btn1 in" name="job" style="margin: 15px; width: 150pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">주방장</p></label> 
	                                    <input type="checkbox" id="j4" name = "job1" style="display: none" value="주방장"> 
	                                    <label for="j5" class="btn1 in" name="job" style="margin: 15px; width: 150pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">주방장</p></label> 
	                                    <input type="checkbox" id="j5" name = "job1" style="display: none" value="주방장">   
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
										  <label for="e1" class="btn1 exp" name="exp" style="margin: 15px; width: 200pt; height: 60pt; font-size: 
                           x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">경력 없음</p></label> 
                                    <input type="checkbox" id="e1" name = "exp1" style="display: none" value="경력 없음">  

                           <label for="e2" class="btn1 exp" name="exp" style="margin: 15px; width: 200pt; height: 60pt; font-size: 
                           x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">1년 이하</p></label> 
                                    <input type="checkbox" id="e2" name = "exp1" style="display: none" value="1년 이하">  

                           <label for="e3" class="btn1 exp" name="exp" style="margin: 15px; width: 200pt; height: 60pt; font-size: 
                           x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">1년 이상</p></label> 
                                    <input type="checkbox" id="e3" name = "exp1" style="display: none" value="1년 이상">  
                                    
                           <label for="e4" class="btn1 exp" name="exp" style="margin: 15px; width: 200pt; height: 60pt; font-size: 
                           x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">2년 이상</p></label> 
                                    <input type="checkbox" id="e4" name = "exp1" style="display: none" value="2년 이상">  

                           <label for="e5" class="btn1 exp" name="exp" style="margin: 15px; width: 200pt; height: 60pt; font-size: 
                           x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">3년 이상</p></label> 
                                    <input type="checkbox" id="e5" name = "exp1" style="display: none" value="3년 이상">  

                           <label for="e6" class="btn1 exp" name="exp" style="margin: 15px; width: 200pt; height: 60pt; font-size: 
                           x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">4년 이상</p></label> 
                                    <input type="checkbox" id="e6" name = "exp1" style="display: none" value="4년 이상"> 

                           <label for="e7" class="btn1 exp" name="exp" style="margin: 15px; width: 200pt; height: 60pt; font-size: 
                           x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">5년 이상</p></label> 
                                    <input type="checkbox" id="e7" name = "exp1" style="display: none" value="5년 이상"> 
										<label for="e1" class="btn1 exp" name="exp" style="margin: 15px; width: 200pt; height: 60pt; font-size: 
                           				x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">경력 없음</p></label> 
                                    	<input type="checkbox" id="e1" name = "exp1" style="display: none" value="경력 없음">  

                           				<label for="e2" class="btn1 exp" name="exp" style="margin: 15px; width: 200pt; height: 60pt; font-size: 
                           				x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">1년 이하</p></label> 
                                    	<input type="checkbox" id="e2" name = "exp1" style="display: none" value="1년 이하">  

                           				<label for="e3" class="btn1 exp" name="exp" style="margin: 15px; width: 200pt; height: 60pt; font-size: 
                           				x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">1년 이상</p></label> 
                                    	<input type="checkbox" id="e3" name = "exp1" style="display: none" value="1년 이상">  
                                    
                           				<label for="p7" class="btn1 exp" name="exp" style="margin: 15px; width: 200pt; height: 60pt; font-size: 
                           				x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">2년 이상</p></label> 
                                    	<input type="checkbox" id="p7" name = "exp1" style="display: none" value="2년 이상">  

                           				<label for="p7" class="btn1 exp" name="exp" style="margin: 15px; width: 200pt; height: 60pt; font-size: 
                           				x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">3년 이상</p></label> 
                                    	<input type="checkbox" id="p7" name = "exp1" style="display: none" value="3년 이상">  

                           				<label for="p7" class="btn1 exp" name="exp" style="margin: 15px; width: 200pt; height: 60pt; font-size: 
                           				x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">4년 이상</p></label> 
                                    	<input type="checkbox" id="p7" name = "exp1" style="display: none" value="4년 이상"> 

                           				<label for="p7" class="btn1 exp" name="exp" style="margin: 15px; width: 200pt; height: 60pt; font-size: 
                           				x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">5년 이상</p></label> 
                                    	<input type="checkbox" id="p7" name = "exp1" style="display: none" value="5년 이상"> 

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
										 <label for="p1" class="btn1 pe" name="perioid" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">일주일 이하</p></label> 
                                    <input type="checkbox" id="p1" name = "perioid1" style="display: none" value="일주일 이하">  
                           <label for="p2" class="btn1 pe" name="perioid" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">일주일 이상</p></label> 
                                    <input type="checkbox" id="p2" name = "perioid1" style="display: none" value="일주일 이상">  
                           <label for="p3" class="btn1 pe" name="perioid" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">1개월 이상</p></label> 
                                    <input type="checkbox" id="p3" name = "perioid1" style="display: none" value="1개월 이상">  
                           <label for="p4" class="btn1 pe" name="perioid" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">3개월 이상</p></label> 
                                    <input type="checkbox" id="p4" name = "perioid1" style="display: none" value="3개월 이상">                                      
                            <label for="p5" class="btn1 pe" name="perioid" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">6개월 이상</p></label> 
                                    <input type="checkbox" id="p5" name = "period1" style="display: none" value="6개월 이상">                                     
                           <label for="p6" class="btn1 pe" name="perioid" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">1년 이상</p></label> 
                                    <input type="checkbox" id="p6" name = "period1" style="display: none" value="1년 이상">  
                           <label for="p7" class="btn1 pe" name="perioid" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">무관</p></label> 
                                    <input type="checkbox" id="p7" name = "period1" style="display: none" value="무관">  
										<label for="p1" class="btn1 pe" name="perioid" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">일주일 이하</p></label> 
                                    	<input type="checkbox" id="p1" name = "perioid1" style="display: none" value="일주일 이하">  
                           				<label for="p2" class="btn1 pe" name="perioid" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">일주일 이상</p></label> 
                                    	<input type="checkbox" id="p2" name = "perioid1" style="display: none" value="일주일 이상">  
                           				<label for="p3" class="btn1 pe" name="perioid" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">1개월 이상</p></label> 
                                    	<input type="checkbox" id="p3" name = "perioid1" style="display: none" value="1개월 이상">  
                           				<label for="p4" class="btn1 pe" name="perioid" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">3개월 이상</p></label> 
                                    	<input type="checkbox" id="p4" name = "perioid1" style="display: none" value="3개월 이상">                                      
                            			<label for="p5" class="btn1 pe" name="perioid" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">6개월 이상</p></label> 
                                    	<input type="checkbox" id="p5" name = "period1" style="display: none" value="6개월 이상">                                     
                           				<label for="p6" class="btn1 pe" name="perioid" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">1년 이상</p></label> 
                                    	<input type="checkbox" id="p6" name = "period1" style="display: none" value="1년 이상">  
                           				<label for="p7" class="btn1 pe" name="perioid" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">무관</p></label> 
                                    	<input type="checkbox" id="p7" name = "period1" style="display: none" value="무관">  

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
										   <label for="h1" class="btn1 ho" name="hour" style="margin: 15px; width: 150pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">시간 협의</p></label> 
                                    <input type="checkbox" id="h1" name = "hour1" style="display: none" value="시간 협의">  
                           <label for="h2" class="btn1 ho" name="hour" style="margin: 15px; width: 150pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">풀타임</p></label> 
									<label for="h1" class="btn1 ho" name="hour" style="margin: 15px; width: 150pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">시간 협의</p></label> 
                                    <input type="checkbox" id="h1" name = "hour1" style="display: none" value="시간 협의">  
                           			<label for="h2" class="btn1 ho" name="hour" style="margin: 15px; width: 150pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">풀타임</p></label> 
                                    <input type="checkbox" id="h2" name = "hour1" style="display: none" value="풀타임">                                      
                                    <label for="h3" class="btn1 ho" name="hour" style="margin: 15px; width: 150pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">새 벽</p></label> 
                                    <input type="checkbox" id="h3" name = "hour1" style="display: none" value="새 벽">   
                                    <label for="h4" class="btn1 ho" name="hour" style="margin: 15px; width: 150pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">오 전</p></label> 
                                    <input type="checkbox" id="h4" name = "hour1" style="display: none" value="오 전">   
                                    <label for="h5" class="btn1 ho" name="hour" style="margin: 15px; width: 150pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">오 후</p></label> 
                                    <input type="checkbox" id="h5" name = "hour1" style="display: none" value="오 후">   
                                    <label for="h6" class="btn1 ho" name="hour" style="margin: 15px; width: 150pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">저 녁</p></label> 
                                    <input type="checkbox" id="h6" name = "hour1" style="display: none" value="저 녁">   

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
	<script>
	
	<!-- 상세 검색에서 업종을 누르면 직종명을 가져오는 function-->
	
    $("#i1").click(function() {
    	
    	const industry1 = $("#i1").val();
    	
    	console.log("button 동작");
    	console.log(industry1);
    	
    	$.ajax({
    		url: "/baekgu/jobSearch",
    		type: "get",
    		data:{ 
    			industry1 : industry1
    		},
    		success: function(data,textStatus,xhr){
    			console.log(data);
    			
    		},
    		error: function(xhr, status, message){
    			console.log(message);
    		}
    		
    	});
	});
	
      $("#i2").click(function() {
    	
    	const industry2 = $("#i2").val();
    	
    	console.log("button 동작");
    	console.log(industry2);
    	
    	$.ajax({
    		url: "/baekgu/jobSearch",
    		type: "get",
    		data:{ industry2 : industry2 },
    		success: function(data,textStatus,xhr){
    			console.log(data);
    			var jobArray = "";
    			
    		},
    		error: function(xhr, status, message){
    			console.log(message);
    		}
    		
    	});
	});
    
    $("#i3").click(function() {
    	
    	const industry3 = $("#i3").val();
    	
    	console.log("button 동작");
    	console.log(industry3);
    	
    	$.ajax({
    		url: "/baekgu/jobSearch",
    		type: "get",
    		data:{ industry3 : industry3 },
    		success: function(data,textStatus,xhr){
    			console.log(data);
    			var jobArray = "";
    			
    		},
    		error: function(xhr, status, message){
    			console.log(message);
    		}
    		
    	});
	});
    
    $("#i4").click(function() {
    	
    	const industry4 = $("#i4").val();
    	
    	console.log("button 동작");
    	console.log(industry4);
    	
    	$.ajax({
    		url: "/baekgu/jobSearch",
    		type: "get",
    		data:{ industry4 : industry4 },
    		success: function(data,textStatus,xhr){
    			console.log(data);
    			var jobArray = "";
    			
    		},
    		error: function(xhr, status, message){
    			console.log(message);
    		}
    		
    	});
	});
    
    $("#i5").click(function() {
    	
    	const industry5 = $("#i5").val();
    	
    	console.log("button 동작");
    	console.log(industry5);
    	
    	$.ajax({
    		url: "/baekgu/jobSearch",
    		type: "get",
    		data:{ industry5 : industry5 },
    		success: function(data,textStatus,xhr){
    			console.log(data);
    			var jobArray = "";
    			alert("저장되셨습니다");
    			
    		},
    		error: function(xhr, status, message){
    			console.log(message);
    		}
    		
    	});
	});
    
    $("#i6").click(function() {
    	
    	const industry6 = $("#i6").val();
    	
    	console.log("button 동작");
    	console.log(industry6);
    	
    	$.ajax({
    		url: "/baekgu/jobSearch",
    		type: "get",
    		data:{ industry6 : industry6 },
    		success: function(data,textStatus,xhr){
    			console.log(data);
    			var jobArray = "";
    			
    		},
    		error: function(xhr, status, message){
    			console.log(message);
    		}
    		
    	});
	});
    
    $("#i7").click(function() {
    	
    	const industry7 = $("#i7").val();
    	console.log(industry7);
    	
    	console.log("button 동작");
    	
    	$.ajax({
    		url: "/baekgu/jobSearch",
    		type: "get",
    		data:{ industry7 : industry7 },
    		success: function(data,textStatus,xhr){
    			console.log(data);
    			var jobArray = "";
    			
    		},
    		error: function(xhr, status, message){
    			console.log(message);
    		}
    		
    	});
	});
    
    $("#i8").click(function() {
    	
    	const industry8 = $("#i8").val();
    	console.log(industry8);
    	
    	console.log("button 동작");
    	
    	$.ajax({
    		url: "/baekgu/jobSearch",
    		type: "get",
    		data:{ industry8 : industry8 },
    		success: function(data,textStatus,xhr){
    			console.log(data);
    			var jobArray = "";
    			
    		},
    		error: function(xhr, status, message){
    			console.log(message);
    		}
    		
    	});
	});
    
    $("#i9").click(function() {
    	
    	const industry = $("#i9").val();
    	
    	console.log("button 동작");
    	console.log(industry9);
    	
    	$.ajax({
    		url: "/baekgu/jobSearch",
    		type: "get",
    		data:{ industry9 : industry9 },
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


	<%@ include file="../common/footer.jsp"%>
</body>
</html>