<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<style type="text/css">
	/* 인원수 */
	.minus, .plus, .count {
		text-align: center;
	}
	.minus, .plus {
		width: 20px; 
		height: 20px;
		cursor: pointer;
	}
	
	.peopleNum .type {
		display: inline-block;
		width: 60px;
	}
	/*----------------------------------------------*/
	.inner.cont{
		margin-top: 50px;
		margin-bottom: 50px;
		width: 1000px;
	}

	.ticketTop { 
		margin: 0 auto;
	}
	
	#ticket {
		text-align: center;
		height: 60px;
		width: 100%;
		margin-bottom: 10px;
	}
	
	.btnsubmit {
		display: block;
		width: 180px;
		margin: 0 auto;
	}
	
	.mainWrapper .leftWrapper .peopleNum {
		margin-top: 35px;
	}
	
	.mainWrapper .leftWrapper .peopleNum .type {
		font-weight: bold;
	}
	
	.mainWrapper .leftWrapper {
		padding-right: 30px;
		align-content: space-around;
	}
	
	.mainWrapper {
		background-color: #eee;
		display: flex;
		justify-content: center;
		padding: 30px;
		margin-top: 30px;
	}
	
	.mainWrapper .resultWrapper {
		margin-top: 30px;
		height:50px;
	}
	
	.mainWrapper .resultWrapper > span {
		padding-bottom: 10px;
		display: block;
		font-weight: bold;
	}
	
	.mainWrapper .resultWrapper .result {
		display: flex;
		height: 100%;
	}
	
	.mainWrapper .resultWrapper .result > span{
		width: 60px;
		height: 100%;
		font-weight: bold;
	}
	
	/*좌석*/
	
	#seats h3 {
		height: 30px;
	}
	
	#seats .row {
		margin-top: 5px;
	}
	
	#seats .row li{
		display: inline-block;
	} 
	
	#seats .row .choose-seat {
		display: none;
	} 
	
	#seats .row li label {
		display: block;
		width: 40px;
		height: 40px;
		background-color: gray;
		color: #fff;
		text-align: center;
		line-height: 2.2;
	}
	
	/* 체크 됐을 때 색깔 변경 */
	#seats .row .choose-seat:checked + label{
		background-color: red;
	}
