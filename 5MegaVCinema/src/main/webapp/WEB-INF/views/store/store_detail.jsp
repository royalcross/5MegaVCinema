<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(${store.item_name}) 상세 &lt; 스토어 | 오메가V시네마</title>
<%-- 외부 CSS 파일(css/default.css) 연결하기 --%>
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<style type="text/css">
	#item_name {font-size: 25px;}
	#item_content {font-size: 15px;}
	table {
		margin: auto;
		width: 1100px;
	}
	td {padding: 15px;}
	td>#available_theaters {
		color: blue;
		text-decoration: underline;
	}
	#item {border-bottom: 1px solid black;}
	td>img {width: 350px; height: 350px;}
	#img {border-right: 1px solid black;}
	#minus, #plus, #count {
		text-align: center;
		font-size: 20px;
	}
	#minus, #plus {
		width: 30px; height: 30px;
		cursor: pointer;
	}
	#amount {
		text-align: right;
		font-size: 30px;
	}
	#gift, #purchase {
		text-align: center;
		width: 330px; height: 40px;
		cursor: pointer;
	}
	#refundAndGuide {
		border-top: 1px solid black;
		padding: 40px 0;
	}
	details>summary {
		border: 1px solid black;
		border-radius:5px;
		padding:10px;
		cursor:pointer;
	}
	details[open]>summary {
		border: 1px solid #ccc;
		background-color: #ccc;
	}
	details>ul>li {list-style: square;}
	
</style>
<%-- jquery 라이브러리 포함시키기 --%>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript">
	// 사용가능극장
	function availableTheaters() {
		let url = "StoreAvailableTheaters";
		let name = "store_available_theaters";
		let option = "width = 500, height = 500, top = 200, left = 650, location = no";
		window.open(url, name, option);
	}
	$(function() {
		// 수량/금액 기본값 출력
		let count = 1;
		$("#count").text(count);
		let amountNum = count*${store.item_price};
		$("#amount").text(amountNum.toLocaleString() + '원');
		// 수량 증가 버튼
		$("#plus").click(function() {
			if(count < 8) {
				$("#count").text(++count);
				amountNum = count*${store.item_price};
				$("#amount").text(amountNum.toLocaleString() + '원');
			}
		});
		// 수량 감소 버튼
		$("#minus").click(function() {
			if(count > 1) {
				$("#count").text(--count);
				amountNum = count*${store.item_price};
				$("#amount").text(amountNum.toLocaleString() + '원');
			}
		});
		// 선물 버튼
		$("#gift").click(function() {
			location.href = "StorePayment?paymentType=gift&item_id=${param.item_id}&count=" + $('#count').text() + "&amount=" + $('#amount').text() + "&amountNum=" + amountNum;
		});
		// 구매 버튼
		$("#purchase").click(function() {
			location.href = "StorePayment?paymentType=purchase&item_id=${param.item_id}&count=" + $('#count').text() + "&amount=" + $('#amount').text() + "&amountNum=" + amountNum;
		});
	});
