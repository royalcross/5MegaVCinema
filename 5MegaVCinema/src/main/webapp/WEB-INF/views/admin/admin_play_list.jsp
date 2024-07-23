<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 날짜 등의 출력 형식 변경을 위한 JSTL - format(fmt) 라이브러리 등록 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>index</title>
		<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/resources/css/admin_default.css" rel="stylesheet" type="text/css">
		<script src="../js/jquery-3.7.1.js"></script>

		<style>
			.tab_content {width: 600px;
			border: 1px solid red;
			margin: 30px auto;
			}

			.tab_menu1 ul {
				display: flex;
				border-bottom: 1px solid oragered;
				height: 45px;
			}

			.tab_menu1 ul li {
				flex: 1; /* 균등배치 */
			}
			
			.tab_menu1 ul li a {
 				border: 1px solid #E1E1E1; 
 				border-left:0;
 				border-bottom: 0;
 				height: 45px; 
 				display: block; 
 				font-size: 14px; 
 				color: lightgray; 
 				text-align: center; 
 				line-height: 45px; 
			}
		
			.tab_menu1 ul li:first-child {
				border-left: 1px solid lightgray;
			}
		
			.tab_menu1 ul li a.on {
				border-color: orangered;
				border-bottom: 1px solid white;
				border-left: 1px solid orange;
				border-top-width: 3px;
				height: 43px;
			}
		
			.tab_menu1 ul li a.on::before {
				content: "";
				position: absolute;
				top: 0;
				left: 0;
				width: 1px;
				height: 1px;
				background-color: orangered;
			}
		
		
			article .location {
				display: none;
			}
		
			article .location.on {
				display: block;
			}
		
	/*--------------------------------------------------------------------------------------------------*/	
		
			.main {
				padding: 1.8rem;
			}
			
			.main h3 {
				text-align: left;
				margin-bottom: 30px;
			}
			
			
			.main .wrapper_top {
				display: flex;
				justify-content: space-between;
				position: relative;
				margin-bottom: 20px;
			}
			
			.main .wrapper_top .search {
				width: 270px;
				position: absolute;
				left: 40%;
			}
			.main .content {
				width: 100%;
			}
			
			.main .content table {
				width: 100%;
				text-align: center;
			}
			
			.main .content table th {
				background-color: #eee;
			}
			
			/* 페이징 처리 */
			.main #pageList {
				text-align: center;
			}
			
			/* 모달 팝업 */
			h2{
			    text-align: center;
			}
			.modal_btn {
			    display: block;
			    margin: 40px auto;
			    padding: 10px 20px;
			    background-color: royalblue;
			    border: none;
			    border-radius: 5px;
			    color: #fff;
			    cursor: pointer;
			    transition: box-shadow 0.2s;
			}
			.modal_btn:hover {
			    box-shadow: 3px 4px 11px 0px #00000040;
			}
			
			/*모달 팝업 영역 스타일링*/
			.modal {
			/*팝업 배경*/
				display: none; /*평소에는 보이지 않도록*/
			    position: absolute;
			    top:0;
			    left: 0;
			    width: 100%;
			    height: 100vh;
			    overflow: hidden;
			    background: rgba(0,0,0,0.5);
			}
			.modal .modal_popup {
			/*팝업*/
			    position: absolute;
			    width: 500px;
			    top: 50%;
			    left: 50%;
			    transform: translate(-50%, -50%);
			    padding: 20px;
			    background: #ffffff;
			    border-radius: 20px;
			}
			
			.modal .modal_popup .content {
				width: 100%;
			}
			
			.modal .modal_popup .close_btn, .modal .modal_popup .regist_btn, .modal .modal_popup .reset_btn {
			    padding: 10px 20px;
			    background-color: rgb(116, 0, 0);
			    border: none;
			    border-radius: 5px;
			    color: #fff;
			    cursor: pointer;
			    transition: box-shadow 0.2s;
			}
			
			.modal.on {
			    display: block;
			    
			}
			.btnArea {
				margin-top: 30px;
			}
		</style>
		<script>
			// 게시글 수 
			function showListLimit(limit){
				location.href="AdminPlay?listLimit=" + limit;
			}
		</script>
	</head>
	<body>
		<header>
			<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
		</header>
		<div class="inner">
			<section class="wrapper">
				<jsp:include page="/WEB-INF/views/inc/admin_side_nav.jsp"></jsp:include>
				<article class="main">
					<h3>상영시간표 관리 페이지</h3>
					<div class="wrapper_top">
						<div>
							<span>Show</span>
							<select onchange="showListLimit(this.value)">
								<option value="5" <c:if test="${param.listLimit eq 5}">selected</c:if>>5</option>
								<option value="10" <c:if test="${param.listLimit eq 10}">selected</c:if>>10</option>
								<option value="20" <c:if test="${param.listLimit eq 20}">selected</c:if>>20</option>
								<option value="30" <c:if test="${param.listLimit eq 30}">selected</c:if>>30</option>
							</select>
							<span>entries</span>
						</div>
								<!-- 영화 등록버튼 -->
