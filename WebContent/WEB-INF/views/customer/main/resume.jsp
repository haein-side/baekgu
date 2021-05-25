<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>백구</title>
        <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/resume.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/YJCSS/header2.css">
        
        <!-- <script type="text/javascript"
        src="http://code.jquery.com/jquery-1.9.1.min.js"></script> -->
        
    </head>

	<br>
    <body style="margin-top: 10%; z-index: 1;"  >
        	<%@ include file="../common/header2.jsp"%>



	<form style="margin:100px; padding:0; " action="${ pageContext.servletContext.contextPath }/user/resume" method="get">
        <!-- 개인정보 입력 폼 -->
        <div class="tblst mt10">
            <fieldset>
                <legend>개인정보입력폼</legend>
                <table summary="연락처,이메일,거주지 입력">
                    <caption>개인정보입력</caption>
                    <colgroup>
                        <col width="178">
                        <col width="120">
                        <col width="*">
                    </colgroup>
                    <tbody>

                        <!-- 첫 단락 시작 이력서 사진 및 사진 등록 -->
                        <tr class="first">

                            <td rowspan="7" class="userinfo" style=" padding-left: 10px; padding-right: 10px;">
                                <div class="picbx">
                                    <div id="div" class="pic" style="display:block;">
                                        <span class="img"><img src="${ pageContext.servletContext.contextPath }/RESOURCES/IMAGES/백구로고.png" width="150" height="300"></span><br>
                                  
                                    </div>
                                </div>
                            </td>

                            <!--1. 회원가입시 DB입력받는 부분(이름,성별,생년월일)-->
                            <th scope="row" colspan="2" class="name">
                                <b style= "font-size: 30px;" ><c:out value="${ sessionScope.loginUserInfo.userName }"/></b>
                            </th>
                        </tr>


                        <tr>

                            <!-- 2. 회원가입 DB입력받는 부분(연락처)-->
                            <th scope="row" rowspan="2">
                                <span class="txt">연락처</span></th>
                            <td> 
                            	  <select
                                    name="HPhone1"
                                    id="HPhone1"
                                    class="select"
                                    style="width:90px;"
                                    title="연락처 앞자리">
                                    <option value="010" selected="">010</option>
                                    <option value="011">011</option>
                                    <option value="016">016</option>
                                    <option value="017">017</option>
                                    <option value="018">018</option>
                                    <option value="019">019</option>
                                </select>	
                            		<b> - </b>
                                    <input
                                        type="text"
                                        name="txtPhone1"
                                        id="res_txt1"
                                        title="연락처"
                                        value="0000"
                                        class="inp4"
                                        style="width:80px;">
                                     	<b> - </b>   
                                    <input
                                        type="text"
                                        name="txtPhone2"
                                        id="res_txt2"
                                        title="연락처2"
                                        value="0000"
                                        class="inp4"
                                        style="width:80px;">   
                                     
                              </td>      
                            

                    
       
                </tr>
                <tr></tr>
                <tr>
                    <!-- 비상연락망 -->
                    <th scope="row">
                        <span class="txt">비상연락망</span></th>
                       <td> 
                            	  <select
                                    name="HPhone2"
                                    id="HPhone1"
                                    class="select"
                                    style="width:90px;"
                                    title="연락처 앞자리">
                                    <option value="010" selected="">010</option>
                                    <option value="011">011</option>
                                    <option value="016">016</option>
                                    <option value="017">017</option>
                                    <option value="018">018</option>
                                    <option value="019">019</option>
                                </select>	
                            		<b> - </b>
                                    <input
                                        type="text"
                                        name="txtSubPhone1"
                                        id="res_txt1"
                                        title="연락처"
                                        value="0000"
                                        class="inp4"
                                        style="width:80px;">
                                     	<b> - </b>   
                                    <input
                                        type="text"
                                        name="txtSubPhone2"
                                        id="res_txt2"
                                        title="연락처2"
                                        value="0000"
                                        class="inp4"
                                        style="width:80px;">   
                                     
                              </td>      
                            
                </tr>
                
                <tr>
                    <!-- 3. 회원가입시 DB로 넘어오는 부분 (성별) -->
                    <th scope="row">
                        <span class="txt">성별</span></th>
                        <td class="vamfix">
                          <input type="radio" name="gender" value="여"> 여성
                           <input type="radio" name="gender" value="남"> 남성	
                        </td>
                </tr>
                
                
                <tr>
                    <!-- 3. 회원가입시 DB로 넘어오는 부분 (생년월일)) -->
                    <th scope="row">
                        <span class="txt">생년월일</span></th>
                    <td class="vamfix">
                   <div class="row">
            	<div class="col-md-3 mb-3" style="float:left;">
              		<input type="number" name = "userBday1" class="birthinfo" id="birthyear" min="1900" max="2021" step="1" value="1"  style="width:80px;" required>
              			<label>년</label>
            
            	</div>
            	
            	<div class="col-md-3 mb-3" style="float:left;">
              		     <select
                                    name = "userBday2"
                                    id="Month"
                                    class="select"
                                    type="number"
                                    style="width:90px;"
                                    title="월">
                                    <option value="01" selected="">1</option>
                                    <option value="02">2</option>
                                    <option value="03">3</option>
                                    <option value="04">4</option>
                                    <option value="05">5</option>
                                    <option value="06">6</option>
                                     <option value="07">7</option>
                                      <option value="08">8</option>
                                       <option value="09">9</option>
                                        <option value="10">10</option>
                                         <option value="11">11</option>
                                          <option value="12">12</option>
                                </select>
              		<label>월</label>
          
           		</div>
            	<div class="col-md-3 mb-3" style="float:left;">
                	     <input type="number" name = "userBday3" class="birthinfo" id="birthyear" min="1" max="31" step="1" value="1"  style="width:80px;" required>
                	<label>일</label>
            	</div>
            </div>
                    </td>
                </tr>

                <tr>
                    <!-- 3. 회원가입시 DB로 넘어오는 부분 (거주지) -->
                    <th scope="row">
                        <span class="txt">거주지</span></th>
                    <td class="vamfix">
                        <input
                            type="text"
                            name="userAddress"
                            id="res_txt4"
                            title="거주지"
                            value="서울시 송파구 "
                            class="inp4"
                            style="width:600px;">
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
        <table summary="간단 자기소개, 특이사항">
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
                        <input
                            type="text"
                            name="resumeLetter"
                            id="txtSimpleSelfIntro"
                            value=""
                            class="inp4"
                            style="width:98%; height: 70px;"
                            onfocus="$(this).css('backgroundImage','none');"
                            onkeyup="InputCharCount(this,'spanSICharCnt',100)">
                        <ul class="caution_lst mt7">
                            <li>
                                <span class="txef">※</span>
                                경력 및 사회활동 등 자신을 어필할 수 있는 문구를 간단하게 입력해 주세요.</li>
                        </ul>
                    </td>
                </tr>
                
                <!-- 특이사항 부분 시작 -->
                <tr>
                    <th scope="row">
                        <span class="txt">특이사항</span></th>
                    <td>
                        <ul class="resume__forte-list">

                        
                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_16" value="장비보유">
                                <label for="res_chk6_16">장비 보유</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_17" value="원동기면허소지">
                                <label for="res_chk6_17">원동기면허 소지</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_18" value="운전능숙">
                                <label for="res_chk6_18">운전 능숙</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_19" value="즉시근무가능">
                                <label for="res_chk6_19">즉시 근무 가능</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_20" value="야간근무가능">
                                <label for="res_chk6_20">야간 근무 가능</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_21" value="주말근무가능">
                                <label for="res_chk6_21">주말 근무 가능</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_22" value="교대근무가능">
                                <label for="res_chk6_22">교대 근무 가능</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_23" value="지방근무가능">
                                <label for="res_chk6_23">지방 근무 가능</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_24" value="기숙사생활가능">
                                <label for="res_chk6_24">기숙사 생활 가능</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_25" value="인근거주가능">
                                <label for="res_chk6_25">인근 거주 가능</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_26" value="파트타임가능">
                                <label for="res_chk6_26">파트타임 가능</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_27" value="자차출퇴근가능">
                                <label for="res_chk6_27">자차 출퇴근 가능</label>
                            </li>

                        </ul>
                        <ul class="caution_lst">
                            <li>
                                <span class="txef">※</span>
                                자신이 속해있는 항목을 선택해주세요. (중복 선택 가능)</li>
                        </ul>
                    </td>
                </tr>
                  <!-- 특이사항 부분  끝 -->
                  
                  <!-- 학력사항 부분 시작   -->
                <tr>
                    <th scope="row">
                        <span class="txt">학력사항</span></th>
                    <td>
                        <ul class="resume__forte-list">

                            <li><input type="radio" name="degree" id="radio1" value="1">
                                <label for="res_chk6_1">학력사항 없음</label>
                            </li>

                            <li><input type="radio" name="degree" id="radio1" value="2">
                                <label for="res_chk6_2">초등학교 졸업</label>
                            </li>

                            <li><input type="radio" name="degree" id="radio1" value="3">
                                <label for="res_chk6_3">중학교 졸업</label>
                            </li>

                            <li><input type="radio" name="degree" id="radio1" value="4">
                                <label for="res_chk6_4">고등학교 졸업</label>
                            </li>

                            <li><input type="radio" name="degree" id="radio1" value="5">
                                <label for="res_chk6_5">대학교 2-3년제 졸업</label>
                            </li>

                            <li><input type="radio" name="degree" id="radio1" value="6">
                                <label for="res_chk6_6">대학교 4년제 졸업</label>
                            </li>

                            <li><input type="radio" name="degree" id="radio1" value="7">
                                <label for="res_chk6_7">대학원 이상</label>
                            </li>
                        </ul>
                      
                    </td>
                </tr>
                  <!-- 학력사항 부분 끝   -->
                  
                 <!-- 경력사항 부분 시작   -->
                <tr>
                    <th scope="row">
                        <span class="txt">경력사항</span></th>
                    <td>
                        <ul class="resume__forte-list">

                            <li><input type="checkbox" name="exp" id="res_chk6_1" value="1">
                                <label for="res_chk6_1">경력 없음</label>
                            </li>

                            <li><input type="checkbox" name="exp" id="res_chk6_2" value="2">
                                <label for="res_chk6_2">1년 이하</label>
                            </li>

                            <li><input type="checkbox" name="exp" id="res_chk6_3" value="3">
                                <label for="res_chk6_3">1년 이상</label>
                            </li>

                            <li><input type="checkbox" name="exp" id="res_chk6_4" value="4">
                                <label for="res_chk6_4">2년 이상</label>
                            </li>

                            <li><input type="checkbox" name="exp" id="res_chk6_5" value="5">
                                <label for="res_chk6_5">3년 이상</label>
                            </li>

                            <li><input type="checkbox" name="exp" id="res_chk6_6" value="6">
                                <label for="res_chk6_6">4년 이상</label>
                            </li>

                            <li><input type="checkbox" name="exp" id="res_chk6_7" value="7">
                                <label for="res_chk6_7">5년 이상</label>
                            </li>

                        </ul>
                     
                    </td>
                </tr>
              <!-- 경력사항 부분 끝    -->
            </tbody>
        </table>
    </fieldset>
