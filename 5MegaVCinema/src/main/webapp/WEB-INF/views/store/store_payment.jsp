<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 &lt; 스토어 | 오메가V시네마</title>
<%-- 외부 CSS 파일(css/default.css) 연결하기 --%>
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<style type="text/css">
	table, th, td {border: 1px solid black;}
	table {
		margin: auto;
		text-align: center;
		width: 1000px;
	}
	#payment_page th {padding: 10px;}
	#payment_page td {padding: 10px;}
	#payment_title, #item_info {text-align: left;}
	#payment_title {font-size: 30px;}
	#item_info {font-size: 20px;}
	td>a {
		color: blue;
		text-decoration: underline;
	}
	td>img {width: 60px; height: 70px;}
	#item_nameAndContent {width: 400px;}
	#gift_message, #final_payment {
		text-align: left;
		font-size: 20px;
		padding: 10px;
	}
	#gift_list {
		background-color: #eee;
		margin: auto;
		width: 990px;
		height: 40px;
	}
	#cancelAndPayment {
		position: relative;
		left: 290px;
		width: 406px;
	}
	#cancel, #payment {
		text-align: center;
		width: 200px; height: 40px;
	}
</style>
<%-- jquery 라이브러리 포함시키기 --%>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript">
	$(function() {
		$("#add_recipient").click(function() {
			if($("#recipient").val() == "") {
				alert("받는 분을 확인해주세요.");
			} else if($("#quantity").val() == "선택") {
				alert("수량을 확인해주세요.");
			} else if($("#phone").val() == "") {
				alert("휴대폰번호를 확인해주세요.");
			} else {
				let recipient = $("#recipient").val();
				let quantity = $("#quantity").val();
				let phone = $("#phone").val();
				$("#gift_list").text($("#gift_list").text() + " " + quantity + " " + recipient + " " + phone);
				$("#recipient").val("");
				$("#quantity").val("선택");
				$("#phone").val("");
			}
		});
		$("#message").blur(function() {
			if($("#message").val().length > 70) {
				alert("최대 70자까지 입력 가능합니다.");
			}
		});
		$('#payment').click(function() {
			if($('#gift_list').val() == "") {
				alert("받는 분 또는 수량/휴대폰번호를 확인해주세요.");
			} else if($('#message').val() == "") {
				alert("선물메세지를 확인해주세요.")
			}
		});
		$('#cancel').click(function() {
			location.href = "Store";
		});
	});
</script>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<section>
		<form action="StorePaymentPro" method="post">
			<table id="payment_page">
				<tr>
					<td colspan="5" id="payment_title">결제</td>
				</tr>
				<tr>
					<td colspan="5" id="item_info">주문상품정보</td>
				</tr>
				<tr>
					<th colspan="2">주문상품</th>
					<th>사용가능처</th>
					<th>구매수량</th>
					<th>총 상품금액</th>
				</tr>
				<tr>
					<td><img alt="item_img" src="${pageContext.request.contextPath}/resources/img/popcorn.jpg"></td>
					<td id="item_nameAndContent">${store.item_name}<br>${store.item_content}</td>
					<td><a href="#">사용가능극장 확인</a></td>
					<td>${param.count}</td>
					<td id="amount">${param.amount}</td>
				</tr>
			</table>
			<br>
			<c:if test="${param.paymentType eq 'gift'}">
				<table id="gift">
					<tr>
						<td colspan="4" id="gift_message">선물 메세지</td>
					</tr>
					<tr>
						<th>받는 분</th>
						<td><input type="text" id="recipient"></td>
						<th rowspan="2">선물메세지<br>(0자/70자)</th>
						<td rowspan="2"><textarea rows="5" cols="40" id="message" placeholder="전달하고자 하는 메세지를 남겨보세요(최대 70자)"></textarea></td>
					</tr>
					<tr>
						<th>수량/휴대폰번호</th>
						<td>
							<select id="quantity">
								<option>선택</option>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
							</select>
							<input type="text" id="phone" placeholder="'-'없이 입력해 주세요">
							<input type="button" id="add_recipient" value="추가">
						</td>
					</tr>
				</table>
				<br>
				<div id="gift_list"></div>
				<br>
			</c:if>
			<table>
				<tr>
					<td id="final_payment">최종결제</td>
				</tr>
				<tr>
					<td>최종 결제금액<br>${param.amount}</td>
				</tr>
				<tr>
					<td>
						결제수단 선택
						<input type="radio" name="payment_method">신용/체크카드
						<input type="radio" name="payment_method">카카오페이
					</td>
				</tr>
				<tr>
					<td>
						카드사 선택
						<select id="card">
							<option>카드선택</option>
							<option>비씨카드</option>
							<option>국민카드</option>
							<option>신한카드</option>
							<option>삼성카드</option>
							<option>롯데카드</option>
							<option>농협카드</option>
							<option>하나카드</option>
							<option>현대카드</option>
							<option>씨티카드</option>
							<option>제주카드</option>
							<option>우리카드</option>
							<option>수협카드</option>
							<option>전북카드</option>
							<option>광주카드</option>
							<option>신협카드</option>
							<option>카카오 뱅크</option>
							<option>케이뱅크</option>
							<option>우체국카드</option>
							<option>토스카드</option>
							<option>SC제일은행 비씨카드</option>
							<option>SC제일은행 삼성카드</option>
							<option>IBK기업은행 카드</option>
						</select>
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
			<br>
		</form>
	</section>
	<footer>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>