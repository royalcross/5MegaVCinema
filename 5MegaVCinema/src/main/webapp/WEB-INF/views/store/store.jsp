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
			<div class="photo">
				<button type="button" onclick="location.href='StoreDetail?item_id=${store_ticket[0].item_id}&item_type=${store_ticket[0].item_type}'">
					<img alt="${store_ticket[0].item_name}" src="${pageContext.request.contextPath}/resources/img/popcorn.jpg">
					<p class="item_name"><b>${store_ticket[0].item_name}</b></p>
					<p class="item_content">${store_ticket[0].item_content}</p>
					<p class="item_price">${store_ticket[0].item_price}원</p>
				</button>
			</div>
			<div class="photo">
				<button type="button" onclick="location.href='StoreDetail?item_id=${store_ticket[1].item_id}&item_type=${store_ticket[1].item_type}'">
					<img alt="${store_ticket[1].item_name}" src="${pageContext.request.contextPath}/resources/img/popcorn.jpg">
					<p class="item_name"><b>${store_ticket[1].item_name}</b></p>
					<p class="item_content">${store_ticket[1].item_content}</p>
					<p class="item_price">${store_ticket[1].item_price}원</p>
				</button>
			</div>
			<div class="photo">
				<button type="button" onclick="location.href='StoreDetail?item_id=${store_ticket[2].item_id}&item_type=${store_ticket[2].item_type}'">
					<img alt="${store_ticket[2].item_name}" src="${pageContext.request.contextPath}/resources/img/popcorn.jpg">
					<p class="item_name"><b>${store_ticket[2].item_name}</b></p>
					<p class="item_content">${store_ticket[2].item_content}</p>
					<p class="item_price">${store_ticket[2].item_price}원</p>
				</button>
			</div>
			<div class="photo">
				<button type="button" onclick="location.href='StoreDetail?item_id=${store_ticket[3].item_id}&item_type=${store_ticket[3].item_type}'">
					<img alt="${store_ticket[3].item_name}" src="${pageContext.request.contextPath}/resources/img/popcorn.jpg">
					<p class="item_name"><b>${store_ticket[3].item_name}</b></p>
					<p class="item_content">${store_ticket[3].item_content}</p>
					<p class="item_price">${store_ticket[3].item_price}원</p>
				</button>
			</div>
			<div class="photo">
				<button type="button" onclick="location.href='StoreDetail?item_id=${store_ticket[4].item_id}&item_type=${store_ticket[4].item_type}'">
					<img alt="${store_ticket[4].item_name}" src="${pageContext.request.contextPath}/resources/img/popcorn.jpg">
					<p class="item_name"><b>${store_ticket[4].item_name}</b></p>
					<p class="item_content">${store_ticket[4].item_content}</p>
					<p class="item_price">${store_ticket[4].item_price}원</p>
				</button>
			</div>
		</div>
		<div class="item_photo">
			<p id="new_product2">팝콘/음료/굿즈</p>
			<p class="see_more">더보기&gt;</p>
			<div class="photo">
				<button type="button" onclick="location.href='StoreDetail?item_id=${store_popcorn[0].item_id}&item_type=${store_popcorn[0].item_type}'">
					<img alt="${store_popcorn[0].item_name}" src="${pageContext.request.contextPath}/resources/img/popcorn.jpg">
					<p class="item_name"><b>${store_popcorn[0].item_name}</b></p>
					<p class="item_content">${store_popcorn[0].item_content}</p>
					<p class="item_price">${store_popcorn[0].item_price}원</p>
				</button>
			</div>
			<div class="photo">
				<button type="button" onclick="location.href='StoreDetail?item_id=${store_popcorn[1].item_id}&item_type=${store_popcorn[1].item_type}'">
					<img alt="${store_popcorn[1].item_name}" src="${pageContext.request.contextPath}/resources/img/popcorn.jpg">
					<p class="item_name"><b>${store_popcorn[1].item_name}</b></p>
					<p class="item_content">${store_popcorn[1].item_content}</p>
					<p class="item_price">${store_popcorn[1].item_price}원</p>
				</button>
			</div>
			<div class="photo">
				<button type="button" onclick="location.href='StoreDetail?item_id=${store_popcorn[2].item_id}&item_type=${store_popcorn[2].item_type}'">
					<img alt="${store_popcorn[2].item_name}" src="${pageContext.request.contextPath}/resources/img/popcorn.jpg">
					<p class="item_name"><b>${store_popcorn[2].item_name}</b></p>
					<p class="item_content">${store_popcorn[2].item_content}</p>
					<p class="item_price">${store_popcorn[2].item_price}원</p>
				</button>
			</div>
			<div class="photo">
				<button type="button" onclick="location.href='StoreDetail?item_id=${store_popcorn[3].item_id}&item_type=${store_popcorn[3].item_type}'">
					<img alt="${store_popcorn[3].item_name}" src="${pageContext.request.contextPath}/resources/img/popcorn.jpg">
					<p class="item_name"><b>${store_popcorn[3].item_name}</b></p>
					<p class="item_content">${store_popcorn[3].item_content}</p>
					<p class="item_price">${store_popcorn[3].item_price}원</p>
				</button>
			</div>
			<div class="photo">
				<button type="button" onclick="location.href='StoreDetail?item_id=${store_popcorn[4].item_id}&item_type=${store_popcorn[4].item_type}'">
					<img alt="${store_popcorn[4].item_name}" src="${pageContext.request.contextPath}/resources/img/popcorn.jpg">
					<p class="item_name"><b>${store_popcorn[4].item_name}</b></p>
					<p class="item_content">${store_popcorn[4].item_content}</p>
					<p class="item_price">${store_popcorn[4].item_price}원</p>
				</button>
			</div>
		</div>
	</section>
	<%-- V티켓 목록 --%>
	<section class="listForm">
		<div class="item_photo">
			<div class="photo">
				<button type="button" onclick="location.href='StoreDetail?item_id=${store_ticket[0].item_id}&item_type=${store_ticket[0].item_type}'">
					<img alt="${store_ticket[0].item_name}" src="${pageContext.request.contextPath}/resources/img/popcorn.jpg">
					<p class="item_name"><b>${store_ticket[0].item_name}</b></p>
					<p class="item_content">${store_ticket[0].item_content}</p>
					<p class="item_price">${store_ticket[0].item_price}원</p>
				</button>
			</div>
			<div class="photo">
				<button type="button" onclick="location.href='StoreDetail?item_id=${store_ticket[1].item_id}&item_type=${store_ticket[1].item_type}'">
					<img alt="${store_ticket[1].item_name}" src="${pageContext.request.contextPath}/resources/img/popcorn.jpg">
					<p class="item_name"><b>${store_ticket[1].item_name}</b></p>
					<p class="item_content">${store_ticket[1].item_content}</p>
					<p class="item_price">${store_ticket[1].item_price}원</p>
				</button>
			</div>
			<div class="photo">
				<button type="button" onclick="location.href='StoreDetail?item_id=${store_ticket[2].item_id}&item_type=${store_ticket[2].item_type}'">
					<img alt="${store_ticket[2].item_name}" src="${pageContext.request.contextPath}/resources/img/popcorn.jpg">
					<p class="item_name"><b>${store_ticket[2].item_name}</b></p>
					<p class="item_content">${store_ticket[2].item_content}</p>
					<p class="item_price">${store_ticket[2].item_price}원</p>
				</button>
			</div>
			<div class="photo">
				<button type="button" onclick="location.href='StoreDetail?item_id=${store_ticket[3].item_id}&item_type=${store_ticket[3].item_type}'">
					<img alt="${store_ticket[3].item_name}" src="${pageContext.request.contextPath}/resources/img/popcorn.jpg">
					<p class="item_name"><b>${store_ticket[3].item_name}</b></p>
					<p class="item_content">${store_ticket[3].item_content}</p>
					<p class="item_price">${store_ticket[3].item_price}원</p>
				</button>
			</div>
			<div class="photo">
				<button type="button" onclick="location.href='StoreDetail?item_id=${store_ticket[4].item_id}&item_type=${store_ticket[4].item_type}'">
					<img alt="${store_ticket[4].item_name}" src="${pageContext.request.contextPath}/resources/img/popcorn.jpg">
					<p class="item_name"><b>${store_ticket[4].item_name}</b></p>
					<p class="item_content">${store_ticket[4].item_content}</p>
					<p class="item_price">${store_ticket[4].item_price}원</p>
				</button>
			</div>
		</div>
	</section>
	<%-- 팝콘/음료/굿즈 목록 --%>
	<section class="listForm">
		<div class="item_photo">
			<div class="photo">
				<button type="button" onclick="location.href='StoreDetail?item_id=${store_popcorn[0].item_id}&item_type=${store_popcorn[0].item_type}'">
					<img alt="${store_popcorn[0].item_name}" src="${pageContext.request.contextPath}/resources/img/popcorn.jpg">
					<p class="item_name"><b>${store_popcorn[0].item_name}</b></p>
					<p class="item_content">${store_popcorn[0].item_content}</p>
					<p class="item_price">${store_popcorn[0].item_price}원</p>
				</button>
			</div>
			<div class="photo">
				<button type="button" onclick="location.href='StoreDetail?item_id=${store_popcorn[1].item_id}&item_type=${store_popcorn[1].item_type}'">
					<img alt="${store_popcorn[1].item_name}" src="${pageContext.request.contextPath}/resources/img/popcorn.jpg">
					<p class="item_name"><b>${store_popcorn[1].item_name}</b></p>
					<p class="item_content">${store_popcorn[1].item_content}</p>
					<p class="item_price">${store_popcorn[1].item_price}원</p>
				</button>
			</div>
			<div class="photo">
				<button type="button" onclick="location.href='StoreDetail?item_id=${store_popcorn[2].item_id}&item_type=${store_popcorn[2].item_type}'">
					<img alt="${store_popcorn[2].item_name}" src="${pageContext.request.contextPath}/resources/img/popcorn.jpg">
					<p class="item_name"><b>${store_popcorn[2].item_name}</b></p>
					<p class="item_content">${store_popcorn[2].item_content}</p>
					<p class="item_price">${store_popcorn[2].item_price}원</p>
				</button>
			</div>
			<div class="photo">
				<button type="button" onclick="location.href='StoreDetail?item_id=${store_popcorn[3].item_id}&item_type=${store_popcorn[3].item_type}'">
					<img alt="${store_popcorn[3].item_name}" src="${pageContext.request.contextPath}/resources/img/popcorn.jpg">
					<p class="item_name"><b>${store_popcorn[3].item_name}</b></p>
					<p class="item_content">${store_popcorn[3].item_content}</p>
					<p class="item_price">${store_popcorn[3].item_price}원</p>
				</button>
			</div>
			<div class="photo">
				<button type="button" onclick="location.href='StoreDetail?item_id=${store_popcorn[4].item_id}&item_type=${store_popcorn[4].item_type}'">
					<img alt="${store_popcorn[4].item_name}" src="${pageContext.request.contextPath}/resources/img/popcorn.jpg">
					<p class="item_name"><b>${store_popcorn[4].item_name}</b></p>
					<p class="item_content">${store_popcorn[4].item_content}</p>
					<p class="item_price">${store_popcorn[4].item_price}원</p>
				</button>
			</div>
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