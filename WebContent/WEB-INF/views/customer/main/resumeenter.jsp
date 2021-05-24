<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>백구</title>
        <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/YJCSS/resume.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/YJCSS/header2.css"
	       type="text/css">
	    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/resume.css">
	      
    </head>
 
    <br>
	
    <body style="margin-top: 10%; z-index: 1;">
    		<c:if test="${ sessionScope.loginBusinessMember eq null }">
				<%@ include file="../common/header2.jsp"%>
			</c:if>        
		<!-- 개인정보 입력 폼 -->
        <form style="margin:100px;">
        <div class="tblst mt10">
            <fieldset>
                <legend>기본이력서</legend>
                <table summary="연락처,이메일,거주지 입력">
                    
                    <colgroup>
                        <col width="178">
                        <col width="120">
                        <col width="*">
                    </colgroup>
                    <tbody>

                        <!-- 첫 단락 시작 이력서 사진 및 사진 등록 -->
                       <tr class="first">

                            <td rowspan="8" class="userinfo" style=" padding-left: 10px; padding-right: 10px;">
                                <div class="picbx">
                                    <div id="div" class="pic" style="display:block;">
                                        <span class="img"><img src="${ pageContext.servletContext.contextPath }/RESOURCES/IMAGES/백구로고.png" width="150" height="300"></span><br>
                                  
                                    </div>
                                </div>
                            </td>

                            <!--1. 회원가입시 DB입력받는 부분(이름,성별,생년월일)-->
                            <th scope="row" colspan="2" class="name">
                                <b style= "font-size: 30px;" >${ resumeInfo.userName }</b>
                            </th>
                        </tr>

                        <tr>

                            <!-- 2. 회원가입 DB입력받는 부분(연락처)-->
                            <th scope="row" rowspan="2">
                                <span class="txt">연락처</span></th>
                            <td>
                               <b>${ resumeInfo.userPhone }</b>
                            </td>    
                        
                        </tr>
                    </td>
               
                </tr>
                <tr></tr>
                <tr>  
                <tr>
                    <!-- 비상연락망 -->
                    <th scope="row">
                        <span class="txt">비상연락</span></th>
                    <td class="vamfix">
                        <b>${ resumeInfo.resumeSubphone }</b>
                    </td>
                </tr>

                <tr>
                    <!-- 3. 회원가입시 DB로 넘어오는 부분 (성별) -->
                    <th scope="row">
                        <span class="txt">성별</span></th>
                    <td class="vamfix">
                        <b>${ resumeInfo.userGender }</b>
                    </td>
                </tr>

                <tr>
                    <!-- 3. 회원가입시 DB로 넘어오는 부분 (생년월일)) -->
                    <th scope="row">
                        <span class="txt">생년월일</span></th>
                    <td class="vamfix">
                        <b>${ resumeInfo.userBday }</b>
                    </td>
                </tr>
          	
          	
                <tr>
                    <!-- 3. 회원가입시 DB로 넘어오는 부분 (거주지) -->
                    <th scope="row">
                        <span class="txt">거주지</span></th>
                    <td class="vamfix">
                        <b>${ resumeInfo.userAddress }</b>
                    </td>
                </tr>
                

            </tbody>
        </table>
    </fieldset>
</div>
<!-- 첫번째 단락 끝 -->

<br>
<br>
<br>

