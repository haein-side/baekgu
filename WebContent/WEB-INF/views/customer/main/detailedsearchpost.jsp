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
    
.btn1 exp.active2{
	background-color: orange;
}
</style>

<!-- script 시작 -->
<script type="text/javascript">
	
	var a;
	var b;
 window.onload = function(){ 
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
		    		for (var i = a+1; i <= b; i++){
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
		    	document.getElementById("location").value = location;
		    	
				  
			}); 
		
	 } 
	       
	       function itemChange() {
	   				 /* var restaurant = ['요리사', '주방보조', '찬모', '설거지', '서빙', '카운터'];5
	   		 var market = ['편의점', '슈퍼/마트/대형마트', '쇼핑몰/아울렛/백화점', '찜질방/사우나', '농수산/청과/축산', '물류/재고', '기타/매장'];12
	   		 var counsel = ['인바운드/CS', '아웃바운드/TM', '일반/기술영업', '보험/금융상담', '방문판매', '부동산상담', '홍보/마켓팅'];19
	   		 var manufacture = ['제조/조립', '미싱/재단/섬유', '노무현장/조선소', '건설/공사/보수', '전기/시설관리', '배관/용접/머시닝', '식품제조/가공', '자동차정비/튜닝', '설치/수리', '생산/포장/검사', '가구/목공', '금형/프레스/성형'];31
	   		 var nursing = ['간호사/간호조무사', '간병/요양보호소', '의료기사', '기타의료직'];35
	   		 var teach = ['어린이집/유치원', '방문/학습지', '외국어', '기타교사/학원관리'];39
	   		 var driving = ['이사/택배/퀵/배송', '대리운전/승용차/일반', '버스/택시/승합차', '지입/차량용역', '화물/중장비/특수차', '음식점/식음료배달'];45
	   		 var account = ['경리/회계/인사', '일반사무/내근직', '기획/총무/관리', '구매/자재/물류', '서비스/안내'];50
	   		 var etc = ['미화/청소/세탁', '생활도우미/파출부', '경비/보안', '주유/세차/광택', '헤어피부/미용/애견', '웨딩/이벤트/스튜디오', '호텔/모텔/숙박', '주차관리/대리주차']; */
	   		var job = [ '요리사', '주방보조', '찬모', '설거지', '서빙', '커운터', '편의점',
	   				'슈퍼/마트/대형마트', '쇼핑몰/아울렛/백화점', '찜질방/사우나', '농수산/청과/축산', '물류/재고',
	   				'기타/매장', '인바운드/CS', '아웃바운드/TM', '일반/기술영업', '보험/금융상담', '방문판매',
	   				'부동산상담', '홍보/마켓팅', '제조/조립', '미싱/재단/섬유', '노무현장/조선소', '건설/공사/보수',
	   				'전기/시설관리', '배관/용접/머시닝', '식품제조/가공', '자동차정비/튜닝', '설치/수리',
	   				'생산/포장/검사', '가구/목공', '금형/프레스/성형', '간호사/간호조무사', '간병/요양보호소',
	   				'의료기사', '기타의료직', '어린이집/유치원', '방문/학습지', '외국어', '기타교사/학원관리',
	   				'이사/택배/퀵/배송', '대리운전/승용차/일반', '버스/택시/승합차', '지입/차량용역',
	   				'화물/중장비/특수차', '음식점/식음료배달', '경리/회계/인사', '일반사무/내근직', '기획/총무/관리',
	   				'구매/자재/물류', '서비스/안내', '미화/청소/세탁', '생활도우미/파출부', '경비/보안',
	   				'주유/세차/광택', '헤어피부/미용/애견', '웨딩/이벤트/스튜디오', '호텔/모텔/숙박',
	   				'주차관리/대리주차' ];
	   		$('input[name="industry1"]:checked').val();
	   		
	   		console.log($('input[name="industry1"]:checked').val());
	   		
	   		var selectItem = $('input[name="industry1"]:checked').val();
	   		var changeItem;
	   	 if (selectItem == "1") {
             changeItem = job.slice(0, 5);
             a=0;
             b=5;
          } else if (selectItem == "2") {
             changeItem = job.slice(6, 12);
             a=6;
             b=12;
          } else if (selectItem == "3") {
             changeItem = job.slice(13, 19);
             a=13;
             b=19;
          } else if (selectItem == "4") {
             changeItem = job.slice(20, 31);
             a=20;
             b=31;
          } else if (selectItem == "5") {
             changeItem = job.slice(32, 35);
             a=32;
             b=35;
          } else if (selectItem == "6") {
             changeItem = job.slice(36, 39);
             a=36;
             b=39;
          } else if (selectItem == "7") {
             changeItem = job.slice(40, 45);
             a=40;
             b=45;
          } else if (selectItem == "8") {
             changeItem = job.slice(46, 50);
             a=46;
             b=50;
          } else if (selectItem == "9") {
             changeItem = job.slice(51, 58);
             a=51;
             b=58;
          }
	   		$('#selectJob').empty();
	   		
	   		
	   		for (var i = 0; i < changeItem.length; i++) {
	   			var option = $('<label for="j' + (i+1+a) + '" class="btn1 jb" name="job" style="margin: 15px; width: 150pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">'+changeItem[i]+'</p></label>' 
                        + '<input type="checkbox" id="j'+(i+1+a)+'" name = "job1" style="display: none" value="'+(i+1+a)+'">');
	   			
	   			console.log(option);
	   			
	   			$('#selectJob').append(option);
	   			
	   			console.log($('#selectJob').innerHTML);
	   			
	   			//var option = $("<option>" + changeItem[count] + "</option>");
	   			
	   			/* <label for="j1" class="btn1 jb" name="job" style="margin: 15px; width: 150pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">요리사</p></label> 
                <input type="checkbox" id="j1" name = "job1" style="display: none" value="1">  */
                
	   			
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

	   		});  
	   	}

	       
	       
	       
	    
	       function move(){
	       	window.location.href="${ pageContext.servletContext.contextPath }/user/toSearchPost";
	       } 
	       <!-- btnSubmit -->
	 
    </script>
 </head>
    
