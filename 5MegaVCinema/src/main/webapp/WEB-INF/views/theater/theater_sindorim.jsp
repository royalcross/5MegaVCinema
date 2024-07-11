<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>index</title>
		<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
		<style type="text/css">
sapn {
margin: 0;
padding: 0;
border: 0;
outline: 0;
font-size 100%;
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
background: rgba(0, 0, 0, 0.4);padding:5px;padding-right:5px;
}
.rate-12 {
    background-color: #1e90ff;
    color: white;
    font-size: 12px;
    padding: 3px 5px;
    border-radius: 3px;
    margin-right: 5px;
}
.rate-15 {
    background-color: #ffa500;
    color: white;
    font-size: 12px;
    padding: 3px 5px;
    border-radius: 3px;
    margin-right: 5px;
}
.rate-x {
    background-color: #ff0000;
    color: white;
    font-size: 12px;
    padding: 3px 5px;
    border-radius: 3px;
    margin-right: 5px;
}
.rate-all {
    background-color: #008000;
    color: white;
    font-size: 12px;
    padding: 3px 5px;
    border-radius: 3px;
    margin-right: 5px;
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

    .rate-15 {
        background-color: #ffd700;
        color: #333;
        padding: 2px 5px;
        margin-right: 5px;
        border-radius: 3px;
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

  .timetable {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    .timetable th, .timetable td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    .timetable .title {
        font-size: 18px;
        font-weight: bold;
    }

    .timetable .rate {
        background-color: #ffd700;
        color: #333;
        padding: 2px 5px;
        margin-right: 5px;
        border-radius: 3px;
    }

    .timetable .screen {
        font-size: 15px;
        line-height: 20px;
    }

    .timetable .time {
        margin-bottom: 5px;
    }

    .timetable .time a {
        text-decoration: none;
        color: #333;
    }

    .timetable .seats-status {
        color: green; /* 좌석 상태에 따라 색상을 조정할 수 있습니다 */
    }

    .timetable .timetable-attrib-gv {
        background-color: #f0f0f0;
        color: #333;
        padding: 2px 5px;
        border-radius: 3px;
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

		</style>
	</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>

	<article>
		<div id="container">
			<div id="content">



				<div class="section group section-theater-head"
					style="background: url('https://file.cineq.co.kr/j.aspx?guid=1b2b4cbf8ab0494282f8e27ce6d366f4') center center no-repeat; background-size: cover; width: 100%; height: 550px; margin-top: 50px;">
					<div class="wrap2">
						<!--<span class="name-1">CINE Q</span>-->
						<span class="name-2"><span>신도림</span></span> <span class="name-3"><span>신도림
								테크노마트 12층. 자연친화적인 복합 문화생활공간
								<p>최고의 몰입감을 선사하는 전 좌석 리클라이너 프리미엄 상영관 Reserve &amp; Suite</p>
						</span></span>
					</div>
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
								<li><a href="#" class="prev">이전</a></li>
								<li class="datelist19" data-date="2024-07-19" data-month="July"
									data-year="2024" data-montheng="July" style="display:"><a
									href="#" class="today selected "><span class="day">오늘</span>19</a></li>
								<li class="datelist20" data-date="2024-07-20" data-month="July"
									data-year="2024" data-montheng="July" style="display:"><a
									href="#" class=""><span class="day">토</span>20</a></li>
								<li class="datelist21" data-date="2024-07-21" data-month="July"
									data-year="2024" data-montheng="July" style="display:"><a
									href="#" class=""><span class="day">일</span>21</a></li>
								<li class="datelist22" data-date="2024-07-22" data-month="July"
									data-year="2024" data-montheng="July" style="display:"><a
									href="#" class=""><span class="day">월</span>22</a></li>
								<li class="datelist23" data-date="2024-07-23" data-month="July"
									data-year="2024" data-montheng="July" style="display:"><a
									href="#" class="sat"><span class="day">화</span>23</a></li>
								<li class="datelist24" data-date="2024-07-24" data-month="July"
									data-year="2024" data-montheng="July" style="display:"><a
									href="#" class="sun"><span class="day">수</span>24</a></li>
								<li class="datelist25" data-date="2024-07-25" data-month="July"
									data-year="2024" data-montheng="July" style="display:"><a
									href="#" class="disabled "><span class="day">목</span>25</a></li>
								<li class="datelist26" data-date="2024-07-26" data-month="July"
									data-year="2024" data-montheng="July" style="display: none"><a
									href="#" class="disabled "><span class="day">금</span>26</a></li>
								<li class="datelist27" data-date="2024-07-27" data-month="July"
									data-year="2024" data-montheng="July" style="display: none"><a
									href="#" class=""><span class="day">토</span>27</a></li>
								<li class="datelist28" data-date="2024-07-28" data-month="July"
									data-year="2024" data-montheng="July" style="display: none"><a
									href="#" class="disabled "><span class="day">일</span>28</a></li>
								<li class="datelist29" data-date="2024-07-29" data-month="July"
									data-year="2024" data-montheng="July" style="display: none"><a
									href="#" class="disabled "><span class="day">월</span>29</a></li>
								<li class="datelist30" data-date="2024-07-30" data-month="July"
									data-year="2024" data-montheng="July" style="display: none"><a
									href="#" class="disabled sat"><span class="day">화</span>30</a></li>
								<li class="datelist31" data-date="2024-07-31" data-month="July"
									data-year="2024" data-montheng="July" style="display: none"><a
									href="#" class="sun"><span class="day">수</span>31</a></li>

								<li><a href="#" class="next">이전</a></li>
							</ul>
						</div>

						<div class="selector-sub">
							<a href="#" data-listtype="movie" class="selected">영화별</a> | <a
								href="#" data-listtype="time">시간대별</a>
						</div>

					</div>

					<div class="wrap-special-box">
						<ul class="desc">
							<li><span class="rate-all">전체</span> 전체 관람가</li>
							<li><span class="rate-12">12</span> 12세 관람가</li>
							<li><span class="rate-15">15</span> 15세 관람가</li>
							<li><span class="rate-x">청불</span> 청소년 관람불가</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<table
		<tr>
									<td>${movie.movie_name_kr}</td>
		</tr>
		></table>
		<form action="AdminStoreModify" method="post" name="movieForm">
			<div id="resultArea"></div>
			<!-- 수정 팝업 내용 들어갈 자리 -->
			<div class="btnArea" style="text-align: center">
				
			</div>
		</form>

	</article>

	<footer>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
<script type="text/javascript">
$(function() {
	$(movieBtn).click(function() {
		$.ajax({
			url:"AdminStoreModify",
			data:{
				"movie_name_kr": $(this).val()
				},
			method:"post",
			success: function (response) {
				$("#resultArea").html(response);
			}
		});
	});
});
</script>

</html>



















