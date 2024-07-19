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

	.inner.cont{
		margin-top: 50px;
		margin-bottom: 50px;
		width: 1000px;
	}
	
	.inner.cont .topInfo {
		width: 400px;
		display: flex;
		justify-content: space-around;
		margin: 0 auto;
		text-align: center;
		margin-bottom: 30px;
	}
	
	.inner.cont .topInfo .step1 {
		color: red;
	}
	
	.inner.cont .topInfo .step2 {
		color: #ccc;
	}
	
	.ticketTop { 
		margin: 0 auto;
		display: flex;
		justify-content: space-around;
		margin-bottom: 30px;
	}
	
	.ticketTop #ticket {
		text-align: center;
		height: 60px;
	}

	/* --------------------------------------------------------------------- */
	
	.inner.cont .member_info { 
		margin-top: 50px;
	} 
	
	/* --------------------------------------------------------------------- */
	
	table {
		border: 1px solid #ccc;
		margin: auto;
		text-align: center;
		width: 1000px;
	}
	
	#payment_page th {
		padding: 10px;
	}
	
	#payment_page td {
		padding: 10px;
	}
	
	#payment_title, #item_info {
		text-align: left;
	}
	
	#payment_title {
		font-size: 30px;
	}	
	
	.payment_method {
		display: none;
	}
	.payment_method.on {
		display: block;
	}
	
	/* --------------------------------------------------------------------- */

	.member_info table {
		height: 60px;	
		margin: 30px 0;
	}
	
	.member_info table th, .member_info table td {
		border: 1px solid #ccc;
	}
	
	.member_info p {
		line-height: 2;
		margin-bottom: 30px;
	}
	
	.pay table{
		margin: 30px 0;
	}

	.pay table th, .pay table td {
		border: 1px solid #ccc;
	}

	.pay table td {
		height: 50px;
	}	
	
	#cancel, #payment {
		text-align: center;
		width: 60px; height: 40px;
	}
	
</style>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>

<%-- 포트원 결제 --%>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<%-- iamport.payment.js --%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>

	<section class="inner cont">
		<div class="topInfo">
			<div class="step1">
				<h4>Step 01</h4>
				<h2>결제하기</h2>
			</div>
			
			<div class="step2">
				<h4>Step 02</h4>
				<h2>예매완료</h2>
			</div>
		</div>
	
		<div class="ticketTop">
			<table id="ticket" >
				<tr>
					<td width="100">상영일자</td>
					<td width="200">극장정보</td>
					<td width="300">영화정보</td>
					<td width="100">상영관</td>
					<td width="100">상영시간</td>
					<td width="100">좌석</td>
					<td width="100">가격</td>
				</tr>
				<tr height="30">
					<td id="selectedDate">${order_ticket.order_ticket_date}</td>
					<td id="selectedTheater">${order_ticket.order_ticket_theater_name}</td>
					<td id="selectedMovie">${order_ticket.order_ticket_movie_name_kr}</td>
					<td id="selectedRoom">${order_ticket.order_ticket_room_num}관</td>
					<td id="selectedTime">${order_ticket.order_ticket_play_start_time}</td>
					<td id="selectedSeat">${order_ticket.order_ticket_seat_num}</td>
					<td id="totalPrice">${order_ticket.order_ticket_price} 원</td>
				</tr>
			</table>
			
		</div>
	
		<div class="member_info">
			<h3>예약자 정보 확인</h3>
			<table>
				<tr>
					<th>성함</th>
					<td><input type="text" value="${member.member_name}" readOnly></td>
					<th>전화번호</th>
					<td><input type="text" value="${member.member_phonenumber}" readOnly></td>
				</tr>
			</table>
			<p>
				• 예매정보는 예약자 정보에 입력된 휴대전화 번호 문자로 발송됩니다. <br>
				입력된 휴대전화 번호가 맞는지 꼭 확인하세요.<br>
				• 정보가 다를 경우 마이페이지에서 수정 가능합니다.
			</p>
		</div>
		
		<div class="pay">
			<h3>최종 결제</h3>
			<table>
				<tr>
					<td>최종 결제금액<br>${order_ticket.order_ticket_price} 원</td>
				</tr>
				<tr>
					<td>
						결제수단 선택
						<label><input type="radio" id="creditCard" name="payment_method" value="신용/체크카드" checked>신용/체크카드</label>
						<label><input type="radio" id="kakaopay" name="payment_method" value="카카오페이">카카오페이</label>
					</td>
				</tr>
				<tr>
					<td>
						<div class="payment_method on">
							신용/체크카드를 선택하셨습니다.<br>
							즉시할인 신용카드 적용이 가능합니다.
						</div>
						<div class="payment_method">
							카카오페이를 선택하셨습니다.<br>
							즉시할인 신용카드 적용이 불가합니다.
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div id="cancelAndPayment">
							<input type="button" id="cancel" value="취소">
							<input type="button" id="payment" value="결제">
						</div>
					</td>
				</tr>
			</table>
		</div>
	</section>
	<footer>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>

