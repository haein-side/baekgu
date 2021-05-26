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
 	<c:if test="${ !empty sessionScope.loginAdminName }">
		<section id="main-content">
			<section class="wrapper">
				<div class="row">
					<div class="col-lg-12">
			</section>
		</section>
	</c:if>
<c:if test="${ !empty sessionScope.loginAdminName }">
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
                              <p>
                              <span>담당자 ID </span>:    
                              <c:out value="${ requestScope.post.hrId }"/>
                              </p>
                            </div>
                            <div class="bio-row" style="margin-top: 50px;">
                              <p>
                              <span>공고코드 </span>:    
                              <c:out value="${ requestScope.post.postCode }"/>
                              </p>
                            </div>
                             <div class="bio-row">
                              <p>
                              <span>심사코드 </span>:    
                              <c:out value="${ requestScope.post.dListCode }"/>
                              </p>
                            </div>
                             <div class="bio-row">
                              <p>
                              <span>기업코드 </span>:    
                              <c:out value="${ requestScope.post.bCode }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>공고제목   </span>: 
                              <c:out value="${ requestScope.post.postTitle }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>공고내용 </span>:    
                              <c:out value="${ requestScope.post.postContent }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>공고 등록일 </span>:    
                              <c:out value="${ requestScope.post.postDate }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>월급 </span>:    
                              <c:out value="${ requestScope.post.payment } 원"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>공고 마감일 </span>:    
                              <c:out value="${ requestScope.post.endDate }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>월급형태 </span>:    
                              <c:out value="${ requestScope.post.payName }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>근무지 </span>:    
                              <c:out value="${ requestScope.post.address }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>공고TO </span>:    
                              <c:out value="${ requestScope.post.postTo } 명"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>온라인 여부</span>: 
                              <c:choose>
                              	<c:when test="${ requestScope.post.online eq 0 }">
									<c:out value="N"/>                              	
                              	</c:when>
                              	<c:when test="${ requestScope.post.online eq 1 }">
									<c:out value="Y"/>                              	
                              	</c:when>
                              </c:choose>  
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>근무요일 </span>:    
                              <c:out value="${ requestScope.post.days }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>성별 </span>:    
                              <c:out value="${ requestScope.post.gender }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>우대사항 </span>:    
                              <c:out value="${ requestScope.post.advantage }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>복지 </span>:    
                              <c:out value="${ requestScope.post.benefit }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>정규직 여부 </span>:    
                              <c:choose>
                              	<c:when test="${ requestScope.post.fullTimeYn eq 0 }">
									<c:out value="N"/>                              	
                              	</c:when>
                              	<c:when test="${ requestScope.post.fullTimeYn eq 1 }">
									<c:out value="Y"/>                              	
                              	</c:when>
                              </c:choose>  
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>근무시간 </span>:    
                              <c:out value="${ requestScope.post.hourName }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>연령 </span>:    
                              <c:out value="${ requestScope.post.ageName }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>학력 </span>:    
                              <c:out value="${ requestScope.post.degreeLevel }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>근무시간 </span>:    
                              <c:out value="${ requestScope.post.periodName }"/>
                              </p>
                            </div>
                            <div class="bio-row">
                              <p>
                              <span>근무지역 </span>:    
                              <c:out value="${ requestScope.post.locationName }"/>
                              </p>
                            </div>
                          </div>
                        </div>
                        <!-- 사용자를 차단할때 알럿을 하나 띄워서 간단하게 차단사유를 적는다
                          				 ex. 사용자 약관 nnn조 nn항에 의거하여 차단당하였습니다 -->
                          		<!-- 차단여부가 미차단일때만 나온다 -->
                          		<c:if test="${ requestScope.post.block eq 0 }">
                          		<br>
								<form action="${ pageContext.servletContext.contextPath }/admin/postDetail?no=${ requestScope.post.postCode }&bCode=${ requestScope.post.bCode }" method="post">
									<input type="text" class="col-lg-6" name="reason" id="blockReason" placeholder="사용자 차단 사유를 명확히 입력해주세요."> 
									<input type="submit" class="btn btn-danger" name="blockButton" onclick="return chk1()" value="기업 신고 승인">
									<br><br>
									
								</form>
								<script>
								function chk1(){
									
								if(document.getElementById("blockReason").value == ""){
	                                alert("사유를 입력해주세요.");
	                                
	                                return false;
                            	  } else{
                            		  
                            		 return true;
                            	  }
								}
								</script>
                          		<form action="${ pageContext.servletContext.contextPath }/admin/postDetail?no=${ requestScope.post.postCode }&bCode=${ requestScope.post.bCode }" method="post">
									<input type="text" class="col-lg-6" name="reason" id="noblockReason" placeholder="신고 거절 사유를 명확히 입력해주세요."> 
									<input type="submit" class="btn btn-warning" name="blockButton" onclick="return chk2()" value="기업 신고 거절">
									
								</form>
								<script>
								function chk2(){
									
								if(document.getElementById("noblockReason").value == ""){
	                                alert("사유를 입력해주세요.");
	                                
	                                return false;
                            	  } else{
                            		  
                            		 return true;
                            	  }
								}
								</script>
                          		</c:if>
                          		<!-- 이미 차단된 기업일시 -->
                          		<c:if test="${ requestScope.post.block eq 1 }">
                          		<p style="color:red; font-size: 20px;">
                          		<c:out value="차단 된 기업입니다."/>
                          		</p>
                          		</c:if>   
                      </section>
                      <!-- 광고정보 -->
                      <div class="table-responsive">
                        <table class="table">
                          <thead>
                              <tr>
                                <th>코드</th>
                                <th>날짜</th>
                                <th>결제여부</th>
                                <th>사용기간</th>
                                <th>광고이름</th>
                                <th>가격</th>
                                <th>결제방법</th>
                              </tr>
                            </thead>
                            <tbody>
							<c:set var = "total" value = "0" />
                            <c:forEach var="ad" items="${ requestScope.adList }">
                              <tr>
								<td><c:out value="${ ad.postAdCode }"/></td>
								<td><c:out value="${ ad.adDate }"/></td>
								<c:choose>
									<c:when test="${ ad.adPaid eq 0 }">
										<td><c:out value="결제대기"/></td>
									</c:when>
									<c:when test="${ ad.adPaid eq 1 }">
										<td><c:out value="결제완료"/></td>
									</c:when>
								</c:choose>
								<td><c:out value="${ ad.adWeek } 주"/></td>
								<td><c:out value="${ ad.adName }"/></td>
								<td><c:out value="${ ad.adPrice }"/></td>
								<c:set var= "total" value="${total + ad.adPrice}"/>
								<td><c:out value="${ ad.methodName }"/></td>
							  </tr>	
                            </c:forEach>
                            </tbody>
                        </table>
                        <table class="total">
                        	<thead>
                        		<tr>
                        		<th>총 결제 금액</th>
                        		</tr>
                        	</thead>
                        	<tbody>
                        		<tr>
                        		<td><c:out value="${ total } 원"/></td>
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
</c:if>


 </body> 
</html> 