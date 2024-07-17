<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h1>영화등록 페이지</h1>
	<form action="adminInsertMovie" method="post">
		<label for="movie_code">영화코드</label>
		<input type="text" id="movie_code" name="movie_code" required>
		<a href="https://www.kobis.or.kr/kobis/business/mast/mvie/searchMovieList.do#none" 
		target="_blank"><label>영화코드 확인하기</label></a><br>
		
		<label for="movie_grade">심의등급</label>
		<select id="movie_grade" name="movie_grade" required>
			<option>ALL</option>
			<option>12</option>
			<option>15</option>
			<option>19</option>
		</select><br>
	<!-- 	<input type="text" id="movie_grade" name="movie_grade" placeholder="예시 : ALL,12,15,19"><br> -->
		
		<label for="movie_release_date">개봉일</label>
		<input type="date" id="movie_release_date" name="movie_release_date" required><br>
		<label for="movie_close_date">종영일</label>
		<input type="date" id="movie_close_date" name="movie_close_date" required><br>
		
		<label for="movie_status">개봉상태</label>
		<select id="movie_status" name="movie_status" required>
			<option value="release">개봉</option>
			<option value="end">상영종료</option>
			<option value="coming">상영예정</option>
		</select>
	<!-- 	<input type="text" id="movie_status" name="movie_status" placeholder="예시 : 개봉, 상영종료"><br> -->
		
		<label for="movie_name_kr">영화제목</label>
		<input type="text" id="movie_name_kr" name="movie_name_kr" required><br>
		
		<label for="movie_name_en">영화제목(영문)</label>
		<input type="text" id="movie_name_en" name="movie_name_en" required><br>
		
		<label for="movie_running_time">러닝타임</label>
		<input type="text" id="movie_running_time" name="movie_running_time" required><br>
		
		<label for="movie_genre">장르</label>
		<select id="movie_genre" name="movie_genre" required>
			<option>코미디</option>
			<option>액션</option>
			<option>멜로</option>
			<option>스릴러</option>
			<option>미스터리</option>
			<option>공포</option>
			<option>어드벤처</option>
			<option>범죄</option>
			<option>판타지</option>
			<option>sf</option>
			<option>사극</option>
			<option>전쟁</option>
			<option>뮤지컬</option>
			<option>공연</option>
			<option>기타</option>
		</select>
	<!-- 	<input type="text" id="movie_genre" name="movie_genre"><br> -->
		
		<label for="movie_director">감독</label>
		<input type="text" id="movie_director" name="movie_director" required><br>
		
		<label for="movie_cast">배우</label>
		<input type="text" id="movie_cast" name="movie_cast" placeholder="홍길동 강감찬 이순신" required><br>
		
		<label for="movie_poster">포스터url</label>
		<input type="text" id="movie_poster" name="movie_poster" required><br>
		
		<label for="movie_photo">스틸컷url</label>
		<textarea rows="10" id="movie_photo" name="movie_photo" required></textarea><br>
		
		<label for="movie_preview">티저url</label>
		<textarea rows="10" id="movie_preview" name="movie_preview" required></textarea><br>
		
		<label for="movie_content">줄거리</label>
		<textarea rows="10" id="movie_content" name="movie_content"required></textarea><br>
	<!-- 	<label for="movie_plot">Comments</label> -->
	<!-- 	<textarea rows="10" id="movie_plot"></textarea> -->
		
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