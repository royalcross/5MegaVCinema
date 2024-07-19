<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style type="text/css">
	table{
		margin: 0 auto;
		width: 100%;
	}
	
	table th {
		width: 25%;
	}
	
	.time_select span{
		line-height: 1;
	}
	
	.Btn{
		width: 100%;
		padding: 10px;
		margin-bottom: 10px;
		background-color: #eee;
		border: 0;
	}
	
	.Btn.selected {
		background-color: yellow;		
	}
	
	.inner.cont{
		margin-top: 50px;
		margin-bottom: 50px;
	}
	
	#selectTr {
		vertical-align: top;
	}
	
	.dateInfo {
		margin-bottom: 10px;
	}
	
	.ticketTop {
		display: flex;
		justify-content: space-around;
		margin-bottom: 30px;
	}
	
	.btnsubmit {
		display: block;
		width: 100px;
		height: 100%;
	}
	
	#date {
		margin-top: 10px;
	}
	
	#ticket {
		text-align: center;
	}
</style>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>

	<section class="inner cont">
		<div class="ticketTop">
			<div class="date">
				<span class="dateInfo">관람하실 날짜를 선택해주세요.</span> <br>
				<input type="date" id="date">
				<input type="button" value="조회하기" id="dateBtn">
			</div>
			<div>
				<table border="1" id="ticket" >
					<tr>
						<td width="100">날짜</td>
						<td width="200">영화관</td>
						<td width="300">영화</td>
						<td width="100">상영관</td>
						<td width="100">시간</td>
						<td width="100">좌석</td>
					</tr>
					<tr height="30">
						<td id="selectedDate"></td>
						<td id="selectedTheater"></td>
						<td id="selectedMovie"></td>
						<td id="selectedRoom"></td>
						<td id="selectedTime"></td>
						<td id="selectedSeat"></td>
					</tr>
				</table>
			</div>
			<form action="Reserve_seat" onsubmit="return subBtn()" method="get">
			    <input type="hidden" name="order_ticket_date" id="order_ticket_date" value="">
			    <input type="hidden" name="order_ticket_theater_name" id="order_ticket_theater_name" value="">
			    <input type="hidden" name="order_ticket_movie_name_kr" id="order_ticket_movie_name_kr" value="">
			    <input type="hidden" name="order_ticket_room_num" id="order_ticket_room_num" value="">
			    <input type="hidden" name="order_ticket_play_start_time" id="order_ticket_play_start_time" value="">
			    
			    <input type="submit" class="btnsubmit" value="좌석선택">
			</form>
		</div>
		<table border="1">
			<tr>
				<th>영화관</th>
				<th>영화</th>
				<th>상영관</th>
				<th>시간</th>
			</tr>
			<tr id="selectTr">
				<td class="theater_select">
<%-- 						<c:forEach var="theater" items="${newTheaterList}"> --%>
<%-- 							<button type="button" class="theaterBtn Btn"  value="${theater.play_theater_name}" > --%>
<%-- 								${theater.play_theater_name} --%>
<!-- 							</button>	 -->
<%-- 						</c:forEach> --%>
				</td>
				<td class="movie_select">
