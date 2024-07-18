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

h2 {
    text-align: center;
    font-size: 24px;
    margin-bottom: 20px;
    color: #333;
}

.area {
    margin-bottom: 20px;
    text-align: center;
}

.area a {
    padding: 10px 20px; 
    text-decoration: none;
    color: #333;
    border: 1px solid #ccc; 
    background-color: #f9f9f9; 
    margin: 0 5px; 
    cursor: pointer; 
}

.area a:hover {
    background-color: #e0e0e0; 
}

table {
    width: 90%;
    max-width: 800px; 
    border-collapse: collapse;
    margin: 20px auto; 
}

table th, table td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: center;
    white-space: nowrap; 
}

#tr_top {
    background: gray;
    color: white;
    text-align: center;
}

#pageList {
    text-align: center;
    margin-top: 20px;
}

#pageList a, #pageList input[type="button"] {
    display: inline-block;
    padding: 8px 16px;
    text-decoration: none;
    color: #333;
    border: 1px solid #ccc;
    margin: 0 5px;
    cursor: pointer;
    background-color: #f9f9f9;
}

#pageList input[type="button"]:disabled {
    background-color: #ddd;
    color: #999;
    cursor: default;
}

</style>
<script>
	function showNoticeDetail(notice_num) {
		alert("공지사항 상세 페이지로 이동: " + notice_num);
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<h2>공지사항</h2>
	<br>
	<section id="buttonArea">
    <div class="area">
        <a href="Notice" >공지사항</a> | 
        <a href="FAQ" >자주찾는질문</a> | 
        <a href="Cs" >1:1문의</a>  
    </div>
    <br>
    </section>   
	<section id="listForm">
		<table border="1">
			<tr id="tr_top">			
				<td width="100px">글번호</td>
				<td width="100px">영화관</td>
				<td>제목</td>
				<td width="150px">등록일</td>

			</tr>
			<c:set var="pageNum" value="1" />
	
			<c:if test="${not empty param.pageNum}">
				<c:set var="pageNum" value="${param.pageNum}" />
			</c:if>
			<c:forEach var="notice" items="${noticeList}">
				<tr>
					<td>${notice.notice_num}</td>
					<td>${notice.notice_theater_name}</td>
					<td><a href="NoticeDetail?notice_num=${notice.notice_num}">${notice.notice_subject}</a></td>					
					<td>${notice.notice_date}</td>
				</tr>
			</c:forEach>
		</table>
	</section>
	<section id="pageList">

		<input type="button" value="이전" 
				onclick="location.href='Notice?pageNum=${pageNum - 1}'"
				<c:if test="${pageNum <= 1}">disabled</c:if>>

		<c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">

			<c:choose>
				<c:when test="${i eq pageNum}">
					<b>${i}</b> 
				</c:when>
				<c:otherwise>
					<a href="Notice?pageNum=${i}">${i}</a> 
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<input type="button" value="다음" 
				<c:if test="${pageNum >= pageInfo.maxPage}">disabled</c:if>
		>
	</section>
	<footer>		
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>