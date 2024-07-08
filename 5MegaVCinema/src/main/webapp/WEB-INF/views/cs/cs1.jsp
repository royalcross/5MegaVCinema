<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<!-- 외부 CSS 파일(css/default.css) 연결하기 -->
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<style type="text/css">
	#listForm {
		width: 1024px;
		max-height: 610px;
		margin: auto;
	}
	
	h2 {
		text-align: center;
	}
	
	table {
		margin: auto;
		width: 1024px;
	}
	
	#tr_top {
		background: gray;
		text-align: center;
	}
	
	table td {
		text-align: center;
	}
	
	#pageList {
		margin: auto;
		width: 1024px;
		text-align: center;
	}
	
	#emptyArea {
		margin: auto;
		width: 1024px;
		text-align: center;
	}
	
	a {
		text-decoration: none;
	}
	
	#subject {
		text-align: left;
		padding-left: 20px;
	}
	#buttonArea {
	 	text-align: center;
	 	margin: 0 10px;
	}
</style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<h2>공지사항</h2>
	<br>
	<section id="buttonArea">
    <div class="area">
        <a href="Cs1" >공지사항</a> | 
        <a href="Cs2" >자주찾는질문</a> | 
        <a href="Cs3" >1:1문의</a> 
    </div>
    <br>
    </section>
	<section id="listForm">
		<table>
			<tr id="tr_top">
				<td width="100px">영화관</td>
				<td>제목</td>
				<td width="150px">등록일</td>

			</tr>
			<c:set var="pageNum" value="1" />
	
			<c:if test="${not empty param.pageNum}">
				<c:set var="pageNum" value="${param.pageNum}" />
			</c:if>
			<c:forEach var="board" items="${boardList}">
				<tr>
					<td>${board.board_num}</td>
					<td id="subject">
						<a href="BoardDetail.bo?board_num=${board.board_num}&pageNum=${pageNum}">${board.board_subject}</a>
					</td>
					<td>${board.board_name}</td>
					<td>${board.board_date}</td>
					<td>${board.board_readcount}</td>
				</tr>
			</c:forEach>
		</table>
	</section>
	<section id="pageList">

		<input type="button" value="이전" 
				onclick="location.href='BoardList.bo?pageNum=${pageNum - 1}'"
				<c:if test="${pageNum <= 1}">disabled</c:if>
		>

		<c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">

			<c:choose>
				<c:when test="${i eq pageNum}">
					<b>${i}</b> 
				</c:when>
				<c:otherwise>
					<a href="BoardList.bo?pageNum=${i}">${i}</a> 
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<input type="button" value="다음" 
<%-- 				onclick="location.href='BoardList.bo?pageNum=${pageNum + 1}'" --%>
				<c:if test="${pageNum >= pageInfo.maxPage}">disabled</c:if>
		>
	</section>
	<footer>		
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>













