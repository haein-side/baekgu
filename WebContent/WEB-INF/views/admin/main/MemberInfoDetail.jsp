<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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


<link href="RESOURCES/CSS/ADMIN/bootstrap-theme.css" rel="stylesheet">


<!-- owl carousel -->
<link rel="stylesheet" href="RESOURCES/CSS/ADMIN/owl.carousel.css"
	type="text/css">
<link href="RESOURCES/CSS/ADMIN/jquery-jvectormap-1.2.2.css"
	rel="stylesheet">
<!-- Custom styles -->
<link href="RESOURCES/CSS/ADMIN/widgets.css" rel="stylesheet">
<link href="RESOURCES/CSS/ADMIN/style.css" rel="stylesheet">
<link href="RESOURCES/CSS/ADMIN/style-responsive.css" rel="stylesheet" />
<link href="RESOURCES/CSS/ADMIN/jquery-ui-1.10.4.min.css"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<!--main content start-->
	<section id="main-content">
		<section class="wrapper">

			<!-- page start-->
			<div class="row">
				<div class="col-lg-12">
					<section class="panel">
						<header class="panel-heading tab-bg-info">
							<ul class="nav nav-tabs">
								<li class="active"><a data-toggle="tab"> <i
										class="icon-home"></i> 회원정보
								</a></li>
								</li>
							</ul>
						</header>

						<!-- 고객정보 -->
						<div id="profile" class="tab-pane">
							<section class="panel">
								<div class="panel-body bio-graph-info">
									<h2>개인정보</h2>
									<div class="row">
										<div class="bio-row" style="margin-top: 50px;">
											<p>
												<span>고객코드 </span>:
												<%-- <input name="code" value="${ requestScope.member.code }"/> --%>
												<c:out value="${ requestScope.member.code }"/>
											</p>
										</div>
										<div class="bio-row" style="margin-top: 50px;">
											<p>
												<span>이름 </span>:
												<c:out value="${ requestScope.member.name }" />
											</p>
										</div>
										<div class="bio-row">
											<p>
												<span>전화번호</span>:
												<c:out value="${ requestScope.member.phone }" />
											</p>
										</div>
										<div class="bio-row">
											<p>
												<span>생년월일 </span>:
												<c:out value="${ requestScope.member.bday }" />
											</p>
										</div>
										<div class="bio-row">
											<p>
												<span>성별 </span>:
												<c:out value="${ requestScope.member.gender }" />
											</p>
										</div>
										<div class="bio-row">
											<p>
												<span>주소 </span>:
												<c:out value="${ requestScope.member.address }" />
											</p>
										</div>
										<div class="bio-row">
											<p>
												<span>가입일 </span>:
												<c:out value="${ requestScope.member.rday }" />
											</p>
										</div>
										<div class="bio-row">
											<c:set var="block" value="${ requestScope.member.block }" />
											<c:choose>
												<c:when test="${ requestScope.member.block eq 0 }">
													<p>
														<span>차단여부 </span>:
														<c:out value="미차단" />
													</p>
												</c:when>
												<c:when test="${ requestScope.member.block eq 1 }">
													<p>
														<span>차단여부 </span>:
														<c:out value="차단" />
													</p>
												</c:when>
											</c:choose>
										</div>
									</div>
							</section>
						</div>
						<!-- 이력서정보 -->
						<div id="profile" class="tab-pane">
							<section class="panel">
								<div class="panel-body bio-graph-info">
									<h2>이력서</h2>
									<div class="row">
										<div class="bio-row" style="margin-top: 50px;">
											<p>
												<span>이력서코드 </span>:
												<c:out value="${ requestScope.member.rCode }" />
											</p>
										</div>
										<div class="bio-row" style="margin-top: 50px;">
											<p>
												<span>비상연락망 </span>:
												<c:out value="${ requestScope.member.rPhone }" />
											</p>
										</div>
										<div class="bio-row">
											<p>
												<span>자기소개 : </span>:
												<c:out value="${ requestScope.member.rLetter }" />
											</p>
										</div>
										<div class="bio-row">
											<p>
												<span>우대조건 </span>:
												<c:out value="${ requestScope.member.rAdvan }" />
											</p>
										</div>
									</div>
									<!-- 사용자를 차단할때 알럿을 하나 띄워서 간단하게 차단사유를 적는다
                          				 ex. 사용자 약관 nnn조 nn항에 의거하여 차단당하였습니다 -->
                          		<!-- 차단여부가 미차단일때만 나온다 -->
                          		<c:if test="${ requestScope.member.block eq 0 }">
                          		<br>
								<form action="${ pageContext.servletContext.contextPath }/admin/memberdetail?no=${ requestScope.member.code }" method="post">
									<input type="text" class="col-lg-6" name="blockReason" id="blockReason" placeholder="사용자 차단 사유를 명확히 입력해주세요."> 
									<input type="submit" class="btn btn-danger" onclick="return chk()" value="사용자 신고 승인">
								</form>
								<br><br>
								<form>
									<input type="text" class="col-lg-6" name="noBlockReason" id="noBlockReason" placeholder="신고 거절 사유를 명확히 입력해주세요."> 
									<input type="submit" class="btn btn-warning" onclick="return chk()" value="사용자 신고 거절">
								</form>
								<script>
								function chk(){
									
								if(document.getElementById("blockReason").value == ""){
	                                alert("사유를 입력해주세요.");
	                                
	                                return false;
                            	  } else{
                            		  
                            		 return true;
                            	  }
								}
								</script>
                          		</c:if>
                          		<c:if test="${ requestScope.member.block eq 1 }">
                          		<p style="color:red; font-size: 20px;">
                          		<c:out value="차단 된 회원입니다."/>
                          		</p>
                          		</c:if>

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

</body>
</html>
