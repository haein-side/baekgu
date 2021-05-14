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
    		color : white;
    		background-color : orange;	
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
                        <h1>공고&nbsp;검색</h1>
                        <hr><br><br>
                    </div>
                    <div align="center" id="btn_group">
                        <button class="btn1" style="width:200pt;height:80pt;border-radius:10px;font-size:x-large;"disabled>기본&nbsp;검색</button>
                        <button class="btn1" style="width:200pt;height:80pt;border-radius:10px;font-size:x-large; margin-left: 160px;">상세&nbsp;검색</button>
                        <br>
                    </div>

                    <div class="container">
                        <div class="section_title text-center">
                            <hr>
                            <h2 style="color: black;"> 희망 직종을 선택해 주세요.</h2>
                            <br><br>
                            <div align="center" style="margin-bottom: 100px;">
                                <div style="width: 1000px;">
                                    <button class="btn1"
                                        style=" margin: 15px; width : 200pt;height: 80pt;border-radius: 10px;font-size:x-large;">식&nbsp;당</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width : 200pt;height: 80pt;border-radius: 10px;font-size:x-large;">매장&nbsp;관리</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width : 200pt;height: 80pt;border-radius: 10px;font-size:x-large;">상&nbsp;담</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width : 200pt;height: 80pt;border-radius: 10px;font-size:x-large;">건&nbsp;설</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width : 200pt;height: 80pt;border-radius: 10px;font-size:x-large;">간&nbsp;호</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width : 200pt;height: 80pt;border-radius: 10px;font-size:x-large;">교&nbsp;사</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width : 200pt;height: 80pt;border-radius: 10px;font-size:x-large;">운&nbsp;전</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width : 200pt;height: 80pt;border-radius: 10px;font-size:x-large;">사&nbsp;무</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width : 200pt;height: 80pt;border-radius: 10px;font-size:x-large;">기&nbsp;타</button>
                                </div>
                            </div>
                        </div><hr>
                    </div>
                </div>
                <div class="container" align="center">
                    <div class="about_content">
                        <h2 style="color: black;">일하고 싶은 기간을 선택하세요.</h2><br><br><br>
                        <div style="width: 1000px;">
                            <button class="btn1"
                                style=" margin: 15px; width:200pt;height: 80pt;border-radius: 10px;font-size:x-large;">일주일&nbsp;&nbsp;이하</button>
                            <button class="btn1"
                                style=" margin: 15px; width:200pt;height: 80pt;border-radius: 10px;font-size:x-large;">한달&nbsp;&nbsp;이하</button>
                            <button class="btn1"
                                style=" margin: 15px; width:200pt;height: 80pt;border-radius: 10px;font-size:x-large;">3개월&nbsp;&nbsp;이하</button>
                            <button class="btn1"
                                style=" margin: 15px; width:200pt;height: 80pt;border-radius: 10px;font-size:x-large;">6개월&nbsp;&nbsp;이하</button>
                            <button class="btn1"
                                style=" margin: 15px; width:200pt;height: 80pt;border-radius: 10px;font-size:x-large;">1년&nbsp;&nbsp;이상</button>
                            <button class="btn1"
                                style=" margin: 15px; width:200pt;height: 80pt;border-radius: 10px;font-size:x-large;">기&nbsp;&nbsp;타</button>
                        </div>
                    </div>
                </div>
                <br><br><br>
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