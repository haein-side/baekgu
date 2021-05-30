<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세조회</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Css Styles -->
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/YJCSS/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/YJCSS/style.css" type="text/css">
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/YJCSS/header2.css" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>

<body>

<%@ include file="../common/header2.jsp"%>
	<section class="product-details" style="margin-top: 10%; z-index: 1;">
		<div class="container">
			<div class="row">
         		<div class="col-lg-6 col-md-6">
            		<div><img src="${ pageContext.servletContext.contextPath }/RESOURCES/IMAGES/product-details-1.jpg"></div>
            	</div>
				<div class="col-lg-6 col-md-6">
					<div class="product__details__text ">
						<h1 style="font-size: 40 px;">${ requestScope.postInfo.postTitle }</h1>
						<hr>
						<table class="table">
							<thead>
								<th style="font-size: 40px;">${ requestScope.postInfo.bName }</th>
							</thead>
							<tbody>
								<th style="font-size: 20px; width: 100%;">${ requestScope.postInfo.postContent }<br></th>
							</tbody>
						</table>						
						
	<%-- 					<div class="company__title" style="font-size: 40px;">${ requestScope.postInfo.bName }
						</div>
						<p style="font-size: 20px; width: 100%;">
							${ requestScope.postInfo.postContent }<br>
						</p> --%>
						<div align="right">
							<!-- hidden 타입의 input 태그에 유저코드와 공고번호를 넣어둠 -->
							<input type="hidden" id="userCode" name="userCode" value="${ loginUserInfo.userCode }"/>
							<input type="hidden" id="postCode" name="postCode" value="${ requestScope.postInfo.postCode }"/>
							<input type="hidden" id="postCode" name="postCode" value="${ requestScope.postInfo.bName }"/>
							
							<button class="jione_button" type="submit" onclick=apply();>								
								<script>
									/* 지원하기 버튼 onclick 이벤트 */
									var userCode = document.getElementById("userCode").value;
							
									console.log(userCode);
									
									function apply(){
										/* userCode가 존재할 경우 지원하기 창 띄우기 */
										if(userCode != null && userCode != "") {

											window.open("${ pageContext.servletContext.contextPath }/toapply?postCode=${ requestScope.postInfo.postCode }&bName=${ requestScope.postInfo.bName }", "a", "width=450, height=600, left=500, top=250");

										/* 유저코드가 존재하지 않을 경우 로그인창 띄우기 */
										} else {

											window.open("${ pageContext.servletContext.contextPath }/signinpopup", "a", "width=450, height=600, left=500, top=250");				
										
										}
                              		}
								</script>
								<h2>지원하기</h2>
							</button>
							
						</div>
						<hr><br><br>
						<table>
							<tr>
								<th>지원자격</th>
								<td>${ requestScope.postInfo.ageName }</td>
							</tr>
							<tr>
								<th>급여</th>
								<td>${ requestScope.postInfo.payment } 원</td>
							</tr>
							<tr>
								<th>근무기간</th>
								<td>${ requestScope.postInfo.periodName }</td>
							</tr>
							<tr>
								<th>근무시간</th>
								<td>${ requestScope.postInfo.hourName }</td>
							</tr>
							<tr>
								<th>근무지역</th>
								<td>${ requestScope.postInfo.locationName }</td>
							</tr>
						</table>

