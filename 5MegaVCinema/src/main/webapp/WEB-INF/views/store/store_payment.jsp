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
	#payment_title, #item_info {
		padding: 10px;
		text-align: left;
	}
	#payment_title {font-size: 30px;}
	#item_info {font-size: 20px;}
	#available_theaters {
		color: blue;
		text-decoration: underline;
	}
	#item_img {width: 100px; height: 100px;}
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
	.payment_method {display: none;}
	.payment_method.on {display: block;}
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
<%-- 포트원 결제 --%>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<%-- iamport.payment.js --%>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<%-- 포트원 결제 --%>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<section>
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
				<td><img alt="item_img" src="${pageContext.request.contextPath}/resources/upload/${store.item_image}" id="item_img"></td>
				<td id="item_nameAndContent">${store.item_name}<br>${store.item_content}</td>
				<td><a href="javascript:availableTheaters()" id="available_theaters">사용가능극장 확인</a></td>
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
					<th rowspan="2" width="100">선물메세지<br><p id="message_length"></p></th>
					<td rowspan="2"><textarea rows="5" cols="50" id="message" placeholder="전달하고자 하는 메세지를 남겨보세요(최대 70자)"></textarea></td>
				</tr>
				<tr>
					<th>수량/휴대폰번호</th>
					<td>
						<select id="quantity">
							<option>선택</option>
							<option>1</option>
							<c:if test="${param.count >= 2}">
								<option>2</option>
								<c:if test="${param.count >= 3}">
									<option>3</option>
									<c:if test="${param.count >= 4}">
										<option>4</option>
										<c:if test="${param.count >= 5}">
											<option>5</option>
											<c:if test="${param.count >= 6}">
												<option>6</option>
												<c:if test="${param.count >= 7}">
													<option>7</option>
													<c:if test="${param.count eq 8}">
														<option>8</option>
													</c:if>
												</c:if>
											</c:if>
										</c:if>
									</c:if>
								</c:if>
							</c:if>
						</select>
						<input type="text" id="recipient_phone" placeholder="'-'없이 입력해 주세요">
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
					<label><input type="radio" id="creditCard" name="payment_method" value="신용/체크카드" checked>신용/체크카드</label>
					<label><input type="radio" id="kakaopay" name="payment_method" value="카카오페이">카카오페이</label>
				</td>
			</tr>
			<tr>
				<td>
					<div class="payment_method on">
						신용/체크카드를 선택하셨습니다.<br>
						즉시할인 신용카드 적용이 가능합니다.
<!-- 							카드사 선택 -->
<!-- 							<select id="card"> -->
<!-- 								<option>카드선택</option> -->
<!-- 								<option>비씨카드</option> -->
<!-- 								<option>국민카드</option> -->
<!-- 								<option>신한카드</option> -->
<!-- 								<option>삼성카드</option> -->
<!-- 								<option>롯데카드</option> -->
<!-- 								<option>농협카드</option> -->
<!-- 								<option>하나카드</option> -->
<!-- 								<option>현대카드</option> -->
<!-- 								<option>씨티카드</option> -->
<!-- 								<option>제주카드</option> -->
<!-- 								<option>우리카드</option> -->
<!-- 								<option>수협카드</option> -->
<!-- 								<option>전북카드</option> -->
<!-- 								<option>광주카드</option> -->
<!-- 								<option>신협카드</option> -->
<!-- 								<option>카카오 뱅크</option> -->
<!-- 								<option>케이뱅크</option> -->
<!-- 								<option>우체국카드</option> -->
<!-- 								<option>토스카드</option> -->
<!-- 								<option>SC제일은행 비씨카드</option> -->
<!-- 								<option>SC제일은행 삼성카드</option> -->
<!-- 								<option>IBK기업은행 카드</option> -->
<!-- 							</select> -->
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
		<br>
	</section>
	<footer>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
