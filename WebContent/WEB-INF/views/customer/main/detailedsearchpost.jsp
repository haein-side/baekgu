<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="icon" href="image/favicon.png" type="image/png">
        <title>백세구&nbsp;인구직</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="RESOURCES/CSS/CUSTOMER/bootstrapSP.css">    
        <!-- main css -->
        <link rel="stylesheet" href="RESOURCES/CSS/CUSTOMER/styleSP.css">
        <style>

            @font-face{

            src: url("../fonts/NanumBarunGothic.ttf");

            font-family: "nan";

            }

            a{
                font-family: "nan";
            }
            input{
                font-family: "nan";
            }
        </style>
    </head>
    <body>
     	<%@ include file="../common/header.jsp" %>
        <!-- 상단 바-->
        <section style="margin-top: 30px;margin-bottom: 30px;">
            <div>
                <br><br>
                <p style="font-size: xx-large;">공고&nbsp;검색(상세 검색)</p><br><br>
            </div>
        </section>
        <!--기본 버튼 상세 버튼-->
        <section>
            <div align="center" id="btn_group">
                <a href="index.html" class="button_hover theme_btn_two" style="width : 200pt;height: 80pt;border-radius: 10px;font-size:x-large;padding-top: 40px;">기본 검색</a>
                <a href="#" class="button_hover theme_btn_two" style="width : 200pt;height: 80pt;border-radius: 10px;font-size:x-large;padding-top: 40px;margin-left: 160px;"disabled>상세 검색</a>
                <br><br><br>
            </div>
        </section>
        <!--지도 자리입니다....-->
        <section>
            <div>
                <div>

                </div>
            </div>
        </section>
        <!--================ 직종 선택  =================-->
        <section class="facilities_area section_gap" style="padding-top: 50px;padding-bottom: 10px;">
            <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background="" style="transform: translateY(-29.3162px); height: 900px;">  
            </div> 
            </div>
              <div class="container">
                <div class="section_title text-center">
                    <h2 class="title_w"> 희망 직종을 선택해 주세요!</h2>
                    <br><br>
                    <div align="center"> 
                   <div style="width: 700px;;">
                    <a href="#job" class="button_hover1 theme_btn_two2" style="width : 100pt;height: 100pt;border-radius: 10px;font-size:x-large;padding-top: 26px;"><br>식&nbsp;당</a>
                    <a href="#job" class="button_hover1 theme_btn_two2" style="width : 100pt;height: 100pt;border-radius: 10px;font-size:x-large;"><br>매장<br>관리</a>
                    <a href="#job" class="button_hover1 theme_btn_two2" style="width : 100pt;height: 100pt;border-radius: 10px;font-size:x-large;padding-top: 26px;"><br>상&nbsp;담</a>
                    <a href="#job" class="button_hover1 theme_btn_two2" style="width : 100pt;height: 100pt;border-radius: 10px;font-size:x-large;padding-top: 26px;"><br>건&nbsp;설</a>
                    <a href="#job" class="button_hover1 theme_btn_two2" style="width : 100pt;height: 100pt;border-radius: 10px;font-size:x-large;padding-top: 26px;"><br>간&nbsp;호</a>
                    <a href="#job" class="button_hover1 theme_btn_two2" style="width : 100pt;height: 100pt;border-radius: 10px;font-size:x-large;padding-top: 26px;"><br>교&nbsp;사</a>
                    <a href="#job" class="button_hover1 theme_btn_two2" style="width : 100pt;height: 100pt;border-radius: 10px;font-size:x-large;padding-top: 26px;"><br>운&nbsp;전</a>
                    <a href="#job" class="button_hover1 theme_btn_two2" style="width : 100pt;height: 100pt;border-radius: 10px;font-size:x-large;padding-top: 26px;"><br>사&nbsp;무</a>
                    <a href="#job" class="button_hover1 theme_btn_two2" style="width : 100pt;height: 100pt;border-radius: 10px;font-size:x-large;padding-top: 26px;"><br>기&nbsp;타</a>
                </div>   
            </div>    
            
        </div>
    </div>
</section>
<!-- 상세직종 검색-->
<section class="job"style="margin-top: 150px; margin-bottom: 150px;" id="job">
    <div class="container">
        <div class="section_title text-center">
            <br>
            <br>
            <h2 class="title title_color">희망 직종을 더 상세하게 선택해주세요.</h2>
            <br><br>
            <div align="center">
                <div>
                    <!-- for loop 으로 직종에대한 상세 카테고리 -->
                    <a href="#times" class="button_hover theme_btn_two" style="width : 100pt;height: 70pt;border-radius: 10px;font-size:x-large;padding-top: 34px;">주방장</a>
                    <a href="#times" class="button_hover theme_btn_two" style="width : 100pt;height: 70pt;border-radius: 10px;font-size:x-large;padding-top: 34px;">서&nbsp;빙</a>
                    <a href="#times" class="button_hover theme_btn_two" style="width : 100pt;height: 70pt;border-radius: 10px;font-size:x-large;padding-top: 20px;">디쉬 워셔</a>
                    <a href="#times" id="times"class="button_hover theme_btn_two" style="width : 100pt;height: 70pt;border-radius: 10px;font-size:x-large;padding-top: 34px;">캐&nbsp;셔</a>

                </div>
            </div>
        </div>
    </div>
