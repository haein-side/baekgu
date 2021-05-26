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

	 <style>
      .total td {
        font-size : 30px;
      }
    </style>
  </head>
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
                        공고심사
                      </a>
                    </li>
                  </ul>
                </header>
                    <!-- 공고정보 -->
                    <div id="profile" class="tab-pane">
                      <section class="panel">
                        <div class="panel-body bio-graph-info">
                          <h2>공고심사</h2>
                          <div class="row">
                            <div class="bio-row" style="margin-top: 50px;">
                              <p>
                              <span>공고코드 </span>:    
                              <c:out value="${ requestScope.postDTO.postCode }"/>
                              </p>
                            </div>
                             <div class="bio-row" style="margin-top: 50px;">
                              <p>
                              <span>담당자 ID </span>:    
                              <c:out value="${ requestScope.postDTO.hrId }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>공고제목   </span>: 
                              <c:out value="${ requestScope.postDTO.postTitle }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>공고내용 </span>:    
                              <c:out value="${ requestScope.postDTO.postContent }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>공고 등록일 </span>:    
                              <c:out value="${ requestScope.postDTO.postDate }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>월급 </span>:    
                              <c:out value="${ requestScope.postDTO.payment } 원"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>공고 마감일 </span>:    
                              <c:out value="${ requestScope.postDTO.endDate }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>월급형태 </span>:    
                              <c:out value="${ requestScope.postDTO.payName }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>근무지 </span>:    
                              <c:out value="${ requestScope.postDTO.address }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>공고TO </span>:    
                              <c:out value="${ requestScope.postDTO.postTo } 명"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>온라인 여부</span>: 
                              <c:choose>
                              	<c:when test="${ requestScope.postDTO.online eq 0 }">
									<c:out value="N"/>                              	
                              	</c:when>
                              	<c:when test="${ requestScope.postDTO.online eq 1 }">
									<c:out value="Y"/>                              	
                              	</c:when>
                              </c:choose>  
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>근무요일 </span>:    
                              <c:out value="${ requestScope.postDTO.days }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>성별 </span>:    
                              <c:out value="${ requestScope.postDTO.gender }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>우대사항 </span>:    
                              <c:out value="${ requestScope.postDTO.advantage }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>복지 </span>:    
                              <c:out value="${ requestScope.postDTO.benefit }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>정규직 여부 </span>:    
                              <c:choose>
                              	<c:when test="${ requestScope.postDTO.fullTimeYn eq 0 }">
									<c:out value="N"/>                              	
                              	</c:when>
                              	<c:when test="${ requestScope.postDTO.fullTimeYn eq 1 }">
									<c:out value="Y"/>                              	
                              	</c:when>
                              </c:choose>  
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>근무시간 </span>:    
                              <c:out value="${ requestScope.postDTO.hourName }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>연령 </span>:    
                              <c:out value="${ requestScope.postDTO.ageName }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>학력 </span>:    
                              <c:out value="${ requestScope.postDTO.degreeLevel }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>근무시간 </span>:    
                              <c:out value="${ requestScope.postDTO.periodName }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>근무지역 </span>:    
                              <c:out value="${ requestScope.postDTO.locationName }"/>
                              </p>
                            </div>
                        
                          </div>
                        </div>
                        
                          	 
                      </section>
                  
                  <div class="table-responsive">
                        <table class="table">
                          <thead>
                              <h2>광고신청</h2>
                              <tr>
                                <th>광고신청코드</th> 
                                <th>광고코드</th>
                                <th>광고이름</th>
                                <th>사용기간</th>
                            <!--     <th>광고금액</th> -->
                              </tr>
                            </thead>
                            <tbody>
   
                              <tr>
                              
                               <c:forEach var="post" items="${ requestScope.payment }" >
							    <td><c:out value="${ post.postAdCode }"/></td> 
								<td><c:out value="${ post.adCode }"/></td>
								<td><c:out value="${ post.adName }"/></td>
								<td><c:out value="${ post.adWeek } 주"/></td>
							<%-- 	<td><c:out value="${ post.adPrice }"/></td> --%>
								</c:forEach>
							  </tr>	
                            </tbody>
                        </table>
                       <form action="${ pageContext.servletContext.contextPath }/admin/postapprovedetail?postCode=${ requestScope.postDTO.postCode }" method="post">
								<!-- 	<input type="text" class="col-lg-6" name="reason" id="joinSubmit" placeholder="가입 승인 사유를 입력해주세요.">  -->
									<input type="submit" class="btn btn-success" name="Button" onclick="approveButton()" value="공고 승인">
									<br><br>
					    </form>
					    
					    <form action="${ pageContext.servletContext.contextPath }/admin/postapprovedetail?postCode=${ requestScope.postDTO.postCode }" method="post">
									<input type="text" class="col-lg-6" name="reason" id="joinBlock" placeholder="공고 거절 사유를 입력해주세요."> 
									<input type="submit" class="btn btn-warning" name="Button" onclick="apporveBlock()" value="공고 거절">
									
						 </form>
                      </div> 
                  </div>
                </div>
                </div>
              </section>
  			</section>
          <!-- page end-->


 </body> 
</html> 