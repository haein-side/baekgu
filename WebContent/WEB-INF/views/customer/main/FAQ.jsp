<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <title>고객문의</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

        <link rel="stylesheet" type="text/css" href="RESOURCES/CSS/CUSTOMER/FAQbootstrap.css"/>

	
        <script type="text/javascript" src="RESOURCES/JS/CUSTOMER/FAQjquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="RESOURCES/JS/CUSTOMER/FAQbootstrap.min.js"></script>
    </head>
    <body>
<<<<<<< HEAD
    <%@ include file="../common/header.jsp"%> 
     
=======
  	 <%@ include file="../common/header.jsp" %>    
>>>>>>> branch 'master' of https://github.com/109SilverTown/baekgu.git

<div class="container">

    <div class="page-header">
        <h1 style="font-family:BM; color: orange;">무엇을 도와드릴까요?</h1>
    </div>

    <div
        id="panel-group"
        class="accordion"
        style="text-align: center; font-family:Nanum; height: 200px; background-color: #e9e9ea;">
        <br>
       <h4>궁금한 질문들이 있었다면 아래 '자주 묻는 질문' 을 확인하시면 됩니다 !
            <br>
                <br>
                    '자주 묻는 질문' 에 궁금한게 없으시다면 백구에게 전화주세요 !
                    <br>
                        <br>
                            <strong>고객센터 : 02-109-1009</strong>
                            <br>
                                (운영시간 : 09:00 ~ 18:00)
                            </h4>
                    </div>
            <!-- FAQ 시작 ! -->
            
                <br/>
                <br/>
                <br/>

                <div class="panel-group" id="accordion">
                    <div class="faqHeader"><h2 style="font-family:BM; color: orange;">자주 묻는 질문들</h2></div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a
                                    class="accordion-toggle"
                                    data-toggle="collapse"
                                    data-parent="#accordion"
                                    href="#collapseOne">회원가입은 무료인가요?</a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <strong>맞습니다.</strong>
                                바로 그것이 정답입니다.
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a
                                    class="accordion-toggle collapsed"
                                    data-toggle="collapse"
                                    data-parent="#accordion"
                                    href="#collapseTen">회원탈퇴는 어디서 하나요?</a>
                            </h4>
                        </div>
                        <div id="collapseTen" class="panel-collapse collapse">
                            <div class="panel-body">
                                회원 탈퇴는 이렇게 하시면 됩니다.
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a
                                    class="accordion-toggle collapsed"
                                    data-toggle="collapse"
                                    data-parent="#accordion"
                                    href="#collapseEleven">가입에 나이제한은 없나요 ?</a>
                            </h4>
                        </div>
                        <div id="collapseEleven" class="panel-collapse collapse">
                            <div class="panel-body">
                                <strong>네
                                </strong>
                                저희는 나이제한은 없습니다.
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a
                                    class="accordion-toggle collapsed"
                                    data-toggle="collapse"
                                    data-parent="#accordion"
                                    href="#collapseEleven">백구는 언제나 존재하나요?</a>
                            </h4>
                        </div>
                        <div id="collapseEleven" class="panel-collapse collapse">
                            <div class="panel-body">
                                <strong>네
                                </strong>
                                항상 있습니다.
                            </div>
                        </div>
                    </div>
                </div>
                <!-- FAQ 끝 -->

                <style>
                    .faqHeader {
                        font-size: 27px;
                        margin: 20px;
                    }

                    .panel-heading [data-toggle="collapse"]:after {
                        font-family: 'Glyphicons Halflings';
                        content: "\e072";
                        /* "play" icon */
                        float: right;
                        color: #F58723;
                        font-size: 18px;
                        line-height: 22px;
                        /* rotate "play" icon from > (right arrow) to down arrow */
                        -webkit-transform: rotate(-90deg);
                        -moz-transform: rotate(-90deg);
                        -ms-transform: rotate(-90deg);
                        -o-transform: rotate(-90deg);
                        transform: rotate(-90deg);
                    }

                    .panel-heading [data-toggle="collapse"].collapsed:after {
                        /* rotate "play" icon from > (right arrow) to ^ (up arrow) */
                        -webkit-transform: rotate(90deg);
                        -moz-transform: rotate(90deg);
                        -ms-transform: rotate(90deg);
                        -o-transform: rotate(90deg);
                        transform: rotate(90deg);
                        color: #454444;
                    }

            
                 
                </style>

            
        </div>
           <%@ include file="../common/footer.jsp" %> 
        </body>
    </html>