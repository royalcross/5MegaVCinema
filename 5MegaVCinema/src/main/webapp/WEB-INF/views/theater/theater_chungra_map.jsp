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
				<li><a href="chungra_map" class="selected">약도/교통</a></li>
				<li><a href="chungra_price" class=" ">관람료</a></li>
			</ul>
	</div>
		<div class="map-container">
			<div class="addr">주소 : 인천광역시 서구 중봉대로 610, 마루힐프라자 8층</div>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.8904743015764!2d126.64826861557226!3d37.53407903374353!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b7facf07323cb%3A0xfc0ab85b84a391e0!2z66eI66Oo7Z6QIO2UhOudvOyekA!5e0!3m2!1sko!2skr!4v1667364614249!5m2!1sko!2skr" width="1020" height="521" frameborder="0" style="border:0" allowfullscreen=""></iframe>

    </div>



		<div class="section group section-theater-location">
			<div class="wrap">
        <h2 class="location-title">오시는길</h2>
        <table class="table-location">
            <caption>대중교통</caption>
            <tbody><tr>
                <th class="subway">지하철</th>
                <td>
                    <ul>
                        <li>[지하철 이용 시]</li>
<li>■ 인천 2호선 가정역 이용</li>
                    </ul>
                </td>
            </tr>
            <tr>
                <th class="bus">버스</th>
                <td>
                    <ul>
                        <li><span class="kind">지선</span> &nbsp;</li>
                        <li><span class="kind">간선</span> 306, 2-1, 43, 72</li>
                        <li><span class="kind">마을</span> &nbsp;</li>
                    </ul>	

                    
                </td>
            </tr>
        </tbody></table>
        <table class="table-location">
            <caption>자가용</caption>
            <tbody><tr>
                <th class="car">자가용</th>
                <td>
                    <ul>
                        <li>[주차안내]</li>
<li>· 주소: 인천광역시 서구 중봉대로 610, 마루힐프라자</li>
<li>· 주차장 : 지하 1층 ~ 지하 3층</li>
                    </ul>
                </td>
            </tr>
            <tr>
                <th class="parking">주차</th>
                <td>
                    <span class="notice">주차요금 안내</span>
                    <ul>
                        <li></li><li>기본 3시간 무료
<br>· 3시간 이후 10분 당 1,000원</li>
                    </ul>
                </td>
            </tr>
        </tbody></table>

    </div>
		</div>
		


	</article>
	<footer>
			<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
		</footer>
	</body>


</html>




















