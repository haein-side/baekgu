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
    <script type="text/javascript">
/*     	jQuery(document).ready(function() {
        	$('.btn1').click(function() {
          /*  $('.btn1').removeClass("btnSelected");
            $(this).addClass("btnSelected") */; 
/* 
             jQuery(this).toggleClass("active");
             
       	});    
        
        
        	$("#btnSubmit").click(function(){
          
           		/* var location =  */
           		// for문 + if문으로 .getElementById("ln") = true
           		var result = document.getElementById("l1").value;
           		console.log(result);
           
           		// 서블릿으로 보내기
           		var path = '${ pageContext.servletContext.contextPath }';
            	$("#fm1").attr("action",path+"/user/detailedSearchPost").submit();
           
      		}); 
   		});   */
     */
    
    
    
/*     	$(function(){
    		
			$(".btn1").click(function(){
				this.style.backgroundColor="orange";
				
	            // 넘어노느 값이 있으면 e값을 대입, 없으면 window.event값을 대입(IE는 e값이 안넘어옴)
	            var event = e || window.event;

	            var btn1 = document.getElementById("btn1");

	            for(var key in event){
	                area2.innerHTML += key + " : " + event[key] + "<br>";
	                Console.log(event[key]);
			});    		
    	}); */
/* for문으로 횟수 설정 */
    </script>
</head>

<body>
<%@ include file="../common/header2.jsp" %>
<form>
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
                        <input type="button" class="btn1" id="category" style="width:200pt;height:60pt;font-size:
                        x-large; margin-left: 160px;x-large;text-align:center;"value="상세 검색" onclick="location.href='${ pageContext.servletContext.contextPath }/user/toDetailedSearchPost'"></input>
                    </div>
                    <div class="container">
                        <div class="section_title text-center">
                            <hr>                    	
                    		<h2 style="color: orange;">희망 지역을 선택해주세요.</h2>
							<p>두 지역까지 선택이 가능합니다.</p><br>
                            <div align="center" style="margin-bottom: 70px;">
                                <div style="width: 1000px;">
                                	
                                	<!-- label의 for로 input의 id를 바로보기 -->
                                	<!-- document.-->
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
									
									<label for="l13" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">마포구</p></label> 
                           			<input type="checkbox" id="l13" name = "location1" style="display: none" value="마포구">                                 	
									
									<label for="l14" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">서대문구</p></label> 
                           			<input type="checkbox" id="l14" name = "location1" style="display: none" value="서대문구">                                 	
									
									<label for="l15" class="btn1 lo" name="location" style="margin: 15px; width: 120pt; height: 60pt; font-size: x-large; text-align: center;"><p style="margin-top:22px; font-weight:normal">서초구</p></label> 
                           			<input type="checkbox" id="l15" name = "location1" style="display: none" value="서초구">                                 	
									
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
                        <div class="section_title text-center">
                            <hr>
                            <h2 style="color: orange;"> 희망 직종을 선택해주세요.</h2>
                            <p>한 가지만 선택이 가능합니다.</p><br>
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
                    <div class="container" align="center"><hr>
                        <button class="btn1" id="btnSubmit"
                            style="width: 180pt; height:60pt; font-size: x-large;">검색하기</button>
                    </div>
                    <br><br><br>
                <div class="col-sm-2 sidenav">
                </div>
            </div>
        </div>
      </div>
    <script>
    		$(".btn1").click(function() {
				const industry = $(".btn1").val();
    			
    			console.log("aa");
    			
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

<script>
/* 		winddow.onload=funcion(){
			buttoncolor().onclick(){
				this.style.backgroundColor="orange";
			}	
		} */
		
			
			
			
			/*var color = ['black', 'orange'];*/
			

/* 		select().onclick = function(e){
			
			this.style.backgroundColor = "orange";
		}
 */
/* 		function select() {
			
			var industy = document.getElementsById("industry")
			
			this.style.backgroundColor = "orange";
		} */

		
/*          var industry = document.getElementById("industry");
			
         test3.onclick = function(e){

            this.style.backgroundColor = "red";
            this.style.color = "white";

            // 넘어노느 값이 있으면 e값을 대입, 없으면 window.event값을 대입(IE는 e값이 안넘어옴)
            var event = e || window.event;

            var area2 = document.getElementById("area2");

            for(var key in event){
                area2.innerHTML += key + " : " + event[key] + "<br>";
            } */

</script>
      
      
</form>
<%@ include file="../common/footer.jsp" %>

</body>
</html>