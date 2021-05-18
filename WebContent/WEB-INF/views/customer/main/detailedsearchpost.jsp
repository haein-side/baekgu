<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>상세 검색</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="RESOURCES/CSS/CUSTOMER/YJCSS/header2.css" type="text/css">
    <link rel="stylesheet" href="RESOURCES/CSS/CUSTOMER/styleSP.css">
</head>
<body>
<%@ include file="../common/header2.jsp" %>
    <div style="z-index:1;">
        <div class="container-fluid text-center"  style="margin-top: 15%;">
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
                        <button class="btn1"
                            style="width:200pt;height:60pt;font-size:x-large;">단순&nbsp;검색</button>
                        <button class="btn1"
                            style="width:200pt;height:60pt;font-size:x-large; margin-left: 160px;"
                            disabled>상세&nbsp;검색</button>
                    </div>
                    <div class="container">
                        <div class="section_title text-center">
                            <hr>
                            <h2 style="color: orange;"> 희망 업종을 선택해주세요.</h2>
                            <p>한 가지만 선택이 가능합니다.</p>
                            <br><br>
                            <div align="center" style="margin-bottom: 70px;">
                                <div style="width: 1000px;">
                                    <button class="btn1"
                                        style=" margin: 15px; width : 200pt;height: 60pt;border-radius: 30px;font-size:x-large;">식당/서빙</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width : 200pt;height: 60pt;border-radius: 30px;font-size:x-large;">매장관리</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width : 200pt;height: 60pt;border-radius: 30px;font-size:x-large;">상담/영업</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width : 200pt;height: 60pt;border-radius: 30px;font-size:x-large;">건설/생산/기술</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width : 200pt;height: 60pt;border-radius: 30px;font-size:x-large;">간호/요양</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width : 200pt;height: 60pt;border-radius: 30px;font-size:x-large;">교사/강사</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width : 200pt;height: 60pt;border-radius: 30px;font-size:x-large;">운전/배달</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width : 200pt;height: 60pt;border-radius: 30px;font-size:x-large;">사무/경리</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width : 200pt;height: 60pt;border-radius: 30px;font-size:x-large;">기&nbsp;타</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="section_title text-center">
                            <hr>
                            <h2 style="color: orange;">희망 직종을 더 상세하게 선택해주세요.</h2>
                            <p>여러 개 선택이 가능합니다.</p>
                            <br><br>
                            <div align="center" style="margin-bottom: 70px;">
                                <div style="width: 1000px;">
                                    <!-- for loop 으로 직종에대한 상세 카테고리 -->
                                    <button class="btn1"
                                        style="margin: 8px; width : 150pt;height: 60pt;font-size:x-large;">주방장</button>
                                    <button class="btn1"
                                        style="margin: 8px; width : 150pt;height: 60pt;font-size:x-large;">서&nbsp;빙</button>
                                    <button class="btn1"
                                        style="margin: 8px; width : 150pt;height: 60pt;font-size:x-large;">디쉬&nbsp;워셔</button>
                                    <button class="btn1"
                                        style="margin: 8px; width : 150pt;height: 60pt;font-size:x-large;">캐&nbsp;셔</button>
                                    <button class="btn1"
                                        style="margin: 8px; width : 150pt;height: 60pt;font-size:x-large;">찬&nbsp;모</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="section_title text-center">
                            <hr>
                            <h2 style="color: orange;">해당 직종에 대해 경력이 있으신가요?</h2>
                            <p>한 가지만 선택이 가능합니다.</p>
                            <br><br>
                            <div align="center" style="margin-bottom: 70px;">
                                <div style="width: 1000px;">
                                    <!-- for loop 으로 직종에대한 상세 카테고리 -->
                                    <button class="btn1"
                                        style="margin: 8px; width : 150pt;height: 60pt;font-size:x-large;">경력&nbsp;없음</button>
                                    <button class="btn1"
                                        style="margin: 8px; width : 150pt;height: 60pt;font-size:x-large;">1년&nbsp;이하</button>
                                    <button class="btn1"
                                        style="margin: 8px; width : 150pt;height: 60pt;font-size:x-large;">1년&nbsp;이상</button>
                                    <button class="btn1"
                                        style="margin: 8px; width : 150pt;height: 60pt;font-size:x-large;">2년&nbsp;이상</button>
                                    <button class="btn1"
                                        style="margin: 8px; width : 150pt;height: 60pt;font-size:x-large;">3년&nbsp;이상</button>
                                    <button class="btn1"
                                        style="margin: 8px; width : 150pt;height: 60pt;font-size:x-large;">4년&nbsp;이상</button>
                                    <button class="btn1"
                                        style="margin: 8px; width : 150pt;height: 60pt;font-size:x-large;">5년&nbsp;이상</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="section_title text-center">
                            <hr>
                            <h2 style="color: orange;">일하고 싶은 기간을 선택하세요.</h2>
                            <p>한 가지만 선택이 가능합니다.</p>
                            <br><br>
                            <div align="center" style="margin-bottom: 70px;">
                                <div style="width: 1000px;">
                                    <button id="btn_1" class="btn1"
                                        style=" margin: 15px; width:200pt;height: 60pt;font-size:x-large;">일주일&nbsp;&nbsp;이하</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width:200pt;height: 60pt;font-size:x-large;">한달&nbsp;&nbsp;이하</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width:200pt;height: 60pt;font-size:x-large;">3개월&nbsp;&nbsp;이하</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width:200pt;height: 60pt;font-size:x-large;">6개월&nbsp;&nbsp;이하</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width:200pt;height: 60pt;font-size:x-large;">1년&nbsp;&nbsp;이상</button>
                                    <button class="btn1"
                                        style=" margin: 15px; width:200pt;height: 60pt;font-size:x-large;">기&nbsp;&nbsp;타</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="section_title text-center">
                            <hr>
                            <h2 style="color: orange;">원하시는 근무 시간이 있으신가요?</h2>
                            <p>여러 개 선택이 가능힙니다.</p>
                            <br><br>
                            <div align="center" style="margin-bottom: 70px;">
                                <div style="width: 1000px;">
                                    <!-- for loop 으로 직종에대한 상세 카테고리 -->
                                    <button class="btn1"
                                        style=" margin: 8px;width : 150pt;height: 60pt;font-size:x-large;">풀타임</button>
                                    <button class="btn1"
                                        style=" margin: 8px;width : 150pt;height: 60pt;font-size:x-large;">새벽(0시~6시)</button>
                                    <button class="btn1"
                                        style=" margin: 8px;width : 150pt;height: 60pt;font-size:x-large;">오전(6시~12시)</button>
                                    <button class="btn1"
                                        style=" margin: 8px;width : 150pt;height: 60pt;font-size:x-large;">오후(12시~18시)</button>
                                    <button class="btn1"
                                        style=" margin: 8px;width : 150pt;height: 60pt;font-size:x-large;">저녁(18시~24시)</button>
                                    <button class="btn1"
                                        style=" margin: 8px;width : 150pt;height: 60pt;font-size:x-large;">시간&nbsp;협의</button>
                                    <button class="btn1"
                                        style=" margin: 8px;width : 150pt;height: 60pt;font-size:x-large;">상관&nbsp;없음</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container" align="center"><hr>
                        <button class="btn1"
                            style="width: 180pt; height:60pt;font-size: x-large;">검색하기</button>
                    </div>
                    <br><br><br>
                </div>
                <div class="col-sm-2 sidenav">
                </div>
            </div>
        </div>
    </div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>