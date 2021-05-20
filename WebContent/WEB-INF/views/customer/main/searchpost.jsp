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
    	$(function(){
    		
			$(".industry").click(function(){
				this.style.backgroundColor="orange";
			});    		
    	});
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
                            <h2 style="color: orange;"> 희망 직종을 선택해 주세요.</h2>
                            <br><br>
                            <div align="center" style="margin-bottom: 70px;">
                                <div style="width: 1000px;">
                                    <input type="button"class="btn1" name="industry" style=" margin: 15px; width : 200pt;height: 60pt;font-size:x-large;text-align:center;"
                                    	id="industry" value="식당/서빙"></input>
                                    <input type="button"class="btn1" name="industry" style=" margin: 15px; width : 200pt;height: 60pt;font-size:x-large;text-align:center;"
                                        id="industry"value="매장관리"></input>
                                    <input type="button"class="btn1" name="industry" style=" margin: 15px; width : 200pt;height: 60pt;font-size:x-large;text-align:center;"
                                    	id="industry" value="상담/영업"></input>
                                    <input type="button"class="btn1" name="industry" style=" margin: 15px; width : 200pt;height: 60pt;font-size:x-large;text-align:center;"
                                    	id="industry" value="건설/생산/기술"></input>
                                    <input type="button"class="btn1" name="industry" style=" margin: 15px; width : 200pt;height: 60pt;font-size:x-large;text-align:center;"
                                    	id="industry" value="간호/요양"></input>
                                    <input type="button"class="btn1" name="industry" style=" margin: 15px; width : 200pt;height: 60pt;font-size:x-large;text-align:center;"
                                    	id="industry" value="교사/강사"></input>
                                    <input type="button"class="btn1"  name="industry" style=" margin: 15px; width : 200pt;height: 60pt;font-size:x-large;text-align:center;"
                                    	id="industry" value="운전/배달"></input>
                                    <input type="button"class="btn1"  name="industry" style=" margin: 15px; width : 200pt;height: 60pt;font-size:x-large;text-align:center;"
                                    	id="industry" value="사무/경리"></input>
                                    <input type="button"class="btn1"  name="industry" style=" margin: 15px; width : 200pt;height: 60pt;font-size:x-large;text-align:center;"
                                    	id="industry" value="기   타"></input>
                                </div>
                            </div>
                        </div><hr>
                    </div>
                </div>
                    <div class="container">
                        <div class="section_title text-center">
                            <hr>
                            <h2 style="color: orange;">일하고 싶은 기간을 선택하세요.</h2>
                            <br><br>
                            <div align="center" style="margin-bottom: 70px;">
                                <div style="width: 1000px;">
                                    <button class="btn1"
                                        style=" margin: 15px; width:200pt;height: 60pt;font-size:x-large;">일주일&nbsp;&nbsp;이하</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width:200pt;height: 60pt;font-size:x-large;">일주일&nbsp;&nbsp;이상</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width:200pt;height: 60pt;font-size:x-large;">1개월&nbsp;&nbsp;이상</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width:200pt;height: 60pt;font-size:x-large;">3개월&nbsp;&nbsp;이상</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width:200pt;height: 60pt;font-size:x-large;">6개월&nbsp;&nbsp;이상</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width:200pt;height: 60pt;font-size:x-large;">1년&nbsp;&nbsp;이상</button>
                                	<button class="btn1"
                                        style=" margin: 15px; width:200pt;height: 60pt;font-size:x-large;">무&nbsp;&nbsp;관</button>                                     
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container" align="center"><hr>
                        <button class="btn1"
                            style="width: 180pt; height:60pt; font-size: x-large;">검색하기</button>
                    </div>
                    <br><br><br>
                <div class="col-sm-2 sidenav">
                </div>
            </div>
        </div>
      </div>
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