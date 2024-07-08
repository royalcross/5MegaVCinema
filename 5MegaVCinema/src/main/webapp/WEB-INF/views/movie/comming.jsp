<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화</title>
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<style type="text/css">
	body {
        text-align: center; 
    }
    #listForm {
        width: 1024px;
        margin: auto;
    }
	.section-movie-list ul {
    list-style-type: none;
    padding: 0;
    margin: 0;
    display: grid;
    grid-template-columns: repeat(5, 1fr);  
    gap: 20px; 
}

.section-movie-list li {
    text-align: center; 
}

.section-movie-list .posterlist {
    width: 100%;
    height: auto;
}

.section-movie-list .movie-desc {
    margin-top: 10px;
}

.section-movie-list .over {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 5px;
}

.section-movie-list .label {
    background-color: #ffcc00;
    color: white;
    font-size: 12px;
    padding: 3px 5px;
    border-radius: 3px;
    margin-right: 5px;
}
.section-movie-list .rate-12 {
    background-color: #1e90ff;
    color: white;
    font-size: 12px;
    padding: 3px 5px;
    border-radius: 3px;
    margin-right: 5px;
}
.section-movie-list .rate-15 {
    background-color: #ffa500;
    color: white;
    font-size: 12px;
    padding: 3px 5px;
    border-radius: 3px;
    margin-right: 5px;
}
.section-movie-list .rate-19 {
    background-color: #ff0000;
    color: white;
    font-size: 12px;
    padding: 3px 5px;
    border-radius: 3px;
    margin-right: 5px;
}
.section-movie-list .rate-all {
    background-color: #008000;
    color: white;
    font-size: 12px;
    padding: 3px 5px;
    border-radius: 3px;
    margin-right: 5px;
} 
.selector {
        text-align: right; 
        margin-right: 480px; 
    }  
</style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<h2>상영예정작</h2> <br>
	<form action="Movie2" name="movie2" method="post">
    <div class="area">
        <a href="Boxoffice" >박스오피스</a> | 
        <a href="Latest" >최신개봉작</a> | 
        <a href="Comming" >상영예정작</a> 
    </div>
    <div class="selector">
        <a href="#" class="selected" data-ordertype="2">개봉일순</a> | <a href="#" data-ordertype="1">가나다순</a>
    </div>
    <br>
	<section id="listForm">
	<div id="container">
        <div id="content">          