</section>
<!-- 근무 시간 -->
<section class="job_area section_gap">
    <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background="" style="transform: translateY(-29.3162px); height: 900px;">  
    </div> 
    <div class="container">
        <div class="section_title text-center">
            <br><br><br><br><br><br><br>
                <h2 class="title_w">원하시는 근무 시간이 있으신가요?</h2>
                <br>
                <br>
                <div align="center">
                    <div style="display: flex;" align="left"> 
                        <div style ="width: 400px;">
                            <label class="radio" style="height: 10px; width: 280px;"><input name="time" type="checkbox" style="zoom: 2;"> 풀타임</label><br>
                            <label class="radio" style="height: 10px; width: 280px;"><input name="time" type="checkbox" style="zoom: 2;"> 저녁(18시 ~ 24시)</label>
                        </div>
                        <div style="width: 400px">
                            <label class="radio" style="height: 10px; width: 280px;"><input name="time" type="checkbox" style="zoom: 2;"> 오전(6시 ~ 12시)</label><br>
                            <label class="radio" style="height: 10px; width: 280px;"><input name="time" type="checkbox" style="zoom: 2;"> 새벽(0시 ~ 4시)</label>
                        </div>
                        <div style="width: 400px">
                            <label class="radio" style="height: 10px; width: 280px;"><input name="time" type="checkbox" style="zoom: 2;"> 오후(12시 ~ 18시)</label><br>
                            <label class="radio" style="height: 10px; width: 280px;"><input name="time" type="checkbox" style="zoom: 2;"> 시간&nbsp;협의</label>
                        </div>
                        <div style="width: 400px">
                            <label class="radio"><input name="time" type="checkbox" style="zoom: 2;"> 상관&nbsp;없음</label>
                            <!-- <label class="radio"><input name="time" type="checkbox" style="zoom: 2;"> 시간 협의</label> -->
                        </div>
                    </div>
                </div>
        </div>
    </div>
</section>

<!-- 경력 사항-->
<section style="margin-bottom: 170px; margin-top: 100px;">
    <div class="container">
        <div class="section_title text-center">
            <br>
            <br>
                <h2 class="title title_color">해당 직종에 대해 경력이 있으신가요?</h2>
                <br>
                <br>
                <div align="center">
                    <div style="width: 1200px; display: flex;" align="left"> 
                        <div style="width: 400px">
                            <label class="checkboxTime"><input type="checkbox" style="zoom: 2;"> 경력&nbsp;없음</label>
                            <label class="checkboxTime"><input type="checkbox" style="zoom: 2;"> 3년&nbsp;이상</label>
                        </div>
                        <div style="width: 400px">
                            <label class="checkboxTime"><input type="checkbox" style="zoom: 2;"> 1년&nbsp;이하</label>
                            <label class="checkboxTime"><input type="checkbox" style="zoom: 2;"> 4년&nbsp;이상</label>
                        </div>
                        <div style="width: 400px">
                            <label class="checkboxTime"><input type="checkbox" style="zoom: 2;"> 1년&nbsp;이상</label>
                            <label class="checkboxTime"><input type="checkbox" style="zoom: 2;"> 5년&nbsp;이상</label>
                        </div>
                        <div style="width: 400px" >
                            <label class="checkboxTime"><input type="checkbox" style="zoom: 2;"> 2년&nbsp;이상</label>
                            <!-- <label class="checkboxTime"><input type="checkbox" style="zoom: 2;"> 상관 없음</label> -->
                        </div>
                    </div>
                </div>
        </div>
    </div>
</section>
<!--================ 기간 선택  =================-->
        <section class="period_area section_gap">
            <div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background="" style="transform: translateY(-29.3162px); height: 900px;">  
            </div> 
             <div class="container" align="center">
                <div class="about_content">
                    <h2 class="title_w">일하고 싶은 기간을 선택하세요. </h2><br><br>
                    <div  style="width: 1000px;">
                    <a href="#" class="button_hover1 theme_btn_two2" style="width : 200pt;height: 80pt;border-radius: 10px;font-size:x-large;padding-top: 40px;">일주일&nbsp;이하</a>
                    <a href="#" class="button_hover1 theme_btn_two2" style="width : 200pt;height: 80pt;border-radius: 10px;font-size:x-large;padding-top: 40px;">한달&nbsp;이하</a>
                    <a href="#" class="button_hover1 theme_btn_two2" style="width : 200pt;height: 80pt;border-radius: 10px;font-size:x-large;padding-top: 40px;">3개월&nbsp;이하</a>
                    <a href="#" class="button_hover1 theme_btn_two2" style="width : 200pt;height: 80pt;border-radius: 10px;font-size:x-large;padding-top: 40px;">6개월&nbsp;이하</a>
                    <a href="#" class="button_hover1 theme_btn_two2" style="width : 200pt;height: 80pt;border-radius: 10px;font-size:x-large;padding-top: 40px;">1년&nbsp;이상</a>
                    <a href="#" class="button_hover1 theme_btn_two2" style="width : 200pt;height: 80pt;border-radius: 10px;font-size:x-large;padding-top: 40px;">기&nbsp;&nbsp;타</a>
                </div>
            </div>
        </div>
    </section>
    <!--================ 검색하기  =================-->
    <section id="search"class="testimonial_area section_gap">
        <div class="container" align="center">
            <a href="#" class="button_hover theme_btn_two" style="width : 200pt;height: 100pt;border-radius: 10px;font-size:x-large;padding-top: 26px;"><br>검색하기</a>
            
        </div>
        </section>
 	<%@ include file="../common/footer.jsp" %>

    </body>
</html>