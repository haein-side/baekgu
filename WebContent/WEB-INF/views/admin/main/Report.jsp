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
                    <!--overview start-->
                    <div class="row">
                        <div class="col-lg-12">
                            <h3 class="page-header">
                                <i class="fa fa-laptop"></i>
                                신고관리</h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                          <section class="panel">
                            <header class="panel-heading">
                              신고 리스트
                              <a class="btn btn-success" data-toggle="modal" href="#myModal" style="margin-left: 30px;">
                                미차단 모아보기
                            </a>
                            <a class="btn btn-info" data-toggle="modal" href="#myModal" style="margin-left: 30px;">
                                확인완료 모아보기
                            </a>
                            <a class="btn btn-warning" data-toggle="modal" href="#myModal" style="margin-left: 30px;">
                                미확인 모아보기
                            </a>
                            </header>
                            <div class="table-responsive">
                              <table class="table">
                                <thead>
                                  <tr>
                                    <th><input type="checkbox" id="checkAll"></th>
                                    <th>신고명</th>
                                    <th>신고대상</th>
                                    <th>신고 접수 날짜</th>
                                    <th>신고자</th>
                                    <th>차단상태</th>
                                    <th>확인상태</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <tr>
                                    <th><input type="checkbox"></th>
                                    <td>스팸 이력서 신고합니다</td>
                                    <td><a href="MemberInfoDetail.html">김홍길</a></td>
                                    <td>2021-05-05</td>
                                    <td>kimcine</td>
                                    <td>Y</td>
                                    <td>Y</td>
                                  </tr>
                                  <tr>
                                    <th><input type="checkbox"></th>
                                    <td>수상한 공고 게시글 신고합니다</td>
                                    <td><a href="CompanyInfoDetail.html">김씨네 식당</a></td>
                                    <td>2021-05-05</td>
                                    <td>백다봥</td>
                                    <td>N</td>
                                    <td>Y</td>
                                  </tr>
                                </tbody>
                              </table>
                            </div>
    
                    <!--하단 페이지 넘기기-->
                    <section class="panel">
                    <div class="panel-body">
                      <div class="text-center">
                        <ul class="pagination">
                          <li><a href="#">«</a></li>
                          <li><a href="#">1</a></li>
                          <li><a href="#">2</a></li>
                          <li><a href="#">3</a></li>
                          <li><a href="#">4</a></li>
                          <li><a href="#">5</a></li>
                          <li><a href="#">»</a></li>
                        </ul>
                      </div>
                      <a class="btn btn-success btn-lg" href="" title="Bootstrap 3 themes generator">
                        확인완료
                      </a>
                       <!--  search form start -->
                        <ul class="nav top-menu" style="float: right;">
                            <li>
                            <form class="navbar-form">
                                <input class="form-control" placeholder="Search" type="text">
                                <button type="submit" class="btn btn-primary">검색하기</button>
                            </form>
                            </li>
                        </ul>
                        <!--  search form end -->
                </section>
            <!--main content end-->
        </section>
        <!-- container section start -->


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