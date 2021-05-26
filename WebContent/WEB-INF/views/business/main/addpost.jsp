<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
	background: darkslategrey;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 450px
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	/* background-color: #f1f1f1; */
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
</style>
<script>
	/* job */

	function itemChange() {

		/* 		 var restaurant = ['요리사', '주방보조', '찬모', '설거지', '서빙', '카운터'];5
		 var market = ['편의점', '슈퍼/마트/대형마트', '쇼핑몰/아울렛/백화점', '찜질방/사우나', '농수산/청과/축산', '물류/재고', '기타/매장'];12
		 var counsel = ['인바운드/CS', '아웃바운드/TM', '일반/기술영업', '보험/금융상담', '방문판매', '부동산상담', '홍보/마켓팅'];19
		 var manufacture = ['제조/조립', '미싱/재단/섬유', '노무현장/조선소', '건설/공사/보수', '전기/시설관리', '배관/용접/머시닝', '식품제조/가공', '자동차정비/튜닝', '설치/수리', '생산/포장/검사', '가구/목공', '금형/프레스/성형'];31
		 var nursing = ['간호사/간호조무사', '간병/요양보호소', '의료기사', '기타의료직'];35
		 var teach = ['어린이집/유치원', '방문/학습지', '외국어', '기타교사/학원관리'];39
		 var driving = ['이사/택배/퀵/배송', '대리운전/승용차/일반', '버스/택시/승합차', '지입/차량용역', '화물/중장비/특수차', '음식점/식음료배달'];45
		 var account = ['경리/회계/인사', '일반사무/내근직', '기획/총무/관리', '구매/자재/물류', '서비스/안내'];50
		 var etc = ['미화/청소/세탁', '생활도우미/파출부', '경비/보안', '주유/세차/광택', '헤어피부/미용/애견', '웨딩/이벤트/스튜디오', '호텔/모텔/숙박', '주차관리/대리주차']; */

		var job = [ '요리사', '주방보조', '찬모', '설거지', '서빙', '커운터', '편의점',
				'슈퍼/마트/대형마트', '쇼핑몰/아울렛/백화점', '찜질방/사우나', '농수산/청과/축산', '물류/재고',
				'기타/매장', '인바운드/CS', '아웃바운드/TM', '일반/기술영업', '보험/금융상담', '방문판매',
				'부동산상담', '홍보/마켓팅', '제조/조립', '미싱/재단/섬유', '노무현장/조선소', '건설/공사/보수',
				'전기/시설관리', '배관/용접/머시닝', '식품제조/가공', '자동차정비/튜닝', '설치/수리',
				'생산/포장/검사', '가구/목공', '금형/프레스/성형', '간호사/간호조무사', '간병/요양보호소',
				'의료기사', '기타의료직', '어린이집/유치원', '방문/학습지', '외국어', '기타교사/학원관리',
				'이사/택배/퀵/배송', '대리운전/승용차/일반', '버스/택시/승합차', '지입/차량용역',
				'화물/중장비/특수차', '음식점/식음료배달', '경리/회계/인사', '일반사무/내근직', '기획/총무/관리',
				'구매/자재/물류', '서비스/안내', '미화/청소/세탁', '생활도우미/파출부', '경비/보안',
				'주유/세차/광택', '헤어피부/미용/애견', '웨딩/이벤트/스튜디오', '호텔/모텔/숙박',
				'주차관리/대리주차' ];

		var selectItem = $("#selectInustry").val();

		var changeItem;

		if (selectItem == "식당/서빙") {

			changeItem = job.slice(0, 5);

		} else if (selectItem == "매장관리") {

			changeItem = job.slice(6, 12);

		} else if (selectItem == "상담/영업") {

			changeItem = job.slice(13, 19);

		} else if (selectItem == "건설/생산/기술") {

			changeItem = job.slice(20, 31);

		} else if (selectItem == "간호/요양") {

			changeItem = job.slice(32, 35);

		} else if (selectItem == "교사/강사") {

			changeItem = job.slice(36, 39);

		} else if (selectItem == "운전/배달") {

			changeItem = job.slice(40, 45);

		} else if (selectItem == "사무/경리") {

			changeItem = job.slice(46, 50);

		} else if (selectItem == "기타") {

			changeItem = job.slice(51, 58);

		}

		$('#selectJob').empty();

		for (var count = 0; count < changeItem.length; count++) {

			var option = $("<option>" + changeItem[count] + "</option>");
			$('#selectJob').append(option);
		}

	}
