<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Creative - Bootstrap 3 Responsive Admin Template">
<meta name="author" content="GeeksLabs">
<meta name="keyword"
	content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">

<title>백구 관리자페이지</title>


<link
	href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/ADMIN/bootstrap-theme.css"
	rel="stylesheet">


<!-- owl carousel -->
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/ADMIN/owl.carousel.css"
	type="text/css">
<link
	href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/ADMIN/jquery-jvectormap-1.2.2.css"
	rel="stylesheet">
<!-- Custom styles -->
<link
	href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/ADMIN/widgets.css"
	rel="stylesheet">
<link
	href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/ADMIN/style.css"
	rel="stylesheet">
<link
	href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/ADMIN/style-responsive.css"
	rel="stylesheet" />
<link
	href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/ADMIN/jquery-ui-1.10.4.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
	<jsp:include page="../common/header.jsp" />
	
	 <!--main content start-->
            <section id="main-content">
                <section class="wrapper">
                    <!--overview start-->
                    <div class="row">
                        <div class="col-lg-12">
                            <h3 class="page-header">
                                <i class="fa fa-laptop"></i>
                                공고 심사 관리</h3>
                            
                        </div>
                    </div>
                </section>
                
                <div class="row">
                    <div class="col-lg-12">
                      <section class="panel">
                        <header class="panel-heading">
                          기업 리스트
                        </header>
                        <div class="table-responsive">
                          <table class="table">
                            <thead>
                              <tr>
                                <th><input type="checkbox" id="checkAll"></th>
                                <th>제목</th>
                                <th>회사명</th>
                                <th>신청일</th>
                                <th>모집시작일</th>
                                <th>모집마감일</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <th><input type="checkbox"></th>
                                <td><a href="PostApproveDetail.html">바리스타 구합니다</a></td>
                                <td>요앞카페</td>
                                <td>2021/05/03</td>
                                <td>2021/05/5</td>
                                <td>2021/05/15</td>
                              </tr>
                              <tr>
                                <th><input type="checkbox"></th>
                                <td><a href="">[재택근무/주5일]소형용달이사 기사배차팀 직원모집</a></td>
                                <td>우리집용달</td>
                                <td>2021/05/07</td>
                                <td>2021/05/30</td>
                                <td>2021/05/05</td>
                              </tr>
                              <tr>
                                <th><input type="checkbox"></th>
                                <td><a href="">반도체 생산직 모집공고</a></td>
                                <td>반도짱</td>
                                <td>2021/05/07</td>
                                <td>2021/05/30</td>
                                <td>2021/05/05</td>
                              </tr>
                              <tr>
                                <th><input type="checkbox"></th>
                                <td><a href="">주방업무외/월 250만원</a></td>
                                <td>박씨주방</td>
                                <td>2021/05/07</td>
                                <td>2021/05/30</td>
                                <td>2021/05/05</td>
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
                <!--하단 페이지 넘기기-->
              <a class="btn btn-success" data-toggle="modal" href="#myModal3">
                승인하기
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
	
	
</body>
</html>