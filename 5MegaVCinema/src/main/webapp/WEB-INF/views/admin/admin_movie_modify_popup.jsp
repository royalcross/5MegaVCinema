<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<label for="movie_code">영화코드</label>
		<input type="text" id="movie_code" name="movie_code" value="${selectedMovie.movie_code}">
		
		<a href="https://www.kobis.or.kr/kobis/business/mast/mvie/searchMovieList.do#none" 
		target="_blank"><label>영화코드 확인하기</label></a><br>
		
		<label for="movie_grade">심의등급</label>
		<select id="movie_grade" name="movie_grade" value="${selectedMovie.movie_grade}">
			<option <c:if test="${selectedMovie.movie_grade eq 'ALL'}">selected</c:if>>ALL</option>
			<option <c:if test="${selectedMovie.movie_grade eq '12'}">selected</c:if>>12</option>
			<option <c:if test="${selectedMovie.movie_grade eq '15'}">selected</c:if>>15</option>
			<option <c:if test="${selectedMovie.movie_grade eq '19'}">selected</c:if>>19</option>
		</select><br>
	<!-- 	<input type="text" id="movie_grade" name="movie_grade" placeholder="예시 : ALL,12,15,19"><br> -->
		
		<label for="movie_release_date">개봉일</label>
		<input type="date" id="movie_release_date" name="movie_release_date" value="${selectedMovie.movie_release_date}"><br>
		
		<label for="movie_close_date">종영일</label>
		<input type="date" id="movie_close_date" name="movie_close_date" value="${selectedMovie.movie_close_date}"><br>
		
		<label for="movie_status">개봉상태</label>
		<select id="movie_status" name="movie_status" value="${selectedMovie.movie_status}">
			<option>개봉</option>
			<option>상영종료</option>
		</select>
	<!-- 	<input type="text" id="movie_status" name="movie_status" placeholder="예시 : 개봉, 상영종료"><br> -->
		
		<label for="movie_name_kr">영화제목</label>
		<input type="text" id="movie_name_kr" name="movie_name_kr" value="${selectedMovie.movie_name_kr}"><br>
		
		<label for="movie_name_en">영화제목(영문)</label>
		<input type="text" id="movie_name_en" name="movie_name_en" value="${selectedMovie.movie_name_en}"><br>
		
		<label for="movie_running_time">러닝타임</label>
		<input type="text" id="movie_running_time" name="movie_running_time" value="${selectedMovie.movie_running_time}"><br>
		
		<label for="movie_genre">장르</label>
		<select id="movie_genre" name="movie_genre">
			<option <c:if test="${selectedMovie.movie_genre eq '코미디'}">selected</c:if>>코미디</option>
			<option <c:if test="${selectedMovie.movie_genre eq '액션'}">selected</c:if>>액션</option>
			<option <c:if test="${selectedMovie.movie_genre eq '멜로'}">selected</c:if>>멜로</option>
			<option <c:if test="${selectedMovie.movie_genre eq '스릴러'}">selected</c:if>>스릴러</option>
			<option <c:if test="${selectedMovie.movie_genre eq '미스터리'}">selected</c:if>>미스터리</option>
			<option <c:if test="${selectedMovie.movie_genre eq '공포'}">selected</c:if>>공포</option>
			<option <c:if test="${selectedMovie.movie_genre eq '어드벤처'}">selected</c:if>>어드벤처</option>
			<option <c:if test="${selectedMovie.movie_genre eq '범죄'}">selected</c:if>>범죄</option>
			<option <c:if test="${selectedMovie.movie_genre eq '판타지'}">selected</c:if>>판타지</option>
			<option <c:if test="${selectedMovie.movie_genre eq 'sf'}">selected</c:if>>sf</option>
			<option <c:if test="${selectedMovie.movie_genre eq '사극'}">selected</c:if>>사극</option>
			<option <c:if test="${selectedMovie.movie_genre eq '전쟁'}">selected</c:if>>전쟁</option>
			<option <c:if test="${selectedMovie.movie_genre eq '뮤지컬'}">selected</c:if>>뮤지컬</option>
			<option <c:if test="${selectedMovie.movie_genre eq '공연'}">selected</c:if>>공연</option>
			<option <c:if test="${selectedMovie.movie_genre eq '기타'}">selected</c:if>>기타</option>
		</select>
	<!-- 	<input type="text" id="movie_genre" name="movie_genre"><br> -->
		
		<label for="movie_director">감독</label>
		<input type="text" id="movie_director" name="movie_director" value="${selectedMovie.movie_director}"><br>
		
		<label for="movie_cast">배우</label>
		<input type="text" id="movie_cast" name="movie_cast" value="${selectedMovie.movie_cast}"><br>
		
		<label for="movie_poster">포스터url</label>
		<textarea rows="3" cols="70" id="movie_poster" name="movie_poster">${selectedMovie.movie_poster}</textarea><br>
		
		<label for="movie_photo">스틸컷url</label>
		<textarea rows="3" cols="70" id="movie_photo" name="movie_photo">${selectedMovie.movie_photo}</textarea><br>
		
		<label for="movie_preview">티저url</label>
		<textarea rows="3"  cols="70"id="movie_preview" name="movie_preview">${selectedMovie.movie_preview}</textarea><br>
		
		<label for="movie_content">줄거리</label>
		<textarea rows="3"  cols="70"id="movie_content" name="movie_content">${selectedMovie.movie_content}</textarea><br>
		
		
		
<!-- 		<label for="movie_poster">포스터url</label> -->
<%-- 		<input type="text" id="movie_poster" name="movie_poster" readonly value="${movie.movie_poster}"><br> --%>
		
<!-- 		<label for="movie_photo">스틸컷url</label> -->
<%-- 		<textarea rows="10" id="movie_photo" name="movie_photo" readonly>${movie.movie_photo}</textarea><br> --%>
		
<!-- 		<label for="movie_preview">티저url</label> -->
<%-- 		<textarea rows="10" id="movie_preview" name="movie_preview" readonly>${movie.movie_preview}</textarea><br> --%>
		
<!-- 		<label for="movie_content">줄거리</label> -->
<%-- 		<textarea rows="10" id="movie_content" name="movie_content" readonly>${movie.movie_content}</textarea><br> --%>
	<!-- 	<label for="movie_plot">Comments</label> -->
	<!-- 	<textarea rows="10" id="movie_plot"></textarea> -->
