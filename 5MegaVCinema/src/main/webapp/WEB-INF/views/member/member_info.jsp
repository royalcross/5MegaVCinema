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
		
		<script type="text/javascript">
				
		</script>
	</head>
	<body>
		<header>
			<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
		</header>
		
		<article>
			<h1>회원 상세 정보</h1>	
			<table border="1">
				<tr>
					<th>이름</th>
					<%-- request 객체에 저장된 member 속성에 접근
					EL 활용 
					이렇게 접근하면 실제로는 getter 메서드 호출됨--%>
					<td>${member.name}</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>${member.id}</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${member.address1} / ${member.address2}</td>
				</tr>
				<tr>
					<th>E-Mail</th>
					<td>${member.email}</td>
				</tr>
				<tr>
					<th>직업</th>
					<td>${member.job}</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>${member.gender}</td>
				</tr>
				<tr>
					<th>취미</th>
					<td>${member.hobby}</td>
				</tr>
				<tr>
					<th>가입동기</th>
					<td>${member.motivation}</td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td>${member.reg_date}</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="돌아가기" onclick="history.back()">
					</td>
				</tr>
			</table>
		</article>
		
		<footer>
			<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
		</footer>
	</body>
</html>