</script>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<section>
		<table>
			<tr>
				<%-- 파라미터로 받아온 상품명과 상품구성 출력 --%>
				<td colspan="4" id="item">
					<p id="item_name">${store.item_name}</p>
					<p id="item_content">${store.item_content}</p>
				</td>
			</tr>
			<tr>
				<td rowspan="6" id="img"><img alt="${store.item_name}" src="${store.item_image}"></td>
				<td>사용극장</td>
				<td colspan="2"><a href="javascript:availableTheaters()" id="available_theaters">사용가능극장</a></td>
			</tr>
			<tr>
				<td>유효기간</td>
				<td colspan="2">구매일로부터 24개월 이내 사용 가능</td>
			</tr>
			<tr>
				<td>판매수량</td>
				<td colspan="2">1회 8개 구매가능</td>
			</tr>
			<tr>
				<td>구매 후 취소</td>
				<td colspan="2">구매일로부터 10일 이내 취소 가능하며, 부분취소는 불가능합니다.</td>
			</tr>
			<tr>
				<%-- 자바스크립트 구문에서 수량 기본값(=1) 지정 및 수량 조절 버튼 클릭 시 수량 1씩 증감 --%>
				<td	>수량/금액</td>
				<td>
					<button type="button" id="minus">-</button>
					<span id="count"><%-- $('#count').text(count); --%></span>
					<button type="button" id="plus">+</button>
				</td>
				<%-- 자바스크립트 구문에서 금액 기본값 지정 및 수량에 따라 금액 변경 --%>
				<td id="amount"><%-- $('#amount').text(amountNum.toLocaleString() + '원'); --%></td>
			</tr>
			<tr>
				<td colspan="3">
					<button type="button" id="gift" disabled>선물</button>
					<button type="button" id="purchase">구매</button>
				</td>
			</tr>
			<tr>
				<td colspan="4" id="refundAndGuide">
					<details>
						<summary>구매 후 취소</summary>
						<ul>
							<c:choose>
								<c:when test="${param.item_type eq 'Ticket'}">
									<li>본 상품은 구매일로부터 10일 이내에 취소 가능합니다.</li>
									<li>유효기간은 본 상품의 유효기간 내에서 연장 신청이 가능하며, 1회 연장 시 3개월(92일) 단위로 연장됩니다.</li>
									<li>구매일로부터 5년까지 유효기간 연장이 가능합니다.</li>
									<li>최초 유효기간 만료 후에는 결제금액의 90%에 대해 환불 요청 가능하며, 환불 처리에 7일 이상의 시간이 소요될 수 있습니다.</li>
									<li>구매 취소 및 환불 요청은 미사용 상품에 한해 가능하며, 사용한 상품에 대해서는 불가합니다.</li>
									<li>
										구매한 관람권은 일괄 환불만 가능하며, 부분 환불 불가합니다.<br>
										(예 : 2매 이상 한번에 구매 시 모든 관람권을 일괄 취소해야 하며, 낱장의 취소는 불가합니다.)
									</li>
									<li>본 상품은 현금으로 환불이 불가합니다.</li>
								</c:when>
								<c:when test="${param.item_type eq ('Popcorn' or 'Drinks' or 'Goods')}">
									<li>
										이용 안내<br>
										본 상품의 사용 기한은 구매일로부터 92일까지입니다.
										<ul>
											<li>- 영화관 매점에서 스토어 쿠폰번호 제시 후 상품으로 교환하실 수 있습니다.</li>
											<li>- 본 상품은 온라인 전용 판매 상품으로 현장 구매는 불가합니다.</li>
											<li>- 구매한 상품은 “나의 오메가V시네마 > 스토어 구매내역”에서 확인할 수 있습니다.</li>
											<li>- 팝콘 및 음료의 맛, 크기, 종류 변경 시 추가 금액이 발생할 수 있습니다.</li>
											<li>- 상기 이미지는 실제 제품과 다를 수 있습니다.</li>
										</ul>
									</li>
									<li>
										연장/취소/환불 안내<br>
										본 상품은 구매일로부터 10일 이내에 취소 가능합니다.
										<ul>
											<li>- 유효기간은 본 상품의 유효기간 내에서 연장 신청이 가능하며, 1회 연장 시 3개월(92일) 단위로 연장됩니다.</li>
											<li>- 구매일로부터 5년까지 유효기간 연장이 가능합니다.</li>
											<li>- 최초 유효기간 만료 후에는 결제금액의 90%에 대해 환불 요청 가능하며, 환불 처리에 7일 이상의 시간이 소요될 수 있습니다.</li>
											<li>- 구매 취소 및 환불 요청은 미사용 상품에 한해 가능하며, 사용한 상품에 대해서는 불가합니다.</li>
											<li>- 본 상품은 현금으로 환불이 불가합니다.</li>
										</ul>
									</li>
								</c:when>
							</c:choose>
						</ul>
					</details>
					<br>
					<details>
						<summary>상품이용안내</summary>
						<ul>
							<c:choose>
								<c:when test="${param.item_type eq 'Ticket'}">
									<li>
										본 권은 구매 시 계정으로 자동 등록되며, 등록된 계정에서만 사용 가능합니다.<br>
										(단! 선물 받은 PIN번호는 계정 내 스토어 교환권 등록 후 사용 가능합니다.)
									</li>
									<li>본 권의 예매 가능한 유효기간은 구매일로부터 2년입니다.</li>
									<li>가격 정책에 따라 티켓금액이 변동 될 수 있으며 이에 대한 차액 환불이 불가합니다. (조조/심야/청소년/우대 등)</li>
									<li>본 권은 카카오 알림톡을 통해 전송 됩니다. (카카오톡 미설치 또는 미수신 고객은 MMS로 발송)</li>
									<li>본 권은 오메가V시네마 홈페이지, 어플에서만 예매 가능합니다. (현장 매표소, 무인발권기 예매 불가)</li>
									<li>어플 및 홈페이지 예매방법 : 지점 > 영화명 > 시간 > 인원 > 관람권/모바일상품권 > 스토어 관람권으로 전송 받은 PIN번호 16자리 입력 > 결제</li>
									<li>오메가V시네마 홈페이지 스토어 구매내역에서 PIN 번호 확인이 가능합니다.</li>
								</c:when>
								<c:when test="${param.item_type eq ('Popcorn' or 'Drinks' or 'Goods')}">
									<li>
										사용가능지점
										<ul>
											<li>구매 전 사용가능 지점을 반드시 확인해주세요!</li>
										</ul>
									</li>
									<li>
										이용 안내<br>
										본 상품의 사용 기한은 구매일로부터 92일까지입니다.
										<ul>
											<li>- 영화관 매점에서 스토어 쿠폰번호 제시 후 상품으로 교환하실 수 있습니다.</li>
											<li>- 본 상품은 온라인 전용 판매 상품으로 현장 구매는 불가합니다.</li>
											<li>- 구매한 상품은 “나의 오메가V시네마 > 스토어 구매내역”에서 확인할 수 있습니다.</li>
											<li>- 팝콘 및 음료의 맛, 크기, 종류 변경 시 추가 금액이 발생할 수 있습니다.</li>
											<li>- 상기 이미지는 실제 제품과 다를 수 있습니다.</li>
										</ul>
									</li>
									<li>
										교환권 사용방법 안내
										<ul>
											<li>- [모바일오더] 오메가V시네마 어플 > 모바일오더 > 스토어교환권 > 상품 선택 > 스토어교환권 등록 > 상품 선택 >결제</li>
											<li>- [현장키오스크] 매점구매 > 매점교환권 > PIN번호 입력 > 상품 선택 > 결제</li>
										</ul>
									</li>
								</c:when>
							</c:choose>
						</ul>
					</details>
				</td>
			</tr>
		</table>
	</section>
	<footer>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>