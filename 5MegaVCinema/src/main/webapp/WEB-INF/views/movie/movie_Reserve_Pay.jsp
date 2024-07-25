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
		width: 60px; 
		height: 40px;
	}
	
	form {
		display: inline-block;
	}
	
	.title {
		background-color: #eee;
		font-weight: bold;
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
					<td id="selectedDate">${map.order_ticket_date}</td>
					<td id="selectedTheater">${map.order_ticket_theater_name}</td>
					<td id="selectedMovie">${map.order_ticket_movie_name_kr}</td>
					<td id="selectedRoom">${map.order_ticket_room_num}관</td>
					<td id="selectedTime">${map.order_ticket_play_start_time}</td>
					<td id="selectedSeat">${map.order_ticket_seat}</td>
					<td id="totalPrice">${map.order_ticket_price} 원</td>
				</tr>
			</table>
			
		</div>
	
		<div class="member_info">
			<h3>예약자 정보 확인</h3>
			<table>
				<tr>
					<th class="title">성함</th>
					<td><input type="text" value="${member.member_name}" readOnly></td>
					<th class="title">전화번호</th>
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
					<td>최종 결제금액<br>${map.order_ticket_price} 원</td>
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
							<form action="CompletePay" method="get" id="reservePayForm">
				    			<input type="hidden" name="order_ticket_date" id="order_ticket_date" value="${map.order_ticket_date}">
							    <input type="hidden" name="order_ticket_theater_name" id="order_ticket_theater_name" value="${map.order_ticket_theater_name}">
							    <input type="hidden" name="order_ticket_movie_name_kr" id="order_ticket_movie_name_kr" value="${map.order_ticket_movie_name_kr}">
							    <input type="hidden" name="order_ticket_room_num" id="order_ticket_room_num" value="${map.order_ticket_room_num}">
							    <input type="hidden" name="order_ticket_play_start_time" id="order_ticket_play_start_time" value="${map.order_ticket_play_start_time}">
							    <input type="hidden" name="order_ticket_seat" id="order_ticket_seat" value="${map.order_ticket_seat}">
							    <input type="hidden" name="order_ticket_price" id="order_ticket_price" value="${map.order_ticket_price}">
			    			    <input type="hidden" name="order_ticket_how_many_people" id="order_ticket_how_many_people" value="${map.order_ticket_how_many_people}">
							    <input type="button" id="payment" class="btnsubmit" value="결제하기" >
							</form>
<!-- 							<input type="button" value="결제"> -->
						</div>
					</td>
				</tr>
			</table>
		</div>
	</section>
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
		
			// 취소 버튼 클릭 시 예매 페이지로 이동
			$('#cancel').click(function() {
				location.href = "Reserve";
			});	
			
			let today = new Date();
			let hours = today.getHours(); // 시
			let minutes = today.getMinutes();  // 분
			let seconds = today.getSeconds();  // 초
			let milliseconds = today.getMilliseconds();
			let makeMerchantUid = "" + hours + minutes + seconds + milliseconds;
			
	
			$("#payment").click(function(){
// 				alert("onClick 확인");
				requestPay();
			});
			
			var IMP = window.IMP;
			IMP.init("imp61351081");
			
			function requestPay() {
				if($("input:radio[name=payment_method]:checked").val() == "신용/체크카드"){
					IMP.request_pay({
						// 파라미터 값 설정
						pg : "kakaopay.TC0ONETIME", // PG사 코드표에서 선택
						pay_method : "card", // 결제 방식
						merchant_uid : "IMP" + makeMerchantUid, // 결제 고유 번호
						name : "${map.order_ticket_movie_name_kr}", // 제품명
						amount : "${map.order_ticket_price}", // 금액
						//구매자 정보 ↓
						buyer_email : "${member.member_id}",
						buyer_name : "${member.member_name}",
						buyer_tel : "${member.member_phonenumber}",
					
					}, function(rsp){ // callback
						if(rsp.success){
							alert("결제 성공!");
							$("#reservePayForm").submit();
						}else {
							var msg = '결제에 실패하였습니다.';
					        msg += '에러내용 : ' + rsp.error_msg;
					        alert(msg);
						}
					
					});//IMP.request_pay End
					
				} else if($("input:radio[name=payment_method]:checked").val() == "카카오페이") {
					IMP.request_pay({
						// 파라미터 값 설정
						pg : "kakaopay.TC0ONETIME", // PG사 코드표에서 선택
						pay_method : "card", // 결제 방식
						merchant_uid : "IMP" + makeMerchantUid, // 결제 고유 번호
						name : "${map.order_ticket_movie_name_kr}", // 제품명
						amount : "${map.order_ticket_price}", // 금액
						//구매자 정보 ↓
						buyer_email : "${member.member_id}",
						buyer_name : "${member.member_name}",
						buyer_tel : "${member.member_phonenumber}",
					
					}, function(rsp){ // callback
						if(rsp.success){
							$("#reservePayForm").submit();
						}else {
							var msg = '결제에 실패하였습니다.';
					        msg += '에러내용 : ' + rsp.error_msg;
					        alert(msg);
						}
					
					});//IMP.request_pay End
				}
				
			};//requestPay function End
			
		});	 // $(function 익명함수 종료)
	</script>
	<footer>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>

		

</html>