<div class="selector"></div>
<div class="section group section-movie-list boxoffice">
    <ul>   
    <li data-moviecode=""><img src="https://file.cineq.co.kr/i.aspx?movieid=20235974&amp;size=210" class="posterlist" /><span class=""><a href="#" class="tik">예매하기</a></span><a href="" class="info"> 상세정보</a>
    <div class="movie-desc"><span class="label">1</span><span class="rate-all">A</span> 인사이드 아웃 2</div></li>
  	
  	<li data-moviecode=""><img src="https://file.cineq.co.kr/i.aspx?movieid=20235974&amp;size=210" class="posterlist" /><span class=""><a href="#" class="tik">예매하기</a></span><a href="" class="info"> 상세정보</a>
    <div class="movie-desc"><span class="label">1</span><span class="rate-12">12</span> 인사이드 아웃 2</div></li>
  
  	<li data-moviecode=""><img src="https://file.cineq.co.kr/i.aspx?movieid=20235974&amp;size=210" class="posterlist" /><span class=""><a href="#" class="tik">예매하기</a></span><a href="" class="info"> 상세정보</a>
    <div class="movie-desc"><span class="label">1</span><span class="rate-15">15</span> 인사이드 아웃 2</div></li>
  	
  	<li data-moviecode=""><img src="https://file.cineq.co.kr/i.aspx?movieid=20235974&amp;size=210" class="posterlist" /><span class=""><a href="#" class="tik">예매하기</a></span><a href="" class="info"> 상세정보</a>
    <div class="movie-desc"><span class="label">1</span><span class="rate-19">19</span> 인사이드 아웃 2</div></li>
    <li data-moviecode=""><img src="https://file.cineq.co.kr/i.aspx?movieid=20235974&amp;size=210" class="posterlist" /><span class=""><a href="#" class="tik">예매하기</a></span><a href="" class="info"> 상세정보</a>
    <div class="movie-desc"><span class="label">1</span><span class="rate-all">A</span> 인사이드 아웃 2</div></li>
  	
  	<li data-moviecode=""><img src="https://file.cineq.co.kr/i.aspx?movieid=20235974&amp;size=210" class="posterlist" /><span class=""><a href="#" class="tik">예매하기</a></span><a href="" class="info"> 상세정보</a>
    <div class="movie-desc"><span class="label">1</span><span class="rate-12">12</span> 인사이드 아웃 2</div></li>
  
  	<li data-moviecode=""><img src="https://file.cineq.co.kr/i.aspx?movieid=20235974&amp;size=210" class="posterlist" /><span class=""><a href="#" class="tik">예매하기</a></span><a href="" class="info"> 상세정보</a>
    <div class="movie-desc"><span class="label">1</span><span class="rate-15">15</span> 인사이드 아웃 2</div></li>
  	
  	<li data-moviecode=""><img src="https://file.cineq.co.kr/i.aspx?movieid=20235974&amp;size=210" class="posterlist" /><span class=""><a href="#" class="tik">예매하기</a></span><a href="" class="info"> 상세정보</a>
    <div class="movie-desc"><span class="label">1</span><span class="rate-19">19</span> 인사이드 아웃 2</div></li>
    <li data-moviecode=""><img src="https://file.cineq.co.kr/i.aspx?movieid=20235974&amp;size=210" class="posterlist" /><span class=""><a href="#" class="tik">예매하기</a></span><a href="" class="info"> 상세정보</a>
    <div class="movie-desc"><span class="label">1</span><span class="rate-all">A</span> 인사이드 아웃 2</div></li>
  	
  	<li data-moviecode=""><img src="https://file.cineq.co.kr/i.aspx?movieid=20235974&amp;size=210" class="posterlist" /><span class=""><a href="#" class="tik">예매하기</a></span><a href="" class="info"> 상세정보</a>
    <div class="movie-desc"><span class="label">1</span><span class="rate-12">12</span> 인사이드 아웃 2</div></li>
  
  	<li data-moviecode=""><img src="https://file.cineq.co.kr/i.aspx?movieid=20235974&amp;size=210" class="posterlist" /><span class=""><a href="#" class="tik">예매하기</a></span><a href="" class="info"> 상세정보</a>
    <div class="movie-desc"><span class="label">1</span><span class="rate-15">15</span> 인사이드 아웃 2</div></li>
  	
  	<li data-moviecode=""><img src="https://file.cineq.co.kr/i.aspx?movieid=20235974&amp;size=210" class="posterlist" /><span class=""><a href="#" class="tik">예매하기</a></span><a href="" class="info"> 상세정보</a>
    <div class="movie-desc"><span class="label">1</span><span class="rate-19">19</span> 인사이드 아웃 2</div></li>
    <li data-moviecode=""><img src="https://file.cineq.co.kr/i.aspx?movieid=20235974&amp;size=210" class="posterlist" /><span class=""><a href="#" class="tik">예매하기</a></span><a href="" class="info"> 상세정보</a>
    <div class="movie-desc"><span class="label">1</span><span class="rate-all">A</span> 인사이드 아웃 2</div></li>
  	
  	<li data-moviecode=""><img src="https://file.cineq.co.kr/i.aspx?movieid=20235974&amp;size=210" class="posterlist" /><span class=""><a href="#" class="tik">예매하기</a></span><a href="" class="info"> 상세정보</a>
    <div class="movie-desc"><span class="label">1</span><span class="rate-12">12</span> 인사이드 아웃 2</div></li>
  
  	<li data-moviecode=""><img src="https://file.cineq.co.kr/i.aspx?movieid=20235974&amp;size=210" class="posterlist" /><span class=""><a href="#" class="tik">예매하기</a></span><a href="" class="info"> 상세정보</a>
    <div class="movie-desc"><span class="label">1</span><span class="rate-15">15</span> 인사이드 아웃 2</div></li>
  	
  	<li data-moviecode=""><img src="https://file.cineq.co.kr/i.aspx?movieid=20235974&amp;size=210" class="posterlist" /><span class=""><a href="#" class="tik">예매하기</a></span><a href="" class="info"> 상세정보</a>
    <div class="movie-desc"><span class="label">1</span><span class="rate-19">19</span> 인사이드 아웃 2</div></li>
    <li data-moviecode=""><img src="https://file.cineq.co.kr/i.aspx?movieid=20235974&amp;size=210" class="posterlist" /><span class=""><a href="#" class="tik">예매하기</a></span><a href="" class="info"> 상세정보</a>
    <div class="movie-desc"><span class="label">1</span><span class="rate-all">A</span> 인사이드 아웃 2</div></li>
  	
  	<li data-moviecode=""><img src="https://file.cineq.co.kr/i.aspx?movieid=20235974&amp;size=210" class="posterlist" /><span class=""><a href="#" class="tik">예매하기</a></span><a href="" class="info"> 상세정보</a>
    <div class="movie-desc"><span class="label">1</span><span class="rate-12">12</span> 인사이드 아웃 2</div></li>
  
  	<li data-moviecode=""><img src="https://file.cineq.co.kr/i.aspx?movieid=20235974&amp;size=210" class="posterlist" /><span class=""><a href="#" class="tik">예매하기</a></span><a href="" class="info"> 상세정보</a>
    <div class="movie-desc"><span class="label">1</span><span class="rate-15">15</span> 인사이드 아웃 2</div></li>
  	
  	<li data-moviecode=""><img src="https://file.cineq.co.kr/i.aspx?movieid=20235974&amp;size=210" class="posterlist" /><span class=""><a href="#" class="tik">예매하기</a></span><a href="" class="info"> 상세정보</a>
    <div class="movie-desc"><span class="label">1</span><span class="rate-19">19</span> 인사이드 아웃 2</div></li>
  	  
    </ul>
</div>

        </div>
    </div>
    </section>
    </form>
	<footer>		
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>