<%-- 						<ul>
							<li style="font-size: 25px;"><b>지원자격</b> <span> ${ requestScope.postInfo.ageName } </span>
							</li>
							<br>
							<li style="font-size: 25px;"><b>급여</b> <span> ${ requestScope.postInfo.payment } 원<samp> (${ requestScope.postInfo.payName }) </samp>
							</span></li>
							<br>
							<li style="font-size: 25px;"><b>근무기간</b> ${ requestScope.postInfo.periodName }  <span></span>
							</li>
							<br>
							<li style="font-size: 25px;"><b>근무시간</b> <span> ${ requestScope.postInfo.hourName } </span>
							</li>
							<br>
							<li style="font-size: 25px;"><b>근무지역</b> <span> ${ requestScope.postInfo.locationName } </span></li>
						</ul> --%>
					</div>
				</div><br><br><br>
				
				<div class="col-lg-12">
					<div class="col-lg-12">
						<div class="product__details__text">
							<div class="tab-content">
								<div class="tab-pane active" id="tabs-1" role="tabpanel">
									<div class="tab-pane active" id="tabs-2" role="tabpanel">
	 									<div class="product__details__tab__desc"
											style="margin-bottom: 50px; margin-top: 100px;" align="center">
											<h2 align="center">상세 근무 지역</h2>
											<hr>
	 										<table>
	 											<tr>
	 												<th>근무 지역</th>
	 												<td> ${ requestScope.postInfo.bAddress } </td>
	 											</tr>
	 										</table>
	 									</div>
	 									<%-- <div class="product__details__tab__desc"
											style="margin-bottom: 50px; margin-top: 100px;" align="center">
											<h2 align="center">상세 근무 지역</h2>
											<div>
												<ul style="margin-top: 20px; margin-bottom: 50px;">
													<li style="font-size: 30px;"><b>근무지역</b> ${ requestScope.postInfo.bAddress } </li>
												</ul>
											</div> --%>
											<br><br><br>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div>
					<div class="product__details__text">
						<div class="tab-pane active" id="tabs-1" role="tabpanel">
							<div class="product__details__tab__desc" style="margin-bottom: 100px; text-alight: center;">
								<h2 align="center">모집부분</h2>
								<hr><br>
								<table class="table" style="text-align: center;">
									<tr>
										<th> 모집 분야 </th>
										<td> ${ requestScope.postInfo.industryName } </td>
									</tr>
									<tr>
										<th> 담당 업무 </th>
										<td> ${ requestScope.postInfo.jobName } </td>
									</tr>
								</table>
<%-- 								<table class="table" style="text-align: center;">
									<thead>
										<tr style="font-size: 25px;">
											<th scope="col">모집분야</th>
											<th scope="col">담당업무</th>
										</tr>
									</thead>
									<tbody>
										<tr style="font-size: 20px;">
											<th scope="row">${ requestScope.postInfo.industryName }</th>
											<th>
												<ul
													style="margin-top: 0px; border: 0px; padding: 0px; text-align: left; margin-left: 370px;">
													<li style="font-size: 20px;"><b>담당업무 </b> <span> ${ requestScope.postInfo.jobName }</span>
													</li>
												</ul>
											</th>
										</tr>
									</tbody>
								</table> --%>
							</div>
						</div>

						<div id="tabs-2">
							<div class="product__details__tab__desc" align="center">
								<div style="height: 550px;">
									<div>
										<h2>근무조건 및 급여</h2>
										<hr>
										<div id="">
											<table>
												<tr>
													<th>근무유형</th>
													<td>
														<c:if test="${ requestScope.postInfo.fulltimeYn eq '1' }"> 정규직 </c:if>
													 	<c:if test="${ requestScope.postInfo.fulltimeYn ne '1' }"> 비정규직 </c:if>
													 </td>
												</tr>
												<tr>
													<th>근무기간</th>
													<td> ${ requestScope.postInfo.periodName } </td>
												</tr>
												<tr>
													<th>근무시간</th>
													<td> 
														
														<c:choose>
													    	<c:when test="${ requestScope.postInfo.hourName eq '시간 협의' }">
													       		시간 협의
													    	</c:when>
													    	<c:when test="${ requestScope.postInfo.hourName eq '풀타임' }">
													       		종일
													    	</c:when>
													    	<c:when test="${ requestScope.postInfo.hourName eq '새벽' }">
													       		새벽
													    	</c:when>
													    	<c:when test="${ requestScope.postInfo.hourName eq '오전' }">
													       		오전
													    	</c:when>
													    	<c:when test="${ requestScope.postInfo.hourName eq '오후' }">
													       		오후
													    	</c:when>
													    	<c:when test="${ requestScope.postInfo.hourName eq '저녁' }">
													       		저녁
													    	</c:when>
														</c:choose>
													</td>
												</tr>
												<tr>
													<th>우대조건</th>
													<td> ${ requestScope.postInfo.advantage } </td>
												</tr>
												<tr>
													<th>복리후생</th>
													<td> ${ requestScope.postInfo.benefit } </td>
												</tr>
												<tr>
													<th>급여형태</th>
													<td> ${ requestScope.postInfo.payName } </td>
												</tr>
												<tr>
													<th>급여</th>
													<td> ${ requestScope.postInfo.payment } 원 </td>
												</tr>
											</table> <!-- align center -->
