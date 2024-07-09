<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript">
	function confirmLogout() {
		let isLogout = confirm("로그아웃 하시겠습니까?");

		// isLogout 변수값이 true 일 경우 로그아웃 작업을 수행할
		// "MemberLogout" 서블릿 요청
		if (isLogout) {
			location.href = "MemberLogout";
		}
	}
	
</script>

<div class="inner">
	<div id="member_area">
		<a href="./">HOME</a> 
		<%-- session 아이디 존재 여부를 판별하여 각각 다른 링크 표시  --%>
		<%-- EL의 sessionScope 내장 객체 접근하여 sId 속성값 존재 여부 판별 --%>
		
		<c:choose>
			<c:when test="${empty sessionScope.sId}"> <%-- 로그인 상태가 아닐 경우 --%>
				| <a href="MemberLogin">로그인 </a>
				| <a href="">멤버십안내 </a>
				| <a href="MemberJoin">회원가입</a>
				| <a href="">비회원 예매내역 </a>
			</c:when>
			<c:otherwise>
				<%-- 아이디 클릭 시 회원 상세정보 조회를 위한 "MemberInfo.me" 서블릿 요청 --%>
				| <a href="MemberInfo">${sName}</a>님
				<%-- 하이퍼링크 상에서 자바스크립트 함수 호출 시
				"javascript:함수명()" 형태로 호출 --%>
				| <a href="javascript:confirmLogout()">로그아웃 </a>
			</c:otherwise>
		</c:choose>
		<c:if test="${sessionScope.sIsAdmin eq 1}">
			| <a href="AdminHome">관리자페이지</a>
		</c:if>
	</div>

	<nav>
		<a href="./" class="main_logo"><img src="resources/images/main_logo.png"></a>
		<ul>
			<li class="depth1">
				<a href="#">영화</a>
				<ul class="depth2">
					<li><a href="Boxoffice">박스오피스</a></li>
					<li><a href="Latest">최신개봉작</a></li>
					<li><a href="Comming">상영예정작</a></li>
				</ul>	
			</li>
			
			<li class="depth1">
				<a href="#">영화관</a>
				<ul class="depth2">
					<li>
						<a href="#">서울/경기/인천</a>
						<ul class="depth3">
							<li><a href="#">신도림</a></li>
							<li><a href="#">청라</a></li>
							<li><a href="#">동탄</a></li>
							<li><a href="#">남양주다산</a></li>
						</ul>
					</li>
					
					<li>
						<a href="#">충청</a>
						<ul class="depth3">
							<li><a href="#">천안불당</a></li>
						</ul>
					</li>
					
					<li>
						<a href="#">경상</a>
						<ul class="depth3">
							<li><a href="#">경주보문</a></li>
							<li><a href="#">구미봉곡</a></li>
							<li><a href="#">대구이시아</a></li>
						</ul>
					</li>
					
					<li>
						<a href="#">작은 영화관</a>
						<ul class="depth3">
							<li><a href="#">칠곡호이</a></li>
							<li><a href="#">보은</a></li>
							<li><a href="#">영덕예주</a></li>
						</ul>
					</li>
				</ul>
			</li>
			
			<li class="depth1">
				<a href="Store">스토어</a>
				<ul class="depth2">
					<li><a href="#">새로운 상품</a></li>
					<li><a href="#">브이티켓</a></li>
					<li><a href="#">팝콘/음료/굿즈</a></li>
				</ul>	
			</li>
		</ul>
		<a href="./" class="simple_order">간편 예매</a>
	</nav>
</div>
<div id="bar"></div>

