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
	      .wrap-event-box {
        width: 80%;
        margin: 0 auto;
        background-color: #f9f9f9;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    .wrap-event-box p {
        margin: 10px 0;
        color: darkblue;
    }
    .bbs-list-theater-price {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
    }
    .bbs-list-theater-price th, .bbs-list-theater-price td {
        border: 1px solid #ccc;
        padding: 10px;
        text-align: center;
    }
    .bbs-list-theater-price th {
        background-color: #f0f0f0;
        font-weight: bold;
    }
    .bbs-list-theater-price td.price {
        font-weight: bold;
        color: #333;
    }
    .wrap-event-box p:last-child {
        font-size: 12pt;
        margin-top: 20px;
    }
	
		
		</style>
	</head>
	<body>
		<header>
			<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
		</header>
		
		<article>
			
           

<div class="section group section-theater-head" style="background: url('https://file.cineq.co.kr/j.aspx?guid=d1ee83f06fc84ebbbe481fb289995a0b') center center no-repeat; background-size: cover; width: 100%; height: 550px; margin-top: 50px;">
    <div class="wrap2">
        <!--<span class="name-1">CINE Q</span>-->
        <span class="name-2"><span>청라</span></span>
        <span class="name-3"><span>청라국제도시 최초 전 좌석 리클라이너</span></span></div>
</div>


    <div class="section group section-theater-select">
			<ul class="selector-summary">
				<li><a href="chungra" class="">상영시간표</a></li>
				<li><a href="chungra_map" class="">약도/교통</a></li>
				<li><a href="chungra_price" class="selected ">관람료</a></li>
			</ul>
	</div>
		
<div class="section group section-theater-body">

    <div class="wrap">
    
   
    
<div class="wrap-event-box">
    <!--청라-->
    <p>RESERVE</p>
    <table class="bbs-list bbs-list-theater-price">
        <thead>
            <tr>
                <th style="width:20%;">구분</th>
                <th>성인</th>
                <th>청소년</th>
                <th>우대</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="">관람 티켓 가격</td>
                <td class="price">10,000 원</td>
                <td class="price">8,000 원</td>
                <td class="price">6,000 원</td>
            </tr>
        </tbody>
    </table>
    <p>
        ※ 우대 요금 기준<br>
        1. 경로: 만 65세 이상 본인 적용<br>
        2. 국가유공자: 유공자증 제시시 동반 1인까지 적용<br>
        3. 장애인: 장애인증 제시시 중증(1~3급) 동반 1인까지 적용 경증(4~6급) 본인 적용
    </p>
</div>
</div>
</div>


		
    


	</article>
	<footer>
			<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
		</footer>
	</body>


</html>




















