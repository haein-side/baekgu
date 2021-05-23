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
                                기업 차단하기
                            </a>
                        </div>   
                      </section>
                      <div class="table-responsive">
                        <!--
                           구상:한 공고를 재등록이 가능하여 하나의 공고에 여러 광고가 붙을 수 있으니 이력을 페이징 처리한다
                                한 페이지당 10개의 리스트를 보여주며 버튼 수는 5개씩으로 지정한다.
                        -->
                        <table class="table">
                          <thead>
                            <tr>
                              <th>사용광고</th>
                              <th>결제번호</th>
                              <th>결제일시</th>
                              <th>서비스 시작일</th>
                              <th>서비스 만료일</th>
                              <th>사용상태</th>
                              <th>결제수단</th>
                              <th>결제상태</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td>광고상단 A</td>
                              <td>3131310</td>
                              <td>2021-04-05</td>
                              <td>2021-04-06</td>
                              <td>2021-05-06</td>
                              <td>사용만료</td>
                              <td>신용카드</td>
                              <td>승인완료</td>
                            </tr>
                            <tr>
                              <td>광고상단 A, 프리미엄 이모티콘 A, 광고 반짝임A, 프리미엄 상단배치 A</td>
                              <td>3131313</td>
                              <td>2021-05-05</td>
                              <td>2021-05-06</td>
                              <td>2021-06-06</td>
                              <td>취소</td>
                              <td>신용카드</td>
                              <td>승인취소</td>
                            </tr>
                            <tr>
                              <td>프리미엄 이모티콘 A, 광고 반짝임A</td>
                              <td>3131312</td>
                              <td>2021-05-05</td>
                              <td>2021-05-06</td>
                              <td>2021-06-06</td>
                              <td>사용중</td>
                              <td>신용카드</td>
                              <td>승인완료</td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                  </div>
                </div>
                </div>
              </section>
  			</section>
          <!-- page end-->


 </body> 
</html> 