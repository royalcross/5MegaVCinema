<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<h1>상영스케줄 수정 페이지</h1>
	
	<div>
		<c:forEach var="play" items="${selectedPlayList}">
			<label for="play_movie_name_kr">영화 선택</label>
			<input type="text" name="play_movie_name_kr" value="${play.play_movie_name_kr}" disabled>
<!-- 			<select id="play_movie_name_kr" name="play_movie_name_kr"> -->
<!-- <!-- 			 onclick="setMovieName(this.value)" --> 
			 
<!-- 			<input type="button" id="btnMovieCode" value="영화 코드 조회"> <br> -->
			<label for="play_movie_code">영화코드</label>
			<input type="text" name="play_movie_code" id="play_movie_code" value="${play.play_movie_code}" disabled> 
			
			<input type="hidden" name="play_num" value="${play.play_num}" > 
			
<!-- 			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
			<button type="button" id="btnPlayDay" onclick="setPlayDay()">
			▶▶▶ 상영일 조회하기(!!클릭!!) ▶▶▶</button>
<!-- 			</select> -->
			<label for="play_day">변경 전 상영일</label>
			
<%-- 			<td><fmt:parseDate value="${play.play_day}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/> --%>
<%-- 			<fmt:formatDate pattern="yyyy-MM-dd" value="${parsedDateTime}"/></td> --%>
<%-- 			<input type="text" value="${play.play_day}" id="play_day2"> --%>
			<input type="date" name="play_day_print" id="play_day_print" disabled><br>
			<label for="play_day">변경 후 상영일</label>
			<input type="date" name="play_day" id="play_day">
<!-- 			<input type="hidden" name="play_day" id="play_day" value="playDay3"> -->
			<br>
			
			
			
<%-- 			<c:set var="movie" target="${movieList}"/> --%>
		
			
			<label for="play_theater_name">영화관명</label>
			<select name="play_theater_name" required >
				<option>영화관을 선택하세요.</option>
				<option <c:if test="${play.play_theater_name eq '신도림'}">selected</c:if>>신도림</option>
				<option <c:if test="${play.play_theater_name eq '청라'}">selected</c:if>>청라</option>
				<option <c:if test="${play.play_theater_name eq '동탄'}">selected</c:if>>동탄</option>
				<option <c:if test="${play.play_theater_name eq '남양주다산'}">selected</c:if>>남양주다산</option>
				<option <c:if test="${play.play_theater_name eq '경주보문'}">selected</c:if>>경주보문</option>
				<option <c:if test="${play.play_theater_name eq '구미봉곡'}">selected</c:if>>구미봉곡</option>
				<option <c:if test="${play.play_theater_name eq '천안불당'}">selected</c:if>>천안불당</option>
				<option <c:if test="${play.play_theater_name eq '대구이시아'}">selected</c:if>>대구이시아</option>
				<option <c:if test="${play.play_theater_name eq '보은'}">selected</c:if>>보은</option>
				<option <c:if test="${play.play_theater_name eq '칠곡호이'}">selected</c:if>>칠곡호이</option>
				<option <c:if test="${play.play_theater_name eq '영덕예주'}">selected</c:if>>영덕예주</option>
			</select><br>
			
<!-- 			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<%-- 			<button type="button" id="btnTheaterNum" value="${play.play_theater_name}"> --%>
<!-- 			▼▼▼ 영화관 번호 조회(!!클릭!!) ▼▼▼</button><br> -->
					
<!-- 			<label for="play_theater_num">영화관 번호</label> -->
<!-- 			<input type="text" id="play_theater_num" name="play_theater_num" placeholder="영화관 번호 조회 버튼을 클릭해주세요" disabled> -->
			<input type="hidden" name="play_theater_num" >
		
			<label for="play_room_num">상영관</label>
			<select name="play_room_num" required>
				<option>상영관을 선택하세요.</option>
				<option <c:if test="${play.play_room_num eq 1}">selected</c:if>>1</option>
				<option <c:if test="${play.play_room_num eq 2}">selected</c:if>>2</option>
				<option <c:if test="${play.play_room_num eq 3}">selected</c:if>>3</option>
				<option <c:if test="${play.play_room_num eq 4}">selected</c:if>>4</option>
				<option <c:if test="${play.play_room_num eq 5}">selected</c:if>>5</option> 
			</select><br>
		
		
			<label for="play_start_time">상영 시작 시간</label>
			<select name="play_start_time" id="play_start_time">
				<option>시작 시간 선택</option>
				<option value="09:00" <c:if test="${play.play_start_time eq '09:00:00'}">selected</c:if>>09:00</option>			
				<option value="10:00"<c:if test="${play.play_start_time eq '10:00:00'}">selected</c:if>>10:00</option>			
				<option value="11:00"<c:if test="${play.play_start_time eq '11:00:00'}">selected</c:if>>11:00</option>			
				<option value="12:00"<c:if test="${play.play_start_time eq '12:00:00'}">selected</c:if>>12:00</option>			
				<option value="13:00"<c:if test="${play.play_start_time eq '13:00:00'}">selected</c:if>>13:00</option>			
				<option value="14:00"<c:if test="${play.play_start_time eq '14:00:00'}">selected</c:if>>14:00</option>			
				<option value="15:00"<c:if test="${play.play_start_time eq '15:00:00'}">selected</c:if>>15:00</option>			
				<option value="16:00"<c:if test="${play.play_start_time eq '16:00:00'}">selected</c:if>>16:00</option>			
				<option value="17:00"<c:if test="${play.play_start_time eq '17:00:00'}">selected</c:if>>17:00</option>			
				<option value="18:00"<c:if test="${play.play_start_time eq '18:00:00'}">selected</c:if>>18:00</option>			
				<option value="19:00"<c:if test="${play.play_start_time eq '19:00:00'}">selected</c:if>>19:00</option>			
				<option value="20:00"<c:if test="${play.play_start_time eq '20:00:00'}">selected</c:if>>20:00</option>			
				<option value="21:00"<c:if test="${play.play_start_time eq '21:00:00'}">selected</c:if>>21:00</option>			
				<option value="22:00"<c:if test="${play.play_start_time eq '22:00:00'}">selected</c:if>>22:00</option>			
			</select>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" value="${play.play_num}" id="btnEndTime2">
			▼▼▼ 상영 종료 시간 조회(!!클릭!!) ▼▼▼</button><br>
			
			<label for="play_end_time">상영 종료 시간</label>
			<input type="text" name="play_end_time" id="play_end_time" readonly>
			<script>
			
			//상영일 조회하기
			function setPlayDay(){
// 				console.log("playday : ${play.play_day}")
// 				console.log("new Date().toISOString() : " + new Date("${play.play_day}").toISOString().substring(0, 10);
				
	// 			$("#play_day").val(new Date().toISOString().substring(0,10));
	
	//toISOString 은 날짜 포맷 맞춰주는 함수, 시차때문에 날짜가 실제 상영일이랑 차이가 남
	//시차 해결을 위해 offset 변수 설정
				const offset2 = new Date().getTimezoneOffset() * 60000;
				console.log("offset2" + offset2 + typeof(offset2));
				
				const playDay = new Date("${play.play_day}");
				console.log("playDay" + playDay + typeof(playDay));
				
				const playDay2 = new Date(playDay - offset2);
				console.log("playDay2" + playDay2 + "type of : " + typeof(playDay2));
				
				const playDayResult = playDay2.toISOString().substring(0, 10);
				console.log("playDayResult" + playDayResult);
				$("#play_day_print").val(playDayResult);
				
				console.log(playDayResult);
				
				let playDay3 = new Date(playDay2);
				console.log(playDay3 + " : " + typeof(playDay3));
			}
			</script>
		
