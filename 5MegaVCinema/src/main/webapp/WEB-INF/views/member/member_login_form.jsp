<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<style>
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
			
			/* 탭 메뉴 */
			
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
			
			<%-- 회원 로그인 --%>
			
			article {
				width: 500px;
				margin: 0 auto;
			}
			
			article form {
				padding-top: 30px;
				margin: o auto;
			}
			
			article form .info {
				width: 100%;
				display: flex;
				justify-content: center;
			} 
			
			article form .info span {
				width: 30%;
				text-align: left;
			} 
			
			article form .info input {
				width: 70%;
			}
			
			article form .search {
				text-align: left;
				margin-bottom: 30px;
			}
			 
			article form ul li {
				display: inline-block;
				margin: 0 20px;
			}
			
			article form #login_btn {
				width: 100%;
			} 
						
			<%-- 비회원 로그인 --%>
			
			article .unregisted .left {
				width: 100%;
			}
			
			article .unregisted .right {
				width: 100%;
			}
			
			article .unregisted .right form {
				width: 100%;
			} 
			
			article .login {
				display: none;
			} 
			  
			article .login.on {
				display: block;
			}   
		</style>
		<script type="text/javascript">
			function alert(){
				if(document.login.member_id == null) {
					alert("아이디를 입력해주세요.");
				}
				
				if(document.login.member_pw == null){
					alert("비밀번호를 입력해주세요.");
					
				}
			}
		</script>
	</head>
	<body>
		<header>
			<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
		</header>
		
		<div class="logo">
			<a href="./" class="main_logo"><img src="resources/images/main_logo.png"></a>
		</div>
		
		<div class="tab">
			<ul>
				<li class="tabMenu on"><a href="#">회원 로그인</a></li>
				<li class="tabMenu"><a href="#">비회원 로그인</a></li>
			</ul>
		</div>
		
		<article>
			<div align="center" class="login registed on">
				<span>아이디와 비밀번호를 입력하신 후, 로그인을 눌러주세요</span>
				<form action="MemberLogin" method="post" name="login">
					<div class="info">
						<span>아이디(이메일)</span>
						<input type="text" name="member_id" id="member_id" value="${cookie.rememberId.value}" placeholder="이메일을 입력해주세요" required> <br>
					</div>
					
					<div class="info">
						<span>비밀번호</span>
						<input type="password" name="member_pw" id="member_pw" placeholder= "영문, 숫자 포함 8자 이상" required><br>
					</div>
					
					<div class="search">
						<div>
							<input type="checkbox" name="rememberId" <c:if test="${not empty cookie.rememberId}">checked</c:if>>아이디 기억<br>
						</div>
					</div>
					<!--  체크박스 생성 시 value 속성 지정하지 않으면 체크값이 "on", 미체크는 "null" -->
					<input type="submit" value="로그인" id="login_btn">
					
					<ul>
						<li><a href="MemberSearchId">아이디 찾기</a></li>
						<li><a href="Passwd_find">비밀번호 찾기</a></li>
						<li><a href="MemberJoin">회원가입</a></li>
					</ul>
				</form>
			</div>
			
			<div align="center" class="login unregisted">
				<div class="left">
					<ul>
						<li>비회원 예매는 할인/포인트/관람권 적용이 불가합니다.</li>
						<li>모든 항목은 필수입니다.</li>
						<li>문의사항은 고객센터(1000-1000)로 문의해주시기 바랍니다.</li>
						<li>비회원 예매내역 서비스는 비회원 예매 시 입력했던 개인정보를 동일하게 입력하셔야 이용 가능합니다.</li>
					</ul>	
				</div>
				
				<div class="right">
					<form action="MemberLoginUnregisted" method="post">
						<div class="info">
							<span>이름</span>
							<input type="text" name="name" placeholder= "본명을 입력해주세요." required><br>
						</div>
						
						<div class="info">
							<span>이메일</span>
							<input type="text" name="email" placeholder= "이메일을 입력해주세요." required><br>
						</div>
						
						<div class="info">
							<span>휴대폰번호</span>
							<input type="text" name="phoneNum" placeholder= "휴대폰번호를 입력해주세요." required><br>
						</div>
						
						<div class="info">
							<span>비밀번호(4자리)</span>
							<input type="text" name="passwd" placeholder= "4자리 숫자를 입력해주세요." required><br>
						</div>
						
						<input type="submit" value="로그인" id="login_btn">
					</form>
				</div>
			</div>
		</article>
		<script type="text/javascript">
			let tabMenu = document.querySelectorAll('.tabMenu');
			let loginCon = document.querySelectorAll('.login');
			
			for(let i = 0; i < tabMenu.length; i++){
		        tabMenu[i].onclick = function () {
		            tabMenu[0].classList.remove('on');
		            tabMenu[1].classList.remove('on');
		                  
		            tabMenu[i].classList.add('on');
		
		            loginCon[0].classList.remove('on');
		            loginCon[1].classList.remove('on');
		
		            loginCon[i].classList.add('on');
		        }
	    	}
		</script>
		<footer>
			<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
		</footer>
	</body>
</html>