<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>채용공고 리스트</title>
         <!-- Core theme CSS (includes Bootstrap)-->
        <link href="RESOURCES/CSS/CUSTOMER/postlist.css" rel="stylesheet" />
    </head>
    <body>
        
        <!-- Page Content-->
        <section class="py-5">
            <div class="container">
                <!-- Page Heading/Breadcrumbs-->
                <h1>
                    채용 공고                   
                </h1>
                <!-- width 57.8%크기 조정, 브라우저별로 사이즈가 다른지 불확실 -->
                <div style="height: 48px;">
                    <ol class="breadcrumb mb-4" style="position: fixed; width: 58.3%; z-index: 10000;">
                        <li class="breadcrumb-item active"  >검색결과 : 지역-강남구 / 직종-서빙 / 기간-한달이하</li>
                    </ol>
                    <span class="breadcrumb-item" style="position: fixed ; width: 57.8%; z-index: 10000;"><a href="index.html" style="color: white; float: right; margin-top: 30px;" >재검색하기</a></span>
                </div>
                
                <!-- Image Header-->
                <img class="img-fluid rounded mb-4" src="https://via.placeholder.com/1200x300" alt="..." />
                <!--  데이터 베이스 결과값으로 div를 생성하여 공고 출력 -->
                <div class="row">
                    <!-- for-loop 으로 결과값 출력-->
                    <div class="col-lg-4 mb-4 mb-lg-0">
                        <div class="card h-100">
                            <h4 class="card-header">일자리 타이틀1</h4>
                            <div class="card-body"><p class="card-text">일자리 간략한 설명(급여, 시간, 위치)</p></div>
                            <div class="card-footer"><a class="btn btn-primary" href="#!" style="background-color: orange;">자세히 보기</a></div>
                        </div>
                    </div>
                    <div class="col-lg-4 mb-4 mb-lg-0">
                        <div class="card h-100">
                            <h4 class="card-header">일자리 타이틀2</h4>
                            <div class="card-body"><p class="card-text">일자리 간략한 설명(급여, 시간, 위치)</p></div>
                            <div class="card-footer"><a class="btn btn-primary" href="#!">자세히 보기</a></div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card h-100">
                            <h4 class="card-header">일자리 타이틀3</h4>
                            <div class="card-body"><p class="card-text">일자리 간략한 설명(급여, 시간, 위치)</p></div>
                            <div class="card-footer"><a class="btn btn-primary" href="#!">자세히 보기</a></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <!-- for-loop 으로 결과값 출력-->
                    <div class="col-lg-4 mb-4 mb-lg-0">
                        <div class="card h-100">
                            <h4 class="card-header">일자리 타이틀1</h4>
                            <div class="card-body"><p class="card-text">일자리 간략한 설명(급여, 시간, 위치)<br><br><br></p></div>
                            <div class="card-footer"><a class="btn btn-primary" href="#!">자세히 보기</a></div>
                        </div>
                    </div>
                    <div class="col-lg-4 mb-4 mb-lg-0">
                        <div class="card h-100">
                            <h4 class="card-header">일자리 타이틀2</h4>
                            <div class="card-body"><p class="card-text">일자리 간략한 설명(급여, 시간, 위치)</p></div>
                            <div class="card-footer"><a class="btn btn-primary" href="#!">자세히 보기</a></div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card h-100">
                            <h4 class="card-header">일자리 타이틀3</h4>
                            <div class="card-body"><p class="card-text">일자리 간략한 설명(급여, 시간, 위치)</p></div>
                            <div class="card-footer"><a class="btn btn-primary" href="#!">자세히 보기</a></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <!-- for-loop 으로 결과값 출력-->
                    <div class="col-lg-4 mb-4 mb-lg-0">
                        <div class="card h-100">
                            <h4 class="card-header">일자리 타이틀1</h4>
                            <div class="card-body"><p class="card-text">일자리 간략한 설명(급여, 시간, 위치)<br><br><br></p></div>
                            <div class="card-footer"><a class="btn btn-primary" href="#!">자세히 보기</a></div>
                        </div>
                    </div>
                    <div class="col-lg-4 mb-4 mb-lg-0">
                        <div class="card h-100">
                            <h4 class="card-header">일자리 타이틀2</h4>
                            <div class="card-body"><p class="card-text">일자리 간략한 설명(급여, 시간, 위치)</p></div>
                            <div class="card-footer"><a class="btn btn-primary" href="#!">자세히 보기</a></div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card h-100">
                            <h4 class="card-header">일자리 타이틀3</h4>
                            <div class="card-body"><p class="card-text">일자리 간략한 설명(급여, 시간, 위치)</p></div>
                            <div class="card-footer"><a class="btn btn-primary" href="#!">자세히 보기</a></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <!-- for-loop 으로 결과값 출력-->
                    <div class="col-lg-4 mb-4 mb-lg-0">
                        <div class="card h-100">
                            <h4 class="card-header">일자리 타이틀1</h4>
                            <div class="card-body"><p class="card-text">일자리 간략한 설명(급여, 시간, 위치)<br><br><br></p></div>
                            <div class="card-footer"><a class="btn btn-primary" href="#!">자세히 보기</a></div>
                        </div>
                    </div>
                    <div class="col-lg-4 mb-4 mb-lg-0">
                        <div class="card h-100">
                            <h4 class="card-header">일자리 타이틀2</h4>
                            <div class="card-body"><p class="card-text">일자리 간략한 설명(급여, 시간, 위치)</p></div>
                            <div class="card-footer"><a class="btn btn-primary" href="#!">자세히 보기</a></div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card h-100">
                            <h4 class="card-header">일자리 타이틀3</h4>
                            <div class="card-body"><p class="card-text">일자리 간략한 설명(급여, 시간, 위치)</p></div>
                            <div class="card-footer"><a class="btn btn-primary" href="#!">자세히 보기</a></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <!-- for-loop 으로 결과값 출력-->
                    <div class="col-lg-4 mb-4 mb-lg-0">
                        <div class="card h-100">
                            <h4 class="card-header">일자리 타이틀1</h4>
                            <div class="card-body"><p class="card-text">일자리 간략한 설명(급여, 시간, 위치)<br><br><br></p></div>
                            <div class="card-footer"><a class="btn btn-primary" href="#!">자세히 보기</a></div>
                        </div>
                    </div>
                    <div class="col-lg-4 mb-4 mb-lg-0">
                        <div class="card h-100">
                            <h4 class="card-header">일자리 타이틀2</h4>
                            <div class="card-body"><p class="card-text">일자리 간략한 설명(급여, 시간, 위치)</p></div>
                            <div class="card-footer"><a class="btn btn-primary" href="#!">자세히 보기</a></div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card h-100">
                            <h4 class="card-header">일자리 타이틀3</h4>
                            <div class="card-body"><p class="card-text">일자리 간략한 설명(급여, 시간, 위치)</p></div>
                            <div class="card-footer"><a class="btn btn-primary" href="#!">자세히 보기</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
    </body>
</html>
    