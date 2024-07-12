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
            


<div class="section group section-theater-head" style="background: url('https://file.cineq.co.kr/j.aspx?guid=1b2b4cbf8ab0494282f8e27ce6d366f4') center center no-repeat; background-size: cover; width: 100%; height: 550px; margin-top: 50px;">
    <div class="wrap2">
        <!--<span class="name-1">CINE Q</span>-->
        <span class="name-2">신도림<br></span>
        <span class="name-3">신도림 테크노마트 12층. 자연친화적인 복합 문화생활공간<p>최고의 몰입감을 선사하는 전 좌석 리클라이너 프리미엄 상영관 Reserve &amp; Suite
    </p></span></div>
</div>

<div class="section group section-theater-body">

    <div class="wrap">
    
    <div class="section group section-theater-select">
			<ul class="selector-summary">
				<li><a href="sindorim" class="">상영시간표</a></li>
				<li><a href="sindorim_map" class="">약도/교통</a></li>
				<li><a href="sindorim_price" class=" selected">관람료</a></li>
			</ul>
		</div>    
    
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
</div>
        <!--.bbs-list-theater-price -->





    </div>
		</article>
	<script type="text/javascript">

let datelist19 = document.querySelectorAll('.datelist19');
let datelist20 = document.querySelectorAll('.datelist20');
let datelist21 = document.querySelectorAll('.datelist21');
let datelist22 = document.querySelectorAll('.datelist22');
let datelist23 = document.querySelectorAll('.datelist23');
let datelist24 = document.querySelectorAll('.datelist24');
let datelist25 = document.querySelectorAll('.datelist25');
let datelist26 = document.querySelectorAll('.datelist26');
let datelist27 = document.querySelectorAll('.datelist27');
let datelist28 = document.querySelectorAll('.datelist28');
let datelist29 = document.querySelectorAll('.datelist29');
let datelist30 = document.querySelectorAll('.datelist30');
let datelist31 = document.querySelectorAll('.datelist31');

		
for(let i = 0; i < datelist19.length; i++){
	datelist19[i].onclick = function () {
		datelist19[0].classList.remove('on');
		datelist19[1].classList.remove('on');
		datelist19[2].classList.remove('on');
		datelist19[3].classList.remove('on');
		datelist19[4].classList.remove('on');
		datelist19[5].classList.remove('on');
		datelist19[6].classList.remove('on');
		datelist19[7].classList.remove('on');
		datelist19[8].classList.remove('on');
		datelist19[9].classList.remove('on');
		datelist19[10].classList.remove('on');
		datelist19[11].classList.remove('on');
		datelist19[12].classList.remove('on');
	                  
		datelist19[i].classList.add('on');
	
		datelist20[0].classList.remove('on');
		datelist20[1].classList.remove('on');
		datelist20[2].classList.remove('on');
		datelist20[3].classList.remove('on');
		datelist20[4].classList.remove('on');
		datelist20[5].classList.remove('on');
		datelist20[6].classList.remove('on');
		datelist20[7].classList.remove('on');
		datelist20[8].classList.remove('on');
		datelist20[9].classList.remove('on');
		datelist20[10].classList.remove('on');
		datelist20[11].classList.remove('on');
		datelist20[12].classList.remove('on');
	
		datelist20[i].classList.add('on');
		
		datelist21[0].classList.remove('on');
		datelist21[1].classList.remove('on');
		datelist21[2].classList.remove('on');
		datelist21[3].classList.remove('on');
		datelist21[4].classList.remove('on');
		datelist21[5].classList.remove('on');
		datelist21[6].classList.remove('on');
		datelist21[7].classList.remove('on');
		datelist21[8].classList.remove('on');
		datelist21[9].classList.remove('on');
		datelist21[10].classList.remove('on');
		datelist21[11].classList.remove('on');
		datelist21[12].classList.remove('on');
	
		datelist21[i].classList.add('on');
		
		datelist22[0].classList.remove('on');
		datelist22[1].classList.remove('on');
		datelist22[2].classList.remove('on');
		datelist22[3].classList.remove('on');
		datelist22[4].classList.remove('on');
		datelist22[5].classList.remove('on');
		datelist22[6].classList.remove('on');
		datelist22[7].classList.remove('on');
		datelist22[8].classList.remove('on');
		datelist22[9].classList.remove('on');
		datelist22[10].classList.remove('on');
		datelist22[11].classList.remove('on');
		datelist22[12].classList.remove('on');
	
		datelist22[i].classList.add('on');
		
		datelist23[0].classList.remove('on');
		datelist23[1].classList.remove('on');
		datelist23[2].classList.remove('on');
		datelist23[3].classList.remove('on');
		datelist23[4].classList.remove('on');
		datelist23[5].classList.remove('on');
		datelist23[6].classList.remove('on');
		datelist23[7].classList.remove('on');
		datelist23[8].classList.remove('on');
		datelist23[9].classList.remove('on');
		datelist23[10].classList.remove('on');
		datelist23[11].classList.remove('on');
		datelist23[12].classList.remove('on');
	
		datelist23[i].classList.add('on');
		
		datelist24[0].classList.remove('on');
		datelist24[1].classList.remove('on');
		datelist24[2].classList.remove('on');
		datelist24[3].classList.remove('on');
		datelist24[4].classList.remove('on');
		datelist24[5].classList.remove('on');
		datelist24[6].classList.remove('on');
		datelist24[7].classList.remove('on');
		datelist24[8].classList.remove('on');
		datelist24[9].classList.remove('on');
		datelist24[10].classList.remove('on');
		datelist24[11].classList.remove('on');
		datelist24[12].classList.remove('on');
	
		datelist24[i].classList.add('on');
		
		datelist25[0].classList.remove('on');
		datelist25[1].classList.remove('on');
		datelist25[2].classList.remove('on');
		datelist25[3].classList.remove('on');
		datelist25[4].classList.remove('on');
		datelist25[5].classList.remove('on');
		datelist25[6].classList.remove('on');
		datelist25[7].classList.remove('on');
		datelist25[8].classList.remove('on');
		datelist25[9].classList.remove('on');
		datelist25[10].classList.remove('on');
		datelist25[11].classList.remove('on');
		datelist25[12].classList.remove('on');
	
		datelist25[i].classList.add('on');
		
		datelist26[0].classList.remove('on');
		datelist26[1].classList.remove('on');
		datelist26[2].classList.remove('on');
		datelist26[3].classList.remove('on');
		datelist26[4].classList.remove('on');
		datelist26[5].classList.remove('on');
		datelist26[6].classList.remove('on');
		datelist26[7].classList.remove('on');
		datelist26[8].classList.remove('on');
		datelist26[9].classList.remove('on');
		datelist26[10].classList.remove('on');
		datelist26[11].classList.remove('on');
		datelist26[12].classList.remove('on');
	
		datelist26[i].classList.add('on');
		
		datelist27[0].classList.remove('on');
		datelist27[1].classList.remove('on');
		datelist27[2].classList.remove('on');
		datelist27[3].classList.remove('on');
		datelist27[4].classList.remove('on');
		datelist27[5].classList.remove('on');
		datelist27[6].classList.remove('on');
		datelist27[7].classList.remove('on');
		datelist27[8].classList.remove('on');
		datelist27[9].classList.remove('on');
		datelist27[10].classList.remove('on');
		datelist27[11].classList.remove('on');
		datelist27[12].classList.remove('on');
	
		datelist27[i].classList.add('on');
		
		datelist28[0].classList.remove('on');
		datelist28[1].classList.remove('on');
		datelist28[2].classList.remove('on');
		datelist28[3].classList.remove('on');
		datelist28[4].classList.remove('on');
		datelist28[5].classList.remove('on');
		datelist28[6].classList.remove('on');
		datelist28[7].classList.remove('on');
		datelist28[8].classList.remove('on');
		datelist28[9].classList.remove('on');
		datelist28[10].classList.remove('on');
		datelist28[11].classList.remove('on');
		datelist28[12].classList.remove('on');
	
		datelist28[i].classList.add('on');
		
		datelist29[0].classList.remove('on');
		datelist29[1].classList.remove('on');
		datelist29[2].classList.remove('on');
		datelist29[3].classList.remove('on');
		datelist29[4].classList.remove('on');
		datelist29[5].classList.remove('on');
		datelist29[6].classList.remove('on');
		datelist29[7].classList.remove('on');
		datelist29[8].classList.remove('on');
		datelist29[9].classList.remove('on');
		datelist29[10].classList.remove('on');
		datelist29[11].classList.remove('on');
		datelist29[12].classList.remove('on');
	
		datelist29[i].classList.add('on');
		
		datelist30[0].classList.remove('on');
		datelist30[1].classList.remove('on');
		datelist30[2].classList.remove('on');
		datelist30[3].classList.remove('on');
		datelist30[4].classList.remove('on');
		datelist30[5].classList.remove('on');
		datelist30[6].classList.remove('on');
		datelist30[7].classList.remove('on');
		datelist30[8].classList.remove('on');
		datelist30[9].classList.remove('on');
		datelist30[10].classList.remove('on');
		datelist30[11].classList.remove('on');
		datelist30[12].classList.remove('on');
	
		datelist30[i].classList.add('on');
		
		datelist31[0].classList.remove('on');
		datelist31[1].classList.remove('on');
		datelist31[2].classList.remove('on');
		datelist31[3].classList.remove('on');
		datelist31[4].classList.remove('on');
		datelist31[5].classList.remove('on');
		datelist31[6].classList.remove('on');
		datelist31[7].classList.remove('on');
		datelist31[8].classList.remove('on');
		datelist31[9].classList.remove('on');
		datelist31[10].classList.remove('on');
		datelist31[11].classList.remove('on');
		datelist31[12].classList.remove('on');
	
		datelist31[i].classList.add('on');
	}
}
</script>


	<footer>
			<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
		</footer>
	</body>


</html>




















