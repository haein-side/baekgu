<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>채용공고 리스트</title>
         <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/postlist.css" rel="stylesheet" />
           <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/YJCSS/header2.css"type="text/css">
        
        
        <style>
        
        .panel {
        border: 1px solid #f4511e; 
        border-radius:0;
        transition: box-shadow 0.5s;
        }

        .panel:hover {
        box-shadow: 5px 0px 40px rgba(0,0,0, .2);
        }

        .panel-footer .btn:hover {
        border: 1px solid #f4511e;
        background-color: #fff !important;
        color: #f4511e;
        }

        .panel-heading {
        color: #fff !important;
        background-color: #f4511e !important;
        padding: 15px;
        border-bottom: 1px solid transparent;
        border-top-left-radius: 0px;
        border-top-right-radius: 0px;
        border-bottom-left-radius: 0px;
        border-bottom-right-radius: 0px;
        }

        .panel-footer {
        background-color: #fff !important;
        }

        .panel-footer h3 {
        font-size: 32px;
        }

        .panel-footer h4 {
        color: #aaa;
        font-size: 14px;
        }

        .panel-footer .btn {
        margin: 15px 0;
        background-color: #f4511e;
        color: #fff;
        }

        </style>
        
    </head>

	<body>
        <!-- header -->
       <%@ include file="../common/header2.jsp" %>
        
        
<!-- width 100% 크기 조정, header size needed -->
        <div class="breadcrumb mb-4" style="height: 60px; position: fixed; width: 100%; z-index: 10000; margin-top : 240px; background-color: skyblue;">
           <c:forEach var="title" begin="1" end="1" items="${ requestScope.selectPost }">
            <p style="margin: auto; color: black; font-size: larger;">검색 조건 : 지역 - <c:forEach var="lo" items="${ requestScope.selectPost }"><c:out value="${ lo.locationName }"/> </c:forEach>  |  업종 - <c:out value="${ title.industryName }"/>  |  기간 - <c:out value="${ title.periodName }"/></p>
            </c:forEach>
            <!-- 재검색하기 버튼 눌렀을 때, 이전페이지인 검색페이지로 이동하기 -->
            <a href="${ pageContext.servletContext.contextPath }/user/toSearchPost" style=" color: red; position: fixed; z-index: 10000; padding-top: 5px; margin-left: 90%; font-size: large;" >재검색하기</a>
        </div>

        <!-- Page Content-->
          <section class="py-5">
            <div class="container" style="margin-top : 270px;">
                <!-- Page Heading/Breadcrumbs-->
                <h1 style ="font-family:BM; color:orange; margin-top: 5%;">
                    채용 공고                   
                </h1>
                <hr>
                
                <!-- premium ads -->
                <div class="text-left">
                <c:forEach var="title" begin="1" end="1" items="${ requestScope.selectPost }">
                    <h2 style="font-family: BM;">백구와 함께하는 추천 기업 - <c:out value="${ title.industryName }"/> 업종</h2>
				</c:forEach>
                </div>
                <!-- Container  -->
                <div class="container-fluid">
                
                
                    <!-- 업종광고상단 (adCode = 1) -->
                    <div class="row">
                    <c:forEach var="post" items="${ requestScope.selectInAdPost }">
                    <%-- <c:set var="ad1" value="${ requestScope.selectInAdPost }"/> --%>
                   	 <c:if test="${ post.adCode eq 1 }">
	                    <div class="col-sm-4 col-xs-12">
	                        <div class="panel panel-default text-center">
	                        <div class="panel-heading">
	                            <h3><c:out value="${ post.jobName }"/></h3>
	                        </div>
	                        <%-- <div class="panel-body">
	                            <p><strong>지역</strong> <c:out value="${ post.locationName }"/></p>
	                            <p><strong>업종</strong> <c:out value="${ post.industryName }"/></p>
	                            <p><strong>직종</strong> <c:out value="${ post.jobName }"/></p>
	                            <p><strong>복리후생</strong> <c:out value="${ post.benefit }"/></p>
	                            <p><strong>급여</strong> <c:out value="${ post.payment }"/>/<c:out value="${ post.payName }"/></p>
	                        </div> --%>
	                        <div class="card-body" style = "text-align: center">
                            	<p class="card-text">
                            	<p><strong>지역</strong> <c:out value="${ post.locationName }"/></p>
                                <p><strong>업종</strong> <c:out value="${ post.industryName }"/></p>
                                <p><strong>직종</strong> <c:out value="${ post.jobName }"/></p>
                                <p><strong>복리후생</strong> <c:out value="${ post.benefit }"/></p>
                                <p><strong>급여</strong> <c:out value="${ post.payment }"/>/<c:out value="${ post.payName }"/></p>
                            </div>
