+<%@ page language="java" contentType="text/html; charset=UTF-8"
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
                        기업정보
                      </a>
                    </li>
                  </ul>
                </header>
               
                    <!-- 기업정보 -->
                    <div id="profile" class="tab-pane">
                      <section class="panel">
                        <div class="panel-body bio-graph-info">
                            <h2>기업</h2>
                          <div class="row">
                            <div class="bio-row" style="margin-top: 50px;">
                              <p><span>기업코드 :</span>
							  <c:out value="${requestScope.bJoinDTO.bCode }"/>	                              
                              </p>
                            </div>
                            <div class="bio-row" style="margin-top: 50px;">
                              <p><span>회사명 :</span> 
                              <c:out value="${requestScope.bJoinDTO.bName }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p><span>대표자명 :</span>
                              <c:out value="${requestScope.bJoinDTO.bOwner }"/>
                              </p>
                            </div>
                            <div class="bio-row" >
                              <p><span>사업자등록번호 :</span>
                              <c:out value="${requestScope.bJoinDTO.bNumber }"/> 
                              </p>
                            </div>
                            <div class="bio-row">
                              <p><span>회사주소 :</span>
                              <c:out value="${requestScope.bJoinDTO.bAddress }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p><span>회사번호 :</span>
                              <c:out value="${requestScope.bJoinDTO.bPhone }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p><span>회사연매출액 :</span>
                              <c:out value="${requestScope.bJoinDTO.bProfit }"/>
                              </p>
                            </div>
                        </div>
                      </section>
                    </div>
                    <!-- 기업정보 -->
                    <div id="profile" class="tab-pane">
                        <section class="panel">
                            <div class="panel-body bio-graph-info">
                              <h2>담당자 </h2>
                            <div class="row">
                              <div class="bio-row" style="margin-top: 50px;">
                                <p><span>아이디 :</span>
                                <c:out value="${requestScope.bJoinDTO.hrId }"/>
                                 </p>
                              </div>
                              <div class="bio-row" style="margin-top: 50px;">
                                <p><span>이름 :</span>
                                <c:out value="${requestScope.bJoinDTO.hrName }"/>
                                </p>
                              </div>
                              <div class="bio-row">
                                <p><span>전화번호 :</span>
                                <c:out value="${requestScope.bJoinDTO.hrPhone }"/>
                                </p>
                              </div>
                              <div class="bio-row">
                                <p><span>이메일 :</span>
                                <c:out value="${requestScope.bJoinDTO.hrEmail }"/>
                                </p>
                              </div>
                          </div>
                        <form action="${ pageContext.servletContext.contextPath }/admin/businesscode?bCode=${ requestScope.bJoinDTO.bCode }" method="post">
								<!-- 	<input type="text" class="col-lg-6" name="reason" id="joinSubmit" placeholder="가입 승인 사유를 입력해주세요.">  -->
									<input type="submit" class="btn btn-success" name="Button" onclick="joinButton()" value="가입 승인">
									<br><br>
					    </form>
					    
					    <form action="${ pageContext.servletContext.contextPath }/admin/businesscode?bCode=${ requestScope.bJoinDTO.bCode }" method="post">
									<input type="text" class="col-lg-6" name="reason" id="joinBlock" placeholder="가입 거절 사유를 입력해주세요."> 
									<input type="submit" class="btn btn-warning" name="Button" onclick="joinBlock()" value="가입 거절">
									
						 </form>
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
      




</body> </html> 