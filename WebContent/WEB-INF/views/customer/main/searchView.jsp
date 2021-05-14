<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세조회</title>

<!-- Css Styles -->
<link rel="stylesheet" href="RESOURCES/CSS/CUSTOMER/YJCSS/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="RESOURCES/CSS/CUSTOMER/YJCSS/style.css" type="text/css">

</head>

<body>
    <header>
        <%@ include file="../common/header2.jsp" %>
    </header>

   <section class="product-details" style="margin-top: 10%;">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6">
                    <div><img src="RESOURCES/IMAGES/product-details-1.jpg"></div>
            </div>

               <div class="col-lg-6 col-md-6">
                    <div class="product__details__text ">
                        <h1>홀서빙 구합니다</h1>
                        <hr>
                        <div class="company__title" style="font-size: 40px;">김씨네 식당</div>
                        <p style="font-size:20px; width: 800px;">

                            3시간 일하면 500만원 주는 회사 들어가고싶다.... 이 일에 대한 사장님의 간단 설명이 들어가는 곳
                            이게어디까지길어지냐아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ

                            </p>
                            <div align="right">
                                <button class="jione_button" onclick=apply();>
                                    <script>
                                        function apply(){
                                            
                                            //로그인 회원일 경우 바로 지원하기로 넘어간다
                                            window.open("apply.jsp", "a", "width=400, height=500, left=500, top=250");
                                            //비회원일 경우 로그인하라는 페이지를 띄운다
                                            // window.open("login_plz.jsp", "a", "width=600, height=300, left=500, top=250");
                                        }
                                    </script>
                                    <h2>지원하기</h2>
                                </button>
                            </div>
                            
                            <ul>
                                <li style="font-size: 25px;">
                                    <b>지원자격</b>
                                    <span>60세 이하</span>
                                </li>
                                <br>
                                    <li style="font-size: 25px;">
                                        <b>급여</b>
                                        <span>5000000원<samp>(월급)</samp>
                                        </span>
                                    </li>
                                    <br>
                                        <li style="font-size: 25px;">
                                            <b>근무기간</b>
                                            <span>1개월 이상</span>
                                        </li>
                                        <br>
                                            <li style="font-size: 25px;">
                                                <b>근무시간</b>
                                                <span>10시~1시</span>
                                            </li>
                                        
                                        <br>
                                            <li style="font-size: 25px;">
                                                <b>근무지역</b>
                                                <span>강남구</span>
                                            </li>
                                        
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="col-lg-12">
                                    <div class="product__details__text">
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                                <div class="tab-pane active" id="tabs-2" role="tabpanel">
                                                    <div class="product__details__tab__desc" style="margin-bottom: 50px; margin-top: 100px;">
                                                            <h2 align="center">상세 근무 지역</h2>
                                                        <div>
                                                            <ul style="margin-top: 20px; margin-bottom: 50px;">
                                                                <li style="font-size: 30px;">
                                                                    <b>근무지역</b>서울특별시 어쩌구 저쩌동 상세로 270 1층</li>
                                                           		 
                                                        </ul>
                                                    </div>
                                                    <div id="map" style="width:500px;height:400px;"></div>
                                                    <script
                                                        type="text/javascript"
                                                        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=65305e0eba5c1c2d79790d8038140b78"></script>
                                                    <script>
                                                        var container = document.getElementById('map');
                                                        var options = {
                                                            center: new kakao
                                                                .maps
                                                                .LatLng(33.450701, 126.570667),
                                                            level: 3
                                                        };

                                                        var map = new kakao
                                                            .maps
                                                            .Map(container, options);
                                                    </script>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="product__details__text">
                                <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                    <div class="product__details__tab__desc" >
                                        <h2 align="center">모집부분</h2>
                                        <br>
                                            <table class="table" style="text-align: center;">
                                                <thead>
                                                    <tr style="font-size: 25px;">
                                                        <th scope="col">모집분야</th>
                                                        <th scope="col">담당업무 및 자격요건</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr style="font-size: 20px;">
                                                        <th scope="row">일반음식점</th>
                                                        <th>
                                                            <ul
                                                                style="margin-top: 0px; border: 0px; padding: 0px; text-align: left; margin-left:370px;">
                                                                <li style="font-size: 20px;">
                                                                    <b>담당업무
                                                                    </b>
                                                                    <span>서빙</span>
                                                                </li>
                                                                <br>
                                                                    <li style="font-size: 20px;">
                                                                        <b>자격요건
                                                                        </b>
                                                                        <span>60세 이하</span>
                                                                    </li>
                                                                    <br>
                                                                    </ul>
                                                                </th>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <div id="tabs-2">
                                                <div class="product__details__tab__desc" align="center">
                                                    <div style="height: 550px;">
                                                        <div>
                                                            <h2>근무조건 및 급여</h2>
                                                            <hr>
                                                                <div id="working">
                                                                        <div>
                                                                            <div
                                                                            style="width:250px; height: 36px; float:left; margin-left: 350px; margin-bottom: 20px;">
                                                                            <b style="font-size: 30px;">근무유형</b>
                                                                        </div>
                                                                        <span style="float:left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">시간제</span>
                                                                    <div
                                                                        style="width:250px; height: 36px; float:left; margin-left: 350px; margin-bottom: 20px;">
                                                                        <b style="font-size: 30px;">근무기간</b>
                                                                    </div>
                                                                    <span style="float:left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">1개월 이상</span>

                                                                    <div
                                                                        style="width:250px; height: 36px; float:left; margin-left: 350px; margin-bottom: 20px;">
                                                                        <b style="font-size: 30px;">근무시간</b>
                                                                    </div>
                                                                    <span style="float:left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">10:00 ~ 1:00</span>

                                                                    <div
                                                                        style="width:250px; height: 36px; float:left; margin-left: 350px; margin-bottom: 20px;">
                                                                        <b style="font-size: 30px;">복리후생</b>
                                                                    </div>
                                                                    <span style="float:left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">건강보험</span>

                                                                    <div
                                                                        style="width:250px; height: 36px; float:left; margin-left: 350px; margin-bottom: 20px;">
                                                                        <b style="font-size: 30px;">급여형태</b>
                                                                    </div>
                                                                    <span style="float:left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">월급</span>

                                                                    <div
                                                                        style="width:250px; height: 36px; float:left; margin-left: 350px; margin-bottom: 20px; margin-bottom: 20px;">
                                                                        <b style="font-size: 30px; ">급여</b>
                                                                    </div>
                                                                    <span style="float:left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">5000000원</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div id="tabs-2">
                                                    <div id="detail_tab_2" style="height: 550px;" align="center">
                                                        <div>
                                                            <h2>지원조건</h2>
                                                            <hr>
                                                                <div id="working">
                                                                    <div style="width:250px; height: 36px; float:left; margin-left: 350px; margin-bottom: 20px;">
                                                                        <b style="font-size: 30px;">성별</b>
                                                                    </div>
                                                                    <span style="float:left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">성별무관</span>

                                                                    <div style="width:250px; height: 36px; float:left; margin-left: 350px; margin-bottom: 20px;">
                                                                        <b style="font-size: 30px;">연령</b>
                                                                    </div>
                                                                    <span style="float:left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">50세 이상 ~ 60세 이하</span>

                                                                    <div style="width:250px; height: 36px; float:left; margin-left: 350px; margin-bottom: 20px;">
                                                                        <b style="font-size: 30px;">학력</b>
                                                                    </div>
                                                                    <span style="float:left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">학력무관</span>

                                                                    <div style="width:250px; height: 36px; float:left; margin-left: 350px; margin-bottom: 20px;">
                                                                        <b style="font-size: 30px;">경력</b>
                                                                    </div>
                                                                    <span style="float:left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">경력무관</span>

                                                                    <div style="width:250px; height: 36px; float:left; margin-left: 350px; margin-bottom: 20px;">
                                                                        <b style="font-size: 30px;">우대조건</b>
                                                                    </div>
                                                                    <span style="float:left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">유사업무 경험, 인근거주</span>

                                                                    <div style="width:250px; height: 36px; float:left; margin-left: 350px; margin-bottom: 20px;">
                                                                        <b style="font-size: 30px;">급여</b>
                                                                    </div>
                                                                    <span style="float:left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">5000000원</span>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="tab-pane active" id="tabs-2" role="tabpanel">
                                                        <div
                                                            class="product__details__tab__desc"
                                                            align="center"
                                                            style="margin-bottom: 100px;">
                                                            <div style="height: 400px;">
                                                                <div>
                                                                    <h2>접수방법</h2>
                                                                    <hr>
                                                                        <div id="how">
                                                                            <div style="width:250px; height: 36px; float:left; margin-left: 350px; margin-bottom: 20px;">
                                                                                <b style="font-size: 30px;">접수종류</b>
                                                                            </div>
                                                                            <span style="float:left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">온라인지원, 전화지원</span>

                                                                            <div style="width:250px; height: 36px; float:left; margin-left: 350px; margin-bottom: 20px;">
                                                                                <b style="font-size: 30px;">연락처</b>
                                                                            </div>
                                                                            <span style="float:left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">010-1xxx-2xxx</span>

                                                                            <div style="width:250px; height: 36px; float:left; margin-left: 350px; margin-bottom: 20px;">
                                                                                <b style="font-size: 30px;">연락 가능 시간</b>
                                                                            </div>
                                                                            <span style="float:left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">오후 9시까지</span>

                                                                            <div style="width:250px; height: 36px; float:left; margin-left: 350px; margin-bottom: 20px;">
                                                                                <b style="font-size: 30px;">채용 담당자</b>
                                                                            </div>
                                                                            <span style="float:left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">유승제</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div style="width: 100%; height: 120px; border: 1px solid grey; margin-top: 30px;">
                                                                    <p align="center" style="font-size: 30px; line-height: 38px; margin-top: 25px;">
                                                                        전화 문의 시, <b>'백구에서 채용정보 보고 전화 드렸습니다.'</b><br>
                                                                            라고 하시면 빠른 문의가 가능합니다.
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                                <h1 style="color: orangered; text-align: center; margin-bottom: 20px;">잠깐!!!</h1>
                                                                <div style="margin-bottom: 80px; height: 100%;">
                                                                    <div>
                                                                        
                                                                        <p style="font-size: 35px; text-align: center;">
                                                                            혹시 임금체불사업주 목록! 확인해보셨나요?<br>
                                                                            <h2 style="text-align: center;"><a href="https://www.moel.go.kr/info/defaulter/defaulterList.do" target="_blank" style="color: black;">목록보기</a></h2>
                                                                        </p>
                                                                    </div>
                                                                    <br>
                                                                    <div align="center">
                                                                        <p style="font-size: 25px; text-align: center;">
                                                                            혹시 이 공고가 수상한가요?
                                                                            <h2><a href="" style="color: red;">신고하기</a></h2>
                                                                        </p>
                                                                    </div>
                                                                    
                                                                </div>
                                                            </div>
                                                            <div >
                                                                <div class="section-title related__product__title">
                                                                    <h2>채용기업 정보</h2>
                                                                </div>
                                                                <div class="product__details__tab__desc" style="margin-bottom: 50px;">
                                                                    <div>
                                                                        <ul style="margin-top: 20px; margin-bottom: 50px;">
                                                                            <li style="font-size: 20px;">
                                                                                <b>회사명</b>김씨네 식당</li>
                                                                            <li style="font-size: 20px;">
                                                                                <b>대표자</b>차지민</li>
                                                                            <li style="font-size: 20px;">
                                                                                <b>회사주소</b>서울특별시 어쩌구 저쩌동 상세로 270 1층</li>
                                                                            <li style="font-size: 20px;">
                                                                                <b>사업내용</b>한식</li>
                                                                                <li style="font-size: 20px;">
                                                                                    <b>연매출액</b>(빈칸가능)</li>    
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="tab-pane active" id="tabs-2" role="tabpanel">

                                                                <div class="section-title related__product__title">
                                                                    <h2>이 공고는...
                                                                    </h2>
                                                                </div>
                                                                <div class="product__details__tab__desc">
                                                                    <div
                                                                        style="height: 120px; border: 2px solid lightgray; margin-bottom: 80px;"
                                                                        align="center">
                                                                        <p style="font-size: 18px; margin-top: 40px;">

                                                                            본 구인정보는 게시자가 제공한 자료이며, 백구는 기재된 내용에 대한 오류와 지연에 사용자가 이를 신뢰하여 취한 조치에 대해 책임을지지 않습니다.<br>
                                                                                본 정보의 저작권은 백구에 있으며, 동의없이 무단게제 및 재배포 할 수 없습니다.
                                                                        </p>
                                                                        
                                                                        </div>
                                                                    </div>

                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
												</div>
											</div>
										
    </section>
     <%@ include file="../common/footer.jsp" %> 
</body>

</html>