<!-- 	                        <div class="panel-footer">
	                            <h3>300만원/월급</h3>
	                            <button class="btn btn-lg">자세히 보기</button>
	                        </div> -->
	                         <div class="card-footer text-center"><a class="btn btn-primary" href="#!" style="background-color: red;">자세히 보기</a></div>
	                        </div>      
	                    </div>
	                   </c:if>
	                    </c:forEach>
                    </div>
					
					<br>
					
                    <!-- 업종광고하단 (adCode = 2) -->
                    <div class="row">
                        <c:forEach var="post" items="${ requestScope.selectInAdPost }">
                        <c:if test="${ post.adCode eq 2 }">
	                    <div class="col-sm-4 col-xs-12">
	                        <div class="panel panel-default text-center">
	                        <div class="panel-heading">
	                            <h3><c:out value="${ post.jobName }"/></h3>
	                        </div>
	                       <%--  <div class="panel-body">
	                            <p><strong>지역</strong> <c:out value="${ post.locationName }"/></p>
	                            <p><strong>업종</strong> <c:out value="${ post.industryName }"/></p>
	                            <p><strong>직종</strong> <c:out value="${ post.jobName }"/></p>
	                            <p><strong>복리후생</strong> <c:out value="${ post.benefit }"/></p>
	                            <p><strong>급여</strong> <c:out value="${ post.payment }"/>/<c:out value="${ post.payName }"/></p>

	                        </div> --%>
	                        <div class="card-body" style = "text-align: center">
                            	<p class="card-text">
                            	<p><strong>지역</strong> <c:out value="${ post.locationName }"/></p>
                                <p><strong>업종</strong> <c:out value="${ post.industryName }"/></p>
                                <p><strong>직종</strong> <c:out value="${ post.jobName }"/></p>
                                <p><strong>복리후생</strong> <c:out value="${ post.benefit }"/></p>
                                <p><strong>급여</strong> <c:out value="${ post.payment }"/>/<c:out value="${ post.payName }"/></p>
                            </div>
	                        <!-- <div class="panel-footer">
	                            <h3>300만원/월급</h3>
	                            <button class="btn btn-lg">자세히 보기</button>
	                        </div> -->
	                         <div class="card-footer text-center"><a class="btn btn-primary" href="#!" style="background-color: red;">자세히 보기</a></div>
	                        </div>      
	                    </div>
	                    </c:if>
	                    </c:forEach>     
                      </div>
 
                <br>
                
                 <!-- 직종광고상단 (adCode = 3) -->
                    <div class="row">
                    <c:forEach var="post" items="${ requestScope.selectJobAdPost }">
                    <%-- <c:set var="ad1" value="${ requestScope.selectInAdPost }"/> --%>
                   	 <c:if test="${ post.adCode eq 3 }">
	                    <div class="col-sm-4 col-xs-12">
	                        <div class="panel panel-default text-center">
	                        <div class="panel-heading">
	                            <h3><c:out value="${ post.jobName }"/></h3>
	                        </div>
	                        <%-- <div class="panel-body">
	                            <p><strong>지역</strong> <c:out value="${ post.locationName }"/></p>
	                            <p><strong>업종</strong> <c:out value="${ post.industryName }"/></p>
	                            <p><strong>직종</strong> <c:out value="${ post.jobName }"/></p>
	                            <p><strong>복리후생</strong> <c:out value="${ post.benefit }"/></p>
	                            <p><strong>급여</strong> <c:out value="${ post.payment }"/>/<c:out value="${ post.payName }"/></p>
	                        </div> --%>
	                        <div class="card-body" style = "text-align: center">
                            	<p class="card-text">
                            	<p><strong>지역</strong> <c:out value="${ post.locationName }"/></p>
                                <p><strong>업종</strong> <c:out value="${ post.industryName }"/></p>
                                <p><strong>직종</strong> <c:out value="${ post.jobName }"/></p>
                                <p><strong>복리후생</strong> <c:out value="${ post.benefit }"/></p>
                                <p><strong>급여</strong> <c:out value="${ post.payment }"/>/<c:out value="${ post.payName }"/></p>
                            </div>