<!-- 		<div id="resultArea"></div> -->
		</c:forEach>
	 </div>
				
	<script type="text/javascript">
	
// 		function selectTheaterNum(theater) {
							
// 			if(theater == "신도림"){ 
// 				document.registForm.play_theater_num.value = 1001;
// 				} else if(theater == "청라") {
// 				document.registForm.play_theater_num.value = 1002;
// 				} else if(theater == "동탄") {
// 					 			document.registForm.play_theater_num.value = 1003;
// 					 		} else if(theater == "남양주다산") {
// 					 			document.registForm.play_theater_num.value = 1004;
// 					 		} else if(theater == "천안불당") {
// 					 			document.registForm.play_theater_num.value = 1005;
// 					 		} else if(theater == "경주보문") {
// 					 			document.registForm.play_theater_num.value = 1006;
// 					 		} else if(theater == "구미봉곡") {
// 					 			document.registForm.play_theater_num.value = 1007;
// 					 		} else if(theater == "대구이시아") {
// 					 			document.registForm.play_theater_num.value = 1008;
// 					 		} else if(theater == "보은") {
// 					 			document.registForm.play_theater_num.value = 1009;
// 					 		} else if(theater == "칠곡호이") {
// 					 			document.registForm.play_theater_num.value = 1010;
// 					 		} else if(theater == "영덕예주") {
// 					 			document.registForm.play_theater_num.value = 1011;
// 					 		}
// 						}
					
				 
				 
								
							$(function() {
								$("#btnMovieCode").on("click", function() {
									$.ajax({
										type : "GET",
										url : "getMovieCode",
										data : {play_movie_name_kr : $("#play_movie_name_kr").val()},
										success : function(response) {
												
											$("#play_movie_code").val(response);
							// 				$("#resultArea").html(response);
										},
										error : function(jqXHR, textStatus, errorThrown) { // 요청 처리 실패(= 응답 에러 발생) 시 자동으로 호출되는 콜백함수
											
											$("#resultArea2").html("요청 에러 발생! - " + jqXHR + ", " + textStatus + ", " + errorThrown);
										}
									});
								})
							});
								
							//상영종료시간 조회
							$(function() {
								$("#btnEndTime2").on("click", function() {
									$.ajax({
										type : "GET",
										url : "getEndTimeModify",
										data : {
											play_num : $(this).val(),
											play_start_time : $("#play_start_time").val()
											},
										success : function(response) {
											
											$("#play_end_time").val(response);
						// 					$("#resultArea").html(response);
										},
										error : function(jqXHR, textStatus, errorThrown) { // 요청 처리 실패(= 응답 에러 발생) 시 자동으로 호출되는 콜백함수
											
											$("#resultArea2").html("요청 에러 발생! - " + jqXHR + ", " + textStatus + ", " + errorThrown);
										}
									});
								})
							});
							
// 							//영화번호 조회
// 							$(function() {
// 								$("#btnTheaterNum ").on("click", function() {
// 									console.log($("#play_theater_name").val());
// 									$.ajax({
// 										type : "GET",
// 										url : "getTheaterNum",
// 										data : {
// 											play_theater_name : $(this).val()
// 											},
// 										success : function(response) {
											
// 											$("#play_theater_num").val(response);
// 						// 					$("#resultArea").html(response);
// 										},
// 										error : function(jqXHR, textStatus, errorThrown) { // 요청 처리 실패(= 응답 에러 발생) 시 자동으로 호출되는 콜백함수
											
// 											$("#resultArea2").html("요청 에러 발생! - " + jqXHR + ", " + textStatus + ", " + errorThrown);
// 										}
// 									});
// 								})
// 							});
							
							
							</script>


				
</body>
</html>