<%-- 											<div>
											<div
													style="width: 250px; height: 36px; float: left; margin-left: 350px; margin-bottom: 20px;">
													<b style="font-size: 30px;">근무유형</b>
												</div> 
												<span
													style="float: left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">시간제</span>
												<div
													style="width: 250px; height: 36px; float: left; margin-left: 350px; margin-bottom: 20px;">
													<b style="font-size: 30px;">근무기간</b>
												</div>
												<span
													style="float: left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">
													${ requestScope.postInfo.periodName } </span>

												<div
													style="width: 250px; height: 36px; float: left; margin-left: 350px; margin-bottom: 20px;">
													<b style="font-size: 30px;">근무시간 </b>
												</div>
												<span
													style="float: left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">
													${ requestScope.postInfo.hourName } </span>

												<div
													style="width: 250px; height: 36px; float: left; margin-left: 350px; margin-bottom: 20px;">
													<b style="font-size: 30px;">우대조건</b>
												</div>
												<span
													style="float: left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">
													${ requestScope.postInfo.advantage }</span>
												<div
													style="width: 250px; height: 36px; float: left; margin-left: 250px; margin-bottom: 20px;">
													<b style="font-size: 30px;">복리후생</b>
												</div>
												<span
													style="float: left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">
													${ requestScope.postInfo.benefit }</span>
														
												<div
													style="width: 250px; height: 36px; float: left; margin-left: 350px; margin-bottom: 20px;">
													<b style="font-size: 30px;">급여형태</b>
												</div>
												<span
													style="float: left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">
													${ requestScope.postInfo.payName }</span>

												<div
													style="width: 250px; height: 36px; float: left; margin-left: 350px; margin-bottom: 20px; margin-bottom: 20px;">
													<b style="font-size: 30px;">급여</b>
												</div>
												<span
													style="float: left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">
													${ requestScope.postInfo.payment } 원</span>
											</div> --%>
										</div>
									</div>
								</div>
							</div>

							<div id="tabs-2">
								<div id="detail_tab_2" style="height: 550px;" align="center">
									<div>
										<h2>지원조건</h2>
										<hr>
										<table>
											<tr>
												<th> 성별 </th>
												<td> ${ requestScope.postInfo.gender } </td>
											</tr>
											<tr>
												<th> 연령 </th>
												<td> ${ requestScope.postInfo.ageName } </td>
											</tr>
											<tr>
												<th> 학력 </th>
												<td> ${ requestScope.postInfo.degreeLevel } </td>
											</tr>
											<tr>
												<th> 경력 </th>
												<td> ${ requestScope.postInfo.expName } </td>
											</tr>
											<tr>
												<th> 우대조건 </th>
												<td> ${ requestScope.postInfo.advantage } </td>
											</tr>
											<tr>
												<th> 급여 </th>
												<td> ${ requestScope.postInfo.payment }원</td>
											</tr>
										</table>
										
										
