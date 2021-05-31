<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>백세구인구직 백구</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">
	<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,600,400italic,700' rel='stylesheet' type='text/css'>

	<!-- Animate.css -->
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/animate.css">
	<!-- Flexslider -->
	<!-- <link rel="stylesheet" href="css/flexslider.css"> -->
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }}/RESOURCES/CSS/CUSTOMER/icomoon.css">
	<!-- Magnific Popup -->
	<!-- <link rel="stylesheet" href="css/magnific-popup.css"> -->
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/bootstrap.css">

	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/RESOURCES/CSS/CUSTOMER/style.css">

	<!-- 오렌지 색상 FF7844 -->

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>

	<!-- 로딩 중일 때 이미지 -->
	<!-- <div class="fh5co-loader"></div> -->
	
	<div id="fh5co-page">
		<c:if test="${ empty sessionScope.loginUserInfo }">	
			<section id="fh5co-header">
				<div class="container">
					<nav role="navigation">
						<ul class="pull-left left-menu">		
						</ul>
						<h1 id="fh5co-logo">
						<!-- 상단 백구 로고 / a 태그 뒤에 시작페이지 링크 수정해야-->
							<a href="${ pageContext.servletContext.contextPath }/user/toMain"><img src="${ pageContext.servletContext.contextPath }/RESOURCES/IMAGES/백구로고.png" width="120" alt="Free HTML5 Bootstrap Template" class="img-responsive"></a>
						</h1>
						<ul class="pull-right right-menu">
							<li><a href="${ pageContext.servletContext.contextPath }/user/toSignin" style="font-family: icomoon; font-size: 30px;">들어가기</a></li>
							<li class="fh5co-cta-btn"><a href="${ pageContext.servletContext.contextPath }/user/toSignup" style="font-family: icomoon; font-size: 30px;">회원가입</a></li>
						</ul>
					</nav>
				</div>
			</section>
		</c:if>
		<!-- #fh5co-header -->
		<c:if test="${ !empty sessionScope.loginUserInfo }">
			<section id="fh5co-header">
				<div class="container">
					<nav role="navigation">
						<ul class="pull-left left-menu">		
						</ul>
						<h1 id="fh5co-logo">
						<!-- 상단 백구 로고 / a 태그 뒤에 시작페이지 링크 수정해야-->
							<a href="index.html"><img src="${ pageContext.servletContext.contextPath }/RESOURCES/IMAGES/백구로고.png" width="120" alt="Free HTML5 Bootstrap Template" class="img-responsive"></a>
						</h1>
						<ul class="pull-right right-menu" style="align:left;">
							<li><a href="" style="font-family: icomoon; font-size: 30px;"> ${ sessionScope.loginUserInfo.userName } 님 반갑습니다! </a></li>
							<li><a href="${ pageContext.servletContext.contextPath }/user/logout" style="font-family: icomoon; font-size: 30px;">나가기</a></li>
						</ul>	
					</nav>
				</div>
			</section>
		</c:if>

		<section id="fh5co-hero" class="js-fullheight" style="background-image: url(${pageContext.request.contextPath}/RESOURCES/IMAGES/grass.jpg); height:561px;" data-next="yes">
			<div class="fh5co-overlay"></div>
			<div class="container">
				<div class="fh5co-intro js-fullheight"  >
					<div class="fh5co-intro-text" style="padding-top:200px;">
						<div class="fh5co-left-position">
							<!-- 시작페이지 타이틀 -->
							<h2 class="animate-box" style="font-family: BME; font-size: 90px;">백세 구인구직, 백구</h2>
							<p class="animate-box"></a> 
								<!-- 채용공고 검색 버튼 / a 태그 뒤에 채용공고 검색 페이지로 이동하게 링크 수정해야 -->
								<a href="${ pageContext.servletContext.contextPath }/user/toSearchPost" class="btn btn-primary" style="font-family: icomoon; font-size: 40px;">채용공고 검색</a></p>
						</div>
					</div>
				</div>
			</div>
			<div class="fh5co-learn-more animate-box" style="margin-left:-150.5px;">
				<a href="#" class="scroll-btn">
					<span class="text" style="font-family: icomoon; font-size: 20px;">중장년층을 위한 구인구직 사이트,<br> 백구에 대하여</span>
					<span class="arrow"><i class="icon-chevron-down"></i></span>
				</a>
			</div>
		</section>
		<!-- END #fh5co-hero -->


		<!-- 백구에 대한 설명 부분 시작 -->
		<section id="fh5co-features">
			<div class="container">
				<div class="row text-center row-bottom-padded-md">
					<div class="col-md-8 col-md-offset-2">
						<!-- 이미지 수정해야 -->
						<figure class="fh5co-devices animate-box"><img src="${pageContext.request.contextPath}/RESOURCES/IMAGES/baekgu3.jpg" alt="Free HTML5 Bootstrap Template" class="img-responsive"></figure>
						<!-- 백구 설명 타이틀 -->
						<h2 class="fh5co-lead animate-box" style="font-family: BME; font-size: 70px;">단순하지만 똑똑한 백구</h2>
						<!-- 백구 설명 타이틀 하단 내용 -->
						<p class="fh5co-sub-lead animate-box" style="font-size: 25px;">중장년층 구직자를 위해 <br> 기존 구인구직 홈페이지의 복잡함은 덜고 편의성은 채웠습니다</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4 col-sm-6 col-xs-12 animate-box">
						<div class="fh5co-feature">
							<div class="fh5co-icon">
								<i class="icon-search2"></i>
							</div>
							<!-- 설명1 -->
							<h3  style="font-family: BME; font-size: 30px;">검색은 쉽게</h3>
							<p style="font-size: 20px;">단순검색, 상세검색 중 원하는 것을 고르고 질문에 답하기만 하세요! 답변을 모아 백구가 검색해드립니다.</p>
						</div>
					</div>
					<div class="col-md-4 col-sm-6 col-xs-12 animate-box">
						<div class="fh5co-feature">
							<div class="fh5co-icon">
								<i class="icon-eye"></i>
							</div>
							<!-- 설명2 -->
							<h3 style="font-family: BME; font-size: 30px;">조회는 상세하게</h3>
							<p style="font-size: 20px;">검색은 손쉽게, 조회는 맞춤형으로 보세요! 알고리즘을 통해 사용자 개개인에게 꼭 맞는 구인 공고를 보여드립니다.</p>
						</div>
					</div>
					<div class="clearfix visible-sm-block"></div>
					<div class="col-md-4 col-sm-6 col-xs-12 animate-box">
						<div class="fh5co-feature">
							<div class="fh5co-icon">
								<i class="icon-expand2"></i>
							</div>
							<!-- 설명3 -->
							<h3 style="font-family: BME; font-size: 30px;">글씨는 크게</h3>
							<p style="font-size: 20px;">글씨가 보이지 않을 땐, 상단의 "글씨 크게" 버튼을 눌러보세요! 버튼 클릭 한 번으로 글씨를 글씨를 크게 만들 수 있습니다.</p>
						</div>
					</div>

					<div class="col-md-4 col-sm-6 col-xs-12 animate-box">
						<div class="fh5co-feature">
							<div class="fh5co-icon">
								<i class="icon-folder-open"></i>
							</div>
							<!-- 설명4 -->
							<h3 style="font-family: BME; font-size: 30px;">이력서는 간편하게</h3>
							<p style="font-size: 20px;">구직 할 때 필수인 이력서! 작성하는 게 어려우셨나요? 회원가입할 때 받은 기본 정보를 가지고 백구가 자동으로 작성해드립니다.</p>
						</div>
					</div>
					<div class="clearfix visible-sm-block"></div>
					<div class="col-md-4 col-sm-6 col-xs-12 animate-box">
						<div class="fh5co-feature">
							<div class="fh5co-icon">
								<i class="icon-mouse-pointer"></i>
							</div>
							<!-- 설명5 -->
							<h3 style="font-family: BME; font-size: 30px;">지원은 하나로</h3>
							<p style="font-size: 20px;">온라인 지원, 이메일 지원, 방문 지원... 백구는 지원하기 버튼 하나만 누르면 자동으로 이력서가 기업 담당자에게 전송됩니다.</p>
						</div>
					</div>
					<div class="col-md-4 col-sm-6 col-xs-12 animate-box">
						<div class="fh5co-feature">
							<div class="fh5co-icon">
								<i class="icon-briefcase"></i>
							</div>
							<!-- 설명6 -->
							<h3 style="font-family: BME; font-size: 30px;">이 모든 걸 백구에서</h3>
							<p style="font-size: 20px;">백구는 중장년층 구직자가 가장 쉽고 편하게 구인구직을 할 수 있도록 만들어졌습니다. 백구를 통해 제2의 인생을 시작하세요!</p>
						</div>
					</div>
					<div class="clearfix visible-sm-block"></div>
				</div>
			</div>
		</section>	



		<!-- 팀 실버타운 소개 시작 -->
		<section id="fh5co-testimonials" class="team" style="background-color: rgb(247, 240, 240);">
			<div class="container">
				<div class="row row-bottom-padded-sm">
					<div class="col-md-6 col-md-offset-3 text-center">
						<div class="fh5co-label animate-box" style="font-size: 23px;">팀 실버타운</div>
						<h2 class="fh5co-lead animate-box" style="font-family: BME; font-size: 70px;">백구를 만든 사람들 </h2>
						<p class="fh5co-sub-lead animate-box" style="font-size: 25px;">팀 실버타운은 중장년층 사용자를 생각하며<br> 고민하고 또 고민하며 만들었습니다</p>
					</div>
				</div>
			
			<!-- 팀원 profile 이미지, 한마디, 링크 시작 -->
			  <div class="row justify-content-center">
				<div class="col-xl-10">

					<!-- 진서 시작 -->
					<div class="col-xl-3 col-lg-4 col-md-6 animate-box">
					  <div class="member">
						  <!-- 프로필 이미지 수정해야-->
						<img src="${pageContext.request.contextPath}/RESOURCES/IMAGES/teamprofile (2).jpg" class="img-fluid" alt="">
						<div class="member-info">
						  <div class="member-info-content">
							<h4 style="font-family: BME; font-size: 30px; font-weight:lighter">차진서</h4>
							<!-- 팀원 한마디 수정해야 -->
							<span style="font-size: 18px;">당신의 열정에 백구를 더하다</span> 
							<!-- 깃허브 주소 -->
							<a href="https://github.com/jinseo-James-Cha"><i class="icon-github"></i></a>
							<!-- <img src="images/githubicon.png"  width="30" class="img-responsive"> -->
						  </div>
						  <div class="social"></div>
						  	<a href=""><i class="bi bi-twitter"></i></a>
							<a href=""><i class="bi bi-facebook"></i></a>
							<a href=""><i class="bi bi-instagram"></i></a>
							<a href=""><i class="bi bi-linkedin"></i></a>
						  </div>
						</div>
					  </div>
					</div>

					<!-- 현우 시작 -->
					<div class="col-xl-3 col-lg-4 col-md-6 animate-box" data-wow-delay="0.1s">
					  <div class="member">
						  <!-- 프로필 이미지 수정해야-->
						<img src="${pageContext.request.contextPath}/RESOURCES/IMAGES/teamprofile (2).jpg" class="img-fluid" alt="">
						<div class="member-info">
						  <div class="member-info-content">
							<h4 style="font-family: BME; font-size: 30px; font-weight:lighter">강현우</h4>
							<!-- 팀원 한마디 수정해야 -->
							<span style="font-size: 18px;">50세부터 100세까지,<br>
								인생의 반을 사용할 새로운 직업 플랫폼</span>
							<!-- 깃허브 주소 -->
							<a href="https://github.com/HyonWooKang"><i class="icon-github"></i></a>
						  </div>
						</div>
					  </div>
					</div> 
					
					<!-- 현빈 시작 -->
					<div class="col-xl-3 col-lg-4 col-md-6 animate-box" data-wow-delay="0.2s">
					  <div class="member">
						  <!-- 프로필 이미지 수정해야-->
						<img src="${pageContext.request.contextPath}/RESOURCES/IMAGES/teamprofile (2).jpg" class="img-fluid" alt="">
						<div class="member-info">
						  <div class="member-info-content">
							<h4 style="font-family: BME; font-size: 30px; font-weight:lighter">김현빈</h4>
							<span style="font-size: 18px;">부모님이 쓰신다는 마음으로 만들었습니다</span>
							<!-- 깃허브 주소 -->
							<a href="https://github.com/Priesticide"><i class="icon-github"></i></a>
						  </div>
						</div>
					  </div>
					</div> 
	  
					<!-- 유진 시작 -->
					<div class="col-xl-3 col-lg-4 col-md-6 animate-box" data-wow-delay="0.3s">
					  <div class="member">
						  <!-- 프로필 이미지 수정해야-->
						<img src="${pageContext.request.contextPath}/RESOURCES/IMAGES/teamprofile (2).jpg" class="img-fluid" alt="">
						<div class="member-info">
						  <div class="member-info-content">
							<h4 style="font-family: BME; font-size: 30px; font-weight:lighter">김유진</h4>
							<span style="font-size: 18px;">백세 시대에 걸맞는<br>백구 시대를 만들었습니다</span>
							<!-- 노션 주소로 수정해야 -->
							<a href="https://github.com/YuJin-Kimm"><i class="icon-github"></i></a>
						  </div>
						</div>
					  </div>
					</div> 

					<!--주영 시작 -->
					<div class="col-xl-3 col-lg-4 col-md-6 animate-box" data-wow-delay="0.3s">
						<div class="member">
							<!-- 프로필 이미지 수정해야-->
						  <img src="${pageContext.request.contextPath}/RESOURCES/IMAGES/teamprofile (2).jpg" class="img-fluid" alt="">
						  <div class="member-info">
							<div class="member-info-content">
							  <h4 style="font-family: BME; font-size: 30px; font-weight:lighter">정주영</h4>
							  <!-- 팀원 한마디 수정해야 -->
							  <span style="font-size: 18px;">30년 뒤 내가 쓸 홈페이지, 백구</span>
							  <a href="https://github.com/jeong-juyoung"><i class="icon-github"></i></a>
							</div>
						  </div>
						</div>
					  </div> 

					  <!-- 해인 시작 -->
					  <div class="col-xl-3 col-lg-4 col-md-6 animate-box" data-wow-delay="0.3s">
						<div class="member">
							<!-- 프로필 이미지 수정해야-->
						  <img src="${pageContext.request.contextPath}/RESOURCES/IMAGES/teamprofile (2).jpg" class="img-fluid" alt="">
						  <div class="member-info">
							<div class="member-info-content">
							  <h4 style="font-family: BME; font-size: 30px; font-weight:lighter">김해인</h4>
							  <span  style="font-size: 18px;">백구를 만들 수 있어서 좋았습니다</span>
							  <a href="https://github.com/haein-side"><i class="icon-github"></i></a>
							</div>
						  </div>
						</div>
					  </div> 
				  </div>
				</div>
			  </div>
	  
			</div>
		  </section>
		  <!-- 팀 실버타운 소개 끝 -->

		  <!-- 푸터 시작 -->
		<footer id="fh5co-footer" style="padding-top: 50px;" style="background-color: rgb(255, 254, 254);">
			<div class="container">
				<div class="row row-bottom-padded-md">
					<div class="col-md-3 col-sm-6 col-xs-12 animate-box">
						<div class="fh5co-footer-widget">
							<h3 style="font-family: BME; font-size: 30px;">고객센터</h3>
							<ul class="fh5co-links">
								<li>02-1234-5678</a></li>
								<li>상담시간 09:00~18:00</a></li>
								<li>토,일요일 및 공휴일은 휴무</a></li>
								<!-- 자주 묻는 질문들 링크 넣어야 -->
								<li><a href="#">자주 묻는 질문들</a></li>

							</ul>
						</div>
					</div>

					<div class="col-md-3 col-sm-6 col-xs-12 animate-box">
						<div class="fh5co-footer-widget">
							<h3 style="font-family: BME; font-size: 30px;">광고문의</h3>
							<ul class="fh5co-links">
								<li>02-2345-6789</a></li>
							</ul>
						</div>
					</div>

					<div class="col-md-3 col-sm-6 col-xs-12 animate-box">
						<div class="fh5co-footer-widget">
							<h3 style="font-family: BME; font-size: 30px;">약관 및 방침</h3>
							<ul class="fh5co-links">
								<!-- 이용 약관 링크 넣어야 -->
								<li><a href="https://member.findjob.co.kr/Stipulation/Stipulation.asp?faflag=615">이용약관</a></li>
								<!-- 개인정보처리방침 링크 넣어야 -->
								<li><a href="https://member.findjob.co.kr/Stipulation/PrivacyRule.asp">개인정보처리방침</a></li>
							</ul>
						</div>
					</div>

					<div class="col-md-3 col-sm-6 col-xs-12 animate-box">
						<div class="fh5co-footer-widget">
							<h3 style="font-family: BME; font-size: 30px;">백구 소스코드</h3>
							<ul class="fh5co-social">
								<!-- 백구 깃허브 주소 연결해놨음 -->
								<li><a href="https://github.com/109SilverTown"><i class="icon-github"></i></a></li>
							</ul>
						</div>
					</div>

				</div>
				
			</div>


			<!-- 하단에 템플릿 출처 남겨놨음 -->
			<div class="fh5co-copyright animate-box">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<p class="fh5co-left"><small>&copy; 2016 <a href="index.html">Guide</a> free html5. All Rights Reserved.</small></p>
							<p class="fh5co-right"><small class="fh5co-right">Designed by <a href="http://freehtml5.co" target="_blank">FREEHTML5.co</a> Demo Images: <a href="http://unsplash.com" target="_blank">Unsplash</a></small></p>
						</div>
					</div>
				</div>
			</div>
		</footer>
	</div>



	
	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="js/jquery.flexslider-min.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>


	<!-- Main JS (Do not remove) -->
	<script src="js/main.js"></script>

	<!-- 
	INFO:
	jQuery Cookie for Demo Purposes Only. 
	The code below is to toggle the layout to boxed or wide 
	-->
	<script src="js/jquery.cookie.js"></script>
	<script>
		$(function(){

			if ( $.cookie('layoutCookie') != '' ) {
				$('body').addClass($.cookie('layoutCookie'));
			}

			$('a[data-layout="boxed"]').click(function(event){
				event.preventDefault();
				$.cookie('layoutCookie', 'boxed', { expires: 7, path: '/'});
				$('body').addClass($.cookie('layoutCookie')); // the value is boxed.
			});

			$('a[data-layout="wide"]').click(function(event){
				event.preventDefault();
				$('body').removeClass($.cookie('layoutCookie')); // the value is boxed.
				$.removeCookie('layoutCookie', { path: '/' }); // remove the value of our cookie 'layoutCookie'
			});
		});
	</script>
	

	</body>
  
  
  
  
  
</html>
