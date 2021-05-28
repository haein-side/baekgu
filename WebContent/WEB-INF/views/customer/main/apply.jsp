<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>지원하기</title>
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/YJCSS/style.css" type="text/css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(function(){
			//alert("${ postCode }");
			
		
			$("#btnApply").click(function(){
				
				const postCode = $("#postCode").val();
				
				console.log(postCode);
				//alert('postCode');
				
				$.ajax({
					url:"${ pageContext.servletContext.contextPath }/user/apply",
					type:"post",
					data :{	postCode : postCode },
					success:function(data, status, xhr){
						
						alert("공고 지원에 성공하였습니다.");
						window.close();
						window.onunload = refreshParent;							
							/* 부모창 reload 시키기 */
						 	function refreshParent() {
						        window.opener.location.reload();
						    }
					},
					error:function(xhr, status, error){
						alert("공고 지원에 실패하였습니다. 다시 지원해주세요.");
						window.close();

					}
				});
			});
		});
	</script>

</head>
<body style="overflow-x: hidden; overflow-y: hidden;">

    <div style="margin-top: 50px;">
        <p>
            <h2 style="text-align: center; color: black;">회사명 : </h2>
            <h1 style="text-align: center;">김씨네 식당</h1>
        </p>
    </div>
    <br>
    <div style="margin-top: 10px;">
        <p style="text-align: center;">
            원하는 곳이 <b>김씨네 식당</b>이 맞으신가요?
        </p>
    </div>
    <div align="center">
    	<!-- <form action="${ pageContext.servletContext.contextPath }/post/apply" method="get"> -->
    	<input type="hidden" id="postCode" name="postCode" value="${ postCode }"/>
        <button class="jione_button" name="btn" id="btnApply" type="submit">
            <h2>이력서 넣기</h2>
<!--  	 		<script>
             function apply(){
                 window.open("${ pageContext.servletContext.contextPath }/post/apply?postCode="+${requestScope.postInfo.postCode}, "a", "width=400, height=500, left=500, top=250");
             }
        </script> -->
        </button>
    </div>
</body>
</html>