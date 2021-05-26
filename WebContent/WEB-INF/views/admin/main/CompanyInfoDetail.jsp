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
                              <p>
                              <span>기업코드 </span>:    
                              <c:out value="${ requestScope.company.code }"/>
                              </p>
                            </div>
                            <div class="bio-row" style="margin-top: 50px;">
                              <p>
                              <span>기업명 :   </span>    
                              <c:out value="${ requestScope.company.name }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>대표명 </span>:    
                              <c:out value="${ requestScope.company.owner }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>사업자등록번호 </span>:    
                              <c:out value="${ requestScope.company.companyNumber }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>주소 </span>:    
                              <c:out value="${ requestScope.company.address }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>전화번호 </span>:    
                              <c:out value="${ requestScope.company.phone }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>차단여부 </span>:    
                              <c:choose>
			                    <c:when test="${ company.block eq 0 }">
			                    <c:out value="미차단"/>
			                    </c:when>
			                    <c:when test="${ company.block eq 1 }">
			                    <c:out value="차단"/>
			                    </c:when>
			                  </c:choose>
                              </p>
                            </div>
                           <div class="bio-row">
                              <p>
                              <span>연매출 </span>: 
                              <c:out value="${ requestScope.company.profit }원"/>
                              </p>
                           </div>
                           <div class="bio-row">
                              <p>
                              <span>카테고리 </span>: 
                              <c:out value="${ requestScope.company.category }"/>
                              </p>
                           </div>
                           <div class="bio-row">
                              <p>
                              <span></span>
                              </p>
                           </div>
                        </div>
                      </section>
                      
                    </div>
                    
                    <!-- 담당자정보 -->
                        <div class="table-responsive">
                          <table class="table">
                            <thead>
                              <tr>
                                <th>담당자 ID</th>
                                <th>담당자 이름</th>
                                <th>담당자 연락처</th>
                                <th>담당자 이메일</th>
                              </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="hrList" items="${ requestScope.hrList }">
                              <tr>
								<td><c:out value="${ hrList.hrId }"/></td>
								<td><c:out value="${ hrList.hrName }"/></td>
								<td><c:out value="${ hrList.hrPhone }"/></td>
								<td><c:out value="${ hrList.hrEmail }"/></td>
							  </tr>	
                            </c:forEach>
                            </tbody>
                          </table>
                          </div>
                        </section>
                      </div>
                  </div>
              </section>
  
          <!-- page end-->
        </section>
 </body> 
</html> 