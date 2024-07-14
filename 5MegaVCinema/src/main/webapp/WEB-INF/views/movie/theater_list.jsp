<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div>
	<c:forEach var="theater" items="${theaterList}">
		<button value="${theater.theater_name}" 
		style="width: 100% ; padding: 10px; margin-bottom : 10px; background-color: #eee ; border: 0;"
		onclick="selectTheater(this.value)">
			${theater.theater_name}
		</button>	
	</c:forEach>
</div>

<script>
	function selectTheater(theater) {
		location.href="ReserveTheaterAjax?theater_name=" + theater;
	}
</script>