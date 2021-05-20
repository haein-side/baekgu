<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta
            name="description"
            content="Creative - Bootstrap 3 Responsive Admin Template">
        <meta name="author" content="GeeksLabs">
        <meta
            name="keyword"
            content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">

        <title>백구 관리자페이지</title>

        
        <link href="RESOURCES/CSS/ADMIN/bootstrap-theme.css" rel="stylesheet">

 
        <!-- owl carousel -->
        <link rel="stylesheet" href="RESOURCES/CSS/ADMIN/owl.carousel.css" type="text/css">
        <link href="RESOURCES/CSS/ADMIN/jquery-jvectormap-1.2.2.css" rel="stylesheet">
        <!-- Custom styles -->
        <link href="RESOURCES/CSS/ADMIN/widgets.css" rel="stylesheet">
        <link href="RESOURCES/CSS/ADMIN/style.css" rel="stylesheet">
        <link href="RESOURCES/CSS/ADMIN/style-responsive.css" rel="stylesheet"/>
        <link href="RESOURCES/CSS/ADMIN/jquery-ui-1.10.4.min.css" rel="stylesheet">
        <!-- ======================================================= Theme Name:
        NiceAdmin Theme URL:
        https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ Author:
        BootstrapMade Author URL: https://bootstrapmade.com
        ======================================================= -->
    </head>
    <body style="overflow-x:hidden">
  <jsp:include page="../common/header.jsp"/>
               <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
         
          <!-- page start-->
          <div class="row">
            <div class="col-lg-12">
              <section class="panel">
                <header class="panel-heading tab-bg-info">
                  <ul class="nav nav-tabs">
                    <li class="active">
                      <a data-toggle="tab">
                       <i class="icon-home"></i>
                        공고정보
                      </a>
                    </li>
                    </li>
                  </ul>
                </header>
               
                    <!-- 공고정보 -->
                    <div id="profile" class="tab-pane">
                      <section class="panel">
                        <div class="panel-body bio-graph-info">
                            <h2>공고정보</h2>
                          <div class="row">
                            <div class="bio-row" style="margin-top: 50px;">
                              <p><span>공고코드 </span>: 1 </p>
                            </div>
                            <div class="bio-row" style="margin-top: 50px;">
                              <p><span>제목 </span>: [주5일]홀서빙 모집하고 있습니다</p>
                            </div>
                            <div class="bio-row">
                              <p><span>근무지역</span>: 서울특별시 어쩌구 저쩌동</p>
                            </div>
                            <div class="bio-row">
                              <p><span>모집인원 </span>: 0명</p>
                            </div>
                            <div class="bio-row">
                              <p><span>모집시작일 </span>: 21/05/05</p>
                            </div>
                            <div class="bio-row">
                              <p><span>온라인접수여부 </span>: Y</p>
                            </div>
                            <div class="bio-row">
                              <p><span>급여 </span>: 3000000원</p>
                            </div>
                            <div class="bio-row">
                              <p><span>성별 </span>: 누구나</p>
                            </div>
                            <div class="bio-row">
                                <p><span>우대조건 </span>: 노예우대</p>
                            </div>
                            <div class="bio-row">
                                <p><span>복리후생 </span>: 퇴직금</p>
                            </div>
                            <div class="bio-row">
                                <p><span>정규직여부 </span>: Y</p>
                            </div>
                            <div class="bio-row">
                                <p><span>경력기간 </span>: 경력무관</p>
                            </div>
                            <div class="bio-row">
                                <p><span>직종 </span>: 서빙</p>
                            </div>
                            <div class="bio-row">
                                <p><span>업종 </span>: 서비스업</p>
                            </div>
                            <div class="bio-row">
                                <p><span>근무기간 </span>: 3개월이상</p>
                            </div>
                            <div class="bio-row">
                                <p><span>근무시간 </span>: 10시~1시</p>
                            </div>
                            <div class="bio-row">
                                <p><span>급여형태 </span>: 월급</p>
                            </div>
                            <div class="bio-row">
                                <p><span>경력기간 </span>: 경력무관</p>
                            </div>
                            <a class="btn btn-danger" href="#">
                                공고 차단하기
                            </a>
                        </div>   
                      </section>
                      <div id="profile" class="tab-pane">
                        <section class="panel">
                            <div class="panel-body bio-graph-info">
                              <h2>사용 광고 </h2>
                            <div class="row">
                              <div class="bio-row" style="margin-top: 50px;">
                                <p><span>결제번호 </span>: 3131312</p>
                              </div>
                              <div class="bio-row" style="margin-top: 50px;">
                                <p><span>결제일시 </span>: 2021-05-05 13:11</p>
                              </div>
                              <div class="bio-row">
                                <p><span>이용상품 </span>: 광고상단 A, 프리미엄 이모티콘 A, 광고 반짝임A, 프리미엄 상단배치 A</p>
                              </div>
                              <div class="bio-row">
                                <p><span>서비스 시작일 </span>: 2021-05-06 00:00 </p>
                              </div>
                              <div class="bio-row">
                                <p><span>총 금액 </span>: 1600000원 </p>
                              </div>
                              <div class="bio-row">
                                <p><span>서비스 만료일 </span>: 2021-06-06 00:00 </p>
                              </div>
                              <div class="bio-row">
                                <p><span>결제수단 </span>: 신용카드 </p>
                              </div>
                          </div>
                        </section>
                    </div>
                  </div>
                </div>
              </section>
            </div>
          </div>
  
          <!-- page end-->
        </section>
      </section>


        <!-- javascripts -->
        <script src="RESOURCES/JS/ADMIN/jquery.js"></script>
        <script src="RESOURCES/JS/ADMIN/jquery-ui-1.10.4.min.js"></script>
        <script src="RESOURCES/JS/ADMIN/jquery-1.8.3.min.js"></script>
        <script type="text/javascript" src="RESOURCES/JS/ADMIN/jquery-ui-1.9.2.custom.min.js"></script>
        <!-- bootstrap -->
        <script src="RESOURCES/JS/ADMIN/bootstrap.min.js"></script>
        <!-- nice scroll -->
        <script src="RESOURCES/JS/ADMIN/jquery.scrollTo.min.js"></script>
        <script src="RESOURCES/JS/ADMIN/jquery.nicescroll.js" type="text/javascript"></script>
        <!-- charts scripts -->
        <script src="RESOURCES/JS/ADMIN/jquery.sparkline.js" type="text/javascript"></script>
        <script src="RESOURCES/JS/ADMIN/owl.carousel.js"></script>
        <!-- jQuery full calendar -->
        <script src="RESOURCES/JS/ADMIN/fullcalendar.min.js"></script> <!-- Full Google Calendar -
        Calendar --> 
        <script src="RESOURCES/JS/ADMIN/jquery.rateit.min.js"></script> 
        <!-- custom select --> 
        <script src="RESOURCES/JS/ADMIN/jquery.customSelect.min.js"></script>
        <script src="RESOURCES/JS/ADMIN/scripts.js"></script> <!-- custom script for this page-->
        <script src="RESOURCES/JS/ADMIN/sparkline-chart.js"></script> 
        <script src="RESOURCES/JS/ADMIN/easy-pie-chart.js"></script> 
        <script src="RESOURCES/JS/ADMIN/jquery-jvectormap-1.2.2.min.js"></script> 
        <script src="RESOURCES/JS/ADMIN/jquery-jvectormap-world-mill-en.js"></script> 
        <script src="RESOURCES/JS/ADMIN/jquery.autosize.min.js"></script> <script
        src="RESOURCES/JS/ADMIN/jquery.placeholder.min.js"></script> <script
        src="RESOURCES/JS/ADMIN/gdp-data.js"></script> <script src="RESOURCES/JS/ADMIN/morris.min.js"></script> <script
        src="RESOURCES/JS/ADMIN/sparklines.js"></script> <script src="RESOURCES/JS/ADMIN/charts.js"></script> <script
        src="RESOURCES/JS/ADMIN/jquery.slimscroll.min.js"></script> <script> //knob $(function() {
        $(".knob").knob({ 'draw': function() { $(this.i).val(this.cv + '%') } }) });
        //carousel $(document).ready(function() { $("#owl-slider").owlCarousel({
        navigation: true, slideSpeed: 300, paginationSpeed: 400, singleItem: true });
        }); //custom select box $(function() { $('select.styled').customSelect(); }); /*
        ---------- Map ---------- */ $(function() { $('#map').vectorMap({ map:
        'world_mill_en', series: { regions: [{ values: gdpData, scale: ['#000', '#000'],
        normalizeFunction: 'polynomial' }] }, backgroundColor: '#eef3f7', onLabelShow:
        function(e, el, code) { el.html(el.html() + ' (GDP - ' + gdpData[code] + ')'); }
        }); }); </script> </body> </html> 