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

                            <td rowspan="8" class="userinfo">
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
                               <b>010-1234-5678</b>
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
                        <b>010-0000-0000</b>
                    </td>
                </tr>

                <tr>
                    <!-- 3. 회원가입시 DB로 넘어오는 부분 (성별) -->
                    <th scope="row">
                        <span class="txt">성별</span></th>
                    <td class="vamfix">
                        <b>여</b>
                    </td>
                </tr>

                <tr>
                    <!-- 3. 회원가입시 DB로 넘어오는 부분 (생년월일)) -->
                    <th scope="row">
                        <span class="txt">생년월일</span></th>
                    <td class="vamfix">
                        <b>1997년 11월 29일</b>
                    </td>
                </tr>

                <tr>
                    <!-- 3. 회원가입시 DB로 넘어오는 부분 (거주지) -->
                    <th scope="row">
                        <span class="txt">거주지</span></th>
                    <td class="vamfix">
                        <b>서울시 송파구</b>
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
                        <b>안녕하세요 더조은아카데미에서 6개월 과정을 수료한 뒤,,,</b>
                    </td>
                </tr>
                <tr>
                    <th scope="row">
                        <span class="txt">특이사항</span></th>
                    <td>
                        <ul class="resume__forte-list">

                            <!-- <li><input type="checkbox" name="chkAdvantage" id="res_chk6_1" value="22">
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
                            </li> -->

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


<br>
<!-- 정보동의 시작 -->
<div class="res_campaign" style="text-align:center">

    <div class="box_check">
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

<!-- 이력서 수정 버튼 -->
<div class="tc mt40" style="text-align:center">
    <a href="resume.html" class="button2">이력서 수정하기</a>
</div>

</div>

</form>

<br>
<br>
<br>

</body>
</html>