<!-- 	                        <div class="panel-footer">
	                            <h3>300만원/월급</h3>
	                            <button class="btn btn-lg">자세히 보기</button>
	                        </div> -->
	                         <div class="card-footer text-center"><a class="btn btn-primary" href="#!" style="background-color: red;">자세히 보기</a></div>
	                        </div>      
	                    </div>
	                   </c:if>
	                    </c:forEach>
                    </div>
                 
                 <!-- 직종광고상단 (adCode = 4) -->
                    <div class="row">
                    <c:forEach var="post" items="${ requestScope.selectJobAdPost }">
                    <%-- <c:set var="ad1" value="${ requestScope.selectInAdPost }"/> --%>
                   	 <c:if test="${ post.adCode eq 4 }">
	                    <div class="col-sm-4 col-xs-12">
	                        <div class="panel panel-default text-center">
	                        <div class="panel-heading">
	                            <h3><c:out value="${ post.jobName }"/></h3>
	                        </div>
	                        <%-- <div class="panel-body">
	                            <p><strong>지역</strong> <c:out value="${ post.locationName }"/></p>
	                            <p><strong>업종</strong> <c:out value="${ post.industryName }"/></p>
	                            <p><strong>직종</strong> <c:out value="${ post.jobName }"/></p>
	                            <p><strong>복리후생</strong> <c:out value="${ post.benefit }"/></p>
	                            <p><strong>급여</strong> <c:out value="${ post.payment }"/>/<c:out value="${ post.payName }"/></p>
	                        </div> --%>
	                        <div class="card-body" style = "text-align: center">
                            	<p class="card-text">
                            	<p><strong>지역</strong> <c:out value="${ post.locationName }"/></p>
                                <p><strong>업종</strong> <c:out value="${ post.industryName }"/></p>
                                <p><strong>직종</strong> <c:out value="${ post.jobName }"/></p>
                                <p><strong>복리후생</strong> <c:out value="${ post.benefit }"/></p>
                                <p><strong>급여</strong> <c:out value="${ post.payment }"/>/<c:out value="${ post.payName }"/></p>
                            </div>
<!-- 	                        <div class="panel-footer">
	                            <h3>300만원/월급</h3>
	                            <button class="btn btn-lg">자세히 보기</button>
	                        </div> -->
	                         <div class="card-footer text-center"><a class="btn btn-primary" href="#!" style="background-color: red;">자세히 보기</a></div>
	                        </div>      
	                    </div>
	                   </c:if>
	                    </c:forEach>
                    </div>
                
                <hr>
                <!-- 일반 공고 -->
                <div class="text-left">
                    <h2 style="font-family: BM;">검색 결과</h2>
                </div>
                
                <!--  데이터 베이스 결과값으로 div를 생성하여 공고 출력 -->
                <div class="row">
                    <!-- for-loop 으로 결과값 출력, 갯수를 파악하여 loop을 해야한다.-->
                   <c:forEach var="post" items="${ requestScope.selectPost }">
                   <c:if test="${ post.adCode eq 0 }">
                    <div class="col-lg-4 mb-4 mb-lg-0">
                        <div class="card h-100">
                            <h4 class="card-header" style = "text-align: center">
                            	<c:out value="${ post.jobName }"/>
                            </h4>
                            <div class="card-body" style = "text-align: center">
                            	<p class="card-text">
                            	<p><strong>지역</strong> <c:out value="${ post.locationName }"/></p>
                                <p><strong>업종</strong> <c:out value="${ post.industryName }"/></p>
                                <p><strong>직종</strong> <c:out value="${ post.jobName }"/></p>
                                <p><strong>복리후생</strong> <c:out value="${ post.benefit }"/></p>
                                <p><strong>급여</strong> <c:out value="${ post.payment }"/>/<c:out value="${ post.payName }"/></p>
                            </div>
                            <div class="card-footer text-center"><a class="btn btn-primary" href="#!" style="background-color: orange;">자세히 보기</a></div>
                        </div>
                    </div>
                    </c:if>
                  </c:forEach>
                </div>
                
                <!-- 상세공고 시 경력 조건 제외 -->
                 <div class="row">
                    <!-- for-loop 으로 결과값 출력, 갯수를 파악하여 loop을 해야한다.-->
                   <c:forEach var="post" items="${ requestScope.selectNormalPost }">
                   <c:if test="${ post.adCode eq 0 }">
                    <div class="col-lg-4 mb-4 mb-lg-0">
                        <div class="card h-100">
                            <h4 class="card-header" style = "text-align: center">
                            	<c:out value="${ post.jobName }"/>
                            </h4>
                            <div class="card-body" style = "text-align: center">
                            	<p class="card-text">
                            	<p><strong>지역</strong> <c:out value="${ post.locationName }"/></p>
                                <p><strong>업종</strong> <c:out value="${ post.industryName }"/></p>
                                <p><strong>직종</strong> <c:out value="${ post.jobName }"/></p>
                                <p><strong>복리후생</strong> <c:out value="${ post.benefit }"/></p>
                                <p><strong>급여</strong> <c:out value="${ post.payment }"/>/<c:out value="${ post.payName }"/></p>
                            </div>
                            <div class="card-footer text-center"><a class="btn btn-primary" href="#!" style="background-color: orange;">자세히 보기</a></div>
                        </div>
                    </div>
                    </c:if>
                  </c:forEach>
                </div>
                
                
                
                
                
            </div>
        </section>      
        <!-- footer -->
        <%@ include file="../common/footer.jsp" %> 
    </body>

</html>
    