</script>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="container-fluid text-center">
		<div class="row content">
			<form class="form-horizontal"
				action="${ pageContext.servletContext.contextPath }/business/insertpost"
				method="POST">
			<div class="col-sm-2 sidenav"></div>
				<div class="col-sm-10 text-left">
					<br> <br> <br>
					<h2 class="big">공고 등록</h2>
					<br> <br> <br>
					<div class="form-group">
						<label class="col-sm-8" style="font-size: xx-large;">인사
							담당자님의 정보를 입력해주세요.</label>
					</div>
					<hr>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">담당자 성함(필수)</label>
						<div class="col-sm-3">
							<input id="name" type="" class="form-control" name="name"
								placeholder="담당자명 입력">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">전화번호(필수)</label>
						<div class="col-sm-3">
							<input id="phone" type="text" class="form-control" name="phone"
								placeholder="ex) 010-xxxx-xxxx">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">이메일
							주소(필수)</label>
						<div class="col-sm-3">
							<input id="email" type="text" class="form-control" name="email"
								placeholder="이메일 주소">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">기업
							주소</label> <small>우편번호</small> <input type="button" value="검색"
							class="btn btn-yg" id="searchZipCode"> <br> <input
							type="text" name="zipCode" id="zipCode" readonly class="">
						<small>주소</small> <input type="text" name="address1" id="address1"
							readonly class=""> <small>상세주소</small> <input type="text"
							name="address2" id="address2" class="l">
					</div>
					<div class="col-sm-0 sidenav"></div>
					<br> <br> <br> <br> <br>
					<div class="form-group">
						<label class="col-sm-8" style="font-size: xx-large;">이떤일
							담당할 직원을 찾으시나요?</label>
					</div>
					<hr>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">모집분야명(업종)</label>
						<div class="col-sm-1">
							<select id="selectInustry" onchange="itemChange()"
								name="industry">
								<option selected>---전체---</option>
								<option>식당/서빙</option>
								<option>매장관리</option>
								<option>상담/영업</option>
								<option>건설/생산/기술</option>
								<option>간호/요양</option>
								<option>교사/강사</option>
								<option>운전/배달</option>
								<option>사무/경리</option>
								<option>기타</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">담당엄무(직종)</label>
						<div class="col-sm-1">


							<select id="selectJob" onchange="selectjob()" name="job">
								<option selected>---선택---</option>

							</select>
							<script>
								function selectjob() {

									var value = document
											.getElementById("selectJob").value;

									console.log(value);

								}
							</script>



						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">경력
							기간</label>
						<div class="col-sm-1">

							<select name="exp" id="" required class="">
								<option>----선택-----</option>
								<option value="1">경력 없음</option>
								<option value="2">1년 이하</option>
								<option value="3">1년 이상</option>
								<option value="4">2년 이상</option>
								<option value="5">3년 이상</option>
								<option value="6">4년 이상</option>
								<option value="7">5년 이상</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">학력</label>
						<div class="col-sm-1">

							<select name="degree" id="" required class="">
								<option>----선택-----</option>
								<option value="1">무관</option>
								<option value="2">초등학교 졸업</option>
								<option value="3">중학교 졸업</option>
								<option value="4">고등학교 졸업</option>
								<option value="5">대학교 2-3년제 졸업</option>
								<option value="6">대학교 4년제 졸업</option>
								<option value="7">대학원 이상</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<br> <br> <label class="col-sm-8"
							style="font-size: xx-large;">공고 정보를 입력해주세요.</label>
					</div>
					<hr>
					<div class="form-group">
						<br> <label for="inputEmail3" class="col-sm-2 control-label">공고
							제목을 작성해주세요.</label>
						<div class="col-sm-10">
							<input type="text" name="postTitle" style="width: 500px;"
								placeholder="공고 제목.">
						</div>
					</div>
					<div class="form-group">
						<br> <label for="inputEmail3" class="col-sm-2 control-label">공고
							내용을 작성해주세요.</label>
						<div class="col-sm-10">
							<input type="textarea" name="postContent" cols=85 rows=15
								style="width: 500px; height: 300px;" placeholder="공고 내용">
						</div>
					</div>
								  <div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">근무 지역</label>
									<div class="col-sm-1">
						<div class="dropdown">
							<select name="location" id="" class="selectpicker"
								data-style="btn-warning">
								<option>----선택----</option>
								<option value="1">무관</option>
								<option value="2">강남구</option>
								<option value="3">강동구</option>
								<option value="4">강북구</option>
								<option value="5">강서구</option>
								<option value="6">관악구</option>
								<option value="7">광진구</option>
								<option value="8">구로구</option>
								<option value="9">금천구</option>
								<option value="10">노원구</option>
								<option value="11">도봉구</option>
								<option value="12">동대문구</option>
								<option value="13">동작구</option>
								<option value="14">마포구</option>
								<option value="15">서대문구</option>
								<option value="16">서초구</option>
								<option value="17">성동구</option>
								<option value="18">성북구</option>
								<option value="19">송파구</option>
								<option value="20">양천구</option>
								<option value="21">영등포구</option>
								<option value="22">용산구</option>
								<option value="23">은평구</option>
								<option value="24">종로구</option>
								<option value="25">중구</option>
								<option value="26">중랑구</option>
							</select>
						</div>
					</div> 
					</div>
					
					<div class="form-group">
						<br> <label for="inputEmail3" class="col-sm-2 control-label">모집인원</label>
						<div class="col-sm-10">
							<input name="postTo" type='number' min='1' max='30' step='1' placeholder="숫자만 입력해주세요.">
						</div>
					</div>
					<div class="form-group">
						<br> <label for="inputEmail3" class="col-sm-2 control-label">온라인
							접수</label> <input type="checkbox" name="online" id="res_chk6_16"
							value="1"> <label for="res_chk6_16">온라인 접수 희망</label>
							<input type="checkbox" name="online" id="res_chk6_16"
							value="0"> <label for="res_chk6_16">온라인 접수 비희망</label>
					</div>
					<div class="form-group">
						<br> <label for="inputEmail3" class="col-sm-2 control-label">모집시작일
							~ 모집마감일</label>
						<div class="col-sm-6">
							<input type="date" name="startDate"> <label>~</label> <input
								type="date" name="endDate">
						</div>
					</div>
					<br>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">임금</label>
						<div class="col-sm-1">
							<select name="pay" id="" required="" class="">
								<option>--선택--</option>
								<option value="1">시급</option>
								<option value="2">일급</option>
								<option value="3">월급</option>
							</select> <label style="font-size: 15px;"><input type="text"
								name="payment" class="form-control" placeholder="정확한 임금을 적어주세요."></label>
						</div>
					</div>
					<br>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">근무
							형식</label>
						<div class="col-sm-1">
							<select name="contract" id="" required class="">
								<option>----선택-----</option>
								<option value="0">비정규직</option>
								<option value="1">정규직</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">연령(선택)</label>
						<div class="col-sm-1">
							<select name="age" id="" required class="">
								<option>--선택--</option>
								<option value="1">연령 무관</option>
								<option value="2">50세 이상</option>
								<option value="3">60세 이상</option>
								<option value="4">70세 이상</option>
								<option value="5">80세 이상</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">work_period</label>
						<div class="col-sm-1">
							<select name="period" id="" required class="">
								<option>----선택-----</option>
								<option value="1">무관</option>
								<option value="2">일주일 이하</option>
								<option value="3">일주일 이상</option>
								<option value="4">1개월 이상</option>
								<option value="5">3개월 이상</option>
								<option value="6">6개월 이상</option>
								<option value="7">1년 이상</option>
							</select>
						</div>
					</div>
					<br>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">근무
							요일</label>
						<div class="col-sm-6">
							<input type="checkbox" name="days" id="res_chk6_16" value="월요일">
							<label for="res_chk6_16">월요일</label> <input type="checkbox"
								name="days" id="res_chk6_17" value="화요일"> <label
								for="res_chk6_17">화요일</label> <input type="checkbox" name="days"
								id="res_chk6_18" value="수요일"> <label for="res_chk6_18">수요일</label>
							<input type="checkbox" name="days" id="res_chk6_19" value="목요일">
							<label for="res_chk6_19">목요일</label> <input type="checkbox"
								name="days" id="res_chk6_20" value="금요일"> <label
								for="res_chk6_20">금요일</label> <input type="checkbox" name="days"
								id="res_chk6_21" value="토요일"> <label for="res_chk6_21">토요일</label>
							<input type="checkbox" name="days" id="res_chk6_22" value="일요일">
							<label for="res_chk6_22">일요일</label>


						</div>

					</div>
					<br>

					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">우대사항</label>
						<div class="col-sm-6">
							<input type="checkbox" name="priority" id="res_chk6_16"
								value="장비보유"> <label for="res_chk6_16">장비 보유</label> <input
								type="checkbox" name="priority" id="res_chk6_17" value="원동기면허소지">
							<label for="res_chk6_17">원동기면허 소지</label> <input type="checkbox"
								name="priority" id="res_chk6_18" value="운전능숙"> <label
								for="res_chk6_18">운전 능숙</label> <input type="checkbox"
								name="priority" id="res_chk6_19" value="즉시근무가능"> <label
								for="res_chk6_19">즉시 근무 가능</label> <input type="checkbox"
								name="priority" id="res_chk6_20" value="야간근무가능"> <label
								for="res_chk6_20">야간 근무 가능</label> <input type="checkbox"
								name="priority" id="res_chk6_21" value="주말근무가능"> <label
								for="res_chk6_21">주말 근무 가능</label> <input type="checkbox"
								name="priority" id="res_chk6_22" value="교대근무가능"> <label
								for="res_chk6_22">교대 근무 가능</label> <br> <input
								type="checkbox" name="priority" id="res_chk6_23" value="지방근무가능">
							<label for="res_chk6_23">지방 근무 가능</label> <input type="checkbox"
								name="priority" id="res_chk6_24" value="기숙사생활가능"> <label
								for="res_chk6_24">기숙사 생활 가능</label> <input type="checkbox"
								name="priority" id="res_chk6_25" value="인근거주가능"> <label
								for="res_chk6_25">인근 거주 가능</label> <input type="checkbox"
								name="priority" id="res_chk6_26" value="파트타임가능"> <label
								for="res_chk6_26">파트타임 가능</label> <input type="checkbox"
								name="priority" id="res_chk6_27" value="자차출퇴근가능"> <label
								for="res_chk6_27">자차 출퇴근 가능</label>

						</div>

					</div>
					<div class="form-group">
						<br> <label for="inputEmail3" class="col-sm-2 control-label">복리후생</label>
						<div class="col-sm-10">
							<input type="text" name="benefit" style="width: 500px;"
								placeholder="복리후생" />
						</div>
					</div>
					<div class="form-group">
						` <label for="inputPassword3" class="col-sm-2 control-label">근무
							시간</label>
						<div class="col-sm-1">
							<select name="hours" id="" required class="">
								<option>--선택--</option>
								<option value="1">풀타임</option>
								<option value="2">새벽</option>
								<option value="3">오전</option>
								<option value="4">오후</option>
								<option value="5">저녁</option>
							</select>
						</div>
					</div>
					<br>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">성별(선택)</label>
						<div class="col-sm-1">
							<select name="gender" id="" required class="">
								<option>--선택--</option>
								<option value="무관">상관 없음</option>
								<option value="남자">남자</option>
								<option value="여자">여자</option>
							</select>
						</div>
					</div>
					<br>
					<div align="">
						<button type="submit" style="width: 100px; height: 50px;"
							class="btn btn-warning">등록</button>
					</div>
					<br>
					<br>
					<br>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
	<!-- 다음 우편번호 api -->
	<!-- key 발급 없이 무제한으로 이용이 가능하다. -->
	<!-- 아래 스크립트를 불러온 후 사용해야 한다. -->
	<!-- 참고 링크 : http://postcode.map.daum.net/guide -->
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		const $searchZipCode = document.getElementById("searchZipCode");;

		$searchZipCode.onclick = function() {

			//다음 우편번호 검색 창을 오픈하면서 동작할 콜백 메소드를 포함한 객체를 매개변수로 전달한다.
			new daum.Postcode({
				oncomplete : function(data) {
					//팝업에서 검색결과 항목을 클릭했을 시 실행할 코드를 작성하는 부분
					document.getElementById("zipCode").value = data.zonecode;
					document.getElementById("address1").value = data.address;
					document.getElementById("address2").focus();
				}
			}).open();
		}

	</script>
	<script>
		function validate(){
			
			var name = document.getElementById("name");
			var phone = document.getElementById("phone");
			var email = document.getElementById("email");
			
	         // name 유효성 검사
            	if(!chk(/^[가-힣]{1,}$/,name,"이름은 한글로 1글자 이상 입력하세요")){
          		 return false;
       		 } 
			
	          // phone 유효성 검사
	           if(!chk(/^[0-9]{10,11}$/,phone,"기업 전화번호는 특수문자(-) 없이 숫자로만 10자리 혹은 11자리를 입력하세요.")){
	            return false;
	         } 
	          
	           // Email 유효성 검사
	           if(!chk(/^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/,email,"이메일 형식에 맞춰 입력하세요.")){
	          	 return false;
	           }
	           
	           // 유효성 검사 alert 창 띄워주는 것
	           function chk(re, ele, msg){
	               if(!re.test(ele.value)){
	                  alert(msg);
	                  ele.value="";
	                  ele.focus();   
	                  return false;
	               }
	               
	               return true;
	            }
			
		}
	</script>

</body>
</html>