<!-- 	<section id="buttonArea" > -->
<!-- 		<input type="button" value="등록" onclick="insertPlay()"> -->
						
						<form action="AdminPlayList">
							<div class="search">
								<span>Search</span>
								<input type="search" name="searchKeyword" value="${param.searchKeyword}" >
								<input type="submit" value="검색">
							</div>
						</form>
<!-- 우측 상단 버튼 들어가는 자리 -->			
						<div>
							<button type="button" id="registBtn">등록</button>
<!-- 							<button type="button" id="categoryBtn">카테고리 관리</button> -->
						</div>
					</div>
						
					<div class="content">
<!-- 영화정보관리 게시판 -->
						<table border="1">
							<tr>
								<th>상영번호</th>
								<th>상영일자</th>
								<th>영화관명</th>
								<th>상영관</th>
								<th>영화명</th>
								<th>시작시간</th>
								<th>종료시간</th>
								<th>수정 및 삭제</th>
							</tr>
			
			<%-- 페이지번호(pageNum 파라미터) 가져와서 저장(없을 경우 기본값 1로 설정) --%>
			<c:set var="pageNum" value="1"/>
			
			<%-- pageNum 파라미터 존재할 경우(비어있지 않음) 판별 --%>
			<c:if test="${not empty param.pageNum}">
				<c:set var="pageNum" value="${param.pageNum}"/>
			</c:if>
			<c:set var="play" target="${playList}">
			
			<c:out value="${play.movie_date}"></c:out>
			</c:set>
			<%-- JSTL과 EL 활용하여 글목록 표시 작업 반복(boardList 객체 활용) --%>
			<c:forEach var="play" items="${playList}">
			<tr>
				<td>${play.play_num}</td>
				<td>${play.play_day}</td>
				<td>${play.play_theater_name}</td>
				<td>${play.room_num}</td>
				<td>${play.play_movie_name_kr}</td>
				<td>${play.play_start_time}</td>
				<td>${play.play_end_time}</td>
				<td>
<!-- 				<input type="button" value="상세보기"> -->
<!-- 				<input type="button" value="상영종료"> -->
					<button value="${play.play_num}" class="modifyBtn">수정</button>
			<input type="button" value="삭제" onclick="confirmDelete('${room.room_num}', '${room.room_theater_num}')">
				<%--수정을 위한 상영시간표 번호  --%>
				<input type="hidden" value="${play.play_num}">
				</td>
			</tr>
			</c:forEach>
			<%--게시물 목록이 하나도 없을 경우 메세지 표시 --%>
			<c:if test="${empty playList}">
				<tr><td colspan="7">게시물이 존재하지 않습니다.</td></tr>
			</c:if>
	</table>
