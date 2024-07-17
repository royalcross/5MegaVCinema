<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<style>
			div ul li{
				display: inline-block;
			}
			
			.tab{
				width: 720px;
				margin: 0 auto;
				text-align: center;
			}
			.tab > ul {
				display: flex;
				justify-content: space-between;
			}
			.tab > ul > li {
				width:50%;
				background-color: #eee;
			}
			.tab > ul > li a {
				display: block;
				width: 100%;
			}
			
			.tab > ul > li.on {
				background-color: #ccc;
				color: rgb(211, 84, 0);
				font-weight: bold;
			}
			
			.social_btn{
				width: 150px;
			}
		
			#submit {
				width: 150px;
			}
			
			.logo {
				width: 100px;
				margin: 0 auto;
			}
			
			.logo .main_logo {
				width: 100%;
			}
			
			.logo .main_logo img {
				width: 100%;
			}
		</style>
		<script type="text/javascript">
			// 이메일 유효성 검사
			
			function checkId() {
				let email = $("#member_id").val();
				let regex = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
				
				if(!regex.exec(email)) {
					alert("올바른 이메일이 아닙니다.");
				}
				
			}
		</script>
	</head>
	<body>
		<header>
			<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
		</header>
		
		<div class="logo">
			<a href="./" class="top_logo">
				<img src="resources/images/main_logo.png">
			</a>
		</div>

		<section align="center">
			<div class="tab">
				<ul>
					<li class="tabMenu on">이메일 입력</li>
					<li class="tabMenu">회원정보 입력</li>
					<li class="tabMenu">가입 완료</li>
				</ul>
			</div>
			
			<form class="join" action="MemberJoinForm">
<!-- 				<div class="social"> -->
<!-- 					<ul> -->
<!-- 						<li>소셜 계정으로 가입</li> -->
<!-- 						<li><input class="social_btn" type="button" value="네이버"></li> -->
<!-- 						<li><input class="social_btn" type="button" value="카카오"></li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
				
				<div class="vCinema">
					<ul>
						<li>이메일 주소로 가입</li>
						<li><input type="text" name="member_id" id="member_id" placeholder="이메일 주소를 입력해주세요." onblur="checkId()"></li>
					</ul>
				</div>
				
				<input id="submit" type="submit" value="가입하기">
			</form>
		</section>
				
		<footer>
			<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
		</footer>
	</body>
</html>















