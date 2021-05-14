<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>백구</title>
        <link rel="stylesheet" type="text/css" href="RESOURCES/CSS/CUSTOMER/YJCSS/resume.css">
        <link rel="stylesheet" href="RESOURCES/CSS/CUSTOMER/YJCSS/header2.css"
	       type="text/css">
    </head>
 
    <br>

    <body style="margin-top: 10%; z-index: 1;">
			<%@ include file="../common/header2.jsp"%>
        <!-- 개인정보 입력 폼 -->
        <form style="margin:100px;">
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

                            <td rowspan="8" class="userinfo" style=" padding-left: 10px; padding-right: 10px;">
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
                  <!-- 특이사항 시작 -->
                <tr>
              
                    <th scope="row">
                        <span class="txt">특이사항</span></th>
                    <td>
                        <ul class="resume__forte-list">

						<!-- DB값 넘어야와야함.. -->                       

                        </ul>
                 
                    </td>
                </tr>
                  <!-- 특이사항 끝 -->
                  
                  
                  <!-- 학력사항 시작  -->
                      <tr>
                    <th scope="row">
                        <span class="txt">학력사항</span></th>
                    <td>
                        <ul class="resume__forte-list">

						<!-- DB값 넘어야와야함.. -->                       

                        </ul>
                 
                    </td>
                </tr>
                  <!-- 학력사항 끝  -->
                  
                  
                   <!-- 경력사항 시작  -->
                      <tr>
                    <th scope="row">
                        <span class="txt">경력사항</span></th>
                    <td>
                        <ul class="resume__forte-list">

						<!-- DB값 넘어야와야함.. -->                       

                        </ul>
                 
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
    <a href="resume.html" class="button2" style="margin-top:10px; width:200px; height:50px; text-align:center; line-height: 50px; font-size: 20px;">이력서 수정하기</a>
</div>

</div>

</form>

<br>
<br>
<br>
<%@ include file="../common/footer2.jsp"%>
</body>
</html>