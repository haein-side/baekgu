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
        
        
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 

   
    </head>
    <body>
   <jsp:include page="../common/header.jsp"/>
         

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

                <!-- 관리자 및 직원 등록하기 -->
                <div class="row">
                    <div class="col-lg-12">
                      <section class="panel">
                        <header class="panel-heading">
                          관리자 및 직원 등록하기
                        </header>
                        <div class="panel-body">
                          <div class="form">
                            <form class="form-validate form-horizontal" id="feedback_form" 
                                  action="${ pageContext.servletContext.contextPath }/admin/signup" method="post" >
                            <input type="hidden" name="idregist" value="fail" />
                              <div class="form-group ">
                                <label for="cname" class="control-label col-lg-2">이름 </label>
                                <div class="col-lg-10">
                                  <input class="form-control" id="adminName" name="adminName"  type="text" required/>
                                </div>
                              </div>
                              <div class="form-group ">
                                <label for="cemail" class="control-label col-lg-2">아이디</label>
                                <div class="col-lg-10">
                                  <input class="form-control " id="adminId" name="adminId" type="id" required/>
                       	          
                                  <input type="button" value="중복확인"  class="btn btn-primary" id="duplicationCheck"/>
                                </div>
                              </div>
                             <div class="form-group ">
                                <label for="curl" class="control-label col-lg-2">비밀번호</label>
                                <div class="col-lg-10">
                                  <input class="form-control " id="adminPwd"  name="enteredPwd" type="password" required/>
                                </div> 
                              </div>
                              <div class="form-group ">
                                <label for="cname" class="control-label col-lg-2">이메일 </label>
                                <div class="col-lg-10">
                                  <input class="form-control" id="adminEmail" name="adminEmail" type="text" required/>
                                </div>
                              </div>
                              <!-- <div class="form-group ">
                                <label for="ccomment" class="control-label col-lg-2">등록일</label>
                                <div class="col-lg-10">
                                  <input class="form-control " id="adminDate" name="adminDate" required/>
                                </div>
                              </div> -->
                              <div class="form-group ">
                                <label for="cname" class="control-label col-lg-2">권한</label>
                                <div class="col-lg-10">
                                  <input class="form-control" id="adminRole" name="adminRole" type="text" placeholder="예시)서브관리자" required/>
                                </div>
                              </div>
                              <div class="form-group">
                                <div class="col-lg-offset-2 col-lg-10">
                                  <button class="btn btn-primary" type="submit" onclick="return ManagerList()">등록</button>
                                </div>
                              </div>
                            </form>
                          </div>
          
                        </div>
                      </section>
                    </div>
                  </div>   
                   <!-- 관리자 및 직원 등록   -->
            </section>
         
            
   <!--  등록하기 버튼 클릭 시  리스트로 넘어감. -->
      <script>
     </script>

   
  <script>
   <!-- 아이디 중복확인용  -->
    var gbl_data = 0;
   	$(function(){
   		
   		$("#duplicationCheck").click(function(){
   			var checkId = $("#adminId").val();
   				
   			$.ajax({
   				url:"/baekgu/adminIdCheck",
   				type:"post",
   				data : {
   						adminId : checkId
   				},
   				success: function(data,textStatus,xhr) {
   					if(data == 'success') {
   						alert("현재 아이디를 사용하셔도 됩니다.");
   						gbl_data = 1;
   					}  else {
   						alert("중복된 아이디입니다. 다른 아이디를 사용해주세요.");
   						$("#adminId").select();
   					}
   					
   				},
   				error : function(xhr,status,error) {
   					console.log(error);
   				}
   			})
   		});
   		

   	});
   	
			function ManagerList() {
			
				if (gbl_data == 1) {
					const link = "${ pageContext.servletContext.contextPath }/admin/search";
					location.href = link;
				} else if(gbl_data == 0){
					alert("중복체크를 하고 오세요.");
					return false;

				}
			}
		</script>
   
 
       
    </body> </html> 