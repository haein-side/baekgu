<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>채용공고 리스트</title>
         <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/baekgu/RESOURCES/CSS/CUSTOMER/postlist.css" rel="stylesheet" />
           <link rel="stylesheet" href="/baekgu/RESOURCES/CSS/CUSTOMER/YJCSS/header2.css"type="text/css">
        
        
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
       

<script type=‘text/javascript’ src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

        
<!-- width 100% 크기 조정, header size needed -->
        
       	<h1 align="center" style="height:1%; margin-top:100px">상품에 따른 광고 위치 예시</h1>

        <!-- Page Content-->
          <section class="py-5">
            <div class="container" style="margin-top : 30px;">
                <!-- Page Heading/Breadcrumbs-->
                <h1 style ="font-family:BM; color:orange; margin-top: 5%;">
                    채용 공고                   
                </h1>
                <hr>
                
                <!-- premium ads -->
                <div class="text-left">
                
                </div>
                <!-- Container  -->
                <div class="container-fluid">
                
                
                    <!-- 업종광고상단 (adCode = 1) -->
                    <div class="row">
                    
                       <div class="col-sm-4 col-xs-12">
                           <div class="panel panel-default text-center">
                           <div class="panel-heading">
                               <h3>업종 광고 상단</h3>
                           </div>
                           
                           <div class="card-body" style = "text-align: center">
                               <p class="card-text">
                               <p><strong>지역</strong> ""</p>
                                <p><strong>업종</strong> ""</p>
                                <p><strong>직종</strong> ""</p>
                                <p><strong>복리후생</strong> ""</p>
                                <p><strong>급여</strong> ""</p>
                            </div>
<!--                            <div class="panel-footer">
                               <h3>300만원/월급</h3>
                               <button class="btn btn-lg">자세히 보기</button>
                           </div> -->
                            <div class="card-footer text-center">
                            <a class="btn btn-primary" style="background-color: red;" href="#">
                            자세히 보기
                            </a>
                            </div>
                           </div>      
                       </div>
                       
                       </div>
                      
                       
                    </div>
               
               <br>
               
                    <!-- 업종광고하단 (adCode = 2) -->
                    <div class="row">
                       <div class="col-sm-4 col-xs-12">
                           <div class="panel panel-default text-center">
                           <div class="panel-heading">
                               <h3>업종 광고 하단</h3>
                           </div>
                          
                           <div class="card-body" style = "text-align: center">
                               <p class="card-text">
                               <p><strong>지역</strong> ""</p>
                                <p><strong>업종</strong> ""</p>
                                <p><strong>직종</strong> ""</p>
                                <p><strong>복리후생</strong> ""</p>
                                <p><strong>급여</strong> ""</p>
                            </div>
                           
                            <div class="card-footer text-center">
                            <a class="btn btn-primary" style="background-color: red;" href="#">
                            자세히 보기
                            </a>
                            </div>
                           </div>      
                       </div>
                       
                       
                            
                      </div>
 
                <br>
                
                 <!-- 직종광고상단 (adCode = 3) -->
                    <div class="row">
                    
                    
                       
                       <div class="col-sm-4 col-xs-12">
                           <div class="panel panel-default text-center">
                           <div class="panel-heading">
                               <h3>직종 광고 상단</h3>
                           </div>
                           
                           <div class="card-body" style = "text-align: center">
                               <p class="card-text">
                               <p><strong>지역</strong> ""</p>
                                <p><strong>업종</strong> ""</p>
                                <p><strong>직종</strong> ""</p>
                                <p><strong>복리후생</strong> ""</p>
                                <p><strong>급여</strong> ""</p>
                            </div>
                            <div class="card-footer text-center"><a class="btn btn-primary" href="#!" style="background-color: red;">자세히 보기</a></div>
                           </div>      
                       </div>
                      
                       
                    
                       
                       
                    </div>
                 
                 <!-- 직종광고상단 (adCode = 4) -->
                    <div class="row">
                       
                       <div class="col-sm-4 col-xs-12">
                           <div class="panel panel-default text-center">
                           <div class="panel-heading">
                               <h3>직종 광고 하단</h3>
                           </div>
                           
                           <div class="card-body" style = "text-align: center">
                               <p class="card-text">
                               <p><strong>지역</strong> ""</p>
                                <p><strong>업종</strong> ""</p>
                                <p><strong>직종</strong> ""</p>
                                <p><strong>복리후생</strong> ""</p>
                                <p><strong>급여</strong> ""</p>
                            </div>
                            <div class="card-footer text-center"><a class="btn btn-primary" href="#!" style="background-color: red;">자세히 보기</a></div>
                           </div>      
                       </div>
                      
                       
                    </div>
                
                <hr>
                <!-- 일반 공고 -->
                <div class="text-left">
                    <h2 style="font-family: BM;">일반공고</h2>
                </div>
                
            </div>
        </section>     
        
    </body>
</html>
    