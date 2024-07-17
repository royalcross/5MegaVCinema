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
	section {text-align: center;}
	table, th, td {border: 1px solid black;}
	table {
		margin: auto;
		text-align: center;
		width: 1000px;
	}
	div>button {
		width: 80px; height: 30px;
		font-size: 16px;
	}
</style>
<%-- jquery 라이브러리 포함시키기 --%>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript">
	$(function() {
		// 결제금액은 toLocaleString() 처리
		let orderItemSalesRevenue = ${orderItem.order_item_sales_revenue};
		$("#orderItemSalesRevenue").text(orderItemSalesRevenue.toLocaleString() + "원");
	});
</script>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<section>
		<br>
		<h1>구매정보</h1>
		<br>
		<table>
			<tr>
				<th>구매상품명</th>
				<th>구매상품구성</th>
				<th>구매날짜</th>
				<th>구매수량</th>
				<th>결제금액</th>
			</tr>
			<tr>
				<td>${store.item_name}</td>
				<td>${store.item_content}</td>
				<td>${orderItem.order_item_purchase_date}</td>
				<td>${orderItem.order_item_sales_rate}개</td>
				<%-- 결제금액은 자바스크립트에서 toLocaleString() 처리 후 출력 --%>
				<td id="orderItemSalesRevenue">
					<%-- $("#orderItemSalesRevenue").text(orderItemSalesRevenue.toLocaleString() + "원"); --%>
				</td>
			</tr>
		</table>
		<br>
		<div>
			<button type="button" onclick="location='./'">홈으로</button>
			<button type="button" onclick="location='Store'">스토어</button>
		</div>
		<br>
	</section>
	<footer>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>