</style>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	
	<section class="inner cont">
		<div>
			<div class="ticketTop">
				<table border="1" id="ticket" >
					<tr>
						<td width="100">날짜</td>
						<td width="130">영화관</td>
						<td width="200">영화</td>
						<td width="100">상영관</td>
						<td width="100">시간</td>
						<td width="100">좌석</td>
					</tr>
					<tr height="30">
						<td id="selectedDate">${ticket.order_ticket_date}</td>
						<td id="selectedTheater">${ticket.order_ticket_theater_name}</td>
						<td id="selectedMovie">${ticket.order_ticket_movie_name_kr}</td>
						<td id="selectedRoom">${ticket.order_ticket_room_num}관</td>
						<td id="selectedTime">${ticket.order_ticket_play_start_time}</td>
						<td id="selectedSeat"></td>
					</tr>
				</table>
				
			</div>
			<form action="Reserve_pay" onsubmit="return subBtn()" method="post">
			    <input type="hidden" name="order_ticket_date" id="order_ticket_date" value="${ticket.order_ticket_date}">
			    <input type="hidden" name="order_ticket_theater_name" id="order_ticket_theater_name" value="${ticket.order_ticket_theater_name}">
			    <input type="hidden" name="order_ticket_movie_name_kr" id="order_ticket_movie_name_kr" value="${ticket.order_ticket_movie_name_kr}">
			    <input type="hidden" name="order_ticket_room_num" id="order_ticket_room_num" value="${ticket.order_ticket_room_num}">
			    <input type="hidden" name="order_ticket_play_start_time" id="order_ticket_play_start_time" value="${ticket.order_ticket_play_start_time}">
			    <input type="hidden" name="order_ticket_seat_num" id="order_ticket_seat_num" value="">
			    <input type="hidden" name="order_ticket_price" id="order_ticket_price" value="">
			    <input type="hidden" name="order_ticket_people" id="order_ticket_people" value="">
			    <input type="submit" class="btnsubmit" value="예매하기">
			</form>
		</div>
		
		<article>
			<div class="mainWrapper">
				<div style="width:180px" class="leftWrapper">
					<div class="peopleNum">
						<div>
							<span class="type">일반</span>
							<button type="button" class="minus nor">-</button>
							<span class="count nor"></span>
							<button type="button" class="plus nor">+</button>
						</div>
						<div>
							<span class="type">청소년</span>
							<button type="button" class="minus stu">-</button>
							<span class="count stu"></span>
							<button type="button" class="plus stu">+</button>
						</div>
						<div>
							<span class="type">우대</span>
							<button type="button" class="minus sen">-</button>
							<span class="count sen"></span>
							<button type="button" class="plus sen">+</button>
						</div>
						
		        	</div>
		        	
		        	<div class="resultWrapper">
			        	<div class="result">
			        		<span class="peoNumber">인원</span>
			        		<div>
				        		<span id="norNumber"></span><br>
				        		<span id="stuNumber"></span><br>
				        		<span id="senNumber"></span><br>
			        		</div>
			        	</div>
			        </div>
			        
			        <div class="resultWrapper">
			        	<span>선택 좌석 </span>
			        	<div id="seatResult"></div>
			        </div>
			        
			        <div class="resultWrapper">
			        	<span>금액 </span>
			        	<div id="moneyResult"></div>
			        </div>
	        	</div>
		
				<div id="seats">
					<h3>SCREEN</h3>	
					<ul class="row" > <!-- A -->
						<li>
							<input type="checkbox" class="choose-seat" id="A1" value="A1" >
							<label for="A1" class="mini">A1</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="A2" value="A2" >
							<label for="A2" class="mini">A2</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="A3" value="A3" >
							<label for="A3" class="mini">A3</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="A4" value="A4" >
							<label for="A4" class="mini">A4</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="A5" value="A5" >
							<label for="A5" class="mini">A5</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="A6" value="A6" >
							<label for="A6" class="mini">A6</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="A7" value="A7" >
							<label for="A7" class="mini">A7</label>
						</li>
					</ul>
					
					<ul class="row" > <!-- B -->
						<li>
							<input type="checkbox" class="choose-seat" id="B1" value="B1" >
							<label for="B1" class="mini">B1</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="B2" value="B2" >
							<label for="B2" class="mini">B2</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="B3" value="B3" >
							<label for="B3" class="mini">B3</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="B4" value="B4" >
							<label for="B4" class="mini">B4</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="B5" value="B5" >
							<label for="B5" class="mini">B5</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="B6" value="B6" >
							<label for="B6" class="mini">B6</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="B7" value="B7" >
							<label for="B7" class="mini">B7</label>
						</li>
					</ul>
					
					<ul class="row" > <!-- C -->
						<li>
							<input type="checkbox" class="choose-seat" id="C1" value="C1" >
							<label for="C1" class="mini">C1</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="C2" value="C2" >
							
							<label for="C2" class="mini">C2</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="C3" value="C3" >
							<label for="C3" class="mini">C3</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="C4" value="C4" >
							<label for="C4" class="mini">C4</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="C5" value="C5" >
							<label for="C5" class="mini">C5</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat"  id="C6" value="C6" >
							<label for="C6" class="mini">C6</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="C7" value="C7" >
							<label for="C7" class="mini">C7</label>
						</li>
					</ul>
					
					<ul class="row" > <!-- D -->
						<li>
							<input type="checkbox" class="choose-seat" id="D1" value="D1" >
							<label for="D1" class="mini">D1</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="D2" value="D2" >
							<label for="D2" class="mini">D2</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="D3" value="D3" >
							<label for="D3" class="mini">D3</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="D4" value="D4" >
							<label for="D4" class="mini">D4</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="D5" value="D5" >
							<label for="D5" class="mini">D5</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="D6" value="D6" >
							<label for="D6" class="mini">D6</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="D7" value="D7" >
							<label for="D7" class="mini">D7</label>
						</li>
					</ul>
					
					<ul class="row" > <!-- E -->
						<li>
							<input type="checkbox" class="choose-seat" id="E1" value="E1" >
							<label for="E1" class="mini">E1</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="E2" value="E2" >
							<label for="E2" class="mini">E2</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="E3" value="E3" >
							<label for="E3" class="mini">E3</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="E4" value="E4" >
							<label for="E4" class="mini">E4</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="E5" value="E5" >
							<label for="E5" class="mini">E5</label>
						</li>
						<li>							
							<input type="checkbox" class="choose-seat" id="E6" value="E6" >
							<label for="E6" class="mini">E6</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="E7" value="E7" >
							<label for="E7" class="mini">E7</label>
						</li>
					</ul>
					
					<ul class="row" > <!-- F -->
						<li>
							<input type="checkbox" class="choose-seat" id="F1" value="F1" >
							<label for="F1" class="mini">F1</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="F2" value="F2" >
							<label for="F2" class="mini">F2</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="F3" value="F3" >
							<label for="F3" class="mini">F3</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="F4" value="F4" >
							<label for="F4" class="mini">F4</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="F5" value="F5" >
							<label for="F5" class="mini">F5</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="F6" value="F6" >
							<label for="F6" class="mini">F6</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="F7" value="F7" >
							<label for="F7" class="mini">F7</label>
						</li>
					</ul>
					<ul class="row" >
						<li>
							<input type="checkbox" class="choose-seat" id="G1" value="G1" >
							<label for="G1" class="mini">G1</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="G2" value="G2" >
							<label for="G2" class="mini">G2</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="G3" value="G3" >
							<label for="G3" class="mini">G3</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="G4" value="G4" >
							<label for="G4" class="mini">G4</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="G5" value="G5" >
							<label for="G5" class="mini">G5</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="G6" value="G6" >
							<label for="G6" class="mini">G6</label>
						</li>
						<li>
							<input type="checkbox" class="choose-seat" id="G7" value="G7" >
							<label for="G7" class="mini">G7</label>
						</li>
					</ul>
				</div>
			</div>
				
