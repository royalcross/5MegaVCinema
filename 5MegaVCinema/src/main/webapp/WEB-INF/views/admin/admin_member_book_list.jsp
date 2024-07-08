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
			.inner .wrapper {
				height: 80vh;
			}
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
			    width: 900px;
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
			
			.modal .modal_popup .content table {
				width: 100%;
			}
			
			.modal .modal_popup .close_btn {
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
			
		</style>
	</head>
	<body>
		<header>
			<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
		</header>	
		<div class="inner">
			<section class="wrapper">
				<jsp:include page="/WEB-INF/views/inc/admin_side_nav.jsp"></jsp:include>
				<article class="main">
					<h3>예매내역 조회 (미완성)</h3>
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
						
						<form action="AdminMemberBook">
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
						<table border="1" >
							<tr>
								<th width="100px">예매번호</th>
								<th width="120px">예매자 회원번호</th>
								<th width="160px">영화</th>
								<th width="120px">상영일</th>
								<th width="160px">극장</th>
								<th width="80px">상태</th>
								<th width="100px">상세보기</th>
							</tr>
							
							<%-- 페이지번호(pageNum 파라미터) 가져와서 저장(없을 경우 기본값 1로 설정) --%>
							<c:set var="pageNum" value="1" />
							<%-- pageNum 파라미터 존재할 경우(= 비어있지 않음) 판별 --%>
							<c:if test="${not empty param.pageNum}">
								<%-- pageNum 변수에 pageNum 파라미터값 저장 --%>
								<c:set var="pageNum" value="${param.pageNum}" />
							</c:if>
							
							<c:forEach var="orderTicket" items="${orderTicketList}">
								<tr>
									<td>${orderTicket.order_ticket_id}</td>
									<td>${orderTicket.order_ticket_member_num}</td>
									<td>${orderTicket.movie_name_kr}</td> 
									<td>${orderTicket.order_ticket_date}</td>
									<td>${orderTicket.theater_name}</td>
									<td>${orderTicket.order_ticket_status}</td>
									<td>
										<input type="button" class="detail" value="상세보기">
									</td>
								</tr>
							</c:forEach>
							<c:if test="${empty orderTicketList}">
								<tr>
									<td align="center" colspan="8">검색결과가 없습니다.</td>
								</tr>
							</c:if>
						</table>
					</div>
					
					<div id="pageList">
						<input type="button" value="이전" 
								onclick="location.href='AdminMemberBook?pageNum=${pageNum - 1}'">
						
						<c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
							<c:choose>
								<c:when test="${i eq pageNum}">
									<b>${i}</b> <%-- 현재 페이지 번호 --%>
								</c:when>
								<c:otherwise>
									<a href="AdminMemberBook?pageNum=${i}">${i}</a> <%-- 다른 페이지 번호 --%>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<input type="button" value="다음" 
								onclick="location.href='AdminMemberBook?pageNum=${pageNum + 1}'">
					</div>
				</article>
			</section>
		</div>
		
		<div class="modal">
		    <div class="modal_popup">
		        <h3>상세보기( 구현 필요 .. )</h3>
		        <div class="content">
			        <table border = "1">
				        <c:forEach var="orderTicket" items="${orderTicketList}">
							<tr>
								<td>${orderTicket.order_ticket_id}</td>
								<td>${orderTicket.order_ticket_member_num}</td>
								<td></td> <!-- join 써서 영화 이름 가져오는게 나을듯(movie) -->
								<td>${orderTicket.order_ticket_date}</td>
								<td>${orderTicket.order_ticket_theater_name}</td><!-- join 써서 상영관 이름 가져와야함(theater) / 일단 그냥 컬럼 추가 해둠 -->
								<td>${orderTicket.order_ticket_status}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				
				<div class="close" style="text-align : center">
		        	<button type="button" class="close_btn">닫기</button>
		        </div>
		    </div>
		</div>
		
		<script>
			let modal = document.querySelector('.modal');
			let openBtn = document.querySelector('.detail');
			let closeBtn = document.querySelector('.close_btn');
			
			openBtn.onclick = function(){
				modal.classList.add('on');
			}
			
			closeBtn.onclick = function(){
				modal.classList.remove('on');
			}
		</script>
		
		<footer>
			<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
		</footer>
	</body>
	
</html>




