<script>
	$(function() {
		//결제 수단 목록
		let payment_method = document.querySelectorAll(".payment_method");
		
		// 결제 수단 변경
		$("#creditCard").click(function() {
			payment_method[0].classList.remove("on");
			payment_method[1].classList.remove("on");
			
			payment_method[0].classList.add("on");
		});
		
		$("#kakaopay").click(function() {
			payment_method[0].classList.remove("on");
			payment_method[1].classList.remove("on");
			
			payment_method[1].classList.add("on");
		});
	
		// 객체 초기화
		let IMP = window.IMP;
		IMP.init("imp61351081"); // 가맹점 식별코드
		
		let today = new Date();
		let hours = today.getHours(); // 시
		let minutes = today.getMinutes();  // 분
		let seconds = today.getSeconds();  // 초
		let milliseconds = today.getMilliseconds();
		let makeMerchantUid = "" + hours + minutes + seconds + milliseconds;
		
		// 결제 버튼 클릭 시 결제 유형 및 각 항목 입력 여부 확인 후 결제 진행
		$("#payment").click(function() {
			if($("input:radio[name=payment_method]:checked").val() == "신용/체크카드") {
				if(confirm("${member.member_name}(${member.member_phonenumber})로 영화예매티켓이 발송됩니다.\n결제하시겠습니까?")) { // 구매 클릭시 한번 더 확인하기
					// 결제창 호출
					IMP.request_pay({
						// 파라미터 값 설정
						pg : "html5_inicis.INIpayTest", // PG사 코드표에서 선택
						pay_method : "card", // 결제 방식
						merchant_uid : "IMP" + makeMerchantUid, // 결제 고유 번호
						name : "${order_ticket.order_ticket_movie_name_kr}", // 제품명
						amount : "${order_ticket.order_ticket_price}", // 금액
						//구매자 정보 ↓
						buyer_email : "${member.member_id}",
						buyer_name : "${member.member_name}",
						buyer_tel : "${member.member_phonenumber}",
						// buyer_addr : '서울특별시 강남구 삼성동',
						// buyer_postcode : '123-456'
					}, function(rsp) { // callback
						if(rsp.success) { // 결제 성공시
							alert("결제가 완료되었습니다(신용/체크카드).");
							location.href = "MovieReservePro?order_ticket_date=${ticket.order_ticket_date}&order_ticket_theater_name=${ticket.order_ticket_theater_name}&order_ticket_movie_name_kr=${ticket.order_ticket_movie_name_kr}&order_ticket_room_num=${ticket.order_ticket_movie_name_kr}&order_ticket_play_start_time=${ticket.order_ticket_play_start_time}&order_ticket_seat_num=${ticket.order_ticket_seat_num}&order_ticket_price=${ticket.order_ticket_price}";
						} else if(!rsp.success) { // 결제 실패시
							alert(rsp.error_msg);
						}
					});
				}
			} else if($("input:radio[name=payment_method]:checked").val() == "카카오페이") {
				if(confirm("${member.member_name}(${member.member_phonenumber})로 영화예매티켓이 발송됩니다.\n결제하시겠습니까?")) { // 구매 클릭시 한번 더 확인하기
					// 결제창 호출
					IMP.request_pay({
						// 파라미터 값 설정
						pg : "kakaopay.TC0ONETIME", // PG사 코드표에서 선택
						pay_method : "card", // 결제 방식
						merchant_uid : "IMP" + makeMerchantUid, // 결제 고유 번호
						name : "${order_ticket.order_ticket_movie_name_kr}", // 제품명
						amount : "${order_ticket.order_ticket_price}", // 금액
						//구매자 정보 ↓
						buyer_email : "${member.member_id}",
						buyer_name : "${member.member_name}",
						buyer_tel : "${member.member_phonenumber}",
						// buyer_addr : '서울특별시 강남구 삼성동',
						// buyer_postcode : '123-456'
					}, function(rsp) { // callback
						if(rsp.success) { // 결제 성공시
							alert("결제가 완료되었습니다(카카오페이).");
							location.href = "MovieReservePro?order_ticket_date=${ticket.order_ticket_date}&order_ticket_theater_name=${ticket.order_ticket_theater_name}&order_ticket_movie_name_kr=${ticket.order_ticket_movie_name_kr}&order_ticket_room_num=${ticket.order_ticket_movie_name_kr}&order_ticket_play_start_time=${ticket.order_ticket_play_start_time}&order_ticket_seat_num=${ticket.order_ticket_seat_num}&order_ticket_price=${ticket.order_ticket_price}";
						} else if(!rsp.success) { // 결제 실패시
							alert(rsp.error_msg);
						}
					});
				}
			}
			// 취소 버튼 클릭 시 예매 페이지로 이동
			$('#cancel').click(function() {
				location.href = "Reserve";
			});	
		}); // $(function 익명함수 종료)
	});	
</script>

</html>