<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>지원하기</title>
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/YJCSS/style.css" type="text/css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body style="overflow-x: hidden; overflow-y: hidden; margin: auto;">

    <div style="margin-top: 50px;">
        <p>
            <h2 style="text-align: center; color: black;">회사명 : </h2>
            <h1 style="text-align: center;"></h1>
        </p>
    </div>
    <br>
    <div style="margin-top: 10px;">
        <textarea cols="75" rows="15" name="reportDetail" id="txtContents" class="fr_txta" onkeyup="limitTextNum('txtContents',500,'txtContentsspan')" style="resize:none;"></textarea>
    </div>
    <div align="center">
    	<input type="hidden" id="postCode" name="postCode" value="${ requestScope.postInfo.postCode }"/>
        <button class="report_button" name="btn" id="btnReport" type="submit">
            <script>
									
				var postCode = document.getElementById("postCode").value;
				console.log(postCode);
			
				/* 신고하기 버튼 onclick 이벤트 */
				function report(){
	
					window.open("${ pageContext.servletContext.contextPath }/user/report?postCode="+${ requestScope.postInfo.postCode }, "a", "width=550, height=700, left=450, top=200");
	
	     	    }
			</script> 
            <h2>신고하기</h2>
        </button>
    </div>
</body>
</html>