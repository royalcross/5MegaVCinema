<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 날짜 등의 출력 형식 변경을 위한 JSTL - format(fmt) 라이브러리 등록 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- hidden (where 절에 써야해서 파라미터 전달해야함 -->
<input type="hidden" name="notice_num" value="${selectedNotice.notice_num}" > 

<div>
	<span>극장</span> <br>
	<select class="category" name="notice_theater_name">
	 	<option value="신도림" <c:if test="${selectedNotice.notice_theater_name eq '신도림'}">selected</c:if>>신도림</option>
	 	<option value="청라" <c:if test="${selectedNotice.notice_theater_name eq '청라'}">selected</c:if>>청라</option>
	 	<option value="동탄" <c:if test="${selectedNotice.notice_theater_name eq '동탄'}">selected</c:if>>동탄</option>
	 	<option value="남양주" <c:if test="${selectedNotice.notice_theater_name eq '남양주'}">selected</c:if>>남양주</option>
	 	<option value="다산" <c:if test="${selectedNotice.notice_theater_name eq '다산'}">selected</c:if>>다산</option>
	 	<option value="천안불당" <c:if test="${selectedNotice.notice_theater_name eq '천안불당'}">selected</c:if>>천안불당</option>
	 	<option value="경주보문" <c:if test="${selectedNotice.notice_theater_name eq '경주보문'}">selected</c:if>>경주보문</option>
	 	<option value="구미봉곡" <c:if test="${selectedNotice.notice_theater_name eq '구미봉곡'}">selected</c:if>>구미봉곡</option>
	 	<option value="대구이시아" <c:if test="${selectedNotice.notice_theater_name eq '대구이시아'}">selected</c:if>>대구이시아</option>
	 	<option value="칠곡호이" <c:if test="${selectedNotice.notice_theater_name eq '칠곡호이'}">selected</c:if>>칠곡호이</option>
	 	<option value="보문" <c:if test="${selectedNotice.notice_theater_name eq '보문'}">selected</c:if>>보문</option>
	 	<option value="영덕예주" <c:if test="${selectedNotice.notice_theater_name eq '영덕예주'}">selected</c:if>>영덕예주</option>
	</select>
</div>
<div>
	<span>제목</span> <br>
	<input type="text" name="notice_subject" value="${selectedNotice.notice_subject}">
</div>

<div>
	<span>공지내용</span> <br>
	<textarea rows="10" cols="40" name="notice_content">${selectedNotice.notice_content}</textarea>
</div>


















