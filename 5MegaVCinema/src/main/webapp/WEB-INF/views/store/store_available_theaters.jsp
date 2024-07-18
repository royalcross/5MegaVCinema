<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용가능극장</title>
<%-- jquery 라이브러리 포함시키기 --%>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
</head>
<body>
	<h2>사용가능극장</h2>
	<ul>
		<li>
			서울/경기/인천
			<ul>
				<li>신도림</li>
				<li>청라</li>
				<li>동탄</li>
				<li>남양주다산</li>
			</ul>
		</li>
		<li>
			충청
			<ul>
				<li>천안불당</li>
			</ul>
		</li>
		<li>
			경상
			<ul>
				<li>경주보문</li>
				<li>구미봉곡</li>
				<li>대구이시아</li>
			</ul>
		</li>
		<li>
			작은 영화관
			<ul>
				<li>칠곡호이</li>
				<li>보은</li>
				<li>영덕예주</li>
			</ul>
		</li>
	</ul>
</body>
</html>