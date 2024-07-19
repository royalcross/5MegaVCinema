<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link
	href="${pageContext.request.contextPath}/resources/css/default.css"
	rel="stylesheet" type="text/css">
<style type="text/css">
sapn {
	margin: 0;
	padding: 0;
	border: 0;
	outline: 0; font-size 100%;
	vertical-align: baseling;
}

.name-2 {
	color: #fff;
	text-align: right;
	font-weight: 5000;
	font-shadow: 0 0 20px;
	ling-height: 1;
}

.name-3 {
	background: rgba(0, 0, 0, 0.4);
	padding: 5px;
	padding-right: 5px;
}

.selector-summary {
	list-style-type: none;
	padding: 0;
	margin: 0;
	display: flex;
	justify-content: center;
}

.selector-summary li {
	margin-right: 10px;
}

.selector-summary li a {
	display: block;
	padding: 10px 20px;
	text-decoration: none;
	color: #000;
	background-color: #eee;
	border: 1px solid #ccc;
	border-radius: 5px;
	transition: background-color 0.3s ease;
}

.selector-summary li a.selected {
	background-color: #FF0000;
	color: #fff;
}

.section-theater-summary {
	display: flex;
	justify-content: space-between;
	max-width: 1200px;
	margin: 20px auto;
	padding: 20px;
	background-color: #f5f5f5;
	border-radius: 10px;
}

