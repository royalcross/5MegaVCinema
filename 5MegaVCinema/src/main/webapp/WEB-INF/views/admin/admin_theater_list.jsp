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
		<%-- 외부 CSS파일 연결하기 --%>
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
		
		function insertTheater() {
			window.open('adminInsertTheater', 'target="self"', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
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
					<h3>극장 조회 페이지</h3>
					
					<div class="tab_content">
						<nav class="tab_menu1">
							<ul>
								<li><a href="#" class="tabmenu on">전국</a></li>
								<li><a href="#" class="tabmenu">서울/경기/인천</a></li>
								<li><a href="#" class="tabmenu">충청</a></li>
								<li><a href="#" class="tabmenu">경상</a></li>
							</ul>
						</nav>
					</div>
		
		<article>
			<div align="left" class="location on ">
<!-- 				<h1>전국</h1> -->
			</div>
			<div align="left" class="location">
<!-- 				<h1>서울</h1> -->
			</div>
			<div align="left" class="location">
<!-- 				<h1>충청</h1> -->
			</div>
			<div align="left" class="location">
<!-- 				<h1>경상</h1> -->
			</div>
		</article>
		
					
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
		<input type="button" value="등록" onclick="insertTheater()">
						
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
			<th>극장번호</th>
			<th>극장명</th>
			<th>극장 설명</th>
			<th>극장 주소</th>
			<th>수정 및 삭제</th>
			</tr>
			
			<%-- 페이지번호(pageNum 파라미터) 가져와서 저장(없을 경우 기본값 1로 설정) --%>
			<c:set var="pageNum" value="1"/>
			
			<%-- pageNum 파라미터 존재할 경우(비어있지 않음) 판별 --%>
			<c:if test="${not empty param.pageNum}">
				<c:set var="pageNum" value="${param.pageNum}"/>
			</c:if>
			
			<%-- JSTL과 EL 활용하여 글목록 표시 작업 반복(boardList 객체 활용) --%>
			<c:forEach var="theater" items="${theaterList}">
			<tr class="theater_location_num_${theater.theater_location_num}">
			<td>${theater.theater_num}</td>
			<td>${theater.theater_name}</td>
			<td>${theater.theater_content}</td>
			<td>${theater.theater_address}</td>
			<td>
			<input type="button" value="수정">
			<input type="button" value="삭제">
			
			</td>
			</tr>
			</c:forEach>
			<%--게시물 목록이 하나도 없을 경우 메세지 표시 --%>
			<c:if test="${empty theaterList}">
				<tr><td colspan="5">게시물이 존재하지 않습니다.</td></tr>
			</c:if>
</table>
</div>
					
					<div id="pageList">
						<input type="button" value="이전" 
								onclick="location.href='AdminMemberList?pageNum=${pageNum - 1}'">
						
						<%-- 계산된 페이지 번호가 저장된 PageInfo 객체(pageInfo)를 통해 페이지 번호 출력 --%>
						<%-- 시작페이지(startPage = begin) 부터 끝페이지(endPage = end)까지 1씩 증가하면서 표시 --%>
						<c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
							<%-- 각 페이지마다 하이퍼링크 설정(페이지번호를 pageNum 파라미터로 전달) --%>
							<%-- 단, 현재 페이지(i 값과 pageNum 파라미터값이 동일)는 하이퍼링크 없이 굵게 표시 --%>
							<c:choose>
								<c:when test="${i eq pageNum}">
									<b>${i}</b> <%-- 현재 페이지 번호 --%>
								</c:when>
								<c:otherwise>
									<a href="AdminMemberList?pageNum=${i}">${i}</a> <%-- 다른 페이지 번호 --%>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<%-- [다음] 버튼 클릭 시 BoardList 서블릿 요청(파라미터 : 현재 페이지번호 + 1) --%>
						<%-- 현재 페이지 번호(pageNum)가 URL 파라미터로 전달되므로 ${param.pageNum} 활용 --%>
						<%-- 단, 현재 페이지 번호가 최대 페이지번호(maxPage)보다 작을 경우에만 동작(아니면, 버튼 비활성화 처리) --%>
						<%-- 두 가지 경우의 수에 따라 버튼을 달리 생성하지 않고, disabled 만 추가 여부 설정 --%>
						<%-- pageNum 파라미터값이 최대 페이지번호 이상일 때 disabled 속성 추가 --%>
						<input type="button" value="다음" 
								onclick="location.href='AdminMemberList?pageNum=${pageNum + 1}'">
					</div>
				</article>
			</section>
		</div>
		<footer>
			<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
		</footer>
	
	
	
	
	
	
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
	<script>
	let tabMenu = document.querySelectorAll('.tabmenu');
	let loginCon = document.querySelectorAll('.location');
	
	for(let i = 0; i < tabMenu.length; i++){
        tabMenu[i].onclick = function () {
            tabMenu[0].classList.remove('on');
            tabMenu[1].classList.remove('on');
            tabMenu[2].classList.remove('on');
            tabMenu[3].classList.remove('on');
                  
            tabMenu[i].classList.add('on');

            loginCon[0].classList.remove('on');
            loginCon[1].classList.remove('on');
            loginCon[2].classList.remove('on');
            loginCon[3].classList.remove('on');

            loginCon[i].classList.add('on');
            
            // theater_location_num_xxx 요소 숨김 처리
            if(i == 0) {
            	$(".theater_location_num_1000").show();
            	$(".theater_location_num_1001").show();
            	$(".theater_location_num_1002").show();
            } else if(i == 1) {
            	$(".theater_location_num_1000").show();
            	$(".theater_location_num_1001").hide();
            	$(".theater_location_num_1002").hide();
            } else if(i == 2) {
            	$(".theater_location_num_1000").hide();
            	$(".theater_location_num_1001").show();
            	$(".theater_location_num_1002").hide();
            } else if(i == 3) {
            	$(".theater_location_num_1000").hide();
            	$(".theater_location_num_1001").hide();
            	$(".theater_location_num_1002").show();
            }
        }
	}
	
	
	
	
	
	</script>
	
</body>
			<footer>
			<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
		</footer>
	</body>
</html>