<%-- 										<div id="working">
											<div
												style="width: 250px; height: 36px; float: left; margin-left: 350px; margin-bottom: 20px;">
												<b style="font-size: 30px;">성별</b>
											</div>
											<span
												style="float: left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">${ requestScope.postInfo.gender }</span>

											<div
												style="width: 250px; height: 36px; float: left; margin-left: 350px; margin-bottom: 20px;">
												<b style="font-size: 30px;">연령</b>
											</div>
											<span
												style="float: left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">${ requestScope.postInfo.ageName }
												</span>

											<div
												style="width: 250px; height: 36px; float: left; margin-left: 350px; margin-bottom: 20px;">
												<b style="font-size: 30px;">학력</b>
											</div>
											<span
												style="float: left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">${ requestScope.postInfo.degreeLevel }</span>

											<div
												style="width: 250px; height: 36px; float: left; margin-left: 350px; margin-bottom: 20px;">
												<b style="font-size: 30px;">경력</b>
											</div>
											<span
												style="float: left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">${ requestScope.postInfo.expName }</span>

											<div
												style="width: 250px; height: 36px; float: left; margin-left: 350px; margin-bottom: 20px;">
												<b style="font-size: 30px;">우대조건</b>
											</div>
											<span
												style="float: left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">${ requestScope.postInfo.advantage }
												</span>

											<div
												style="width: 250px; height: 36px; float: left; margin-left: 350px; margin-bottom: 20px;">
												<b style="font-size: 30px;">급여</b>
											</div>
											<span
												style="float: left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">${ requestScope.postInfo.payment } 원</span>
										</div> --%>
									</div>
								</div>

							</div>
							<div class="tab-pane active" id="tabs-2" role="tabpanel">
								<div class="product__details__tab__desc" align="center"
									style="margin-bottom: 100px;">
									<div style="height: 400px;">
										<div>
											<h2>접수방법</h2>
											<hr>
											<div id="how">
											<table>
												<tr>
													<th>접수방법</th>
													<td>
														<c:if test="${ requestScope.postInfo.postOnline eq '0' }"> 전화 지원 </c:if>
														<c:if test="${ requestScope.postInfo.postOnline eq '1' }"> 온라인 지원 </c:if>													
													</td>
												</tr>
												<tr>
													<th>연락처</th>
													<td> ${ requestScope.postInfo.hrPhone } </td>
												</tr>
												<tr>
													<th>채용 담당자</th>
													<td> ${ requestScope.postInfo.hrName } </td>
												</tr>																								
											</table>
<!-- 												<div
													style="width: 250px; height: 36px; float: left; margin-left: 350px; margin-bottom: 20px;">
													<b style="font-size: 30px;">접수방법</b>
												</div>
												 -->
<%-- 												<span
													style="float: left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">
													<c:if test="${ requestScope.postInfo.postOnline eq '0' }"> 전화 지원 </c:if>
													<c:if test="${ requestScope.postInfo.postOnline eq '1' }"> 온라인 지원 </c:if>
													</span>
												<div
													style="width: 250px; height: 36px; float: left; margin-left: 350px; margin-bottom: 20px;">
													<b style="font-size: 30px;">연락처</b>
												</div>
												<span
													style="float: left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">${ requestScope.postInfo.hrPhone } </span><br>

												<div
													style="width: 250px; height: 36px; float: left; margin-left: 350px; margin-bottom: 20px;">
													<b style="font-size: 30px;">채용 담당자</b>
												</div>
												<span
													style="float: left; font-size: 30px; margin-left: 50px; margin-bottom: 20px;">${ requestScope.postInfo.hrName } </span> --%>
											</div>
										</div>
									</div>
									<div
										style="width: 100%; height: 200px; border: 1px solid grey; margin-top: 30px;">
										<p align="center"
											style="font-size: 30px; line-height: 38px; margin-top: 25px;"><br>
											전화 문의 시, <b>'백구에서 채용정보 보고 전화 드렸습니다.'</b><br> 라고 하시면 빠른
											문의가 가능합니다.<br>
										</p>
									</div>
								</div>
								<h1
									style="color: orangered; text-align: center; margin-bottom: 20px;">잠깐!!!</h1>
								<div style="margin-bottom: 80px; height: 100%;">
									<div>

										<p style="font-size: 35px; text-align: center;">
											혹시 임금체불사업주 목록! 확인해보셨나요?<br>
										<h2 style="text-align: center;">
											<a
												href="https://www.moel.go.kr/info/defaulter/defaulterList.do"
												target="_blank" style="color: black;">목록보기</a>
										</h2>
										</p>
									</div>
									<br>
									
									<div align="center">
										
										<p style="font-size: 25px; text-align: center;">
										본 채용 정보에 불법, 허위, 과장 또는 잘못된 내용이 있을 경우, 신고해주세요.
										</p>
										<!-- 신고하기 버튼 -->
										<input type="hidden" name="postCode" value="<c:out value="${ requestScope.postInfo.postCode }"/>">
										
										<!-- <button class="report_button" type="button" onclick=report();>
											<script>
											
												var postCode = document.getElementById("postCode").value;
												console.log(postCode);
											
												/* 신고하기 버튼 onclick 이벤트 */
												function report(){
	
													window.open("${ pageContext.servletContext.contextPath }/user/toreport?postCode="+${ requestScope.postInfo.postCode }, "a", "width=550, height=700, left=450, top=200");

        	                      				}
											</script> 
											<h2>신고하기</h2>
										</button> -->
										<!-- 모달 끝 -->
										
										<input type="button" class="btn btn-primary" style="width: 117.73913049697876px !important; padding-left: 8px !important; height: 60px !important; width: 40px; border: 0px; background: white; color: red; font-Size: 28px;" data-toggle="modal" data-target="#report" value="신고하기"/>
										<!--  신고하기 모달창 -->
					                    <form action="${ pageContext.servletContext.contextPath }/user/report" method="post">
					                    <div class="modal fade" id="report" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="z-index: 20000;">
					                        <div class="modal-dialog" role="document">
						                        <div class="modal-content">
						                            <div class="modal-header">
														<h3>공고 신고하기</h3>
						                            </div>
						                            	<div class="modal-body">
						                            		<label>신고 사유 :  </label><br> 
						                            		<textarea id="reportReason" name="reportReason"  rows="50" cols="60" style="height:300px; resize:none"></textarea>
						                            		<br><br>
						                            		*신고된 내용을 심사숙고하여 최대한 빠른 결과로 응답해드리겠습니다
						                            		<br>
						                            		*심사결과는 보통 3~5일뒤에 확인하실 수 있습니다
						                           		</div>
						                            
						                            	<input type="hidden" name="userCode" value="<c:out value="${ loginUserInfo.userCode }"/>">
						                            	<input type="hidden" name="postCode" value="<c:out value="${ requestScope.postInfo.postCode }"/>">
						                            	
						                            	<div class="modal-footer">
						                            		<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						                            		<button type="submit" class="btn btn-default">신고하기</button>
						                            	</div>
						                        </div>
					                        </div>
					                    </div>
					                    </form>	
										
								
									</div>
								</div>
							</div>
							<div>
								<div class="section-title related__product__title">
									<h2>채용기업 정보</h2>
								</div>
								<div class="product__details__tab__desc"
									style="margin-bottom: 50px; text-align: center;">
									<div>
										<table>
											<tr>
												<th>회사명</th>
												<td>${ requestScope.postInfo.bName }</td>
											</tr>
											<tr>
												<th>대표자</th>
												<td>${ requestScope.postInfo.bOwner }</td>
											</tr>
											<tr>
												<th>회사주소</th>
												<td>${ requestScope.postInfo.bAddress }</td>
											</tr>
											<tr>
												<th>사업내용</th>
												<td>${ requestScope.postInfo.industryName }</td>
											</tr>
											<tr>
												<th>연매출액</th>
												<td>${ requestScope.postInfo.bProfit } 원</td>
											</tr>										
										</table>
									
									
