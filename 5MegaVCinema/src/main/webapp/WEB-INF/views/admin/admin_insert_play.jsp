<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">

</head>
<body>
<header>
		<%-- 기본 메뉴 표시 영역(inc/top.jsp) 페이지 삽입 --%>
		<%-- 현재 위치는 컨텍스트 루트(/test2 = webapp) 이며, inc 디렉토리의 top.jsp 지정 --%>
		<%-- 단, JSP 때와 달리 디렉토리 구조가 다르므로 주의! --%>
		<%-- JSP 파일의 루트는 webapp 이 맞지만, 하위 디렉토리로 WEB-INF/views 가 포함되어야함 --%>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<h1>상영스케줄 등록 페이지</h1>
	<form action="adminInsertPlay" method="post">
<!-- 		<label for="moive_release_date">상영기간</label><br> -->
<!-- 		<input type="date" name="moive_release_date" readonly>~ -->
<!-- 		<input type="date" name="movie_close_date" readonly><br> -->
		
		<label for="movie_name_kr">영화 선택</label>
			<select name="movie_name_kr" id="movie_name_kr">
			<c:forEach var="movie" items="${movieList}">
				<option>${movie.movie_name_kr}</option>
			</c:forEach>
			</select><br>
		
		<script type="text/javascript">
			let selected_movie_name_kr = ${"#movie_name_kr"}.val();
			console.log(selected_movie_name_kr);
		
		</script>
		
			
		<c:set var="movie" target="${movieList}"/>
		<
		<label for="">영화 코드</label>
			<input type="text" name="" value="">
 		
			
		<label for="theater_name">영화관명</label>
		<select name="theater_name" required>
			<option selected>신도림</option>
			<option>청라</option>
			<option>동탄</option>
			<option>남양주다산</option>
			<option>경주보문</option>
			<option>구미봉곡</option>
			<option>천안불당</option>
			<option>대구이시아</option>
			<option>보은</option>
			<option>칠곡호이</option>
			<option>영덕예주</option>
		</select><br>
		
		<label for="room_num">상영관</label>
		<select name="room_num" required>
			<option>1</option>
			<option>2</option>
			<option>3</option>
			<option>4</option>
			<option>5</option>
		</select><br>
		
<%-- 		<jsp:useBean id="now" class="java.util.Date"/> --%>
		
		<label for="play_start_time">상영 시작 시간</label>
		<input type="time" name="play_start_time">
		<label for="play_end_time">상영 종료 시간</label>
		<c:set var="movie2" target="${#movie_name_kr option:selected}.val()"/>
		<c:if test=""></c:if>
		<input type="time" name="play_end_time" value="${play_start_time}">


		
		<input type="submit" value="등록">
		<input type="reset" value="초기화">
		<input type="button" value="돌아가기" onclick="history.back()">
	
	</form>
	<footer>
		<%-- 회사 소개 영역(inc/bottom.jsp) 페이지 삽입 --%>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
	
</body>
</html>