</div>





<br>
<br>
<br>

<!-- 정보동의 시작 -->
<div class="res_campaign" style="text-align:center">

    <div class="box_check">
        <input
            type="checkbox",                                          
            class="inp_campaign"
            name="chkUprightAgree"
            id="chkUprightAgree"
            value="1"
            onclick="FnUprightAgree('')">
        <label for="chkUprightAgree">
            <b>정보 동의 및 위의 모든 기재사항은 사실과 다름없음을 확인합니다.</b>
        </label>
    </div>
</div>
<!-- 정보동의 끝 -->
<br>
<!-- 작성일 및 이름 시작 -->

<!-- 날짜 및 이름은 DB에서 넘어와야함. -->
<div class="res_dateEnd" style="text-align:center ">
<c:set var="today" value="<%=new java.util.Date()%>" />
<!-- 현재년도 -->
<c:set var="year"><fmt:formatDate value="${today}" pattern="yyyy" /></c:set> 
<!-- 현재월 -->
<c:set var="month"><fmt:formatDate value="${today}" pattern="MM" /></c:set> 
<!-- 현재일 -->
<c:set var="day"><fmt:formatDate value="${today}" pattern="dd" /></c:set> 
    <p>작성일 :
        <b>
		<c:out value="${year}" />년
		<c:out value="${month}" />월
        <c:out value="${day}" />일
        
        </b>
        <span>작성자 :
            <b><c:out value="${ sessionScope.loginUserInfo.userName }"/></b></span></p>
</div>
<!-- 작성일 및 이름 끝 -->

<!-- 이력서 등록 버튼 -->
<div class="tc.mt40" style="text-align:center;">
    <button class="button2" type="submit" style="margin-top:10px; width:200px; height:50px; text-align:center; line-height: 50px; font-size: 20px;">이력서 등록하기</button>
</div>



</form>


<br>
	<%@ include file="../common/footer2.jsp"%>
</body>
</html>