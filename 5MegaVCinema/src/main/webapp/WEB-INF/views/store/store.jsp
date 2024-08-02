<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토어 | 오메가V시네마</title>
<%-- 외부 CSS 파일(css/default.css) 연결하기 --%>
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<style type="text/css">
	body {text-align: center;}
	
	#item_list {height: 50px;}
	
	/* 탭 메뉴 시작 */
	.tab {
		width: 720px;
		margin: 0 auto;
		text-align: center;
	}
	.tab>ul {
		display: flex;
		justify-content: space-between;
	}
	.tab>ul>li {
		width:50%;
		background-color: #eee;
		cursor: pointer;
	}
	.tab>ul>li.on {
		background-color: #ccc;
		color: rgb(211, 84, 0);
		font-weight: bold;
	}
	/* 탭 메뉴 끝 */
	
	.item_name {font-size: 14px;}
	.item_content {font-size: 11px;}
	
	.listForm {
		width: 1024px;
		margin: auto;
	}
	#new_product1 {
		text-align: left;
		font-size: 25px;
		margin-right: 865px;
	}
	#new_product2 {
		text-align: left;
		font-size: 25px;
		margin-right: 760px;
	}
	.see_more {
		text-align: right;
		font-size: 15px;
		cursor: pointer;
	}
	.see_more:hover {
		text-decoration: underline;
	}
	.item_photo {
		display: flex;
		flex-wrap: wrap;
		justify-content: center;
		max-width: 1000px;
		margin: 0 auto;
	}
	.item_photo>.photo {
		width: 20%;
		padding: 5px;
		box-sizing: border-box;
		text-align: center;
		margin-bottom: 20px;
	}
	.item_photo>.photo>button {cursor: pointer;}
	.item_photo>.photo>button>img {
		max-width: 100%;
		height: auto;
		display: block;
		margin: 0 auto;
		background-color: white;
	}
	.listForm {display: none;}
	.listForm.on {display: block;}
