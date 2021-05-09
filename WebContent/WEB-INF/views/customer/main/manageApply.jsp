<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="RESOURCES/CUSTOMER/styleMa.css" rel="stylesheet">
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>입사지원관리페이지</title>
    <style>
        /* .container {
            position:absolute;
            top: 30%;
            left: 30%;
        } */
        thead {background : orange}
    </style>
</head>


<body class="body">
    <div class="container" style=" top: 30%; left: 30%;">
     <div class="container-inside">
        <div class="col-sm-1 sidenav">
        </div>
        <div class="col-sm-10 text-left">
        <h1 style="font-family:BME; font-size: 50px;">입사지원관리</h1>
        <table border="0" width="800">
            <thead style= "font-family: BME; font-size:30px; font-weight: lighter;">
                <tr height="40">
                    <th>지원일</th>
                    <th>회사명</th>
                    <th>모집공고</th>
                    <th>지원취소</th>
                    <th>열람여부</th>
                </tr>
            </thead>
            <tbody align="center" style="font-family: icomoon; font-size:20px;">
                <tr height="40">
                    <td>2020.05.02</td>
                    <td>크린토피아</td>
                    <td><a href="https://www.naver.com/">세탁소 직원 모집합니다</td>
                    <td>
                        <form>
                            <input type="button" name="cancel" onclick="alert('정말 지원을 취소하시겠습니까?');" value="지원취소"
                           style="height:32px; width: 110px; font-size: 22px;"/>
                        </form>
                    </td>
                    <td>미열람</td>
                </tr>
            </tbody>
        </table>
    </div>
    </div>
    <div class="col-sm-1 sidenav">
    </div>   
</div>


 <!-- 푸터 시작 -->

<div class="footer">
    <footer>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-sm-4 col-md-3 item" style="float: left; width: 20%; padding:10px; margin-left:90px;">
                    <h3 style="font-family: BME; font-size: 32px; color: black; margin: 15px;">고객센터</h3>
                    <ul style="font-family: icomoon; font-size: 18px; list-style: none; padding-left:0px; color: black; line-height:30px; ">
                        <li>02-1234-5678</a></li>
                        <li>상담시간 09:00~18:00</a></li>
                        <li>토,일요일 및 공휴일은 휴무</a></li>
                        <!-- 자주 묻는 질문들 링크 넣어야 -->
                        <li><a href="#" style="color: black;">자주 묻는 질문들</a></li>
                    </ul>
                </div>
                <div class="col-sm-4 col-md-3 item" style="float: left; width: 20%; padding:10px;">
                    <h3 style="font-family: BME; font-size: 32px; color: black; margin: 15px;">광고문의</h3>
                    <ul style="font-family: icomoon; font-size: 18px; list-style: none; padding-left:0px; color: black;">
                        <li style="margin-left: 15px;">02-2345-6789</a></li>
                    </ul>
                </div>
                <div class="col-sm-4 col-md-3 item" style="float: left; width: 20%; padding:10px;">
                    <h3 style="font-family: BME; font-size: 32px; color: black; margin: 15px;">약관 및 방침</h3>
                    <ul style="font-family: icomoon; font-size: 18px; list-style: none; padding-left:0px; color: black; line-height:30px;">
                        <!-- 이용 약관 링크 넣어야 -->
                        <li style="margin-left: 15px;"><a href="https://member.findjob.co.kr/Stipulation/Stipulation.asp?faflag=615" style="color: black;">이용약관</a></li>
                        <!-- 개인정보처리방침 링크 넣어야 -->
                        <li style="margin-left: 15px;"><a href="https://member.findjob.co.kr/Stipulation/PrivacyRule.asp"  style="color: black;">개인정보처리방침</a></li>
                    </ul>
                </div>
                <div class="col-sm-4 col-md-3 item" style="float: left; width: 20%; padding:10px;">
                    <h3 style="font-family: BME; font-size: 32px; color: black; margin: 15px;">백구 소스코드</h3>
                    <ul style="list-style: none; padding-left:0px;">
                        <li style="margin-left: 15px;"><a href="https://github.com/109SilverTown"><img src="../입사지원관리/깃헙아이콘.png" width="40" ></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</div>


   
</body>
</html>