.summary {
	flex: 1;
	margin: 0 10px;
	padding: 20px;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 10px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.cal {
	text-align: left; /* 가로 정렬을 왼쪽으로 설정 */
}

.cal ul {
	list-style-type: none;
	padding: 0;
	text-align: left; /* 리스트 아이템들을 왼쪽으로 정렬 */
}

.cal ul li {
	display: inline-block;
	margin: 0;
	padding: 0;
}

.desc {
	list-style-type: none;
	padding: 0;
	text-align: right; /* 전체를 오른쪽 정렬 */
}

.desc li {
	display: inline-block;
	margin-left: 10px; /* 각 항목 사이의 간격 설정 */
}

.selector-sub {
	text-align: right; /* 오른쪽 정렬 */
}

.selector-sub a {
	text-decoration: none; /* 링크 밑줄 제거 */
	color: #000; /* 링크 색상 */
	margin-left: 10px; /* 링크 간격 */
}

.each-movie-time {
	border: 1px solid #ccc;
	padding: 10px;
	margin-bottom: 20px;
}

.title {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 10px;
}

.title {
	text-align: left;
}

.screen {
	display: flex;
	align-items: center;
}

.screen-name {
	font-size: 15px;
	line-height: 20px;
	margin-right: 10px;
}


.map-container {
	max-width: 1020px; /* 지도의 최대 너비에 맞춤 */
	margin: 0 auto; /* 가운데 정렬 */
	position: relative; /* 상대 위치 설정 */
}

.addr {
	position: absolute; /* 절대 위치 설정 */
	top: 10px; /* 위에서 10px 떨어진 위치 */
	left: 10px; /* 왼쪽에서 10px 떨어진 위치 */
	background-color: rgba(255, 255, 255, 0.8); /* 배경색 */
	padding: 10px; /* 내부 여백 */
	border-radius: 5px; /* 모서리 둥글게 */
	font-weight: bold; /* 굵은 글꼴 */
	font-size: 14px; /* 글꼴 크기 */
	z-index: 10; /* 위에 오도록 설정 */
}

.section-theater-select {
	margin-top: 50px; /* 위쪽 여백 설정 */
	margin-bottom: 50px; /* 아래쪽 여백 설정 */
}

.section group section-theater-head {
	position: relative;
}

.wrap2 {
	position: absolute;
	right: 0;
	bottom: 400px;
}

.name-2 {
	text-align: right;
	font-size: 30px;
}

.name-3 {
	color: #fff;
}

.content {
	margin: 20px;
}

table {
	border-collapse: collapse;
	width: 50%; /* 테이블 너비를 더 줄여서 작게 표시 */
	margin-left: 0; /* 왼쪽에 붙이기 위해 margin-left를 0으로 설정 */
	margin-top: 50px;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left; /* 모든 텍스트를 왼쪽 정렬 */
}

th {
	background-color: #f2f2f2;
	color: black;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

tr:hover {
	background-color: #f1f1f1;
}

.no-data {
	text-align: center;
	font-weight: bold;
	color: red;
}

.cal {
	font-family: Arial, sans-serif;
	text-align: center;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 10px;
	width: 400px;
	margin: 0 auto;
	margin-bottom: 50px; /* 달력과 테이블 사이의 여백 추가 */
	background-color: #f9f9f9;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.big-m {
	font-size: 24px;
	font-weight: bold;
	color: #333;
}

.small-yyyym {
	font-size: 16px;
	color: #666;
	margin-left: 10px;
}

.cal ul {
	list-style-type: none;
	padding: 0;
	margin: 10px 0;
	display: flex;
	justify-content: space-around;
	flex-wrap: wrap;
}

.cal li {
	margin: 5px;
}

.cal li a {
	display: block;
	padding: 10px;
	border-radius: 5px;
	text-decoration: none;
	color: #333;
	transition: background-color 0.3s;
}

.cal li a:hover {
	background-color: #eee;
}

li a span.day {
	display: block;
	font-size: 12px;
	color: #999;
}

.datelist19 a, .datelist20 a, .datelist21 a, .datelist22 a, .datelist23 a,
	.datelist24 a, .datelist25 a, .datelist26 a, .datelist27 a {
	background-color: #007bff;
	color: #fff;
}

.datelist19 a:hover, .datelist20 a:hover, .datelist21 a:hover,
	.datelist22 a:hover, .datelist23 a:hover, .datelist24 a:hover,
	.datelist25 a:hover, .datelist26 a:hover, .datelist27 a:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>

	<article>
		<div id="container">
			<div id="content">

				<div class="section group section-theater-head" style="background: url('https://file.cineq.co.kr/j.aspx?guid=d1ee83f06fc84ebbbe481fb289995a0b') center center no-repeat; background-size: cover; width: 100%; height: 550px; margin-top: 50px;">
    <div class="wrap2">
        <!--<span class="name-1">CINE Q</span>-->
        <span class="name-2"><span>청라</span></span>
        <span class="name-3"><span>청라국제도시 최초 전 좌석 리클라이너</span></span></div>
</div>

				<div class="section group section-theater-body">

					<div class="wrap">

						<div class="section group section-theater-select">
							<ul class="selector-summary">
								<li><a href="sindorim" class="selected">상영시간표</a></li>
								<li><a href="sindorim_map" class="">약도/교통</a></li>
								<li><a href="sindorim_price" class="">관람료</a></li>
							</ul>
						</div>

						<div class="cal">
							<span class="big-m">July</span> <span class="small-yyyym">2024
								July</span>
							<ul>
								<li class="datelist19" data-date="2024-07-19"><a
									href="chungra"><span class="day">오늘</span>19</a></li>
								<li class="datelist20" data-date="2024-07-20"><a
									href="cdatelist20"><span class="day">토</span>20</a></li>
								<li class="datelist21" data-date="2024-07-21"><a
									href="cdatelist21"><span class="day">일</span>21</a></li>
								<li class="datelist22" data-date="2024-07-22"><a href="#"><span
										class="day">월</span>22</a></li>
								<li class="datelist23" data-date="2024-07-23"><a href="#"><span
										class="day">화</span>23</a></li>
								<li class="datelist24" data-date="2024-07-24"><a href="#"><span
										class="day">수</span>24</a></li>
							</ul>
						</div>


					</div>
				</div>
			</div>
</div>
			<table border="1">
				<tr>
					<th width="120px">영화관명</th>
					<th width="120px">상영관</th>
					<th width="120px">영화명</th>
					<th width="120px">시작시간</th>
					<th width="120px">종료시간</th>
				</tr>

				<%-- 페이지번호(pageNum 파라미터) 가져와서 저장(없을 경우 기본값 1로 설정) --%>
				<c:set var="pageNum" value="1" />

				<%-- pageNum 파라미터 존재할 경우(비어있지 않음) 판별 --%>
				<c:if test="${not empty param.pageNum}">
					<c:set var="pageNum" value="${param.pageNum}" />
				</c:if>

				<%-- JSTL과 EL 활용하여 글목록 표시 작업 반복(boardList 객체 활용) --%>
				<c:forEach var="play" items="${playList}">

					<c:if
						test="${play.theater_name eq '청라' and play.play_day eq '2024-07-21T00:00'}">
						<tr>
							<td>${play.theater_name}</td>
							<td>${play.room_num}</td>
							<td>${play.movie_name_kr}</td>
							<td>${play.play_start_time}</td>
							<td>${play.play_end_time}</td>
						</tr>
					</c:if>
				</c:forEach>
				<%--게시물 목록이 하나도 없을 경우 메세지 표시 --%>
				<c:if test="${empty playList}">
					<tr>
						<td colspan="5">게시물이 존재하지 않습니다.</td>
					</tr>
				</c:if>
			</table>
	</article>

	<footer>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
<script>
	
</script>

</html>




















