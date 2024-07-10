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
.section-theater-location {
        margin-top: 40px;
    }
    .wrap {
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
        background-color: #f9f9f9;
        border: 1px solid #ddd;
        border-radius: 8px;
    }
    .location-title {
        font-size: 24px;
        margin-bottom: 10px;
        color: #333;
        border-bottom: 2px solid #333;
        padding-bottom: 5px;
    }
    .table-location {
        width: 100%;
        margin-bottom: 20px;
        border-collapse: collapse;
        border-spacing: 0;
    }
    .table-location caption {
        font-weight: bold;
        font-size: 18px;
        margin-bottom: 10px;
    }
    .table-location th, .table-location td {
        padding: 10px;
        text-align: left;
        vertical-align: top;
        border-bottom: 1px solid #ddd;
    }
    .table-location th {
        font-weight: bold;
        width: 25%;
    }
    .table-location td {
        width: 75%;
    }
    .table-location ul {
        list-style-type: none;
        padding-left: 0;
    }
    .table-location ul li {
        margin-bottom: 5px;
    }
    .table-location .kind {
        font-weight: bold;
        color: #007bff; /* blue color for bus types */
    }
    .table-location .notice {
        font-weight: bold;
        color: #dc3545; /* red color for notices */
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
			
           

<div class="section group section-theater-head" style="background: url('https://file.cineq.co.kr/j.aspx?guid=1b2b4cbf8ab0494282f8e27ce6d366f4') center center no-repeat; background-size: cover; width: 100%; height: 550px; margin-top: 50px;">
    <div class="wrap2">
        <!--<span class="name-1">CINE Q</span>-->
        <span class="name-2">신도림<br></span>
        <span class="name-3">신도림 테크노마트 12층. 자연친화적인 복합 문화생활공간<p>최고의 몰입감을 선사하는 전 좌석 리클라이너 프리미엄 상영관 Reserve &amp; Suite
    </p></span></div>
</div>

    <div class="section group section-theater-select">
			<ul class="selector-summary">
				<li><a href="sindorim" class="">상영시간표</a></li>
				<li><a href="sindorim_map" class="selected">약도/교통</a></li>
				<li><a href="sindorim_price" class=" ">관람료</a></li>
			</ul>
	</div>
		<div class="map-container">
			<div class="addr">주소 : 서울특별시 구로구 새말로 97</div>
			<iframe
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.037101774987!2d126.88802445079014!3d37.50704307970996!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9e5d5d464d2d%3A0x5619ad3e9f14195b!2z7ISc7Jq47Yq567OE7IucIOq1rOuhnOq1rCDsg4jrp5DroZwgOTc!5e0!3m2!1sko!2skr!4v1511160175794"
				width="1020" height="521"
				style="border: 0; display: block; margin: 0 auto;"></iframe>
		</div>



		<div class="section group section-theater-location">
			<div class="wrap">
				<h2 class="location-title">오시는길</h2>
				<table class="table-location">
					<caption>대중교통</caption>
					<tbody>
						<tr>
							<th class="subway">지하철</th>
							<td>
								<ul>
									<li>[지하철 이용 시]</li>
									<li>■ 1호선, 2호선 신도림역 3번 출구</li>
									<li>· 신도림역 하차 후 3번 출구쪽 헌혈의 집으로 이동</li>
									<li>· 정면에 위치한 테크노마트 (B1층) 입구로 진입</li>
									<li>· 진입 후 왼쪽으로 이동 시, 전용 엘리베이터 (15~17호기) 탑승하여 12F 씨네Q로 이동</li>
									<li>※ 건물 휴업일에도 동일한 경로로 입장 가능합니다.</li>
								</ul>
							</td>
						</tr>
						<tr>
							<th class="bus">버스</th>
							<td>
								<ul>
									<li><span class="kind">지선</span> 5611, 5619, 6411, 5144,
										8641</li>
									<li><span class="kind">간선</span> 5200</li>
									<li><span class="kind">마을</span> 영등포01, 영등포 08, 영등포 09,
										영등포 12, 영등포 13</li>
								</ul>


							</td>
						</tr>
					</tbody>
				</table>
				<table class="table-location">
					<caption>자가용</caption>
					<tbody>
						<tr>
							<th class="car">자가용</th>
							<td>
								<ul>
									<li>[자가용 이용 시]</li>
									<li>· 내비게이션 주소 : 서울시 구로구 새말로 97, 테크노마트</li>
									<li>· 영등포 방향 : 새말로 진입 후 신도림교 → 신도림역 버스정류소 지나 좌측 횡단보도 이마트
										매장입구 IN 진입</li>
									<li>· 구로역 방향 : 미래초교앞 교차로에서 미래초교 방향으로 직진 후 우측 포스빌 기준으로 좌회전
										신호 후 입구 진입</li>
									<li></li>
									<li>[주차안내]</li>
									<li>· 주소: 서울특별시 구로구 새말로 97</li>
									<li>· 주차장 : 지하 3층 ~ 지하 7층</li>
								</ul>
							</td>
						</tr>
						<tr>
							<th class="parking">주차</th>
							<td><span class="notice">주차요금 안내</span>
								<ul>
									<li></li>
									<li>기본 4시간 무료 (초과 30분 당 1,500원) <br>· 영화 관람 시, 12층 주차
										인증용 PC에서 적용 가능합니다. <br>· 테크노마트 건물 내 다른 업체와 합산 적용은 불가합니다.
									</li>
								</ul></td>
						</tr>
					</tbody>
				</table>

			</div>
		</div>
		


	</article>
	<footer>
			<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
		</footer>
	</body>


</html>




















