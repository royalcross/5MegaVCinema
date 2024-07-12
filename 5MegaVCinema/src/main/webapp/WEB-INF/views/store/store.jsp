<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	.item_name {font-size: 16px;}
	.item_content {font-size: 13px;}
	
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
			<c:forEach var="i" begin="0" end="4">
				<div class="photo">
					<button type="button" onclick="location.href='StoreDetail?item_id=${Ticket[i].item_id}&item_type=${Ticket[i].item_type}'">
						<img alt="${Ticket[i].item_name}" src="${pageContext.request.contextPath}/resources/img/popcorn.jpg">
						<p class="item_name"><b>${Ticket[i].item_name}</b></p>
						<p class="item_content">${Ticket[i].item_content}</p>
						<p class="item_price">${Ticket[i].item_price}원</p>
					</button>
				</div>
			</c:forEach>
		</div>
		<div class="item_photo">
			<p id="new_product2">팝콘/음료/굿즈</p>
			<p class="see_more">더보기&gt;</p>
			<c:forEach var="i" begin="0" end="4">
				<c:if test="${Popcorn[i] != null}">
					<div class="photo">
						<button type="button" onclick="location.href='StoreDetail?item_id=${Popcorn[i].item_id}&item_type=${Popcorn[i].item_type}'">
							<img alt="${Popcorn[i].item_name}" src="${pageContext.request.contextPath}/resources/img/popcorn.jpg">
							<p class="item_name"><b>${Popcorn[i].item_name}</b></p>
							<p class="item_content">${Popcorn[i].item_content}</p>
							<p class="item_price">${Popcorn[i].item_price}원</p>
						</button>
					</div>
				</c:if>
				<c:if test="${Drinks[i] != null}">
					<div class="photo">
						<button type="button" onclick="location.href='StoreDetail?item_id=${Drinks[i].item_id}&item_type=${Drinks[i].item_type}'">
							<img alt="${Drinks[i].item_name}" src="${pageContext.request.contextPath}/resources/img/popcorn.jpg">
							<p class="item_name"><b>${Drinks[i].item_name}</b></p>
							<p class="item_content">${Drinks[i].item_content}</p>
							<p class="item_price">${Drinks[i].item_price}원</p>
						</button>
					</div>
				</c:if>
				<c:if test="${Goods[i] != null}">
					<div class="photo">
						<button type="button" onclick="location.href='StoreDetail?item_id=${Goods[i].item_id}&item_type=${Goods[i].item_type}'">
							<img alt="${Goods[i].item_name}" src="${pageContext.request.contextPath}/resources/img/popcorn.jpg">
							<p class="item_name"><b>${Goods[i].item_name}</b></p>
							<p class="item_content">${Goods[i].item_content}</p>
							<p class="item_price">${Goods[i].item_price}원</p>
						</button>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</section>
	<%-- V티켓 목록 --%>
	<section class="listForm">
		<div class="item_photo">
			<c:forEach items="${Ticket}" varStatus="status">
				<div class="photo">
					<button type="button" onclick="location.href='StoreDetail?item_id=${Ticket[status.index].item_id}&item_type=${Ticket[status.index].item_type}'">
						<img alt="${Ticket[status.index].item_name}" src="${pageContext.request.contextPath}/resources/img/popcorn.jpg">
						<p class="item_name"><b>${Ticket[status.index].item_name}</b></p>
						<p class="item_content">${Ticket[status.index].item_content}</p>
						<p class="item_price">${Ticket[status.index].item_price}원</p>
					</button>
				</div>
			</c:forEach>
		</div>
	</section>
	<%-- 팝콘/음료/굿즈 목록 --%>
	<section class="listForm">
		<div class="item_photo">
			<c:forEach items="${Popcorn}" varStatus="status">
				<c:if test="${Popcorn[status.index] != null}">
					<div class="photo">
						<button type="button" onclick="location.href='StoreDetail?item_id=${Popcorn[status.index].item_id}&item_type=${Popcorn[status.index].item_type}'">
							<img alt="${Popcorn[status.index].item_name}" src="${pageContext.request.contextPath}/resources/img/popcorn.jpg">
							<p class="item_name"><b>${Popcorn[status.index].item_name}</b></p>
							<p class="item_content">${Popcorn[status.index].item_content}</p>
							<p class="item_price">${Popcorn[status.index].item_price}원</p>
						</button>
					</div>
				</c:if>
			</c:forEach>
			<c:forEach items="${Drinks}" varStatus="status">
				<c:if test="${Drinks[status.index] != null}">
					<div class="photo">
						<button type="button" onclick="location.href='StoreDetail?item_id=${Drinks[status.index].item_id}&item_type=${Drinks[status.index].item_type}'">
							<img alt="${Drinks[status.index].item_name}" src="${pageContext.request.contextPath}/resources/img/popcorn.jpg">
							<p class="item_name"><b>${Drinks[status.index].item_name}</b></p>
							<p class="item_content">${Drinks[status.index].item_content}</p>
							<p class="item_price">${Drinks[status.index].item_price}원</p>
						</button>
					</div>
				</c:if>
			</c:forEach>
			<c:forEach items="${Goods}" varStatus="status">
				<c:if test="${Goods[status.index] != null}">
					<div class="photo">
						<button type="button" onclick="location.href='StoreDetail?item_id=${Goods[status.index].item_id}&item_type=${Goods[status.index].item_type}'">
							<img alt="${Goods[status.index].item_name}" src="${pageContext.request.contextPath}/resources/img/popcorn.jpg">
							<p class="item_name"><b>${Goods[status.index].item_name}</b></p>
							<p class="item_content">${Goods[status.index].item_content}</p>
							<p class="item_price">${Goods[status.index].item_price}원</p>
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
	let tabMenu = document.querySelectorAll('.tabMenu');
	let listForm = document.querySelectorAll('.listForm');
	let see_more = document.querySelectorAll('.see_more');
			
	for(let i = 0; i < tabMenu.length; i++){
		tabMenu[i].onclick = function() {
			tabMenu[0].classList.remove('on');
			tabMenu[1].classList.remove('on');
			tabMenu[2].classList.remove('on');
			
			tabMenu[i].classList.add('on');
			
			listForm[0].classList.remove('on');
			listForm[1].classList.remove('on');
			listForm[2].classList.remove('on');
			
			listForm[i].classList.add('on');
		}
	}
	
	for(let i = 0; i < see_more.length; i++) {
		see_more[i].onclick = function() {
			tabMenu[0].classList.remove('on');
			tabMenu[1].classList.remove('on');
			tabMenu[2].classList.remove('on');
			
			tabMenu[i + 1].classList.add('on');
			
			listForm[0].classList.remove('on');
			listForm[1].classList.remove('on');
			listForm[2].classList.remove('on');
			
			listForm[i + 1].classList.add('on');
		}
	}
</script>
</html>