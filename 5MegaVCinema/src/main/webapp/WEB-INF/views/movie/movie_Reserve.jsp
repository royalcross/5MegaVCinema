<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath}/resources/css/default.css"
	rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
   .wrap-date {
            width: 300px;
            margin: 0 auto;
            font-family: Arial, sans-serif;
        }
        .calendar {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            gap: 5px;
            text-align: center;
        }
        .calendar-header, .calendar-day {
            padding: 10px;
            border: 1px solid #ccc;
        }
        .calendar-header {
            background-color: #f2f2f2;
        }
        .calendar-day.today {
            background-color: #ffcccc;
        }
        .calendar-day.selected {
            background-color: #ccffcc;
        }
        .controls {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        .controls button {
            padding: 5px 10px;
        }
</style>
<script
	src="${pageContext.request.servletContext.contextPath}/js/jquery-3.7.1.js">

	
	</script>
	

	
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>

	<div class="top-reserve">
		  <div class="wrap-date">
        <h4 class="title">날짜</h4>
        <div class="controls">
            <button id="prevWeek">이전 주</button>
            <div class="month-year"></div>
            <button id="nextWeek">다음 주</button>
        </div>
        <div class="calendar"></div>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const daysOfWeek = ['일', '월', '화', '수', '목', '금', '토'];
            const monthYear = document.querySelector('.month-year');
            const calendar = document.querySelector('.calendar');
            let currentStartDate = new Date();
            const today = new Date();

            function updateCalendar(startDate) {
                calendar.innerHTML = '';
                monthYear.textContent = `${startDate.getFullYear()}년 ${startDate.getMonth() + 1}월`;

                // Add days of the week headers
                daysOfWeek.forEach(day => {
                    const header = document.createElement('div');
                    header.className = 'calendar-header';
                    header.textContent = day;
                    calendar.appendChild(header);
                });

                // Add the days of the current week
                for (let i = 0; i < 7; i++) {
                    const date = new Date(startDate);
                    date.setDate(startDate.getDate() + i);
                    const day = document.createElement('div');
                    day.className = 'calendar-day' + (date.toDateString() === today.toDateString() ? ' today' : '');
                    day.textContent = date.getDate();
                    day.addEventListener('click', function() {
                        document.querySelectorAll('.calendar-day').forEach(d => d.classList.remove('selected'));
                        day.classList.add('selected');
                    });
                    calendar.appendChild(day);
                }

                // Disable the "previous week" button if the current start date is before today
                const prevWeekButton = document.getElementById('prevWeek');
                if (startDate <= today) {
                    prevWeekButton.disabled = true;
                } else {
                    prevWeekButton.disabled = false;
                }
            }

            document.getElementById('prevWeek').addEventListener('click', function() {
                currentStartDate.setDate(currentStartDate.getDate() - 7);
                updateCalendar(currentStartDate);
            });

            document.getElementById('nextWeek').addEventListener('click', function() {
                currentStartDate.setDate(currentStartDate.getDate() + 7);
                updateCalendar(currentStartDate);
            });

            updateCalendar(currentStartDate);
        });
    </script>

	</div>
	<div class="left-reserve">
   

		<div>
			<h1>영화관</h1>
		</div>

		<div class="theater-box">
			<a href="#" class="theater selected">신도림</a>
			<a href="#" class="theater">동탄</a> 
			<a href="#" class="theater">천안불당</a> 
			<a href="#" class="theater">경주보문</a> 
			<a href="#" class="theater">구미봉곡</a>
			<a href="#" class="theater">남양주다산</a> 
			<a href="#" class="theater">대구이시아</a>
			<a href="#" class="theater">청라</a> 
			<a href="#" class="theater">보은</a>
			<a href="#" class="theater">영덕예주</a> 
			<a href="#" class="theater">칠곡호이</a>
		</div>
	<div class="">
	 <h4 class="title">영화</h4>
    <div class="btn-box1">
        <a href="#" class="" data-type="select">전체 선택</a>
        <a href="#" class="" data-type="reload">전체 해제</a>
    </div>
    <div class="btn-box2">
        <a href="#" class="selected" data-sorttype="1">예매율순</a>
        <a href="#" class="" data-sorttype="2">가나다순</a>
    </div>
    
    
    <ul class="list-movie-name" style="height: 278px;">
            <li><input type="checkbox" id="theater1" name="movie_Code" value="20235974" class="ck-movie"><label for="theater1"><span class="rate-all">0</span>영화1</label><span class="check"></span></li>
            <li><input type="checkbox" id="theater2" name="movie_Code" value="20208245" class="ck-movie"><label for="theater2"><span class="rate-15">15</span>영화2</label><span class="check"></span></li>
            <li><input type="checkbox" id="theater3" name="movie_Code" value="20123662" class="ck-movie"><label for="theater3"><span class="rate-15">15</span>영화3</label><span class="check"></span></li>
            <li><input type="checkbox" id="theater4" name="movie_Code" value="20148424" class="ck-movie"><label for="theater4"><span class="rate-15">15</span>영화4</label><span class="check"></span></li>
	</ul>
	
	</div>
	</div>
	
	<div class="right-reserve">
       <div class="wrap-timetable"><p class="ready">영화관과 영화를 선택하면 시간표가 나옵니다.</p></div>

    </div>
	
	<div class="bottom-reserve">
        <div class="wrap-rsv-select">
            <a href="reserve_seat" class="btn-rsv-next">다음</a>
        </div>
    </div>
	
	
	<footer>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>

</body>
</html>