</div>
					
	<%-- ========================== 페이징 처리 영역 ========================== --%>
	<section id="pageList">
		<input type="button" value="이전" 
				onclick="location.href='AdminPlay?pageNum=${pageNum - 1}'"
				<c:if test="${pageNum <= 1}">disabled</c:if>
		>
		
		<c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
			<c:choose>
				<c:when test="${i eq pageNum}">
					<b>${i}</b> <%-- 현재 페이지 번호 --%>
				</c:when>
				<c:otherwise>
					<a href="AdminPlay?pageNum=${i}">${i}</a> <%-- 다른 페이지 번호 --%>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<input type="button" value="다음" 
				onclick="location.href='AdminPlay?pageNum=${pageNum + 1}'" <c:if test="${pageNum > pageInfo.maxPage}"> disabled </c:if>>
	</div>
				</article>
			</section>
		</div>
	
	<!--  ----------- 등록 페이지 ----------->	
	
		
		<div class="modal"> 
		    <div class="modal_popup">
		        <h3>상영스케줄 등록</h3>
		        <div class="content">
		        	<form action="AdminPlayRegist" method="post" name="registForm">
		        		<div id="resultArea"></div>  <!-- 수정 팝업 내용 들어갈 자리 -->
						<div class="btnArea" style="text-align : center">
				        	<input type="submit" class="regist_btn" value="등록">
				        	<input type="button" class="close_btn" value="취소">
				        </div>
			        </form>
				</div>
		    </div>
		</div>
	
	
	
	
	<!--  ----------- 수정 페이지 ----------->	
	
		
		<div class="modal"> <!-- 수정 -->
		    <div class="modal_popup">
		        <h3>상영시간표 수정</h3>
		        <div class="content">
		        	<form action="AdminPlayModify" method="post" name="modifyForm">
		        		<div id="resultArea2"></div>  <!-- 수정 팝업 내용 들어갈 자리 -->
						<div class="btnArea" style="text-align : center">
				        	<input type="submit" class="regist_btn" value="등록">
				        	<input type="button" class="close_btn" value="취소">
				        </div>
			        </form>
				</div>
		    </div>
		</div>
		
		<script>
			let modal = document.querySelectorAll('.modal');
			let registBtn = document.querySelector('#registBtn');
			let modifyBtn = document.querySelectorAll('.modifyBtn'); // 반복문으로 버튼이 여러 개 뜨니까 버튼도 여러개임을 인지하고, 팝업 뜨는 것도 반복문 작성필요
			let closeBtn = document.querySelectorAll('.close_btn');
			let categoryBtn = document.querySelector('#categoryBtn');
			
			// 아이템 삭제
			function confirmDelete(room_num, room_theater_num){
				if(confirm("삭제하시겠습니까?")) {
					location.href="AdminRoomDelete?room_num=" + room_num + "&room_theater_num=" + room_theater_num;
				}
			}

			// -------------------------------------------------------------------------
			
			// 아이템 등록 - 팝업 오픈
// 			registBtn.onclick = function(){
// 				modal[0].classList.add('on');
// 			}
			
			$(function() {
				$(registBtn).click(function() {
					$.ajax({
						url:"AdminPlayRegist",
	    				data:{
	    					"item_id": $(this).val()
	    					},
	    				method:"get",
	    				success: function (response) {
	    					modal[0].classList.add('on');
	    					$("#resultArea").html(response);
	    				}
					});
				});
			});
			
			// -------------------------------------------------------------------------
			// 카테고리 관리
// 			categoryBtn.onclick = function(){
// 				modal[1].classList.add('on');
// 			}
			
			// -------------------------------------------------------------------------
			
			// 아이템 수정 팝업 띄우기
			for(let i = 0; i < modifyBtn.length ; i++) {
				modifyBtn[i].onclick = function(){
// 					console.log("modal")
					modal[1].classList.add('on');
				}
			}
			
			// 아이템 상세 내용 가져오는 AJAX - resources 에 js 있어야함 (script 태그에 주소 연결도 해야함)
			$(function() {
				$(modifyBtn).click(function() {
					$.ajax({
						url:"AdminPlayModify",
	    				data:{
	    					"play_num": $(this).val()
	    					},
	    				method:"get",
	    				success: function (response) {
	    					$("#resultArea2").html(response);
	    				}
					});
				});
			});
			
			// -------------------------------------------------------------------------
			
			// 취소 버튼 성공
			for(let i = 0; i < closeBtn.length ; i++) {
				closeBtn[i].onclick = function(){
					modal[i].classList.remove('on');
				}
			}
		</script>
	
	
	
</body>
<footer>
			<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
		</footer>
	</body>
</html>

