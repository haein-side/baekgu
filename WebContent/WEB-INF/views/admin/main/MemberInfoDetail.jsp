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
  <body>
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
                        회원정보
                      </a>
                    </li>
                    </li>
                  </ul>
                </header>
               
                    <!-- 고객정보 -->
                    <div id="profile" class="tab-pane">
                      <section class="panel">
                        <div class="panel-body bio-graph-info">
                            <h2>개인정보</h2>
                          <div class="row">
                            <div class="bio-row" style="margin-top: 50px;">
                              <p><span>고객코드 </span>: 1 </p>
                            </div>
                            <div class="bio-row" style="margin-top: 50px;">
                              <p><span>이름 </span>: 김홍길</p>
                            </div>
                            <div class="bio-row">
                              <p><span>전화번호</span>: 010-1234-2222</p>
                            </div>
                            <div class="bio-row">
                              <p><span>생년월일 </span>: 1965/11/11</p>
                            </div>
                            <div class="bio-row">
                              <p><span>성별 </span>: 남</p>
                            </div>
                            <div class="bio-row">
                              <p><span>주소 </span>: 서울특별시 어쩌구 저쩌동</p>
                            </div>
                            <div class="bio-row">
                              <p><span>차단여부 </span>: Y</p>
                            </div>
                            <div class="bio-row">
                              <p><span>차단코드 </span>: R1</p>
                            </div>
                            <div class="bio-row">
                                <p><span>관리자명 </span>: 김사원</p>
                              </div>
                        </div>
                      </section>
                    </div>
                    <!-- 이력서정보 -->
                    <div id="profile" class="tab-pane">
                        <section class="panel">
                            <div class="panel-body bio-graph-info">
                              <h2>이력서 </h2>
                            <div class="row">
                              <div class="bio-row" style="margin-top: 50px;">
                                <p><span>이력서코드 </span>: 1 </p>
                              </div>
                              <div class="bio-row" style="margin-top: 50px;">
                                <p><span>비상연락망 </span>: </p>
                              </div>
                              <div class="bio-row">
                                <p><span>자기소개 : </span>
                                    안녕하세요 저는 김홍길입니다. 제 주특기는 밥먹기입니다.
                                    뽑아주신다면 열심히 하겠습니다. 
                                    커피를 좋아해서 이 일을 지원하게 됐습니다. 열심히 하겠습니다.
                                </p>
                              </div>
                              <div class="bio-row">
                                <p><span>우대조건 </span>: 자차 출퇴 가능 </p>
                              </div>
                          </div>
                          <a class="btn btn-danger" href="#">
                            사용자 차단하기
                          </a>
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