<%-- 						<c:forEach var="movie" items="${movieList}"> --%>
<%-- 							<button value="${movie.movie_name_kr}"  --%>
<!-- 							style="width: 100% ; padding: 10px; margin-bottom : 10px; background-color: #eee ; border: 0;"> -->
<%-- 								${movie.movie_name_kr} --%>
<!-- 							</button>	 -->
<%-- 						</c:forEach> --%>
					<span>영화관을 먼저 선택해주세요</span>
				</td>
				<td class="room_select">
				</td>
				<td class="time_select">
				</td>
			</tr>
		</table>
	</section>
	<script>
		$(function() {
			// 날짜 선택하면 그에 맞는 극장 표출 !!!!!!!!!!
			let dateBtn = document.querySelector('#dateBtn');
			
			$(dateBtn).click(function(){
				
				console.log("선택된 날짜 : " + $("#date").val());
				
				$("#selectedDate").text($("#date").val());
				
				// 예매내역(input hidden 에 value 값 넣어주기)
				$("#order_ticket_date").val($("#date").val());
				
				if($("#date").val() == ""){
					alert("날짜를 선택해주세요!");
					$("#date").focus();
				} 
				
				$.ajax({
					url: "ReserveDateAjax",
					type : "get",
					async:false, // 이 한줄만 추가해주시면 됩니다.
					data:{
						"play_day": $("#date").val()
					},
					dataType: "json",
					success: function (response) {
// 						alert("극장표출 ajax 성공!");
// 						date = $("#date").val();
						
						$(".theater_select").html("");
						
						let TheaterNameArr = [];
						
						for(let theater of response) {
	 						TheaterNameArr.push(theater);
	 					}
						
						let uniqueTheaterNameData = new Set(TheaterNameArr);
						
						for(let theater of uniqueTheaterNameData ){
	 				    	$(".theater_select").append("<input type ='button' value='" + theater + "' class='theaterBtn Btn'><br>");
	 			     	}
					}
				});
				
			}); // 날짜선택 end
			
// 			console.log(date);
			
			// 극장 버튼 클릭 시 동일한 극장으로 상영시간표에 등록된 영화 뜨게 하기
			$(document).on('click', '.theaterBtn', function() {
				
// 			    console.log("theaterBtn clicked!"); // 확인용

				// 클릭 시 색깔 변경
			    $(".theaterBtn").removeClass("selected");
			    $(this).addClass("selected");
			    
			    // 클릭 시 예매내역에 출력되게 하기
			    let theater = $(".theaterBtn.selected").val();
			    
				let theaterName = JSON.stringify(theater).replaceAll('"', ''); // stringify 시 붙는 "" 삭제
			    $("#selectedTheater").text(theaterName);
				
			 	// 예매내역(input hidden 에 value 값 넣어주기)
				$("#order_ticket_theater_name").val(theater);
				
				$(".movie_select").html("");
				$(".room_select").html("");
				$(".time_select").html("");
				
			    $.ajax({
					url: "ReserveMovieAjax",
					async:false, // 이 한줄만 추가해주시면 됩니다.
					type : "get",
					data:{
						"play_theater_name": $(this).val(),
						"play_day" : $("#date").val()
						},
					dataType: "json",
					success: function (response) {
// 						alert("theater ajax 성공!");

						// 이전에 있던 데이터 제거
				    	$(".movie_select").html("");
						
						let MovieNameArr = [];
						
						for(let movie of response) {
							MovieNameArr.push(movie);
						}
						
						let uniqueMovieNameData = new Set(MovieNameArr);
						
						for(let movie of uniqueMovieNameData ){
// 							console.log(movie);
							// 문자열 인식 문제때문에 value 부분에 '' 로 한번 더 감싸줌
					    	$(".movie_select").append("<input type ='button' value='" + movie + "' class='movieBtn Btn'><br>");
				     	}
				    	
					},
					error: function(response){
						alert("실패");
					}
				});
			});
			
			// 영화 클릭 시 상영시간표에 등록된 해당 영화가 상영되는 상영관 출력
			$(document).on('click', '.movieBtn', function() {
				 console.log("theaterBtn clicked!");
				 
				// 클릭 시 색깔 변경
			    $(".movieBtn").removeClass("selected");
			    $(this).addClass("selected");
			    
			    // 클릭 시 예매내역에 출력되게 하기
			    let movie = $(".movieBtn.selected").val();
			    
			    let movieName = JSON.stringify(movie).replaceAll('"', ''); // stringify 시 붙는 "" 삭제
			    $("#selectedMovie").text(movieName);   
			    
				// 예매내역(input hidden 에 value 값 넣어주기)
				$("#order_ticket_movie_name_kr").val(movie);
				 
				console.log("영화 클릭 시 나타나는 극장명 : " + $("#selectedTheater").val())
				
				$(".room_select").html("");
				$(".time_select").html("");
				
				 $.ajax({
					url: "ReserveRoomAjax",
					async:false, // 이 한줄만 추가해주시면 됩니다.
					type : "get",
					data:{
						"play_theater_name": $(".theaterBtn.selected").val(),
						"play_day" : $("#date").val(),
						"play_movie_name_kr": $(this).val()
					},
					dataType: "json",
					success: function (response) {
// 	 					alert("theater ajax 성공!");
					    	
// 	// 					$(".movie_select").html(JSON.stringify(response));
		
						// 이전에 있던 데이터 제거
				    	$(".room_select").html("");
							
						let roomNumArr = [];
							
						for(let room of response) {
							roomNumArr.push(room);
						}
						
						let uniqueRoomNumData = new Set(roomNumArr);
						
						for(let room of uniqueRoomNumData ){
//	 							console.log(movie);
							// 문자열 인식 문제때문에 value 부분에 '' 로 한번 더 감싸줌
					    	$(".room_select").append("<input type ='button' value='" + room + "' class='RoomBtn Btn'><br>");
				     	}
					},
					error: function(response){
						alert("실패");
					}
				});
 			});
			
			// 상영관 버튼 클릭 시 시간 뜨게 하기
			$(document).on('click', '.RoomBtn', function() {
			    console.log("RoomBtn clicked!"); // 확인용

				// 클릭 시 색깔 변경
			    $(".RoomBtn").removeClass("selected");
			    $(this).addClass("selected");
			    
			    // 클릭 시 예매내역에 출력되게 하기
			    let room = $(".RoomBtn.selected").val();
// 			    console.log("상영관 : " + room); // -> 맨 앞에 것만 출력됨 !!!!
			    
				let RoomNum = JSON.stringify(room).replaceAll('"', ''); // stringify 시 붙는 "" 삭제
			    $("#selectedRoom").text(RoomNum);
				
				// 예매내역(input hidden 에 value 값 넣어주기)
				$("#order_ticket_room_num").val(room);
				
				$(".time_select").html("");
				
			    $.ajax({
					url: "ReserveTimeAjax",
					async:false, // 이 한줄만 추가해주시면 됩니다.
					type : "get",
					data:{
						"play_theater_name": $(".theaterBtn.selected").val(),
						"play_day" : $("#date").val(),
						"play_movie_name_kr": $(".movieBtn.selected").val(),
						"play_room_num":  $(this).val()
						},
					dataType: "json",
					success: function (response) {
// 						alert("time ajax 성공!");
				    	
	// 					$(".movie_select").html(JSON.stringify(response));
	
						// 이전에 있던 데이터 제거
				    	$(".time_select").html("");
						
						let MovieTimeArr = [];
						
						for(let time of response) {
							MovieTimeArr.push(time);
						}
						
						let uniqueMovieTimeData = new Set(MovieTimeArr);
						
						for(let time of uniqueMovieTimeData ){
					    	$(".time_select").append("<input type ='button' value="+ time +" class='TimeBtn Btn'><br>");
				     	}
					},
					error: function(response){
						alert("실패");
					}
				});
			});
			
			// 시간 버튼 동작
			$(document).on('click', '.TimeBtn', function() {
				console.log("TimeBtn clicked!"); // 확인용

				// 클릭 시 색깔 변경
			    $(".TimeBtn").removeClass("selected");
			    $(this).addClass("selected");
			    
			    // 클릭 시 예매내역에 출력되게 하기
			    let TimeBtn = $(".TimeBtn.selected").val();
				let Time = JSON.stringify(TimeBtn).replaceAll('"', ''); // stringify 시 붙는 "" 삭제
			    $("#selectedTime").text(Time);
				
			 	// 예매내역(input hidden 에 value 값 넣어주기)
				$("#order_ticket_play_start_time").val(Time);
				
			});
			
			
			function param() {
				// 선택된 각 속성을 각각의 hidden input 태그에 설정
				document.querySelector("#")
			}
			
		});
		
		function subBtn(){
			let sId = '<%= session.getAttribute("sId") %>';   	
			if(sId == null){
				if(confirm("로그인이 필요한서비스입니다.")){
					location.href = "MemberLogin";
				}
				
				return false;
			}
			
			if($("#theater_name").val()==""){
				alert("극장선택 필수!")
				return false;
			}
			
			if($("#movie_name").val()==""){
				alert("영화선택 필수!")
				return false;
			}
			
			
			if($("#play_date").val()==""){
				alert("날짜선택 필수!")
				return false;
			}
			
			if($("#play_start_time").val()==""){
				alert("시간선택 필수!")
				return false;
			}
		}
		
	</script>
	<footer>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>