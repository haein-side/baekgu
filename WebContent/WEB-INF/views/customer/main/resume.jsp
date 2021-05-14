<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>백구</title>
        <link rel="stylesheet" type="text/css" href="RESOURCES/CSS/CUSTOMER/resume.css">
        <link rel="stylesheet" href="RESOURCES/CSS/CUSTOMER/YJCSS/header2.css">
        
        <!-- <script type="text/javascript"
        src="http://code.jquery.com/jquery-1.9.1.min.js"></script> -->
        

    </head>

	<br>
    <body style="margin-top: 10%; z-index: 1;"  >
        	<%@ include file="../common/header2.jsp"%>



	<form style="margin:100px; padding:0; ">
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
                                        <span class="img"><img src="RESOURCES/IMAGES/백구로고.png" width="150" height="300"></span><br>
                                  
                                    </div>
                                </div>
                            </td>

                            <!--1. 회원가입시 DB입력받는 부분(이름,성별,생년월일)-->
                            <th scope="row" colspan="2" class="name">
                                <b style= "font-size: 30px;" >정주영</b>
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
                                        name="txtPhone"
                                        id="res_txt1"
                                        title="연락처"
                                        value="0000"
                                        class="inp4"
                                        style="width:80px;">
                                     	<b> - </b>   
                                    <input
                                        type="text"
                                        name="txtPhone"
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
                                        name="txtPhone"
                                        id="res_txt1"
                                        title="연락처"
                                        value="0000"
                                        class="inp4"
                                        style="width:80px;">
                                     	<b> - </b>   
                                    <input
                                        type="text"
                                        name="txtPhone"
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
                          <input type="radio" name="chk_info" value="W"> 여성
                           <input type="radio" name="chk_info" value="M"> 남성	
                        </td>
                </tr>
                
                
                <tr>
                    <!-- 3. 회원가입시 DB로 넘어오는 부분 (생년월일)) -->
                    <th scope="row">
                        <span class="txt">생년월일</span></th>
                    <td class="vamfix">
                   <div class="row">
            	<div class="col-md-3 mb-3" style="float:left;">
              		<input type="number" class="birthinfo" id="birthyear" min="1900" max="2021" step="1" value="1"  style="width:80px;" required>
              			<label>년</label>
            
            	</div>
            	
            	<div class="col-md-3 mb-3" style="float:left;">
              		     <select
                                    name="Month"
                                    id="Month"
                                    class="select"
                                    style="width:90px;"
                                    title="월">
                                    <option value="1" selected="">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                     <option value="7">7</option>
                                      <option value="8">8</option>
                                       <option value="9">9</option>
                                        <option value="10">10</option>
                                         <option value="11">11</option>
                                          <option value="12">12</option>
                                </select>
              		<label>월</label>
          
           		</div>
            	<div class="col-md-3 mb-3" style="float:left;">
                	     <select
                                    name="Day"
                                    id="Day"
                                    class="select"
                                    style="width:90px;"
                                    title="일">
                                    <option value="1" selected="">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                     <option value="7">7</option>
                                      <option value="8">8</option>
                                       <option value="9">9</option>
                                        <option value="10">10</option>
                                         <option value="11">11</option>
                                          <option value="12">12</option>
                                </select>
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
                            name="textarea"
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
                            name="txtSimpleSelfIntro"
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

                        
                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_16" value="44">
                                <label for="res_chk6_16">장비 보유</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_17" value="5">
                                <label for="res_chk6_17">원동기면허 소지</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_18" value="3">
                                <label for="res_chk6_18">운전 능숙</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_19" value="7">
                                <label for="res_chk6_19">즉시 근무 가능</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_20" value="8">
                                <label for="res_chk6_20">야간 근무 가능</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_21" value="12">
                                <label for="res_chk6_21">주말 근무 가능</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_22" value="9">
                                <label for="res_chk6_22">교대 근무 가능</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_23" value="11">
                                <label for="res_chk6_23">지방 근무 가능</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_24" value="10">
                                <label for="res_chk6_24">기숙사 생활 가능</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_25" value="13">
                                <label for="res_chk6_25">인근 거주 가능</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_26" value="46">
                                <label for="res_chk6_26">파트타임 가능</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_27" value="4">
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

                            <li><input type="radio" name="radio1" id="radio1" value="22">
                                <label for="res_chk6_1">학력사항 없음</label>
                            </li>

                            <li><input type="radio" name="radio1" id="radio1" value="16">
                                <label for="res_chk6_2">초등학교 졸업</label>
                            </li>

                            <li><input type="radio" name="radio1" id="radio1" value="25">
                                <label for="res_chk6_3">중학교 졸업</label>
                            </li>

                            <li><input type="radio" name="radio1" id="radio1" value="27">
                                <label for="res_chk6_4">고등학교 졸업</label>
                            </li>

                            <li><input type="radio" name="radio1" id="radio1" value="29">
                                <label for="res_chk6_5">대학교 2-3년제 졸업</label>
                            </li>

                            <li><input type="radio" name="radio1" id="radio1" value="31">
                                <label for="res_chk6_6">대학교 4년제 졸업</label>
                            </li>

                            <li><input type="radio" name="radio1" id="radio1" value="35">
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

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_1" value="22">
                                <label for="res_chk6_1">식당/서빙</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_2" value="16">
                                <label for="res_chk6_2">매장관리</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_3" value="25">
                                <label for="res_chk6_3">상담/영업</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_4" value="27">
                                <label for="res_chk6_4">건설/생산/기술</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_5" value="29">
                                <label for="res_chk6_5">간호/요양</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_6" value="31">
                                <label for="res_chk6_6">교사/강사</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_7" value="35">
                                <label for="res_chk6_7">운전/배달</label>
                            </li>
                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_8" value="36">
                                <label for="res_chk6_7">사무/경리</label>
                            </li>
                             <li><input type="checkbox" name="chkAdvantage" id="res_chk6_9" value="37">
                                <label for="res_chk6_7">기타</label>
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
            type="checkbox"
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
    <p>작성일 :
        <b>2021년 4월 30일</b>
        <span>작성자 :
            <b>정주영</b></span></p>
</div>
<!-- 작성일 및 이름 끝 -->

<!-- 이력서 등록 버튼 -->
<div class="tc.mt40" style="text-align:center;">
    <a href="enter.html" class="button2" style="margin-top:10px; width:200px; height:50px; text-align:center; line-height: 50px; font-size: 20px;">이력서 등록하기</a>
</div>



</form>


<br>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>