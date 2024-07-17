<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<h1>상영스케줄 등록 페이지</h1>
	

	
<div class="content">
<!-- 		 <form action="adminInsertPlay" method ="post" name="registForm"> -->
				        <div>
		<label for="movie_name_kr">영화 선택</label>
			<select id="movie_name_kr" name="movie_name_kr">
<!-- 			 onclick="setMovieName(this.value)" -->
			 
			<c:forEach var="movie" items="${movieList}">
				<option>${movie.movie_name_kr}</option>
			</c:forEach>
			</select>
		
			<input type="button" id="btnMovieCode" value="영화 코드 조회"> <br>
		<label for="play_movie_code">영화코드 조회</label>
			<input type="text" name="play_movie_code" id="play_movie_code"> 
			
			
		<c:set var="movie" target="${movieList}"/><br>
		
			
		<label for="play_theater_num">영화관명</label>
			<select name="play_theater_num" required onchange="selectTheaterNum(this.value)">
				<option value="1001">신도림</option>
				<option value="1002">청라</option>
				<option value="1003">동탄</option>
				<option value="1004">남양주다산</option>
				<option value="1006">경주보문</option>
				<option value="1007">구미봉곡</option>
				<option value="1005">천안불당</option>
				<option value="1008">대구이시아</option>
				<option value="1009">보은</option>
				<option value="1010">칠곡호이</option>
				<option value="1011">영덕예주</option>
			</select><br>
		
		<label for="play_room_num">상영관</label>
		<select name="play_room_num" required>
			<option>1</option>
			<option>2</option>
			<option>3</option>
			<option>4</option>
			<option>5</option>
		</select><br>
		
		
		<label for="play_start_time">상영 시작 시간</label>
		<select name="play_start_time" id="play_start_time">
			<option>시작 시간 선택</option>
			<option value="09:00">09:00</option>			
			<option value="10:00">10:00</option>			
			<option value="11:00">11:00</option>			
			<option value="12:00">12:00</option>			
			<option value="13:00">13:00</option>			
			<option value="14:00">14:00</option>			
			<option value="15:00">15:00</option>			
			<option value="16:00">16:00</option>			
			<option value="17:00">17:00</option>			
			<option value="18:00">18:00</option>			
			<option value="19:00">19:00</option>			
			<option value="20:00">20:00</option>			
			<option value="21:00">21:00</option>			
			<option value="22:00">22:00</option>			
		</select>
		<input type="button" value="상영종료시간 조회" id="btnEndTime"><br>
		<label for="play_end_time">상영 종료 시간</label>
		<input type="text" name="play_end_time" id="play_end_time" readonly>

		
		<div id="resultArea"></div>
	 </div>
<!-- 			        </form> -->
				</div>
				
				 <script type="text/javascript">
								
					 function selectTheaterNum(theater) {
							
					 		if(theater == "신도림"){ 
					 			document.registForm.room_theater_num.value = 1001;
					 		} else if(theater == "청라") {
					 			document.registForm.room_theater_num.value = 1002;
					 		} else if(theater == "동탄") {
					 			document.registForm.room_theater_num.value = 1003;
					 		} else if(theater == "남양주다산") {
					 			document.registForm.room_theater_num.value = 1004;
					 		} else if(theater == "천안불당") {
					 			document.registForm.room_theater_num.value = 1005;
					 		} else if(theater == "경주보문") {
					 			document.registForm.room_theater_num.value = 1006;
					 		} else if(theater == "구미봉곡") {
					 			document.registForm.room_theater_num.value = 1007;
					 		} else if(theater == "대구이시아") {
					 			document.registForm.room_theater_num.value = 1008;
					 		} else if(theater == "보은") {
					 			document.registForm.room_theater_num.value = 1009;
					 		} else if(theater == "칠곡호이") {
					 			document.registForm.room_theater_num.value = 1010;
					 		} else if(theater == "영덕예주") {
					 			document.registForm.room_theater_num.value = 1011;
					 		}
						}
					
				 
				 
								
							$(function() {
								$("#btnMovieCode").on("click", function() {
									$.ajax({
										type : "GET",
										url : "getMovieCode",
										data : {movie_name_kr : $("#movie_name_kr").val()},
										success : function(response) {
												
											$("#play_movie_code").val(response);
							// 				$("#resultArea").html(response);
										},
										error : function(jqXHR, textStatus, errorThrown) { // 요청 처리 실패(= 응답 에러 발생) 시 자동으로 호출되는 콜백함수
											
											$("#resultArea").html("요청 에러 발생! - " + jqXHR + ", " + textStatus + ", " + errorThrown);
										}
									});
								})
							});
								

							$(function() {
								$("#btnEndTime").on("click", function() {
									$.ajax({
										type : "GET",
										url : "getEndTime",
										data : {movie_name_kr : $("#movie_name_kr").val(),
											play_start_time : $("#play_start_time").val()
											},
										success : function(response) {
											
											$("#play_end_time").val(response);
						// 					$("#resultArea").html(response);
										},
										error : function(jqXHR, textStatus, errorThrown) { // 요청 처리 실패(= 응답 에러 발생) 시 자동으로 호출되는 콜백함수
											
											$("#resultArea").html("요청 에러 발생! - " + jqXHR + ", " + textStatus + ", " + errorThrown);
										}
									});
								})
							});
							</script>


				
</body>
</html>