</style>
<%-- jquery 라이브러리 포함시키기 --%>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<h2>스토어</h2>
	<section id="item_list">
		<div class="tab">
			<ul>
				<%-- 각 항목 선택 시 항목에 맞는 상품 목록 표시 --%>
				<li class="tabMenu on">새로운 상품</li>
				<li class="tabMenu">V티켓</li>
				<li class="tabMenu">팝콘/음료/굿즈</li>
			</ul>
		</div>
	</section>
	<%-- 새로운 상품 목록 --%>
	<section class="listForm on">
		<div class="item_photo">
			<p id="new_product1">V티켓</p>
			<p class="see_more">더보기&gt;</p>
			<%-- 상품 목록 개수를 5개로 제한하기 위해 <c:set>태그로 limit 변수 선언 및 초기화 --%>
			<c:set var="limit" value="0"/>
			<c:forEach items="${storeList}" varStatus="status">
				<%-- <c:if> 태그로 상품 목록을 추가하는 조건 설정 --%>
				<c:if test="${storeList[status.index] != null and storeList[status.index].item_type eq 'Ticket' and limit < 5}">
					<div class="photo">
						<button type="button" onclick="location.href='StoreDetail?item_id=${storeList[status.index].item_id}&item_type=${storeList[status.index].item_type}'">
							<img alt="${storeList[status.index].item_name}" src="${pageContext.request.contextPath}/resources/upload/${storeList[status.index].item_image}">
							<p class="item_name"><b>${storeList[status.index].item_name}</b></p>
							<p class="item_content">${storeList[status.index].item_content}</p>
							<p class="item_price"><fmt:formatNumber value="${storeList[status.index].item_price}" pattern="#,###" />원</p>
						</button>
					</div>
					<%-- 상품 목록이 하나 추가될 때마다 limit 변수의 값을 1씩 증가 --%>
					<c:set var="limit" value="${limit + 1}"/>
				</c:if>
			</c:forEach>
		</div>
		<div class="item_photo">
			<p id="new_product2">팝콘/음료/굿즈</p>
			<p class="see_more">더보기&gt;</p>
			<%-- 상품 목록 개수를 5개로 제한하기 위해 <c:set>태그로 limit 변수 선언 및 초기화 --%>
			<c:set var="limit" value="0"/>
			<c:forEach items="${storeList}" varStatus="status">
				<%-- <c:if> 태그로 상품 목록을 추가하는 조건 설정 --%>
				<c:if test="${storeList[status.index] != null and (storeList[status.index].item_type eq 'Popcorn' or storeList[status.index].item_type eq 'Drinks' or storeList[status.index].item_type eq 'Goods') and limit < 5}">
					<div class="photo">
						<button type="button" onclick="location.href='StoreDetail?item_id=${storeList[status.index].item_id}&item_type=${storeList[status.index].item_type}'">
							<img alt="${storeList[status.index].item_name}" src="${pageContext.request.contextPath}/resources/upload/${storeList[status.index].item_image}">
							<p class="item_name"><b>${storeList[status.index].item_name}</b></p>
							<p class="item_content">${storeList[status.index].item_content}</p>
							<p class="item_price"><fmt:formatNumber value="${storeList[status.index].item_price}" pattern="#,###" />원</p>
						</button>
					</div>
					<%-- 상품 목록이 하나 추가될 때마다 limit 변수의 값을 1씩 증가 --%>
					<c:set var="limit" value="${limit + 1}"/>
				</c:if>
			</c:forEach>
		</div>
	</section>
	<%-- V티켓 목록 --%>
	<section class="listForm">
		<div class="item_photo">
			<c:forEach items="${storeList}" varStatus="status">
				<%-- <c:if> 태그로 상품 목록을 추가하는 조건 설정 --%>
				<c:if test="${storeList[status.index] != null and storeList[status.index].item_type eq 'Ticket'}">
					<div class="photo">
						<button type="button" onclick="location.href='StoreDetail?item_id=${storeList[status.index].item_id}&item_type=${storeList[status.index].item_type}'">
							<img alt="${storeList[status.index].item_name}" src="${pageContext.request.contextPath}/resources/upload/${storeList[status.index].item_image}">
							<p class="item_name"><b>${storeList[status.index].item_name}</b></p>
							<p class="item_content">${storeList[status.index].item_content}</p>
							<p class="item_price"><fmt:formatNumber value="${storeList[status.index].item_price}" pattern="#,###" />원</p>
						</button>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</section>
	<%-- 팝콘/음료/굿즈 목록 --%>
	<section class="listForm">
		<div class="item_photo">
			<c:forEach items="${storeList}" varStatus="status">
				<%-- <c:if> 태그로 상품 목록을 추가하는 조건 설정 --%>
				<c:if test="${storeList[status.index] != null and (storeList[status.index].item_type eq 'Popcorn' or storeList[status.index].item_type eq 'Drinks' or storeList[status.index].item_type eq 'Goods')}">
					<div class="photo">
						<button type="button" onclick="location.href='StoreDetail?item_id=${storeList[status.index].item_id}&item_type=${storeList[status.index].item_type}'">
							<img alt="${storeList[status.index].item_name}" src="${pageContext.request.contextPath}/resources/upload/${storeList[status.index].item_image}">
							<p class="item_name"><b>${storeList[status.index].item_name}</b></p>
							<p class="item_content">${storeList[status.index].item_content}</p>
							<p class="item_price"><fmt:formatNumber value="${storeList[status.index].item_price}" pattern="#,###" />원</p>
						</button>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</section>
	<footer>		
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
<script type="text/javascript">
	let tabMenu = document.querySelectorAll(".tabMenu");
	let listForm = document.querySelectorAll(".listForm");
	let see_more = document.querySelectorAll(".see_more");
	
	for(let i = 0; i < tabMenu.length; i++){
		tabMenu[i].onclick = function() {
			tabMenu[0].classList.remove("on");
			tabMenu[1].classList.remove("on");
			tabMenu[2].classList.remove("on");
			
			tabMenu[i].classList.add("on");
			
			listForm[0].classList.remove("on");
			listForm[1].classList.remove("on");
			listForm[2].classList.remove("on");
			
			listForm[i].classList.add("on");
		}
	}
	
	for(let i = 0; i < see_more.length; i++) {
		see_more[i].onclick = function() {
			tabMenu[0].classList.remove("on");
			tabMenu[1].classList.remove("on");
			tabMenu[2].classList.remove("on");
			
			tabMenu[i + 1].classList.add("on");
			
			listForm[0].classList.remove("on");
			listForm[1].classList.remove("on");
			listForm[2].classList.remove("on");
			
			listForm[i + 1].classList.add("on");
		}
	}
</script>
</html>