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
   <body>
 <jsp:include page="../common/header.jsp"/>
<c:if test="${ empty sessionScope.loginAdminName }">
		<section id="main-content">
			<section class="wrapper">
			</section>
		</section>
</c:if>
<c:if test="${ !empty sessionScope.loginAdminName }">

            <!--main content start-->
            <section id="main-content">
                <section class="wrapper">
                    <!--overview start-->
                    <div class="row">
                        <div class="col-lg-12">
                            <h3 class="page-header">
                                <i class="fa fa-laptop"></i>
                                관리자 및 직원관리</h3>
                            
                        </div>
                    </div>
                </section>

                <!-- 백구 홈페이지 정보 시작  -->
                <div class="row">
                    <div class="col-lg-12">
                      <section class="panel">
                        <header class="panel-heading">
                          관리자 및 직원관리 상세보기
                        </header>
                        <div class="panel-body">
                          <div class="form">
                           <c:if test="${ sessionScope.adminRole eq '대표관리자' }"> 
                            <form class="form-validate form-horizontal" id="feedback_form" method="post" action="${ pageContext.servletContext.contextPath }/admin/adminid">
                              <div class="form-group ">
                                <label for="cname" class="control-label col-lg-2">이름 </label>
                                <div class="col-lg-10">
                                  <input class="form-control" id="beakname" name="name"  type="text"  value=<c:out value="${ adminDTO.adminName}"/>></input>
                                </div>
                              </div>
                              <div class="form-group ">
                                <label for="cemail" class="control-label col-lg-2">아이디</label>
                                <div class="col-lg-10">
                                  <input class="form-control " id="baekid" type="id" name="id"  value=<c:out value="${ adminDTO.adminId }"/>></input>
                                </div>
                              </div>
                              <div class="form-group ">
                                <label for="curl" class="control-label col-lg-2">비밀번호</label>
                                <div class="col-lg-10">
                                  <input class="form-control " id="beakpassword" type="password" name="password" value=<c:out value="${ adminDTO.adminPwd }"/>></input>
                                </div>
                              </div>
                              <div class="form-group ">
                                <label for="cname" class="control-label col-lg-2">이메일 </label>
                                <div class="col-lg-10">
                                  <input class="form-control" id="beakemail" name="email" type="text"  value=<c:out value="${ adminDTO.adminEmail }"/>></input>
                                </div>
                              </div>
                              <div class="form-group ">
                                <label for="ccomment" class="control-label col-lg-2">등록일</label>
                                <div class="col-lg-10">
                                  <input class="form-control " id="beakconfirm" name="confirm" value=<c:out value="${ adminDTO.adminDate }"/>></input>
                                </div>
                              </div>
                              <div class="form-group ">
                                <label for="cname" class="control-label col-lg-2">권한</label>
                                <div class="col-lg-10">
                                  <input class="form-control" id="beak" name="beakre" type="text"  value=<c:out value="${ adminDTO.adminRole }"/>></input>
                                </div>
                              </div>
                              <div class="form-group">
                                <div class="col-lg-offset-2 col-lg-10">
                                  <button class="btn btn-primary" class="btn btn-primary" type="submit">등록</button>
                                 
                                </div>
                              </div>
                            </form>
                            </c:if>
                          </div>
          
                        </div>
                      </section>
                    </div>
                  </div>   
                   <!-- 백구 홈페이지 정보 끝   -->
            </section>
            <!--main content end-->

</c:if>


 </body> </html> 