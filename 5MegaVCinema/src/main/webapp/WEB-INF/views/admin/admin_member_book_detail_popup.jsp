<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<table border = "1">
    <tr>
		<th>예매번호</th>
		<th>예매자 회원번호</th>
		<th>영화</th>
		<th>상영일</th>
		<th>극장</th>
	</tr>
	
	<tr align="center">
		<td>${selectedBook.order_ticket_id}</td>
		<td>${selectedBook.order_ticket_member_num}</td>
		<td>${selectedBook.movie_name_kr}</td>
		<td><fmt:parseDate value="${selectedBook.order_ticket_date}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
			<fmt:formatDate pattern="yyyy-MM-dd" value="${parsedDateTime}"/></td>
		<td>${selectedBook.theater_name}</td>
	</tr>
	
	<tr>
		<th>상영관</th>
		<th>좌석</th>
		<th>예매인원</th>
		<th>예매금액</th>
		<th>상태</th>
	</tr>
	
	<tr align="center">
		<td>${selectedBook.order_ticket_room_num}</td>
		<td>${selectedBook.order_ticket_seat_num}</td>
		<td>${selectedBook.order_ticket_how_many_people}</td>
		<td>${selectedBook.order_ticket_how_many_people * selectedBook.ticket_price}</td>
		<td>${selectedBook.order_ticket_status}</td>
	</tr>
</table>