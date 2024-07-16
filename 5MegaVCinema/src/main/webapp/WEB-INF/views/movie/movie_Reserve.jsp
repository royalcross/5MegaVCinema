<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style type="text/css">
	table{
		margin: 0 auto;
		width: 100%;
	}
	
	table th {
		width: 25%;
	}
	
	.time_select span{
		line-height: 1;
	}
	
	.theaterBtn {
		width: 100%;
		padding: 10px;
		margin-bottom: 10px;
		background-color: #eee;
		border: 0;
	}
	
	.theaterBtn.selected {
		background-color: yellow;		
	}
	
	.inner.cont{
		margin-top: 50px;
		margin-bottom: 50px;
	}
	
</style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>

	<section class="inner cont">
		<form>
			<table border="1">
				<tr>
					<th>날짜</th>
					<th>영화관</th>
					<th>영화</th>
					<th>시간</th>
				</tr>
				<tr>
					<td>날짜 선택</td>
					<td class="theater_select">
						<c:forEach var="theater" items="${theaterList}">
<%-- 							<button type="button" class="theaterBtn selected"  value="${theater.theater_name}"  --%>
<!-- 							style="width: 100% ; padding: 10px; margin-bottom : 10px; background-color: #eee ; border: 0;" -->
<!-- 							onclick="location.href='ReserveTheaterAjax?theater_name=' + this.value"> -->
							<button type="button" class="theaterBtn"  value="${theater.theater_name}" >
								${theater.theater_name}
							</button>	
						</c:forEach>
					</td>
					<td class="movie_select">
						<c:forEach var="movie" items="${movieList}">
							<button value="${movie.movie_name_kr}" 
							style="width: 100% ; padding: 10px; margin-bottom : 10px; background-color: #eee ; border: 0;">
								${movie.movie_name_kr}
							</button>	
						</c:forEach>
					</td>
					<td class="time_select">
						<span>날짜, 극장, 영화를 선택해주세요</span>
					</td>
				</tr>
			</table>
			
			<input type="submit" value="예매하기">
		</form>
		
		<div id="resultArea"></div>
	</section>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
	<script>
		
		// 극장 버튼 클릭 시 색깔 변경
		$(function() {
			let theaterBtn = document.querySelectorAll('.theaterBtn');
			
			for(let i = 0; i < theaterBtn.length; i++){
				theaterBtn[i].onclick = function () {
					theaterBtn[0].classList.remove('selected');
					theaterBtn[1].classList.remove('selected');
					theaterBtn[2].classList.remove('selected');
					theaterBtn[3].classList.remove('selected');
					theaterBtn[4].classList.remove('selected');
					theaterBtn[5].classList.remove('selected');
					theaterBtn[6].classList.remove('selected');
					theaterBtn[7].classList.remove('selected');
					theaterBtn[8].classList.remove('selected');
					theaterBtn[9].classList.remove('selected');
					theaterBtn[10].classList.remove('selected');
					
					theaterBtn[i].classList.add('selected');
				}
		   	}
			
		});
		
		let theaterBtn = document.querySelectorAll('.theaterBtn');
		
		$(theaterBtn).click(function() {
			$.ajax({
				url: "ReserveTheaterAjax",
				type : "get",
				data:{
					"theater_name": $(this).val()
					},
				dataType: "json",
				success: function (response) {
					alert("ajax 성공!");
					
				},
				error: function(response){
					alert("실패");
				}
			});
		});
		
		
	</script>
	<footer>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>