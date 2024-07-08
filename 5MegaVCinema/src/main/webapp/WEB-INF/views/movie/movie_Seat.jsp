<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>index</title>
<link
	href="${pageContext.request.contextPath}/resources/css/default.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.servletContext.contextPath}/js/jquery-3.7.1.js"></script>
</head>
	<body>
		<header>
			<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
		</header>
		
		<article>
		성인
		<select name="adultAge" >
			<option value="0명">0 명</option>
			<option value="1명">1 명</option>
			<option value="2명">2 명</option>
			<option value="3명">3 명</option>
			<option value="4명">4 명</option>
			<option value="5명">5 명</option>
			<option value="6명">6 명</option>
			<option value="7명">7 명</option>
			<option value="8명">8 명</option>
			
		</select>
		청소년
		<select name="studentAge" >
			<option value="0명">0 명</option>
			<option value="1명">1 명</option>
			<option value="2명">2 명</option>
			<option value="3명">3 명</option>
			<option value="4명">4 명</option>
			<option value="5명">5 명</option>
			<option value="6명">6 명</option>
			<option value="7명">7 명</option>
			<option value="8명">8 명</option>
		</select>
		우대
		<select name="oldAge" >
			<option value="0명">0 명</option>
			<option value="1명">1 명</option>
			<option value="2명">2 명</option>
			<option value="3명">3 명</option>
			<option value="4명">4 명</option>
			<option value="5명">5 명</option>
			<option value="6명">6 명</option>
			<option value="7명">7 명</option>
			<option value="8명">8 명</option>
		</select>
		
		<div class="secttion-left">
		<div class="section-pop-movie">
        <img src="https://file.cineq.co.kr/i.aspx?movieid=20235974&amp;size=210" class="poster" alt="포스터">

        <div class="title">
            <span class="rate-all">0</span>인사이드 아웃 2
        </div>
        <table class="table-movie-info">
            <tbody><tr>
                <th>영화관</th>
                <td>칠곡호이</td>
            </tr>
            <tr>
                <th>상영관</th>
                <td>1관</td>
            </tr>
            <tr>
                <th>날짜</th>
                <td>2024.06.27(목)</td>
            </tr>
            <tr>
                <th>시간</th>
                <td class="time">17:55</td>
            </tr>
            <tr>
                <th>인원</th>
                <td class="number">성인 5명, 청소년 1명</td>
            </tr>
            <tr>
                <th>좌석</th>
                <td class="seats">B3, C2, C3, C4, C5, C6</td>
            </tr>
        </tbody></table>

        <span class="total-price"><span>41,000</span> 원</span>

    </div><!--.section-pop-movie-->
		
		</div>

		<table>
			<tr>
				<th>시간(데이터 넣어야함)</th>
			</tr>
			<tr>
				<th>SCREEN</th>
			</tr>
		</table>
		
		<ul class="row" ><li class="head">A</li>
		<li><input type="checkbox" class="choose-seat " id="A1" value="A1" ><label for="A1" class="mini">1</label></li>
		<li><input type="checkbox" class="choose-seat " id="A2" value="A2" ><label for="A2" class="mini">2</label></li>
		<li><input type="checkbox" class="choose-seat " id="A3" value="A3" ><label for="A3" class="mini">3</label></li>
		<li><input type="checkbox" class="choose-seat " id="A4" value="A4" ><label for="A4" class="mini">4</label></li>
		<li><input type="checkbox" class="choose-seat " id="A5" value="A5" ><label for="A5" class="mini">5</label></li>
		<li><input type="checkbox" class="choose-seat " id="A6" value="A6" ><label for="A6" class="mini">6</label></li>
		<li><input type="checkbox" class="choose-seat " id="A7" value="A7" ><label for="A7" class="mini">7</label></li>
		</ul>
		<ul class="row" ><li class="head">B</li>
		<li><input type="checkbox" class="choose-seat " id="B1" value="B1" ><label for="B1" class="mini">1</label></li>
		<li><input type="checkbox" class="choose-seat " id="B2" value="B2" ><label for="B2" class="mini">2</label></li>
		<li><input type="checkbox" class="choose-seat " id="B3" value="B3" ><label for="B3" class="mini">3</label></li>
		<li><input type="checkbox" class="choose-seat " id="B4" value="B4" ><label for="B4" class="mini">4</label></li>
		<li><input type="checkbox" class="choose-seat " id="B5" value="B5" ><label for="B5" class="mini">5</label></li>
		<li><input type="checkbox" class="choose-seat " id="B6" value="B6" ><label for="B6" class="mini">6</label></li>
		<li><input type="checkbox" class="choose-seat " id="B7" value="B7" ><label for="B7" class="mini">7</label></li>
		</ul>
		<ul class="row" ><li class="head">C</li>
		<li><input type="checkbox" class="choose-seat " id="C1" value="C1" ><label for="C1" class="mini">1</label></li>
		<li><input type="checkbox" class="choose-seat " id="C2" value="C2" ><label for="C2" class="mini">2</label></li>
		<li><input type="checkbox" class="choose-seat " id="C3" value="C3" ><label for="C3" class="mini">3</label></li>
		<li><input type="checkbox" class="choose-seat " id="C4" value="C4" ><label for="C4" class="mini">4</label></li>
		<li><input type="checkbox" class="choose-seat " id="C5" value="C5" ><label for="C5" class="mini">5</label></li>
		<li><input type="checkbox" class="choose-seat " id="C6" value="C6" ><label for="C6" class="mini">6</label></li>
		<li><input type="checkbox" class="choose-seat " id="C7" value="C7" ><label for="C7" class="mini">7</label></li>
		</ul>
		<ul class="row" ><li class="head">D</li>
		<li><input type="checkbox" class="choose-seat " id="D1" value="D1" ><label for="D1" class="mini">1</label></li>
		<li><input type="checkbox" class="choose-seat " id="D2" value="D2" ><label for="D2" class="mini">2</label></li>
		<li><input type="checkbox" class="choose-seat " id="D3" value="D3" ><label for="D3" class="mini">3</label></li>
		<li><input type="checkbox" class="choose-seat " id="D4" value="D4" ><label for="D4" class="mini">4</label></li>
		<li><input type="checkbox" class="choose-seat " id="D5" value="D5" ><label for="D5" class="mini">5</label></li>
		<li><input type="checkbox" class="choose-seat " id="D6" value="D6" ><label for="D6" class="mini">6</label></li>
		<li><input type="checkbox" class="choose-seat " id="D7" value="D7" ><label for="D7" class="mini">7</label></li>
		</ul>
		<ul class="row" ><li class="head">E</li>
		<li><input type="checkbox" class="choose-seat " id="E1" value="E1" ><label for="E1" class="mini">1</label></li>
		<li><input type="checkbox" class="choose-seat " id="E2" value="E2" ><label for="E2" class="mini">2</label></li>
		<li><input type="checkbox" class="choose-seat " id="E3" value="E3" ><label for="E3" class="mini">3</label></li>
		<li><input type="checkbox" class="choose-seat " id="E4" value="E4" ><label for="E4" class="mini">4</label></li>
		<li><input type="checkbox" class="choose-seat " id="E5" value="E5" ><label for="E5" class="mini">5</label></li>
		<li><input type="checkbox" class="choose-seat " id="E6" value="E6" ><label for="E6" class="mini">6</label></li>
		<li><input type="checkbox" class="choose-seat " id="E7" value="E7" ><label for="E7" class="mini">7</label></li>
		</ul>
		<ul class="row" ><li class="head">F</li>
		<li><input type="checkbox" class="choose-seat " id="F1" value="F1" ><label for="F1" class="mini">1</label></li>
		<li><input type="checkbox" class="choose-seat " id="F2" value="F2" ><label for="F2" class="mini">2</label></li>
		<li><input type="checkbox" class="choose-seat " id="F3" value="F3" ><label for="F3" class="mini">3</label></li>
		<li><input type="checkbox" class="choose-seat " id="F4" value="F4" ><label for="F4" class="mini">4</label></li>
		<li><input type="checkbox" class="choose-seat " id="F5" value="F5" ><label for="F5" class="mini">5</label></li>
		<li><input type="checkbox" class="choose-seat " id="F6" value="F6" ><label for="F6" class="mini">6</label></li>
		<li><input type="checkbox" class="choose-seat " id="F7" value="F7" ><label for="F7" class="mini">7</label></li>
		</ul>
		<ul class="row" ><li class="head">G</li>
		<li><input type="checkbox" class="choose-seat " id="G1" value="G1" ><label for="A1" class="mini">1</label></li>
		<li><input type="checkbox" class="choose-seat " id="G2" value="G2" ><label for="A2" class="mini">2</label></li>
		<li><input type="checkbox" class="choose-seat " id="G3" value="G3" ><label for="A3" class="mini">3</label></li>
		<li><input type="checkbox" class="choose-seat " id="G4" value="G4" ><label for="A4" class="mini">4</label></li>
		<li><input type="checkbox" class="choose-seat " id="G5" value="G5" ><label for="A5" class="mini">5</label></li>
		<li><input type="checkbox" class="choose-seat " id="G6" value="G6" ><label for="A6" class="mini">6</label></li>
		<li><input type="checkbox" class="choose-seat " id="G7" value="G7" ><label for="A7" class="mini">7</label></li>
		</ul>
		
	<div class="section-bottom">
        <div class="wrap-rsv-select">
            <a href="#" class="btn-rsv-cancel2">이전</a>
            <a href="#" class="btn-rsv-next2">다음</a>
        </div>
    </div>
		







	</article>
		<footer>
			<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
		</footer>
	</body>
</html>




















