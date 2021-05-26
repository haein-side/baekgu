<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ page import="com.baekgu.silvertown.admin.model.dto.*"%> --%>
<%-- <%@ page import="java.util.*"%> --%>

<!DOCTYPE html>
<html lang="en">

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
    
    
    <link href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/ADMIN/bootstrap-theme.css" rel="stylesheet">
    
     
    <!-- owl carousel -->
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/ADMIN/owl.carousel.css" type="text/css">
    <link href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/ADMIN/jquery-jvectormap-1.2.2.css" rel="stylesheet">
    <!-- Custom styles -->
    <link href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/ADMIN/widgets.css" rel="stylesheet">
    <link href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/ADMIN/style.css" rel="stylesheet">
    <link href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/ADMIN/style-responsive.css" rel="stylesheet"/>
    <link href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/ADMIN/jquery-ui-1.10.4.min.css" rel="stylesheet">
<%--           <%
          	
          BaekguDTO baekgudto = new BaekguDTO();
          
          
           
          String baekguName = baekgudto.getBaekguName();
          String baekguPhone = baekgudto.getBaekguPhone();
          String fax = baekgudto.getFax();
          String addresss = baekgudto.getBaekguAdd();
          String baekguNum = baekgudto.getBaekguNum();
          String ownerName = baekgudto.getOwnerName();
          
          System.out.println("회사명 : " + baekguName);
          
          %>
	 --%>
<body>
<c:if test="${ !empty sessionScope.loginAdminName }">
            <section id="main-content">
                <section class="wrapper">
                    <!--overview start-->
                    <div class="row">
                        <div class="col-lg-12">
                            <h3 class="page-header">
                                <i class="fa fa-laptop"></i>
                                로그인을 먼저 해주세요</h3>
                            
                        </div>
                    </div>
                </section>

	</c:if>
	<jsp:include page="../common/header.jsp"/>
     

<c:if test="${ !empty sessionScope.loginAdminName }">
            <!--main content start-->
            <section id="main-content">
                <section class="wrapper">
                    <!--overview start-->
                    <div class="row">
                        <div class="col-lg-12">
                            <h3 class="page-header">
                                <i class="fa fa-laptop"></i>
                                백구 홈페이지 정보</h3>
                            
                        </div>
                    </div>
                </section>
                <!-- 백구 홈페이지 정보 시작  -->
                <div class="row">
                    <div class="col-lg-12">
                      <section class="panel">
                        <header class="panel-heading">
                          백구 홈페이지 정보
                        </header>
                        <div class="panel-body">
                          <div class="form">
                            <form class="form-validate form-horizontal" id="feedback_form" method="get" action="">
                              <div class="form-group ">
                                <label for="cname" class="control-label col-lg-2">회사명</label>
                                <div class="col-lg-10">
                                  <td><p>백구</p></td>
                                </div>
                              </div>
                              <div class="form-group ">
                                <label for="cemail" class="control-label col-lg-2">회사 전화번호</label>
                                <div class="col-lg-10">
                                  <td>02-109-1009</td>
                                </div>
                              </div>
                              <div class="form-group ">
                                <label for="curl" class="control-label col-lg-2">회사 팩스번호</label>
                                <div class="col-lg-10">
                                  <td>021-6000-1314</td>
                                </div>
                              </div>
                              <div class="form-group ">
                                <label for="cname" class="control-label col-lg-2">회사주소 </label>
                                <div class="col-lg-10">
                                  <td>서울시 강남구 실버타운 1204호</td>
                                </div>
                              </div>
                              <div class="form-group ">
                                <label for="ccomment" class="control-label col-lg-2">사업자 등록번호</label>
                                <div class="col-lg-10">
                                  <td>1237-121-146545 </td>
                                </div>
                              </div>
                              <div class="form-group ">
                                <label for="cname" class="control-label col-lg-2">대표자명</label>
                                <div class="col-lg-10">
                                  <td>황백구</td>
                                </div>
                              </div>
                             <%--  <!-- 관리자인 경우에만 수정 버튼이 보인다 -->
                              <c:if test="${ sessionScope.loginAdmin.adminRole eq '대표관리자' }">
                              <div class="form-group">
                               <div class="col-lg-offset-2 col-lg-10">
                               <button class="btn btn-primary" type="button" name=btn id=btn onclick="location='homedetail'">
                                  수정 
                               </button>
                               </c:if> --%>
                                </div>
                              </div>
                            </form>
                          </div>
          
                        </div>
                      </section>
                    </div>
                  </div>   
                   <!-- 백구 홈페이지 정보 끝   -->
            </section>
</c:if>
        
            <!--main content end-->


</body> </html> 