<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>백구</title>
        <link rel="stylesheet" type="text/css" href="RESOURCES/CSS/CUSTOMER/resume.css">
        <!-- <script type="text/javascript"
        src="http://code.jquery.com/jquery-1.9.1.min.js"></script> -->

    </head>
    <br>
    <br>
    <br>

    <body marginwidth="0" marginheight="0" style="height: auto; width: 1000px; margin-left: 500px;"   >
<<<<<<< HEAD
    <%@ include file="../common/header.jsp" %> 

=======
	 <%@ include file="../common/header.jsp" %> 
>>>>>>> branch 'master' of https://github.com/109SilverTown/baekgu.git
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

                            <td rowspan="7" class="userinfo">
                                <div class="picbx">
                                    <div id="div" class="pic" style="display:block;">
                                        <span class="img"><img src="RESOURCES/IMAGES/백구로고.png" width="150" height="200"></span><br>
                                  
                                    </div>
                                </div>
                            </td>

                            <!--1. 회원가입시 DB입력받는 부분(이름,성별,생년월일)-->
                            <th scope="row" colspan="2" class="name">
                                <b>정주영</b>
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
                                </select><input
                                    type="text"
                                    name="HPhone2"
                                    id="HPhone2"
                                    title="연락처 가운데자리"
                                    value="2775"
                                    class="inp4 tc ml5"
                                    style="width:58px;"
                                    maxlength="4"><input
                                    type="text"
                                    name="HPhone3"
                                    id="HPhone3"
                                    title="연락처 끝자리"
                                    value="3242"
                                    class="inp4 tc ml5"
                                    style="width:58px;"
                                    maxlength="4">

                            </span>

                        </div>
                    </td>
                </tr>
                <tr></tr>
                <tr>
                    <!-- 비상연락망 -->
                    <th scope="row">
                        <span class="txt">비상연락</span></th>
                    <td class="vamfix">
                        <input
                            type="text"
                            name="txtEmail"
                            id="res_txt1"
                            title="비상연락망"
                            value="010-0000-0000"
                            class="inp4"
                            style="width:328px;">
                    </td>
                </tr>
                <tr>
                    <!-- 3. 회원가입시 DB로 넘어오는 부분 (성별) -->
                    <th scope="row">
                        <span class="txt">성별</span></th>
                    <td class="vamfix">
                        <li  style="list-style: none; float: left;"><input type="checkbox" name="res_gender" id="res_gender" value="">
                            <label for="res_ch1">남</label>
                        </li>

                        <li style="list-style: none; float: left;"><input type="checkbox" name="res_gender" id="res_gender" value="">
                            <label for="res_ch1">여</label>
                        </li>
                    </td>
                </tr>
                <tr>
                    <!-- 3. 회원가입시 DB로 넘어오는 부분 (생년월일)) -->
                    <th scope="row">
                        <span class="txt">생년월일</span></th>
                    <td class="vamfix">
                        <input
                            type="text"
                            name="res_BDY"
                            id="res_txt3"
                            title="생년월일"
                            value="1997년 11월 29일"
                            class="inp4"
                            style="width:328px;">
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
                            style="width:328px;">
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
                <tr>
                    <th scope="row">
                        <span class="txt">특이사항</span></th>
                    <td>
                        <ul class="resume__forte-list">

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_1" value="22">
                                <label for="res_chk6_1">초등학교 졸업</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_2" value="16">
                                <label for="res_chk6_2">중학교 졸업</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_3" value="25">
                                <label for="res_chk6_3">고등학교 졸업</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_4" value="27">
                                <label for="res_chk6_4">대학교 2-3년제 졸업</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_5" value="29">
                                <label for="res_chk6_5">대학교 4년제 졸업</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_6" value="31">
                                <label for="res_chk6_6">뭐적지</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_7" value="35">
                                <label for="res_chk6_7">뭐적지</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_8" value="36">
                                <label for="res_chk6_8">관련 자격증 소유</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_9" value="14">
                                <label for="res_chk6_9">모든 시간 가능</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_10" value="17">
                                <label for="res_chk6_10">관련 분야 경력있음.</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_11" value="39">
                                <label for="res_chk6_11">등등</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_12" value="23">
                                <label for="res_chk6_12">등등</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_13" value="18">
                                <label for="res_chk6_13">등등</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_14" value="40">
                                <label for="res_chk6_14">등등</label>
                            </li>

                            <li><input type="checkbox" name="chkAdvantage" id="res_chk6_15" value="41">
                                <label for="res_chk6_15">등등</label>
                            </li>

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
             
            </tbody>
        </table>
    </fieldset>
</div>
<!-- 두번째 단락 끝 -->

<br>
<br>
<br>

<!-- 세번째 단락 시작 ( 이력서 공개 및 비공개 여부 ) -->
<h2 class="mt30"><img src="" alt=""></h2>
<fieldset>
    <legend>이력서설정</legend>
    <div class="tblst vamfix mt10">
        <link rel="stylesheet" href="/css/jquery-ui.css">
        <table summary="공개여부 체크">
            <caption>이력서설정</caption>
            <colgroup>
                <col width="178">
                <col width="*">
            </colgroup>
            <tbody>
                <tr class="first">
                    <th scope="row">
                        <span class="txt">공개여부</span></th>
                    <td>
                        <input
                            type="radio"
                            name="rdoOpenResumeDiv"
                            id="res_rdo7_1"
                            value="Y"
                            onclick="fnOpenResume('Y');"
                            checked="">
                        <label for="res_rdo7_1">공개</label>
                        <input
                            type="radio"
                            name="rdoOpenResumeDiv"
                            id="res_rdo7_2"
                            value="N"
                            class="ml25"
                            onclick="fnOpenResume('N');">
                        <label for="res_rdo7_2">비공개</label>
                        <p class="mt5">
                            <span class="txef2">※</span>
                            이력서를 공개하시면, 입사지원을 하지 않아도 인사담당자에게 직접 연락을 받을 수 있습니다.</p>
                    </td>
                </tr>

                <style type="text/css">
                    #ui-datepicker-div {
                        z-index: 20 !important;
                    }
                </style>

            </tbody>
        </table>
    </div>
</fieldset>
<!-- 세번째 단락 끝 -->
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
<div class="res_dateEnd" style="text-align:center">
    <p>작성일 :
        <b>2021년 4월 30일</b>
        <span>작성자 :
            <b>정주영</b></span></p>
</div>
<!-- 작성일 및 이름 끝 -->

<!-- 이력서 등록 버튼 -->
<div class="tc mt40" style="text-align:center">
    <a href="enter.html" class="button2">이력서 등록하기</a>
</div>

</div>

</form>

<br>
<br>
<br>
   <%@ include file="../common/footer.jsp" %> 
</body>
</html>