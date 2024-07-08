<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오메가V시네마</title>
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<style type="text/css">
	h1 {text-align: center;}
	
	#movie_slider {position: relative;}
	
	#movie_list {
		position: relative;
		height: 400px;
	}
	
	table, th, td {border: 1px solid black;}
	
	#movie_list>table {
		margin: auto;
		border-collapse: collapse;
		font-size: 14px;
	}
	
	#movie_list1 {padding: 10px 15px;}
	#movie_list2 {padding: 10px 15px;}
	#movie_list3 {padding: 10px 15px;}
	
	.movie_desc {display: inline-block;}
	.movie_desc>img {width: 180px; height: 250px;}
	.movie_desc>p {
		border: 1px solid black;
		background-color: white;
		padding: 6px;
	}
	
	#list_btn1 {
		position: absolute;
		top: 175px; left: 420px;
		width: 50px; height: 50px;
	}
	#list_btn1>img {width: 45px; height: 45px;}
	
	#movie_desc1 {
		position: absolute;
		left: 480px;
	}
	#movie_desc2 {
		position: absolute;
		left: 670px;
	}
	#movie_desc3 {
		position: absolute;
		left: 860px;
	}
	#movie_desc4 {
		position: absolute;
		left: 1050px;
	}
	#movie_desc5 {
		position: absolute;
		left: 1240px;
	}
	
	#list_btn2 {
		position: absolute;
		top: 175px; left: 1430px;
		width: 50px; height: 50px;
	}
	#list_btn2>img {width: 45px; height: 45px;}
	
	.rate_all {
		background-color: green;
		border-radius: 4px 4px;
		padding: 4px 2px;
		margin: 8px 6px;
		color: white;
		font-size: 14px;
	}
	.rate_12 {
		background-color: #fd1;
		border-radius: 4px 4px;
		padding: 2px 4px;
		margin: 6px 8px;
		color: white;
	}
	.rate_15 {
		background-color: orange;
		border-radius: 4px 4px;
		padding: 2px 4px;
		margin: 6px 8px;
		color: white;
	}
	.rate_19 {
		background-color: red;
		border-radius: 4px 4px;
		padding: 2px 4px;
		margin: 6px 8px;
		color: white;
	}
	
	#announcement {
		position: relative;
		height: 350px;
	}
	#announcement>h1 {
		font-size: 25px;
		margin: 20px;
	}
	#announcement>#anno_list {
		border: 1px solid black;
		position: relative;
		position: absolute;
		left: 480px;
		width: 935px; height: 200px;
		text-align: center;
		font-size: 18px;
		overflow: scroll;
	}
	#announcement>#anno_list>ul {
		position: absolute;
		left: 90px;
		width: 735px;
	}
	#announcement>#anno_list>ul>li {
		border-bottom: 1px solid black;
		padding: 15px;
	}
	#announcement>#anno_list_more {
		position: absolute;
		top: 255px;
		left: 480px;
		width: 937px; height: 35px;
	}
</style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<form id="main_form">
		<section id="movie_slider">
			개봉 예정작/현재 상영작<br>
			영화제목(한글)<br>
			영화제목(영어)<br>
			영화 간단 소개<br>
			<%-- 이미지는 일정 시간마다 슬라이드 형식으로 변경 --%>
			<%-- 이미지 파일은 임시로 설정(나중에 바꿀 예정) --%>
			<a href="#"><img alt="blue" src="resources/img/blue.jpg" ></a>
			<br>
			<%-- 라디오버튼 클릭 시 영화 이미지를 각 버튼에 해당하는 이미지로 변경 --%>
			<input type="radio" name="changeImage" onclick="">
			<input type="radio" name="changeImage" onclick="">
			<input type="radio" name="changeImage" onclick="">
			<input type="radio" name="changeImage" onclick="">
			<input type="radio" name="changeImage" onclick="">
			<input type="radio" name="changeImage" onclick="">
			<input type="radio" name="changeImage" onclick="">
			<%-- 버튼 클릭 시 영화 이미지 변경을 일시정지/재생 및 버튼 이미지 변경 --%>
			<button type="button">
				<img alt="playing" src="resources/img/png/playing.png" 
					width="15" height="15" onclick="">
			</button>
		</section>
		<section id="movie_list">
			<table>
				<tr>
					<%-- 각 항목 선택 시 항목에 맞는 영화 목록 표시 --%>
					<td id="movie_list1">박스오피스</td>
					<td id="movie_list2">최신개봉작</td>
					<td id="movie_list3">상영예정작</td>
				</tr>
			</table>
			<br>
			<button type="button" id="list_btn1" onclick="">
				<img alt="arrow1" src="resources/img/png/arrow1.png">
			</button>
			<div class="movie_desc" id="movie_desc1">
				<img alt="dahlia" src="resources/img/dahlia.jpg" onmouseover=""><br>
				<p><a href="#"><span class="rate_all"><b>ALL</b></span>영화제목</a></p>
			</div>
			<div class="movie_desc" id="movie_desc2">
				<img alt="dahlia" src="resources/img/dahlia.jpg" onmouseover=""><br>
				<p><a href="#"><span class="rate_12"><b>12</b></span>영화제목</a></p>
			</div>
			<div class="movie_desc" id="movie_desc3">
				<img alt="dahlia" src="resources/img/dahlia.jpg" onmouseover=""><br>
				<p><a href="#"><span class="rate_15"><b>15</b></span>영화제목</a></p>
			</div>
			<div class="movie_desc" id="movie_desc4">
				<img alt="dahlia" src="resources/img/dahlia.jpg" onmouseover=""><br>
				<p><a href="#"><span class="rate_19"><b>19</b></span>영화제목</a></p>
			</div>
			<div class="movie_desc" id="movie_desc5">
				<img alt="dahlia" src="resources/img/dahlia.jpg" onmouseover=""><br>
				<p><a href="#"><span class="rate_all"><b>ALL</b></span>영화제목</a></p>
			</div>
			<button type="button" id="list_btn2" onclick="">
				<img alt="arrow2" src="resources/img/png/arrow2.png">
			</button>
		</section>
		<section id="announcement">
			<h1>공지사항</h1>
			<div id="anno_list">
				<ul>
					<li><a href="#">극장명 | 공지사항 제목 | 등록일</a></li>
					<li><a href="#">극장명 | 공지사항 제목 | 등록일</a></li>
					<li><a href="#">극장명 | 공지사항 제목 | 등록일</a></li>
					<li><a href="#">극장명 | 공지사항 제목 | 등록일</a></li>
					<li><a href="#">극장명 | 공지사항 제목 | 등록일</a></li>
					<li><a href="#">극장명 | 공지사항 제목 | 등록일</a></li>
					<li><a href="#">극장명 | 공지사항 제목 | 등록일</a></li>
					<li><a href="#">극장명 | 공지사항 제목 | 등록일</a></li>
					<li><a href="#">극장명 | 공지사항 제목 | 등록일</a></li>
					<li><a href="#">극장명 | 공지사항 제목 | 등록일</a></li>
				</ul>
			</div>
			<input type="button" id="anno_list_more" value="+더보기" onclick="">
		</section>
	</form>
	<footer>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>