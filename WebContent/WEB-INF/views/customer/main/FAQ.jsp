<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <title>고객문의</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

        <link rel="stylesheet" type="text/css" href="RESOURCES/CSS/CUSTOMER/FAQbootstrap.css"/>

	
        <script type="text/javascript" src="RESOURCES/JS/CUSTOMER/FAQjquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="RESOURCES/JS/CUSTOMER/FAQbootstrap.min.js"></script>
        <link rel="stylesheet" href="RESOURCES/CSS/CUSTOMER/YJCSS/header2.css"
	        type="text/css"> 
    </head>
    <body>

      <%@ include file="../common/header2.jsp"%> 

<div class="container" style="margin-top: 15%; z-index: 1;">

    <div class="page-header">
        <h1 style="font-family:BM; color: orange;">무엇을 도와드릴까요?</h1>
    </div>

    <div
        id="panel-group"
        class="accordion"
        style="text-align: center; font-family:Nanum; height: 200px; background-color: #e9e9ea;">
        <br>
       <h4>궁금한 질문들이 있었다면 아래 '자주 묻는 질문' 을 확인하시면 됩니다 !
            <br>
                <br>
                    '자주 묻는 질문' 에 궁금한게 없으시다면 백구에게 전화주세요 !
                    <br>
                        <br>
                            <strong>고객센터 : 02-109-1009</strong>
                            <br>
                                (운영시간 : 09:00 ~ 18:00)
                            </h4>
                    </div>
            <!-- FAQ 시작 ! -->
            
                <br/>
                <br/>
                <br/>

		<div class="page-header">
			<h1 style="font-family: BM; color: orange;">자주 묻는 질문들</h1>
		</div>
		
	 <div class="panel-group" id="accordion">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
                Q. 회원가입은 어떻게 하나요 ?
                </a>
              </h4>
            </div>
            <div id="collapse1" class="panel-collapse collapse in">
              <div class="panel-body">
                네 , 가능합니다.
            </div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
                Q. 백구는 언제나 존재하나요 ? 
              </a>
              </h4>
            </div>
            <div id="collapse2" class="panel-collapse collapse">
              <div class="panel-body">
                네 존재합니다.
            </div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
                Q. 탈퇴 어떻게 하죠 ? 
              </a>
              </h4>
            </div>
            <div id="collapse3" class="panel-collapse collapse">
              <div class="panel-body">
             	탈퇴 할 수 없습니다.
            </div>
            </div>
          </div>
        </div>

                <style>
                    .faqHeader {
                        font-size: 27px;
                        margin: 20px;
                    }

                    
            
                 
                </style>

            
        </div>
           <%@ include file="../common/footer.jsp" %> 
        </body>
    </html>