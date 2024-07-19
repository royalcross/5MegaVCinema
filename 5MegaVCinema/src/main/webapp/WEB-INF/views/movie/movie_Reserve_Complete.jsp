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
		color: #ccc;
	}
	
	.inner.cont .topInfo .step2 {
		color: red;
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
	
	form {
		display: inline-block;
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
					<td width="100">예매번호</td>
					<td width="100">상영일자</td>
					<td width="300">영화정보</td>
					<td width="100">좌석</td>
					<td width="100">결제금액</td>
				</tr>
				<tr height="30">
					<td id=order_ticket_id>${map.order_ticket_id}</td>
					<td id="order_ticket_date">${map.order_ticket_date}</td>
					<td id="order_ticket_movie">${map.order_ticket_movie_name_kr}</td>
					<td id="order_ticket_seat">${orderTicket.order_ticket_seat}</td>
					<td id="order_ticket_price">${map.order_ticket_price} 원</td>
				</tr>
			</table>
			
		</div>
		
		<div align="center">
			<input type="button" value ="홈으로" onclick="location.href='./'">
		</div>
	</section>
	<footer>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>

<script>
</script>

</html>