<!-- 두번째 단락 시작 -->
<h2 class="mt25"><img src="" alt=""></h2>
<div class="tblst mt10">
    <fieldset>
        <legend>개인정보입력폼</legend>
        <table summary="간단 자기소개,특이사항">
            <caption>개인정보입력</caption>
            <colgroup>
                <col width="178">
                <col width="*">
            </colgroup>
            <tbody>

                <tr>
                    <th scope="row">
                        <span class="txt">간단 자기소개</span></th>
                    <td>
                        <b>${ resumeInfo.resumeLetter }</b>
                    </td>
                </tr>
                  <!-- 특이사항 시작 -->
                <tr>
              
                    <th scope="row">
                        <span class="txt">특이사항</span></th>
                    <td class="vamfix">
                        <d>${ resumeInfo.resumeAdvantage }</d>         
                    </td>
                </tr>
                  <!-- 특이사항 끝 -->
                  
                  
                  <!-- 학력사항 시작  -->
                      <tr>
                    <th scope="row">
                        <span class="txt">학력사항</span></th>
					<td class="vamfix">
                        
                        <c:choose>
							    <c:when test="${resumeInfo.degreeCode eq 1 }">
							    <p>학력사항 없음</p>
							    </c:when>
							    <c:when test="${resumeInfo.degreeCode eq 2 }">
								<p>초등학교 졸업</p>
							    </c:when>
							    <c:when test="${resumeInfo.degreeCode eq 3 }">
								<p>중학교 졸업</p>
							    </c:when>
							    <c:when test="${resumeInfo.degreeCode eq 4 }">
								<p>고등학교 졸업</p>
							    </c:when>
							    <c:when test="${resumeInfo.degreeCode eq 5 }">
								<p>대학교 2-3년제 졸업</p>
							    </c:when>
							    <c:when test="${resumeInfo.degreeCode eq 6 }">
								<p>대학교 4년제 졸업</p>
							    </c:when>
							    <c:when test="${resumeInfo.degreeCode eq 7 }">
							    <p>대학원 이상</p>
							    </c:when>
							</c:choose>
                           
                    </td>
                </tr>
                  <!-- 학력사항 끝  -->
                  
                  
                   <!-- 경력사항 시작  -->
                      <tr>
                    <th scope="row">
                        <span class="txt">경력사항</span></th>
                        <td class="vamfix">
                        <c:choose>
							    <c:when test="${resumeInfo.expCode eq 1 }">
							    <p>경력 없음</p>
							    </c:when>
							    <c:when test="${resumeInfo.expCode eq 2 }">
								<p>1년 이하</p>
							    </c:when>
							    <c:when test="${resumeInfo.expCode eq 3 }">
								<p>1년 이상</p>
							    </c:when>
							    <c:when test="${resumeInfo.expCode eq 4 }">
								<p>2년 이상</p>
							    </c:when>
							    <c:when test="${resumeInfo.expCode eq 5 }">
								<p>3년 이상</p>
							    </c:when>
							    <c:when test="${resumeInfo.expCode eq 6 }">
								<p>4년 이상</p>
							    </c:when>
							    <c:when test="${resumeInfo.expCode eq 7 }">
							    <p>5년 이상</p>
							    </c:when>
							</c:choose>
                        
                        
                                 
                    </td>
                </tr>
               <!-- 경력사항 끝  -->
            </tbody>
        </table>
    </fieldset>
</div>
<!-- 두번째 단락 끝 -->

<br>
<br>
<br>


<!-- 정보동의 시작 -->
<div class="res_campaign" style="text-align:center">

    <c:if test="${ sessionScope.loginBusinessMember eq null }">
		<div class="box_check">
        	<label for="chkUprightAgree">
            	<b>정보 동의 및 위의 모든 기재사항은 사실과 다름없음을 확인합니다.</b>
        	</label>
    	</div>
	</c:if>
	
	<c:if test="${ sessionScope.loginBusinessMember ne null }">
		<div class="box_check">
        	<label for="chkUprightAgree">
            	<b>위의 모든 기재사항은 백구사이트 내, 
            		<br>지원자 확인 용도외엔 사용할 수 없음을 확인합니다.
            	</b>
            	
        	</label>
    	</div>
	</c:if>
	
</div>
<!-- 정보동의 끝 -->
<br>
<!-- 작성일 및 이름 시작 -->

<!-- 날짜 및 이름은 DB에서 넘어와야함. -->
<div class="res_dateEnd" style="text-align:center">
    <p>작성일 :
        <b>${ resumeInfo.resumeWriteDate }</b><br>
        <span>작성자 :
            <b>${ resumeInfo.userName }</b></span></p>
    <br><br>
    
    <c:if test="${ sessionScope.loginBusinessMember ne null }">
    	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    	<jsp:useBean id="now" class="java.util.Date" />
    	<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd" />
    	
		<p>열람일 :
        <b>${ today }</b>
        <br>
        <span>열람자 :
            <b>${ sessionScope.loginBusinessMember.bName }</b>(${ sessionScope.loginBusinessMember.CName })</span></p>
	</c:if>
</div>
<!-- 작성일 및 이름 끝 -->

<!-- 이력서 수정 버튼 -->
<c:if test="${ sessionScope.loginBusinessMember eq null }">
	<div class="tc mt40" style="text-align:center">
    	<a href="${ pageContext.servletContext.contextPath }/user/toResume" class="button2" style="margin-top:10px; width:200px; height:50px; text-align:center; line-height: 50px; font-size: 20px;">이력서 수정하기</a>
	</div>
</c:if>
			
</div>

</form>

<br>
<br>
<br>
<c:if test="${ sessionScope.loginBusinessMember eq null }">
	<%@ include file="../common/footer2.jsp"%>
</c:if>
</body>
</html>