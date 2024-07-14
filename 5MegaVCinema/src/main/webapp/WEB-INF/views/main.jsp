<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>오메가V시네마</title>
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<style type="text/css">

* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0}
.mySlides {display: none}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  animation-name: fade;
  animation-duration: 1.5s;
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}




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
<!-- 			개봉 예정작/현재 상영작<br> -->
<!-- 			영화제목(한글)<br> -->
<!-- 			영화제목(영어)<br> -->
<!-- 			영화 간단 소개<br> -->
			<%-- 이미지는 일정 시간마다 슬라이드 형식으로 변경 --%>
			<%-- 이미지 파일은 임시로 설정(나중에 바꿀 예정) --%>
<!-- 			<a href="#"><img alt="blue" src="resources/img/blue.jpg" ></a> -->
<!-- 			<br> -->
			
			
<!-- 			<div class="slideshow-container"> -->

<div class="mySlides fade">
  <div class="numbertext">1 / 3</div>
  <img src="https://cf2.lottecinema.co.kr/lotte_image/2024/BOL4/BOL4_1920774.jpg" style="width:100%">
  <div class="text">Caption Text</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 3</div>
  <img src="https://cf2.lottecinema.co.kr/lotte_image/2024/TheBaton/TheBaton_1920774.jpg" style="width:100%">
  <div class="text">Caption Two</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 3</div>
  <img src="https://cf2.lottecinema.co.kr/lotte_image/2024/HappyLittleSubmarine/HappyLittleSubmarine_19207742.png" style="width:100%">
  <div class="text">Caption Three</div>
</div>

<a class="prev" onclick="plusSlides(-1)">❮</a>
<a class="next" onclick="plusSlides(1)">❯</a>

</div>
<br>

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>

<script>
let slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>


			
			
			
<%-- 			<%-- 라디오버튼 클릭 시 영화 이미지를 각 버튼에 해당하는 이미지로 변경 --%> 
<!-- 			<input type="radio" name="changeImage" onclick=""> -->
<!-- 			<input type="radio" name="changeImage" onclick=""> -->
<!-- 			<input type="radio" name="changeImage" onclick=""> -->
<!-- 			<input type="radio" name="changeImage" onclick=""> -->
<!-- 			<input type="radio" name="changeImage" onclick=""> -->
<!-- 			<input type="radio" name="changeImage" onclick=""> -->
<!-- 			<input type="radio" name="changeImage" onclick=""> -->
<%-- 			<%-- 버튼 클릭 시 영화 이미지 변경을 일시정지/재생 및 버튼 이미지 변경 --%> 
<!-- 			<button type="button"> -->
<!-- 				<img alt="playing" src="resources/img/png/playing.png"  -->
<!-- 					width="15" height="15" onclick=""> -->
<!-- 			</button> -->
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