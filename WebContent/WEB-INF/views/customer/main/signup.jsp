<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<link href="RESOURCES/CSS/CUSTOMER/signupbootstrap.css" rel="stylesheet">
<title>백세구인구직 백구</title>
</head>

<body class="bg-light">
  <!-- 헤더 부분 -->
   <%@ include file="../common/header.jsp" %> 

  <form>
    <div class="container">
      <div class="py-5 text-center" background="white">
        <h2 class="form-signin-heading">개인회원 가입</h2>
      </div>

      <div class="row">
        <div class="col-md-12">

          <div class="form-group">
            <label for="mobile" class="basiclabel">전화번호 (아이디로 사용됩니다.)</label>
            <input type="text" class="form-control" id="mobile" placeholder="(예 : 01012345678)" required>
            <small id="passwordHelp" class="form-text text-muted">특수문자(-) 없이 숫자로만 10자리 혹은 11자리를 입력하세요.</small>
          </div><br>
          <div class="form-group">
            <label for="password" class="basiclabel">비밀번호</label>
            <input type="password" class="form-control" id="password" placeholder="(예 : hgd610405)" aria-describedby="" required>
            <small id="passwordHelp" class="form-text text-muted">영어와 숫자를 사용하여 8자리 이상 입력하세요.<br>(대문자, 소문자 사용에 주의하세요.)</small>
          </div><br>
          <div class="form-group">
            <label for="name" class="basiclabel">이름</label>
            <input type="text" class="form-control" id="name" placeholder="(예 : 홍길동)" required>
            <small id="passwordHelp" class="form-text text-muted">이름을 입력해주세요.</small>
          </div><br>
          
          <div class="row">
            <div class="col-md-3 mb-3">
              <label for="birthyear" class="basiclabel">태어난 해</label><br>
              <input type="number" class="birthinfo" id="birthyear" min="1900" max="2021" step="1" value="1" placeholder="(예 : 1960)" style="width:150px" required>
              <label>년</label><br>
              <small class="form-text text-muted">(예 : 1970)</small>
            </div>
            <div class="col-md-3 mb-3">
              <label for="birthmonth" class="basiclabel">태어난 달</label><br>
              <input type="number" class="birthinfo" id="birthmonth" min="1" max="12" step="1" value="1" placeholder="(예 : 08)" style="width:150px" required>
              <label>월</label><br>
              <small class="form-text text-muted">(예 : 08)</small>
            </div>
              <div class="col-md-3 mb-3">
                <label for="birthday" class="basiclabel">태어난 날</label><br>
                <input type="number" class="birthinfo" id="birthday" min="1" max="31" step="1" value="1" placeholder="(예 : 08)" style="width:150px" required>
                <label>일</label><br>
                <small class="form-text text-muted">(예 : 31)</small>
              </div>
            </div><br>
            
            <div class="form-group">
              <label for="gender" class="basiclabel">성별</label><br><br>
              <input type="radio" id="gender" name="gender" class="genderset" value="male" style="font-size: 30px;"><label class="genderlabel">남</label>
              <input type="radio" id="gender" name="gender" class="genderset" value="famale"><label class="genderlabel">여</label>
            </div><br>
            
            <div class="form-group">
              <label for="address" class="basiclabel">주소</label>
              <input type="text" class="form-control" id="address" placeholder="(예 : 서울시 서초구 서초동 1310-15)" required>
              <small id="address" class="form-text text-muted">시, 구, 동까지 입력해주세요.</small><br>
              <input type="text" class="form-control" id="address" placeholder="(예 : 서초빌라 302호)">
              <small id="address" class="form-text text-muted">세부 주소(번지, 건물명, 호수)를 입력해주세요.</small>
            </div><br>
            
            <div>
              <label for="address" class="basiclabel">약관 동의하기</label>
              <div class="form-group">
                <div class="user_join_agree">
                  <input type="checkbox" name="user_all_agree" id="agreeChkAll" class="agrSeletAll" value=""><label for="agreeChkAll" style="font-size: 20px;">[모두 동의] 필수 이용 동의 약관 및 선택 사항에 모두 동의합니다.</label>
                </div>
                <div class="join_dot"></div>
                  <div class="user_join_agree agrSelect">
                   <input type="checkbox" name="Agree5" id="agreeChk_0" class="agrSelect" value="on"><label for="agreeChk_0" style="font-size: 19px;">[필수] 서비스 이용약관 동의</label>&nbsp;<a href="#" style="font-size: 20px;">내용보기</a>
                  </div>
                  <div class="user_join_agree agrSelect">
                    <input type="checkbox" name="Agree1" id="agreeChk_0" class="agrSelect" value="on"><label for="agreeChk_0" style="font-size: 19px;">[필수] 개인정보 제 3자 제공 동의(기업 및 고객)</label>&nbsp;<a href="#" style="font-size: 20px;">내용보기</a>
                  </div>
                  <div class="user_join_agree agrSelect">
                    <input type="checkbox" name="Agree1" id="agreeChk_0" class="agrSelect" value="on"><label for="agreeChk_0" style="font-size: 19px;">[선택] 이메일/SMS 수신 동의</label>&nbsp;<a href="#" style="font-size: 20px;">내용보기</a>
                  </div>
        		<button class="btn btn-lg btn-primary btn-block" type="submit" style="font-size: 30px; margin-left: 290px">들어가기</button>

          </div>
        </div>

  </form>
</div>

<!-- footer -->
<%@ include file="../common/footer.jsp" %> 

</body>
</html>