<form action = "${ pageContext.servletContext.contextPath}/user/detailedSearchPost" method="get">
<!-- script 끝남 -->

<!-- 폼 시작 -->
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
						<input type="button" class="btn1" id="category" style="width:200pt;height:60pt;font-size:
							x-large;text-align:center;" value="단순 검색" onclick='move()'></input>
						<button class="btn1"
							style="width: 200pt; height: 60pt; font-size: x-large; margin-left: 160px;"
							disabled >상세&nbsp;검색</button>
					</div>

					<!-- hidden -->                               	
                     <input type="hidden" id="location" name="location" value=""/>

						<div class="section_title text-center">
							<hr>
							<h2 style="color: orange;">희망 지역을 선택해주세요.</h2>
							<p>여러 개 선택이 가능합니다.</p>
							<br>
							<div align="center" style="margin-bottom: 70px;">
								<div style="width: 1000px;">
								
									<label for="l1" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">강남구</p></label> 
                           			<input type="checkbox" id="l1" name = "location1" style="display: none" value="2"> 
									
									<label for="l2" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">강동구</p></label> 
                           			<input type="checkbox" id="l2" name = "location1" style="display: none" value="3">                                 	
									
									<label for="l3" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">강북구</p></label> 
                           			<input type="checkbox" id="l3" name = "location1" style="display: none" value="4">                                 	
									
									<label for="l4" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">강서구</p></label> 
                           			<input type="checkbox" id="l4" name = "location1" style="display: none" value="5">                                 	
									
									<label for="l5" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">관악구</p></label> 
                           			<input type="checkbox" id="l5" name = "location1" style="display: none" value="6">                                 	
									
									<label for="l6" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">광진구</p></label> 
                           			<input type="checkbox" id="l6" name = "location1" style="display: none" value="7">                                 	
									
									<label for="l7" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">구로구</p></label> 
                           			<input type="checkbox" id="l7" name = "location1" style="display: none" value="8">                                 	
									
									<label for="l8" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">금천구</p></label> 
                           			<input type="checkbox" id="l8" name = "location1" style="display: none" value="9">                                 	
									
									<label for="l9" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">노원구</p></label> 
                           			<input type="checkbox" id="l9" name = "location1" style="display: none" value="10">                                 	
									
									<label for="l10" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">도봉구</p></label> 
                           			<input type="checkbox" id="l10" name = "location1" style="display: none" value="11">                                 	
									
									<label for="l11" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">동대문구</p></label> 
                           			<input type="checkbox" id="l11" name = "location1" style="display: none" value="12">   

									<label for="l12" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">동작구</p></label> 
                           			<input type="checkbox" id="l12" name = "location1" style="display: none" value="13">                           			                              	
									
									<label for="l13" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">마포구</p></label> 
                           			<input type="checkbox" id="l13" name = "location1" style="display: none" value="14">                                 	
									
									<label for="l14" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">서대문구</p></label> 
                           			<input type="checkbox" id="l14" name = "location1" style="display: none" value="15">                                 	
									
									<label for="l15" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">서초구</p></label> 
                           			<input type="checkbox" id="l15" name = "location1" style="display: none" value="16">                                 	
									
									<label for="l16" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">성동구</p></label> 
                           			<input type="checkbox" id="l16" name = "location1" style="display: none" value="17">                                 	
									
									<label for="l17" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">성북구</p></label> 
                           			<input type="checkbox" id="l17" name = "location1" style="display: none" value="18">                                 	
									
									<label for="l18" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">송파구</p></label> 
                           			<input type="checkbox" id="l18" name = "location1" style="display: none" value="19">                                 	
									
									<label for="l19" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">양천구</p></label> 
                           			<input type="checkbox" id="l19" name = "location1" style="display: none" value="20">                                 	
									
									<label for="l20" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">영등포구</p></label> 
                           			<input type="checkbox" id="l20" name = "location1" style="display: none" value="21">                                 	
									
									<label for="l21" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">용산구</p></label> 
                           			<input type="checkbox" id="l21" name = "location1" style="display: none" value="22">                                 	
									
									<label for="l22" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">은평구</p></label> 
                           			<input type="checkbox" id="l22" name = "location1" style="display: none" value="23">                                 	
									
									<label for="l23" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">종로구</p></label> 
                           			<input type="checkbox" id="l23" name = "location1" style="display: none" value="24">                                 	
									
									<label for="l24" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">중구</p></label> 
                           			<input type="checkbox" id="l24" name = "location1" style="display: none" value="25">                                 	
									
									<label for="l25" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">중랑구</p></label> 
                           			<input type="checkbox" id="l25" name = "location1" style="display: none" value="26">                                 	
									
									<label for="l26" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">무관</p></label> 
                           			<input type="checkbox" id="l26" name = "location1" style="display: none" value="1">                                 	
					                              

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
								<div align="center" style="margin-bottom: 70px;" id="selectIndustry" onchange="itemChange()">
									<div style="width: 1000px;">
										<label for="i1" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">식당/서빙</p></label> 
	                           			<input type="checkbox" id="i1" class="btn1 1n" name = "industry1" style="display: none" value="1">  
										<label for="i2" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">매장관리</p></label> 
	                           			<input type="checkbox" id="i2" class="btn1 1n" name = "industry1" style="display: none" value="2">  
										<label for="i3" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">상담/영업</p></label> 
	                           			<input type="checkbox" id="i3" class="btn1 1n" name = "industry1" style="display: none" value="3">  
										<label for="i4" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">건설/생산/기술</p></label> 
	                           			<input type="checkbox" id="i4" class="btn1 1n" name = "industry1" style="display: none" value="4">  
										<label for="i5" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">간호/요양</p></label> 
	                           			<input type="checkbox" id="i5" class="btn1 1n" name = "industry1" style="display: none" value="5">  
										<label for="i6" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">교사/강사</p></label> 
	                           			<input type="checkbox" id="i6" class="btn1 1n" name = "industry1" style="display: none" value="6">  
										<label for="i7" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">운전/배달</p></label> 
	                           			<input type="checkbox" id="i7" class="btn1 1n" name = "industry1" style="display: none" value="7">  
										<label for="i8" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">사무/경리</p></label> 
	                           			<input type="checkbox" id="i8" class="btn1 1n" name = "industry1" style="display: none" value="8">  
										<label for="i9" class="btn1 in" name="industry" style="margin: 15px; width: 200pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">기타</p></label> 
	                           			<input type="checkbox" id="i9" class="btn1 1n" name = "industry1" style="display: none" value="9">  
									</div>
								</div>
							</div>
						</div>
						<div class="container">
							<div class="section_title text-center">
								<hr>
								<h2 style="color: orange;">희망 직종을 더 상세하게 선택해주세요.</h2>
								<p>한 가지만 선택이 가능합니다.</p>
								<br>
								<br>
								<div align="center" id="selectJob" style="margin-bottom: 70px;">
									<div style="width: 1000px;">
										          
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
										<!-- 경력 카테고리 -->
										<label for="e1" class="btn1 exp" name="exp"  style="margin: 15px; width: 200pt; height: 60pt; font-size: 
                           				x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">경력 없음</p></label> 
                                    	<input type="checkbox" id="e1" name = "exp1" style="display: none" value="1">  

				                         <label for="e2" class="btn1 exp" name="exp" style="margin: 15px; width: 200pt; height: 60pt; font-size: 
				                         x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">1년 이하</p></label> 
                                    	 <input type="checkbox" id="e2" name = "exp1" style="display: none" value="2">  

                          				 <label for="e3" class="btn1 exp" name="exp" style="margin: 15px; width: 200pt; height: 60pt; font-size: 
                         				  x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">1년 이상</p></label> 
                                   		 <input type="checkbox" id="e3" name = "exp1" style="display: none" value="3">  
                                    
                           				<label for="e4" class="btn1 exp" name="exp" style="margin: 15px; width: 200pt; height: 60pt; font-size: 
                          				 x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">2년 이상</p></label> 
                            	        <input type="checkbox" id="e4" name = "exp1" style="display: none" value="4">  

                         				<label for="e5" class="btn1 exp" name="exp" style="margin: 15px; width: 200pt; height: 60pt; font-size: 
                           				x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">3년 이상</p></label> 
                                   		<input type="checkbox" id="e5" name = "exp1" style="display: none" value="5">  

                           				<label for="e6" class="btn1 exp" name="exp" style="margin: 15px; width: 200pt; height: 60pt; font-size: 
                           				x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">4년 이상</p></label> 
                                    	<input type="checkbox" id="e6" name = "exp1" style="display: none" value="6"> 

                           				<label for="e7" class="btn1 exp" name="exp" style="margin: 15px; width: 200pt; height: 60pt; font-size: 
                          				x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">5년 이상</p></label> 
                                    	<input type="checkbox" id="e7" name = "exp1" style="display: none" value="7"> 
										
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
						<div class="container">
							<div class="section_title text-center">
								<hr>
								<h2 style="color: orange;">원하시는 근무 시간이 있으신가요?</h2>
								<p>여러 개 선택이 가능힙니다.</p>
								<br>
								<br>
								<div align="center" style="margin-bottom: 70px;">
									<div style="width: 1000px;">
										<!-- for loop 으로 직종에대한 상세 카테고리 -->
										    <label for="h1" class="btn1 ho" name="hour" style="margin: 15px; width: 150pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">시간 협의</p></label> 
                                    	    <input type="checkbox" id="h1" name = "hour1" style="display: none" value="1">  
		                           			<label for="h2" class="btn1 ho" name="hour" style="margin: 15px; width: 150pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">풀타임</p></label> 
		                                    <input type="checkbox" id="h2" name = "hour1" style="display: none" value="2">                                      
		                                    <label for="h3" class="btn1 ho" name="hour" style="margin: 15px; width: 150pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">새 벽</p></label> 
		                                    <input type="checkbox" id="h3" name = "hour1" style="display: none" value="3">   
		                                    <label for="h4" class="btn1 ho" name="hour" style="margin: 15px; width: 150pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">오 전</p></label> 
		                                    <input type="checkbox" id="h4" name = "hour1" style="display: none" value="4">   
		                                    <label for="h5" class="btn1 ho" name="hour" style="margin: 15px; width: 150pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">오 후</p></label> 
		                                    <input type="checkbox" id="h5" name = "hour1" style="display: none" value="5">   
		                                    <label for="h6" class="btn1 ho" name="hour" style="margin: 15px; width: 150pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">저 녁</p></label> 
		                                    <input type="checkbox" id="h6" name = "hour1" style="display: none" value="6">   

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
	<script>
	$(".btn1 exp").click(function() {
	       $(".btn1 exp").removeClass("active2");
	       $(this).addClass("active2");
	    });
	
	</script>
</body>
</html>