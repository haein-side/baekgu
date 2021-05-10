<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="image/favicon.png" type="image/png">
<title>백세&nbsp;구인구직</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="RESOURCES/CSS/CUSTOMER/bootstrapSP.css">
<!-- main css -->
<link rel="stylesheet" href="RESOURCES/CSS/CUSTOMER/styleSP.css">
<style>
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<section>
		<div>
			<br> <br>
			<p style="font-size: xx-large; font-weight: bold;">공고&nbsp;&nbsp;검색</p>
			<br> <br>
		</div>
	</section>
	<!--기본 버튼 상세 버튼-->
	<section>
		<div align="center" id="btn_group">
			<a href="#" class="button_hover theme_btn_two"
				style="width: 200pt; height: 80pt; border-radius: 10px; font-size: x-large; padding-top: 40px;"
				disabled>기본&nbsp;검색</a> <a href="index2.html"
				class="button_hover theme_btn_two"
				style="width: 200pt; height: 80pt; border-radius: 10px; font-size: x-large; padding-top: 40px; margin-left: 160px;">상세&nbsp;검색</a>
			<br> <br> <br>
		</div>
	</section>
	<!--지도 자리입니다....-->
	<section>
		<div>
			<div></div>
		</div>
	</section>
	<!--================ 직종 선택  =================-->
	<section class="facilities_area section_gap"
		style="padding-top: 50px; padding-bottom: 10px;">
		<div class="overlay bg-parallax" data-stellar-ratio="0.8"
			data-stellar-vertical-offset="0" data-background=""
			style="transform: translateY(-29.3162px); height: 900px;"></div>
		</div>
		<div class="container">
			<div class="section_title text-center">
				<h2 class="title_w">희망 직종을 선택해 주세요!</h2>
				<br> <br>
				<div align="center">
					<div style="width: 700px;">
						<a href="#times" class="button_hover1 theme_btn_two2"
							style="width: 100pt; height: 100pt; border-radius: 10px; font-size: x-large; padding-top: 26px;"><br>식&nbsp;당</a>
						<a href="#times" class="button_hover1 theme_btn_two2"
							style="width: 100pt; height: 100pt; border-radius: 10px; font-size: x-large;"><br>매장<br>관리</a>
						<a href="#times" class="button_hover1 theme_btn_two2"
							style="width: 100pt; height: 100pt; border-radius: 10px; font-size: x-large; padding-top: 26px;"><br>상&nbsp;담</a>
						<a href="#times" class="button_hover1 theme_btn_two2"
							style="width: 100pt; height: 100pt; border-radius: 10px; font-size: x-large; padding-top: 26px;"><br>건&nbsp;설</a>
						<a href="#times" class="button_hover1 theme_btn_two2"
							style="width: 100pt; height: 100pt; border-radius: 10px; font-size: x-large; padding-top: 26px;"><br>간&nbsp;호</a>
						<a href="#times" class="button_hover1 theme_btn_two2"
							style="width: 100pt; height: 100pt; border-radius: 10px; font-size: x-large; padding-top: 26px;"><br>교&nbsp;사</a>
						<a href="#times" class="button_hover1 theme_btn_two2"
							style="width: 100pt; height: 100pt; border-radius: 10px; font-size: x-large; padding-top: 26px;"><br>운&nbsp;전</a>
						<a href="#times" class="button_hover1 theme_btn_two2"
							style="width: 100pt; height: 100pt; border-radius: 10px; font-size: x-large; padding-top: 26px;"><br>사&nbsp;무</a>
						<a href="#times" class="button_hover1 theme_btn_two2"
							style="width: 100pt; height: 100pt; border-radius: 10px; font-size: x-large; padding-top: 26px;"><br>기&nbsp;타</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================ 기간 선택  =================-->
	<section id="times" class="about_history_area section_gap">
		<div class="container" align="center">
			<div class="about_content">
				<h2 class="title title_color">일하고 싶은 기간을 선택하세요.</h2>
				<br> <br>
				<div style="width: 1000px;">
					<a href="#search" class="button_hover theme_btn_two"
						style="width: 200pt; height: 80pt; border-radius: 10px; font-size: x-large; padding-top: 40px;">일주일&nbsp;&nbsp;이하</a>
					<a href="#search" class="button_hover theme_btn_two"
						style="width: 200pt; height: 80pt; border-radius: 10px; font-size: x-large; padding-top: 40px;">한달&nbsp;&nbsp;이하</a>
					<a href="#search" class="button_hover theme_btn_two"
						style="width: 200pt; height: 80pt; border-radius: 10px; font-size: x-large; padding-top: 40px;">3개월&nbsp;&nbsp;이하</a>
					<a href="#search" class="button_hover theme_btn_two"
						style="width: 200pt; height: 80pt; border-radius: 10px; font-size: x-large; padding-top: 40px;">6개월&nbsp;&nbsp;이하</a>
					<a href="#search" class="button_hover theme_btn_two"
						style="width: 200pt; height: 80pt; border-radius: 10px; font-size: x-large; padding-top: 40px;">1년&nbsp;&nbsp;이상</a>
					<a href="#search" class="button_hover theme_btn_two"
						style="width: 200pt; height: 80pt; border-radius: 10px; font-size: x-large; padding-top: 40px;">기&nbsp;&nbsp;타</a>
				</div>
			</div>
		</div>
	</section>
	<!--================ 검색하기  =================-->
	<section id="search" class="testimonial_area section_gap">
		<div class="container" align="center">
			<a href="#" class="button_hover theme_btn_two"
				style="width: 200pt; height: 100pt; border-radius: 10px; font-size: x-large; padding-top: 26px;"><br>검색하기</a>
		</div>
	</section>
	<div style="position: fixed; width: 300px; height: 400px">
		<h3 style="color: black;">수상한 공고인가요?</h3>
		<button class="police_button" onclick="">
			<h3>신고하기</h3>
		</button>
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>