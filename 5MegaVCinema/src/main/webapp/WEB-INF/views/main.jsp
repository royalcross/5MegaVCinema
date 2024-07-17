<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>오메가V시네마</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<style type="text/css">

	* {box-sizing: border-box}
	body {font-family: Verdana, sans-serif; margin:0}
/* 	.mySlides {display: none} */
	img {vertical-align: middle;}
	
	/* Slideshow container */
	.slideshow-container {
/* 	  max-width: 1000px; */
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
		
	<!-- 영화 리스트 슬라이드 -->
	#movie_list {
		margin-top: 100px;
		margin-bottom: 100px;
	}
	
	#movie_list table {
		margin: 0 auto;
		width: 500px;
		text-align: center;
		margin-top: 100px;
		margin-bottom: 30px;
	}
	
	#movie_list table tr {
		height: 50px;
	}
	
	.swiper {
		height: 350px;
	}
	
	.swiper-wrapper {
		justify-content: space-between;
	}
	
	.swiper-slide {
		width: 230px;
	}
	
	.swiper-slide .movie_desc {
		height: 100%;
	}
	
	.swiper-slide .movie_desc img{
		width: 100%;
		height: 80%;
	}
	
	.swiper-slide .movie_desc p {
		margin-top: 30px;
	}
	
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
		margin-top: 100px;
		margin-bottom: 100px;
	}
	
	#announcement table {
		width: 100%;
		margin-top: 30px;
		text-align: center;
	}
	
	#announcement table th {
		background-color: #eee;
	}
</style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
		<section id="movie_slider">
<!-- 			개봉 예정작/현재 상영작<br> -->
<!-- 			영화제목(한글)<br> -->
<!-- 			영화제목(영어)<br> -->
<!-- 			영화 간단 소개<br> -->
			<%-- 이미지는 일정 시간마다 슬라이드 형식으로 변경 --%>
			<%-- 이미지 파일은 임시로 설정(나중에 바꿀 예정) --%>
<!-- 			<a href="#"><img alt="blue" src="resources/img/blue.jpg" ></a> -->
<!-- 			<br> -->
			
			
			<div class="slideshow-container">
				<div class="mySlides fade">
				  <div class="numbertext">1 / 3</div>
				  <img src="https://cf2.lottecinema.co.kr/lotte_image/2024/BOL4/BOL4_1920774.jpg" style="width:100%">
				<!--   <div class="text">Caption Text</div> -->
				</div>
				
				<div class="mySlides fade">
				  <div class="numbertext">2 / 3</div>
				  <img src="https://cf2.lottecinema.co.kr/lotte_image/2024/TheBaton/TheBaton_1920774.jpg" style="width:100%">
				<!--   <div class="text">Caption Two</div> -->
				</div>
				
				<div class="mySlides fade">
				  <div class="numbertext">3 / 3</div>
				  <img src="https://cf2.lottecinema.co.kr/lotte_image/2024/HappyLittleSubmarine/HappyLittleSubmarine_19207742.png" style="width:100%">
				<!--   <div class="text">Caption Three</div> -->
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
		</section>
		<section class="inner">
			<section id="movie_list">
				<table border="1">
					<tr>
						<%-- 각 항목 선택 시 항목에 맞는 영화 목록 표시 --%>
						<td id="movie_list1"><a href ="Boxoffice">박스오피스</a></td>
						<td id="movie_list3"><a href ="Comming">상영예정작</a></td>
					</tr>
				</table>
				<div class="m_list_inner">
					<div class="swiper">
						<!-- Additional required wrapper -->
						<div class="swiper-wrapper">
							<!-- Slides -->
							<div class="swiper-slide">
							 	<div class="movie_desc" id="movie_desc1">
									<img alt="dahlia" src="https://file.cineq.co.kr/i.aspx?movieid=20235974&size=210"" onmouseover=""><br>
									<p><a href="#"><span class="rate_all"><b>ALL</b></span>영화제목</a></p>
								</div>
							</div> <!-- end swiper-slide -->
							<div class="swiper-slide">
							 	<div class="movie_desc" id="movie_desc1">
									<img alt="dahlia" src="https://file.cineq.co.kr/i.aspx?movieid=20212932&size=210" onmouseover=""><br>
									<p><a href="#"><span class="rate_12"><b>12</b></span>영화제목</a></p>
								</div>
							</div> <!-- end swiper-slide -->
							<div class="swiper-slide">
							 	<div class="movie_desc" id="movie_desc1">
									<img alt="dahlia" src="https://file.cineq.co.kr/i.aspx?movieid=20208245&size=210" onmouseover=""><br>
									<p><a href="#"><span class="rate_15"><b>15</b></span>영화제목</a></p>
								</div>
							</div> <!-- end swiper-slide -->
							<div class="swiper-slide">
							 	<div class="movie_desc" id="movie_desc1">
									<img alt="dahlia" src="https://file.cineq.co.kr/i.aspx?movieid=20248465&size=210" onmouseover=""><br>
									<p><a href="#"><span class="rate_12"><b>12</b></span>영화제목</a></p>
								</div>
							</div> <!-- end swiper-slide -->
							<div class="swiper-slide">
							 	<div class="movie_desc" id="movie_desc1">
									<img alt="dahlia" src="https://file.cineq.co.kr/i.aspx?movieid=20247811&size=210" onmouseover=""><br>
									<p><a href="#"><span class="rate_15"><b>15</b></span>영화제목</a></p>
								</div>
							</div> <!-- end swiper-slide -->
						</div> <!-- end swiper-wrapper -->
					</div>
				</div>
			</section>
			<section id="announcement">
				<h1>공지사항</h1>
				<table border="1">
					<tr>
						<th width="120px">글번호</th>
						<th>제목</th>
						<th width="120px">등록일</th>
					</tr>
					
<%-- 					페이지번호(pageNum 파라미터) 가져와서 저장(없을 경우 기본값 1로 설정) --%>
<%-- 					<c:set var="pageNum" value="1" /> --%>
<%-- 					pageNum 파라미터 존재할 경우(= 비어있지 않음) 판별 --%>
<%-- 					<c:if test="${not empty param.pageNum}"> --%>
<%-- 						pageNum 변수에 pageNum 파라미터값 저장 --%>
<%-- 						<c:set var="pageNum" value="${param.pageNum}" /> --%>
<%-- 					</c:if> --%>

<%-- 					<c:forEach var="notice" items="${NoticeList}"> --%>
<!-- 						<tr> -->
<%-- 							<td>${notice.notice_num}</td> --%>
<%-- 							<td>${notice.notice_subject}</td> --%>
<%-- 							<td><fmt:parseDate value="${notice.notice_date}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/> --%>
<%-- 								<fmt:formatDate pattern="yyyy-MM-dd" value="${parsedDateTime}"/></td> --%>
<!-- 						</tr> -->
<%-- 					</c:forEach> --%>
					<tr>
						<td>공지사항 번호</td>
						<td>공지사항 제목</td>
						<td>공지사항 등록일</td>
					</tr>
					<tr>
						<td>공지사항 번호</td>
						<td>공지사항 제목</td>
						<td>공지사항 등록일</td>
					</tr>
					<tr>
						<td>공지사항 번호</td>
						<td>공지사항 제목</td>
						<td>공지사항 등록일</td>
					</tr>
				</table>
			</section>
		</section>
	<footer>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>