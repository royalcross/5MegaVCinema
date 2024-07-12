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
		<style>
			.main {
				padding: 1.8rem;
				height: 100vh;
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
				margin-bottom: 50px;
			}
			
			.main .content table {
				width: 100%;
			}
			
			.main .content table th {
				background-color: #eee;
			}
			
			.main .content table #yAdmin {
				background-color:  orange;
			}
			
			/* 페이징 처리 */
			.main #pageList {
				text-align: center;
			}
		</style>
		<script>
		// 팝업창 띄우기
		var popupWidth = 1000;
		var popupHeight = 800;
		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		
// 			function confirmAdmin(id, isadmin, isAuthorize){
// 				let msg = "";
				
// 				if(isAuthorize == 'Y') {
// 					msg = "부여";
// 				} else {
// 					msg = "해제";
// 				}
				
// 				if(confirm("관리자 권한을 " + msg + "하시겠습니까?")){
// 					location.href="ChangeAdminAuthorize?member_id=" + id + "&member_isAdmin=" + isadmin + "&isAuthorize=" + isAuthorize;
// 				}
// 			}
			
			function insertPlay() {
				window.open('adminInsertPlay', 'target="self"', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
			}
			function detailMovie(movie_code) {
				window.open('adminMovieDetail?movie_code=' + movie_code, 'target="self"', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
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
							<select>
								<option>5</option>
								<option>10</option>
								<option>20</option>
								<option>30</option>
							</select>
							<span>entries</span>
						</div>
								<!-- 영화 등록버튼 -->
	<section id="buttonArea" >
		<input type="button" value="등록" onclick="insertPlay()">
						
						<form action="AdminPlayList">
							<div class="search">
								<span>Search</span>
								<input type="search" name="searchKeyword" value="${param.searchKeyword}" >
								<input type="submit" value="검색">
							</div>
						</form>
			
						<!-- 우측 상단 버튼 들어가는 자리 -->			
<!-- 						<div> -->
							
<!-- 						</div> -->
					</div>
						
					<div class="content">
<!-- 영화정보관리 게시판 -->
	<table border="1">
		<tr>
			<th>상영기간</th>
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
			
			<%-- JSTL과 EL 활용하여 글목록 표시 작업 반복(boardList 객체 활용) --%>
			<c:forEach var="play" items="${playList}">
			<tr>
			<td>${play.movie_date}</td>
			<td>${play.theater_name}</td>
			<td>${play.room_num}</td>
			<td>${play.movie_name_kr}</td>
			<td>${play.play_start_time}</td>
			<td>${play.play_end_time}</td>
			<td>
			<input type="button" value="상세보기">
			<input type="button" value="상영종료">
			
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
				onclick="location.href='movieList?pageNum=${pageNum - 1}'"
				<c:if test="${pageNum <= 1}">disabled</c:if>
		>
		
		<c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
			<c:choose>
				<c:when test="${i eq pageNum}">
					<b>${i}</b> <%-- 현재 페이지 번호 --%>
				</c:when>
				<c:otherwise>
					<a href="movieList?pageNum=${i}">${i}</a> <%-- 다른 페이지 번호 --%>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<input type="button" value="다음" 
				onclick="location.href='movieList?pageNum=${pageNum + 1}'"
				<c:if test="${pageNum >= pageInfo.maxPage}">disabled</c:if>
		>
	</section>
	
</body>
<footer>
			<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
		</footer>
	</body>
</html>