<%-- 										<ul style="margin-top: 20px; margin-bottom: 50px;">
											<li style="font-size: 20px;"><b>회사명</b>${ requestScope.postInfo.bName }</li>
											<li style="font-size: 20px;"><b>대표자</b>${ requestScope.postInfo.bOwner }</li>
											<li style="font-size: 20px;"><b>회사주소</b>${ requestScope.postInfo.bAddress }</li>
											<li style="font-size: 20px;"><b>사업내용</b>${ requestScope.postInfo.industryName }</li>
											<li style="font-size: 20px;"><b>연매출액</b>${ requestScope.postInfo.bProfit } 원</li>
										</ul> --%>
									</div>
								</div>
							</div>

							<div class="tab-pane active" id="tabs-2" role="tabpanel">

								<div class="section-title related__product__title">
									<h2>이 공고는...</h2>
								</div>
								<div class="product__details__tab__desc">
									<div
										style="height: 120px; border: 2px solid lightgray; margin-bottom: 80px;"
										align="center">
										<p style="font-size: 18px; margin-top: 40px;">

											본 구인정보는 게시자가 제공한 자료이며, 백구는 기재된 내용에 대한 오류와 지연에 사용자가 이를 신뢰하여 취한
											조치에 대해 책임을지지 않습니다.<br> 본 정보의 저작권은 백구에 있으며, 동의없이 무단게제 및
											재배포 할 수 없습니다.
										</p>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</section>
	
	<script>
		
		$('#report').on('click', function(event) {
			var button = $(event.relatedTarget)
		});
	</script>

	
<%@ include file="../common/footer.jsp"%>

</body>

</html>