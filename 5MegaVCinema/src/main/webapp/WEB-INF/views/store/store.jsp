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
	
	table, th, td {border: 1px solid black;}
	
	#item_list>table {
		margin: auto;
		border-collapse: collapse;
		font-size: 14px;
		table-layout: fixed;
		width: 1080px;
	}
	
	#item_list1 {padding: 10px 15px;}
	#item_list2 {padding: 10px 15px;}
	#item_list3 {padding: 10px 15px;}
	
	.item_name {font-size: 16px;}
	.item_content {font-size: 13px;}
	
	#listForm {
		width: 1024px;
		margin: auto;
	}
	.mvphoto {
		display: flex;
		flex-wrap: wrap;
		justify-content: center;
		max-width: 1000px;
		margin: 0 auto;
	}
	.mvphoto .photo {
		width: 20%;
		padding: 5px;
		box-sizing: border-box;
		text-align: center;
		margin-bottom: 20px;
	}
	.mvphoto .photo img {
		max-width: 100%;
		height: auto;
		display: block;
		margin: 0 auto;
	}
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
		<table>
			<tr>
				<%-- 각 항목 선택 시 항목에 맞는 상품 목록 표시 --%>
				<td id="item_list1">새로운 상품</td>
				<td id="item_list2">V티켓</td>
				<td id="item_list3">팝콘/음료/굿즈</td>
			</tr>
		</table>
	</section>
	<section id="listForm">
		<div class="mvphoto">
			<div class="photo">
				<button type="button" onclick="location.href='StoreDetail?item_id=${store[0].item_id}&item_type=${store[0].item_type}'">
					<img src="${pageContext.request.contextPath}/resources/img/popcorn.jpg" alt="사진1">
					<p class="item_name"><b>${store[0].item_name}</b></p>
					<p class="item_content">${store[0].item_content}</p>
					<p class="item_price">${store[0].item_price}원</p>
				</button>
			</div>
			<div class="photo">
				<img src="resources/img/popcorn.jpg" alt="사진2">
			</div>
			<div class="photo">
				<img src="resources/img/popcorn.jpg" alt="사진3">
			</div>
			<div class="photo">
				<img src="resources/img/popcorn.jpg" alt="사진4">
			</div>
			<div class="photo">
				<img src="resources/img/popcorn.jpg" alt="사진5">
			</div>
			<div class="photo">
				<img src="resources/img/popcorn.jpg" alt="사진6">
			</div>
			<div class="photo">
				<img src="resources/img/popcorn.jpg" alt="사진7">
			</div>
			<div class="photo">
				<img src="resources/img/popcorn.jpg" alt="사진8">
			</div>
			<div class="photo">
				<img src="resources/img/popcorn.jpg" alt="사진9">
			</div>
			<div class="photo">
				<img src="resources/img/popcorn.jpg" alt="사진10">
			</div>
			<div class="photo">
				<img src="resources/img/popcorn.jpg" alt="사진11">
			</div>
			<div class="photo">
				<img src="resources/img/popcorn.jpg" alt="사진12">
			</div>
			<div class="photo">
				<img src="resources/img/popcorn.jpg" alt="사진13">
			</div>
			<div class="photo">
				<img src="resources/img/popcorn.jpg" alt="사진14">
			</div>
			<div class="photo">
				<img src="resources/img/popcorn.jpg" alt="사진15">
			</div>
			<div class="photo">
				<img src="resources/img/popcorn.jpg" alt="사진16">
			</div>
			<div class="photo">
				<img src="resources/img/popcorn.jpg" alt="사진17">
			</div>
			<div class="photo">
				<img src="resources/img/popcorn.jpg" alt="사진18">
			</div>
			<div class="photo">
				<img src="resources/img/popcorn.jpg" alt="사진19">
			</div>
			<div class="photo">
				<img src="resources/img/popcorn.jpg" alt="사진20">
			</div>
		</div>
	</section>
	<footer>		
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>