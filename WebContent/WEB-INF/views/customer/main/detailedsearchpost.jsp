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
                        <input type="button" class="btn1" id="category" style="width:200pt;height:60pt;font-size:
							x-large;text-align:center;" value="단순 검색" onclick="location.href='${ pageContext.servletContext.contextPath }/user/toSearchPost'"></input>
                        <input type="button" class="btn1" id="category" style="width:200pt;height:60pt;font-size:
                        x-large; margin-left: 160px;x-large;text-align:center;"value="상세 검색"></input>
                    </div>
                    <div class="container">
                        <div class="section_title text-center">
                            <hr>
                            <h2 style="color: orange;"> 희망 업종을 선택해주세요.</h2>
                            <p>한 가지만 선택이 가능합니다.</p>
                            <br><br>
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
                            <br><br>
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
                            <br><br>
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
                    <div class="container">
                        <div class="section_title text-center">
                            <hr>
                            <h2 style="color: orange;">원하시는 근무 시간이 있으신가요?</h2>
                            <p>여러 개 선택이 가능힙니다.</p>
                            <br><br>
                            <div align="center" style="margin-bottom: 70px;">
                                <div style="width: 1000px;">
                                    <!-- for loop 으로 직종에대한 상세 카테고리 -->
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