<script type="text/javascript">
	// 사용가능극장
	function availableTheaters() {
		let url = "StoreAvailableTheaters";
		let name = "store_available_theaters";
		let option = "width = 500, height = 500, top = 200, left = 650, location = no";
		window.open(url, name, option);
	}
	$(function() {
		// 주문 상품의 상품이미지 또는 상품명 클릭 시 상품 구매 페이지로 이동
// 		$("#")
		// 결제 유형(선물, 구매) 확인
		if(${param.paymentType eq 'gift'}) {
			// 선물 수량 합계 변수 선언
			let quantity_result = 0;
			// 추가 버튼 클릭 시 익명 함수 호출
			$("#add_recipient").click(function() {
				if(${param.count} <= quantity_result) { // 선물 수량 합계가 선택한 수량을 초과할 경우 알림창 출력
					alert("선택한 수량을 초과했습니다.")
				} else if($("#recipient").val() == "") { // 받는 분이 입력되지 않았을 경우 알림창 출력
					alert("받는 분을 확인해주세요.");
				} else if($("#quantity").val() == "선택") { // 선물할 수량이 선택되지 않았을 경우 알림창 출력
					alert("수량을 확인해주세요.");
				} else if($("#recipient_phone").val() == "") { // 휴대폰번호가 입력되지 않았을 경우 알림창 출력
					alert("휴대폰번호를 확인해주세요.");
				} else { // 위 조건을 모두 통과했을 경우 선물 수량 합계 계산 후 목록 추가
					for(let i = 1; i <= 8; i++) {
						if($("#quantity").val() == i) {
							quantity_result = quantity_result + i;
						}
					}
					$("#gift_list").text($("#gift_list").text() + "[수량:" + $("#quantity").val() + ",받는 분:" + $("#recipient").val() + ",전화번호:" + $("#recipient_phone").val() + "]");
					$("#recipient").val("");
					$("#quantity").val("선택");
					$("#recipient_phone").val("");
				}
			});
			// 메세지 입력 확인 및 글자 수 확인
			$("#message_length").text("(" + $("#message").val().length + "자/70자)");
			$("#message").keyup(function() {
				$("#message_length").text("(" + $("#message").val().length + "자/70자)");
				if($("#message").val().length > 70) {
					alert("최대 70자까지 입력 가능합니다.");
				}
			});
		}
		
		// 결제 수단 목록
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
			if(${param.paymentType eq 'gift'}) {
				if($("#gift_list").text() == "") {
					alert("받는 분 또는 수량/휴대폰번호를 확인해주세요.");
				} else if($("#message").val() == "") {
					alert("선물메세지를 확인해주세요.")
				} else if($("input:radio[name=payment_method]:checked").val() == "신용/체크카드") {
// 					if($("#card").val() == "카드선택") {
// 						alert("결제하실 카드를 선택하세요.");
// 					} else 
					if(confirm("${buyMember.member_name}(${buyMember.member_phonenumber})로 스토어교환권이 발송됩니다.\n결제하시겠습니까?")) { // 구매 클릭시 한번 더 확인하기
						// 결제창 호출
						IMP.request_pay({
							// 파라미터 값 설정
							pg : "html5_inicis.INIpayTest", // PG사 코드표에서 선택
							pay_method : "card", // 결제 방식
							merchant_uid : "IMP" + makeMerchantUid, // 결제 고유 번호
							name : "${store.item_name}", // 제품명
							amount : "${param.amountNum}", // 금액
							//구매자 정보 ↓
							buyer_email : "${buyMember.member_id}",
							buyer_name : "${buyMember.member_name}",
							buyer_tel : "${buyMember.member_phonenumber}",
							// buyer_addr : '서울특별시 강남구 삼성동',
							// buyer_postcode : '123-456'
						}, function(rsp) { // callback
							if(rsp.success) { // 결제 성공시
								alert("결제가 완료되었습니다(신용/체크카드).");
								location.href = "StorePaymentSuccess?order_item_item_id=${store.item_id}&order_item_sales_rate=${param.count}&order_item_sales_revenue=${param.amountNum}&order_item_member_num=${buyMember.member_num}";
							} else if(!rsp.success) { // 결제 실패시
								alert(rsp.error_msg);
							}
						});
					}
				} else if($("input:radio[name=payment_method]:checked").val() == "카카오페이") {
					if(confirm("${buyMember.member_name}(${buyMember.member_phonenumber})로 스토어교환권이 발송됩니다.\n결제하시겠습니까?")) { // 구매 클릭시 한번 더 확인하기
						// 결제창 호출
						IMP.request_pay({
							// 파라미터 값 설정
							pg : "kakaopay.TC0ONETIME", // PG사 코드표에서 선택
							pay_method : "card", // 결제 방식
							merchant_uid : "IMP" + makeMerchantUid, // 결제 고유 번호
							name : "${store.item_name}", // 제품명
							amount : "${param.amountNum}", // 금액
							//구매자 정보 ↓
							buyer_email : "${buyMember.member_id}",
							buyer_name : "${buyMember.member_name}",
							buyer_tel : "${buyMember.member_phonenumber}",
							// buyer_addr : '서울특별시 강남구 삼성동',
							// buyer_postcode : '123-456'
						}, function(rsp) { // callback
							if(rsp.success) { // 결제 성공시
								alert("결제가 완료되었습니다(카카오페이).");
								location.href = "StorePaymentSuccess?order_item_item_id=${store.item_id}&order_item_sales_rate=${param.count}&order_item_sales_revenue=${param.amountNum}&order_item_member_num=${buyMember.member_num}";
							} else if(!rsp.success) { // 결제 실패시
								alert(rsp.error_msg);
							}
						});
					}
				}
			} else if(${param.paymentType eq 'purchase'}) {
				if($("input:radio[name=payment_method]:checked").val() == "신용/체크카드") {
// 					if($("#card").val() == "카드선택") {
// 						alert("결제하실 카드를 선택하세요.");
// 					} else 
					if(confirm("${buyMember.member_name}(${buyMember.member_phonenumber})로 스토어교환권이 발송됩니다.\n결제하시겠습니까?")) { // 구매 클릭시 한번 더 확인하기
						// 결제창 호출
						IMP.request_pay({
							// 파라미터 값 설정
							pg : "html5_inicis.INIpayTest", // PG사 코드표에서 선택
							pay_method : "card", // 결제 방식
							merchant_uid : "IMP" + makeMerchantUid, // 결제 고유 번호
							name : "${store.item_name}", // 제품명
							amount : "${param.amountNum}", // 금액
							//구매자 정보 ↓
							buyer_email : "${buyMember.member_id}",
							buyer_name : "${buyMember.member_name}",
							buyer_tel : "${buyMember.member_phonenumber}",
							// buyer_addr : '서울특별시 강남구 삼성동',
							// buyer_postcode : '123-456'
						}, function(rsp) { // callback
							if(rsp.success) { // 결제 성공시
								alert("결제가 완료되었습니다(신용/체크카드).");
								location.href = "StorePaymentSuccess?order_item_item_id=${store.item_id}&order_item_sales_rate=${param.count}&order_item_sales_revenue=${param.amountNum}&order_item_member_num=${buyMember.member_num}";
							} else if(!rsp.success) { // 결제 실패시
								alert(rsp.error_msg);
							}
						});
					}
				} else if($("input:radio[name=payment_method]:checked").val() == "카카오페이") {
					if(confirm("${buyMember.member_name}(${buyMember.member_phonenumber})로 스토어교환권이 발송됩니다.\n결제하시겠습니까?")) { // 구매 클릭시 한번 더 확인하기
						// 결제창 호출
						IMP.request_pay({
							// 파라미터 값 설정
							pg : "kakaopay.TC0ONETIME", // PG사 코드표에서 선택
							pay_method : "card", // 결제 방식
							merchant_uid : "IMP" + makeMerchantUid, // 결제 고유 번호
							name : "${store.item_name}", // 제품명
							amount : "${param.amountNum}", // 금액
							//구매자 정보 ↓
							buyer_email : "${buyMember.member_id}",
							buyer_name : "${buyMember.member_name}",
							buyer_tel : "${buyMember.member_phonenumber}",
							// buyer_addr : '서울특별시 강남구 삼성동',
							// buyer_postcode : '123-456'
						}, function(rsp) { // callback
							if(rsp.success) { // 결제 성공시
								alert("결제가 완료되었습니다(카카오페이).");
								location.href = "StorePaymentSuccess?order_item_item_id=${store.item_id}&order_item_sales_rate=${param.count}&order_item_sales_revenue=${param.amountNum}&order_item_member_num=${buyMember.member_num}";
							} else if(!rsp.success) { // 결제 실패시
								alert(rsp.error_msg);
							}
						});
					}
				}
			}
		});
		// 취소 버튼 클릭 시 스토어 페이지로 이동
		$('#cancel').click(function() {
			location.href = "Store";
		});
	});
</script>
</html>