<!-- 			<div class="section-bottom"> -->
<!-- 		        <div class="wrap-rsv-select"> -->
<!-- 		            <a href="#" class="btn-rsv-cancel2">이전</a> -->
<!-- 		            <a href="#" class="btn-rsv-next2">다음</a> -->
<!-- 		        </div> -->
<!-- 		    </div> -->
		</article>
	</section>
</body>

<script>
	$(function() {
		// 유형별 인원수 표시할 곳 변수 지정
		let normal = document.querySelector(".count.nor");
		let student = document.querySelector(".count.stu");
		let senior = document.querySelector(".count.sen");
		
		// 유형별 인원수 변수 지정
		let nor_count = 0;
		let stu_count = 0;
		let sen_count = 0;
		
		// 인원, 좌석 표시할 곳 변수 지정
		let seatResult = document.querySelector("#seatResult");
		let moneyResult = document.querySelector("#moneyResult");

		// 총 인원
		let total = 0;
		
		let peopleArr = new Array();
		
		// 일반 고객
		$(normal).text(nor_count);
// 		let amountNum = count*${store.item_price};
// 		$("#amount").text(amountNum.toLocaleString() + '원');
		// 수량 증가 버튼
		$(".plus.nor").click(function() {
			if(nor_count < 8) {
				$(normal).text(++nor_count);
				total++;
				if(total > 8) {
					alert("최대 8명까지 가능합니다!");
					return false;
				}
					
// 				amountNum = count*${store.item_price};
// 				$("#amount").text(amountNum.toLocaleString() + '원');
				$("#norNumber").text("일반 " + nor_count + "명");
			}
		});
		
		// 수량 감소 버튼
		$(".minus.nor").click(function() {
			if(nor_count > 0) {
				$(normal).text(--nor_count);
// 				amountNum = count*${store.item_price};
// 				$("#amount").text(amountNum.toLocaleString() + '원');
				$("#norNumber").text("일반 " + nor_count + "명");
				total--;
				if(total > 8) {
					alert("최대 8명까지 가능합니다!");
					return false;
				}
			}
			if(nor_count == 0) {
				$("#norNumber").text("");
			}
		});
		
		// 청소년 고객
		$(student).text(stu_count);
// 		let amountNum = count*${store.item_price};
// 		$("#amount").text(amountNum.toLocaleString() + '원');
		// 수량 증가 버튼
		$(".plus.stu").click(function() {
			if(stu_count < 8) {
				$(student).text(++stu_count);
				total++;
				if(total > 8) {
					alert("최대 8명까지 가능합니다!");
					return false;
				}
// 				amountNum = count*${store.item_price};
// 				$("#amount").text(amountNum.toLocaleString() + '원');
				$("#stuNumber").text("청소년 " + stu_count + "명");
			}
		});
		// 수량 감소 버튼
		$(".minus.stu").click(function() {
			if(stu_count > 0) {
				$(student).text(--stu_count);
				total--;
				if(total > 8) {
					alert("최대 8명까지 가능합니다!");
					return false;
				}
// 				amountNum = count*${store.item_price};
// 				$("#amount").text(amountNum.toLocaleString() + '원');
				$("#stuNumber").text("청소년 " + stu_count + "명");
			}
			if(stu_count == 0) {
				$("#stuNumber").text("");
			}
		});
		
		// 우대 고객
		$(senior).text(sen_count);
// 		let amountNum = count*${store.item_price};
// 		$("#amount").text(amountNum.toLocaleString() + '원');
		// 수량 증가 버튼
		$(".plus.sen").click(function() {
			if(sen_count < 8) {
				$(senior).text(++sen_count);
				total++;
				if(total > 8) {
					alert("최대 8명까지 가능합니다!");
					return false;
				}
// 				amountNum = count*${store.item_price};
// 				$("#amount").text(amountNum.toLocaleString() + '원');
				$("#senNumber").text("우대 " + sen_count + "명");
			}
		});
		// 수량 감소 버튼
		$(".minus.sen").click(function() {
			if(sen_count > 0) {
				$(senior).text(--sen_count);
				total--;
				if(total > 8) {
					alert("최대 8명까지 가능합니다!");
					return false;
					
				}
// 				amountNum = count*${store.item_price};
// 				$("#amount").text(amountNum.toLocaleString() + '원');
				$("#senNumber").text("우대 " + sen_count + "명");
			}
			if(sen_count == 0) {
				$("#senNumber").text("");
			}
		});
		
		// 예매 인원 정보 저장
		// 배열로 ..? 일단 .. 패ㅑ스 ...		
		
		
		
		// --------------------------------------------------------------------------------------------------------
		// 좌석 선택
		// 선택한 인원수보다 많은 좌석을 골랐을 때
		// 선택한 좌석을 배열로 저장해서 length 구하면 알 수 있지 않을까
		let checkboxes = document.querySelectorAll('.choose-seat');
// 		let maxSize = 8;
		let seatArr = new Array(); // 좌석 배열
		
		$(checkboxes).change(function() {
			let value = $(this).val();
			if(total == 0) {
				alert("인원 정보를 먼저 선택해주세요.");				
				
				$(this).prop("checked", false); // 체크 해제
				return false;
			}
			
			
			console.log("seatArr.length : " + seatArr.length + ", total : " + total);
			console.log("$(this).is(':checked') : " + $(this).is(':checked'));
// 			console.log("$(checkboxes).is(':checked') : " + $(checkboxes).is(':checked'));
			if(seatArr.length < total && $(this).is(':checked')){ // 선택 좌석 수가 총 인원 수보다 적고, 빈 좌석 선택했을 경우
				if(seatArr.indexOf(value) == -1) { // 배열에 해당 값이 없을 때 (인덱스로 확인 / 없으면 -1 임)
					seatArr.push($(this).val()); // 배열에 저장 
					console.log(seatArr.join(", ")); // 이건 이제 되고
				} 
			} else if(seatArr.indexOf(value) >= 0) { // 기존 선택 좌석 클릭 시
				// 기존 좌석 제거
				console.log("삭제 전 : " + seatArr); // 이건 이제 되고
				seatArr.splice(seatArr.indexOf(value), 1);
				console.log("삭제 후 : " + seatArr); // 이건 이제 되고
				$(this).prop("checked", false); // 체크 해제
			} else { // 선택 좌석 수가 총 인원수와 같거나 클 때 빈 좌석 선택 시
				alert("선택한 인원수를 초과하였습니다.");
				$(this).prop("checked", false); // 체크 해제
				return false;
			}
			
			// 좌석 선택 값 표출 및 input-hidden 태그에 저장 (예매하기로 넘겨야함)
			seatResult.innerText = seatArr.join(", ");
			$("#order_ticket_seat_num").val(seatArr.join(","));
			$("#selectedSeat").text(seatArr.join(","));
// 			console.log("order_ticket_seat_num : " + $("#order_ticket_seat_num").val());
			
			// --------------------------------------------------------------------------------------------------------
			// 유형별 가격 구하기
			// 금액 표시할 곳 변수 지정
			
			// 총 금액 변수 지정
			let totalPrice = 0;
			
			if(seatArr != null){
				if(nor_count != 0) { // 일반이 0이 아니면
					let nor_price = nor_count * 10000;
// 					console.log("nor_price : " + nor_price);
					
					totalPrice += nor_price;
				} 
				
				if(stu_count != 0 ){
					let stu_price = stu_count * 8000;
// 					console.log("stu_price : " + stu_price);
					
					totalPrice += stu_price;
				}
				
				if(sen_count != 0 ){
					let sen_price = sen_count * 6000;
// 					console.log("sen_price : " + sen_price);
					
					totalPrice += sen_price;
				}
				
// 				console.log("totalPrice : " + totalPrice)
			}
			
			moneyResult.innerText = totalPrice + "원";
			$("#order_ticket_price").val(totalPrice);
		});
	
	
	
	});
	
	
	
	
	
</script>


<footer>
	<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
</footer>
</html>




















