<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>허위정보 신고하기</title>
    <style>
        .header{ 

            border: 1px solid black;
            background: orange;
        }

        .fr_txta{
            width: 600px;
            height: 300px;
        }
        @font-face {

        src : url("../fonts/BMEuljiro10yearslater.ttf");

        font-family:"jua";

        }
        .blind{
            font-family: "jua";
        }

        @font-face {

        src : url("../fonts/NanumBarunGothic.ttf");

        font-family:"nan";

        }
        .btn1{
            background: orange;
            font-family: "jua";
        }

    </style>
</head>

<body class="none">
<form action="${ pageContext.servletContext.contextPath }/user/report" method="get">
    <div id="FRWrap">
        <div class="header">
            <h1 class="bg_fr fr_tit" align="center"><span class="blind">공고 신고하기</span></h1>
        </div>

        <div class="body">
            <!-- 상단 -->
            <div class="top">
                <div id="left">
                    
                </div>
                <div class="" align="center">
                    <br>
                <span id="hyun" style="font-family: nan;font-size: x-large;">
                
                        허위 또는 부적한 광고 내용으로 의심되거나 이로 인해 피해를 입으신 경우<br>
                        신고 해주시면 관리자 확인을 거쳐 신속히 조치하겠습니다.
                </span>
                </div>
                <div class="right" style="font-family: nan;">
                    <div class="bg_fr fr_txt"></div>
                    <div class="fr_list">
                        <ul align="center" >
                            <li style="display: block; font-size: x-large;"><strong>정확한 사실</strong>만을 기재해 주시기 바랍니다.</li>
                            <li style="display: block; font-size: x-large;"><strong>연락처(휴대폰 번호)</strong>를 반드시 기재해 주시기 바랍니다.</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- //상단 -->

            <!-- 테이블 -->
            <div class="tbl" style="font-family: nan;">
                <div class="mtxt" align="center" style="font-size: x-large;">입력한 연락처는 사실 확인 용도로만 사용되며<br> 신고 업체에는 노출되지 않습니다.</div>
                <br>
                <table width="100%" border="2PX" cellspacing="0" cellpadding="0" summary="허위정보 신고를 위해 정보를 기재해 주시기 바랍니다.">
                    <colgroup>
                        <col width="107">
                        <col width="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>공고제목</th>
                            <td align="center">
                                신규 최대 10만원 지급 이벤트/원하는요일/단기알바/초보가능/쿠팡플렉스
                            </td>
                        </tr>
                        <tr>
                            <th>공고 등록자</th>
                            <td align="center">쿠팡 주식회사</td>
                        </tr>
                        <tr>
                            <th>신고사유 <span class="bg_fr fr_point"></span></th>
                            <td>
                                <select name="reportCode">
                                    <option value="">------- 선택 -------</option>
                                    
                                    <option value="1" >허위과장광고</option>
                                    
                                    <option value="2" >유흥광고</option>
                                    
                                    <option value="4" >유사상호 광고</option>
                                    
                                    <option value="5" >차별 광고 (장애인/성/나이)</option>
                                    
                                    <option value="6" >최저임금 위반광고</option>
                                    
                                    <option value="7" >마감광고</option>
                                    
                                    <option value="8" >기타</option>
                                    
                                </select>
                            </td>
                        </tr>
                        <tr class="last" style="font-family: nan;">
                            <th>신고내용 <span class="bg_fr fr_point"></span></th>
                            <td>
                                <textarea cols="75" rows="15" name="reportDetail" id="txtContents" class="fr_txta" onkeyup="limitTextNum('txtContents',500,'txtContentsspan')" style="resize:none;"></textarea>
                                <p align="center">신고내용을 30자 이내로 입력해주세요.<!-- (<span id="txtContentsspan">0</span>/30자)--> </p> 
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- //테이블 -->
            <div style="margin-top:10px;padding:10px;border:1px solid #d7d7d7;background-color:#f8f8f8;font-family: nan;">
                <p style="font-size:11px;line-height:18px;color:#777"><strong style="font-size:12px;color:#777">개인정보 수집 및 이용 안내</strong><br />1. 수집 항목 : 휴대폰 번호<br />2. 수집·이용목적 : 민원 처리 및 결과 회신<br />3. 보유 및 이용기간 : 3년(소비자의 불만 또는 분쟁처리에 관한 기록에 의거)</p>
                <div style="padding-top:10px"><label for="" style="font-size:11px;color:#f26522"><input type="checkbox" name="check" style="width:13px;height:13px;margin:0;vertical-align:-2px;" /> 위 ‘개인정보 수집 및 이용’ 에 동의합니다.</label></div>
            </div>
        </div>
        <div class="footer" align="center">
            <input type="button" class="btn1" style="font: 30px jua; width: 200px; height: 80px;" value="신고하기"/>
            <input type="button" class="btn1"  style="font: 30px jua; width: 200px; height: 80px; margin-left: 100px;" value="나가기"/>
    	</div>
    </div>
</form>
</body>
</html>