<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>상세조회</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="RESOURCES/CSS/CUSTOMER/YJCSS/header2.css"type="text/css">
    <style>
    	.btn1{
    		background-color: black;
			color : white;
    	}
    </style>
</head>

<body>
<%@ include file="../common/header2.jsp" %>
    <form>
        <div class="container-fluid text-center">
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
                    <div align="center" id="btn_group"style="height: 170px;">
                        <button class="btn1"
                            style="width:200pt;height:60pt;border-radius:10px;font-size:x-large;">단순&nbsp;검색</button>
                        <button class="btn1"
                            style="width:200pt;height:60pt;border-radius:10px;font-size:x-large; margin-left: 160px;"
                            disabled>상세&nbsp;검색</button>
                        <br><br><br><br><br>
                        <br>
                    </div>
                    <div class="container">
                        <div class="section_title text-center">
                            <hr>
                            <h2 style="color: orange;"> 희망 직종을 선택해 주세요.</h2>
                            <br><br>
                            <div align="center" style="margin-bottom: 100px;">
                                <div style="width: 1000px;">
                                    <button class="btn1"
                                        style=" margin: 15px; width : 200pt;height: 60pt;border-radius: 10px;font-size:x-large;">식당/서빙</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width : 200pt;height: 60pt;border-radius: 10px;font-size:x-large;">매장관리</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width : 200pt;height: 60pt;border-radius: 10px;font-size:x-large;">상담/영업</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width : 200pt;height: 60pt;border-radius: 10px;font-size:x-large;">건설/생산/기술</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width : 200pt;height: 60pt;border-radius: 10px;font-size:x-large;">간호/요양</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width : 200pt;height: 60pt;border-radius: 10px;font-size:x-large;">교사/강사</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width : 200pt;height: 60pt;border-radius: 10px;font-size:x-large;">운전/배달</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width : 200pt;height: 60pt;border-radius: 10px;font-size:x-large;">사무/경리</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width : 200pt;height: 60pt;border-radius: 10px;font-size:x-large;">기&nbsp;타</button>
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
                            <div align="center" style="margin-bottom: 100px;">
                                <div style="width: 1000px;">
                                    <button class="btn1"
                                        style=" margin: 15px; width:200pt;height: 60pt;border-radius: 10px;font-size:x-large;">일주일&nbsp;&nbsp;이하</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width:200pt;height: 60pt;border-radius: 10px;font-size:x-large;">한달&nbsp;&nbsp;이하</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width:200pt;height: 60pt;border-radius: 10px;font-size:x-large;">3개월&nbsp;&nbsp;이하</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width:200pt;height: 60pt;border-radius: 10px;font-size:x-large;">6개월&nbsp;&nbsp;이하</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width:200pt;height: 60pt;border-radius: 10px;font-size:x-large;">1년&nbsp;&nbsp;이상</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width:200pt;height: 60pt;border-radius: 10px;font-size:x-large;">기&nbsp;&nbsp;타</button>
                                </div>
                            </div>
                        </div>
                    </div>
                <div class="container" align="center">
                    <hr><br><br>
                    <button class="btn1"
                        style="width: 200pt; height: 80pt; border-radius: 10px; font-size: x-large;">검색하기</button>
                </div>
                <div class="col-sm-2 sidenav">
                </div>
            </div>
        </div>
        <br><br><br>
    </form>
<%@ include file="../common/footer.jsp" %>
</body>
</html>