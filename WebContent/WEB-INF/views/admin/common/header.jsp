<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
        
        <link href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/ADMIN/bootstrap-theme.css" rel="stylesheet">

 
        <!-- owl carousel -->
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/ADMIN/owl.carousel.css" type="text/css">
        <link href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/ADMIN/jquery-jvectormap-1.2.2.css" rel="stylesheet">
        <!-- Custom styles -->
        <link href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/ADMIN/widgets.css" rel="stylesheet">
        <link href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/ADMIN/style.css" rel="stylesheet">
        <link href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/ADMIN/style-responsive.css" rel="stylesheet"/>
        <link href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/ADMIN/jquery-ui-1.10.4.min.css" rel="stylesheet">

</head>
<body>
	        <!-- container section start -->
        <section id="container" class="">

          <!-- 맨 위 다크 헤더 (백구 관리자 있는 곳) -->
            <header class="header dark-bg">
                <div class="toggle-nav">
                    <div
                        class="icon-reorder tooltips"
                        data-original-title="Toggle Navigation"
                        data-placement="bottom">
                        <i class="icon_menu"></i>
                    </div>
                </div>

                <!--logo start-->
                <a href="${ pageContext.servletContext.contextPath }/admin/main" class="logo">백구
                    <span class="lite">관리자</span></a>
                <!--logo end-->

                  <!-- 사용자 프로필 -->
  
                <%-- <h4 align="right" style="margin-top: 1%;">관리자 : <c:out value="${ sessionScope.loginAdmin.adminName }"/></h4> --%>
                <h4 align="right" style="margin-top: 1%;">관리자 : <c:out value="${ sessionScope.loginAdminName }"/></h4>
            </header>
            <!--header end-->

            <!--sidebar start-->
            <aside>
                <div id="sidebar" class="nav-collapse ">
                    <!-- sidebar menu start-->
                    <ul class="sidebar-menu">
                        <li class="active">
                            <a class="" href="${ pageContext.servletContext.contextPath }/admin/main">
                                <i class="icon_house_alt"></i>
                                <span>Dashboard</span>
                            </a>
                        </li>
                          <li class="active">
                            <a class="" href="${ pageContext.servletContext.contextPath }/admin/homepage">
                                <i class="icon_house_alt"></i>
                                <span>홈페이지 정보</span>
                            </a>
                        </li>
                        <li class="active">
                            <a class="" href="${ pageContext.servletContext.contextPath }/admin/search">
                                <i class="icon_house_alt"></i>
                                <span>관리자 및 직원관리</span>
                            </a>
                        </li>
                        <li class="active">
                            <a class="" href="${ pageContext.servletContext.contextPath }/admin/memberList">
                                <i class="icon_house_alt"></i>
                                <span>회원 정보</span>
                            </a>
                        </li>
                         <li class="active">
                            <a class="" href="${ pageContext.servletContext.contextPath }/admin/manager">
                                <i class="icon_house_alt"></i>
                                <span>기업 정보</span>
                            </a>
                        </li>
                        <li class="active">
                            <a class="" href="${ pageContext.servletContext.contextPath }/admin/manager">
                                <i class="icon_house_alt"></i>
                                <span>공고심사관리</span>
                            </a>
                        </li>
                        <li class="active">
                            <a class="" href="${ pageContext.servletContext.contextPath }/admin/manager">
                                <i class="icon_house_alt"></i>
                                <span>공고관리</span>
                            </a>
                        </li>
                        <li class="active">
                            <a class="" href="${ pageContext.servletContext.contextPath }/admin/manager">
                                <i class="icon_house_alt"></i>
                                <span>가입승인</span>
                            </a>
                        </li>
                        <li class="active">
                            <a class="" href="${ pageContext.servletContext.contextPath }/admin/advertlist">
                                <i class="icon_house_alt"></i>
                                <span>광고상품관리</span>
                            </a>
                        </li>
                        <li class="active">
                            <a class="" href="${ pageContext.servletContext.contextPath }/admin/reportlist">
                                <i class="icon_house_alt"></i>
                                <span>신고관리</span>
                            </a>
                        </li>
                        <li class="active">
                            <a class="" href="${ pageContext.servletContext.contextPath }/admin/manager">
                                <i class="icon_house_alt"></i>
                                <span>재무관리</span>
                            </a>
                        </li>
                     </ul>
                    <!-- sidebar menu end-->
                </div>
            </aside>
            <!--sidebar end-->
</body>
</html>