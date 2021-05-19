<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type=‘text/javascript’ src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

<%-- a 태그 속성값 제거하기 --%>
<%-- <% $("#nolink").removeAttr("href"); %> --%>

    <!-- 헤더 영역 -->   
	<div class="header" style="z-index: 10000;">
	
		<!-- 헤드라인 -->`
		<div style="text-align: center;">
			<!-- 의도 : 백구 네임을 클릭하면 메인 화면으로 넘어간다 -->
			<br>
			<h1 style="font-size: 100px; height:100%;"><a href="" style="color: black; text-decoration:none; margin-bottom: 1%;">
			<img src="RESOURCES/IMAGES/백구로고.png" width="180">
			</a></h1>
		</div>
		
		<!-- 로그인 영역 -->
		<div class="login-area">
		
			<!-- 로그인이 필요한 경우 -->
		<%-- 	<c:if test="${ empty sessionScope.loginMember }">
			
				<!-- 로그인 폼 -->
				<form id="loginForm" action="${ pageContext.servletContext.contextPath }/member/login" method="post">
					<table>
						<tr>
							<td>
								<label class="text">ID : </label>
							</td>
							<td>
								<input type="text" name="memberId">
							</td>
						</tr>
							<tr>
							<td>
								<label class="text">PWD : </label>
							</td>
							<td>
								<input type="password" name="memberPwd">
							</td>
						</tr>
					</table>
					<div class="btns" align="right">
						<input type="button" class="btn btn-yg" value="회원가입" id="regist">
						<input type="submit" class="btn btn-or" value="로그인" id="login">
					</div>
				</form>
				
			</c:if> --%>
			
			<%-- <c:if test="${ !empty sessionScope.loginMember }">
				<!-- 로그인 되어 있는 경우 -->
				<h3><c:out value="${ sessionScope.loginMember.nickname }"/>님의 방문을 환영합니다.</h3>
				<div class="btns">
					<input type="button" class="btn btn-yg" value="정보수정" id="update">
					<input type="button" class="btn btn-or" value="로그아웃" id="logout">
				</div>
			</c:if> --%>
			
		</div>	<!-- login-area end -->

		
	<!-- 메뉴 영역 -->
	<c:if test="${ !empty sessionScope.loginUser }">
		<div class="menu-area">
			<div class="nav-area">
				<ul>
					<li><a href="">이력서 관리</a></li>
					<li><a href="">입사지원 관리</a></li>
					<li><a href="">일자리 모음</a></li>
					<li><a href="">고객문의</a></li>
					<li><a id="nolink" href=""></a></li>
					<li><a href="${ pageContext.servletContext.contextPath }/user/logout">로그아웃</a></li>
				</ul>
			</div>	<!-- nav-area end -->
		</div>	<!-- menu-area end -->
	</c:if>
	
	<c:if test="${ empty sessionScope.loginUser }">
		<div class="menu-area">
			<div class="nav-area">
				<ul>
					<li><a href="">고객문의</a></li>
					<li><a id="nolink" href=""></a></li>
					<li><a id="nolink" href=""></a></li>
					<li><a id="nolink" href=""></a></li>
					<li><a href="">회원가입</a></li>
					<li><a href="${ pageContext.servletContext.contextPath }/user/login">로그인</a></li>
				</ul>
			</div>	<!-- nav-area end -->
		</div>	<!-- menu-area end -->
	</c:if>
</div>	<!-- header end -->
