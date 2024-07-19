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
			    height: 140vh;
			    overflow: hidden;
			    background: rgba(0,0,0,0.5);
			}
			.modal .modal_popup {
			/*팝업*/
			    position: absolute;
			    width: 500px;
			    top: 35%;
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
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
	</head>
	<body>
			<header>
			<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
		</header>	
		<div class="inner">
			<section class="wrapper">
				<jsp:include page="/WEB-INF/views/inc/admin_side_nav.jsp"></jsp:include>
				<article class="main">
					<h3>영화정보관리</h3>
					<div class="wrapper_top">
<!-- 						<div> -->
<!-- 							<span>Show</span> -->
<!-- 							<select> -->
<!-- 								<option>5</option> -->
<!-- 								<option>10</option> -->
<!-- 								<option>20</option> -->
<!-- 								<option>30</option> -->
<!-- 							</select> -->
<!-- 							<span>entries</span> -->
<!-- 						</div> -->
						<!-- 영화 등록버튼 -->
						
						<form action="AdminMovieList">
							<div class="search">
								<span>Search</span>
								<input type="search" name="searchKeyword" value="${param.searchKeyword}" >
								<input type="submit" value="검색">
							</div>
						</form>
			
						<!-- 우측 상단 버튼 들어가는 자리 -->			
						<div>
							<button type="button" id="registBtn">등록</button>
						</div>
					</div>
						
					<div class="content">
						<table border="1" >
							<tr>
								<th>영화코드</th>
								<th>영화제목</th>
								<th>심의등급</th>
								<th>개봉일</th>
								<th>개봉상태</th>
								<th>러닝타임</th>
								<th>상세보기</th>
							</tr>
			
							<%-- 페이지번호(pageNum 파라미터) 가져와서 저장(없을 경우 기본값 1로 설정) --%>
							<c:set var="pageNum" value="1"/>
							
							<%-- pageNum 파라미터 존재할 경우(비어있지 않음) 판별 --%>
							<c:if test="${not empty param.pageNum}">
								<c:set var="pageNum" value="${param.pageNum}"/>
							</c:if>
							
							<%-- JSTL과 EL 활용하여 글목록 표시 작업 반복(boardList 객체 활용) --%>
							<c:forEach var="movie" items="${movieList}">
								<tr>
									<td>${movie.movie_code}</td>
									<td>${movie.movie_name_kr}</td>
									<td>${movie.movie_grade}</td>
									<td>${movie.movie_release_date}</td>
									<td>${movie.movie_status}</td>
									<td>${movie.movie_running_time}</td>
									<td>
										<button value="${movie.movie_code}" class="modifyBtn">수정</button>
										<input type="button" class="delete" value="삭제" onclick="confirmDelete('${movie.movie_code}')">
									</td>
				<!-- 					<td> -->
				<%-- 					<input type="button" value="상세보기" onclick="detailMovie(${movie.movie_code})"> --%>
				<!-- 					<input type="button" value="상영종료" id="btnEndMovie" onclick="endMovie()"> -->
				<!-- 					</td> -->
								</tr>
							</c:forEach>
							<%--게시물 목록이 하나도 없을 경우 메세지 표시 --%>
							<c:if test="${empty movieList}">
								<tr>
									<td align="center" colspan="8">검색결과가 없습니다.</td>
							</c:if>
						</table>
					</div>
					
					<div id="pageList">
						<input type="button" value="이전" 
								onclick="location.href='AdminMovieList?pageNum=${pageNum - 1}'">
						
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
									<a href="AdminMovieList?pageNum=${i}">${i}</a> <%-- 다른 페이지 번호 --%>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<%-- [다음] 버튼 클릭 시 BoardList 서블릿 요청(파라미터 : 현재 페이지번호 + 1) --%>
						<%-- 현재 페이지 번호(pageNum)가 URL 파라미터로 전달되므로 ${param.pageNum} 활용 --%>
						<%-- 단, 현재 페이지 번호가 최대 페이지번호(maxPage)보다 작을 경우에만 동작(아니면, 버튼 비활성화 처리) --%>
						<%-- 두 가지 경우의 수에 따라 버튼을 달리 생성하지 않고, disabled 만 추가 여부 설정 --%>
						<%-- pageNum 파라미터값이 최대 페이지번호 이상일 때 disabled 속성 추가 --%>
						<input type="button" value="다음" 
								onclick="location.href='AdminMovieList?pageNum=${pageNum + 1}'">
					</div>
				</article>
			</section>
		</div>
	
		<div class="modal"> <!-- 등록 -->
		    <div class="modal_popup">	
			<h3>영화등록 페이지</h3>	
		    <div class="content">	
			<form action="adminInsertMovie" method="post" name="registForm">	
		<label for="movie_code">영화코드</label>
		<input type="text" id="movie_code" name="movie_code" required>
		<a href="https://www.kobis.or.kr/kobis/business/mast/mvie/searchMovieList.do#none" 
		target="_blank"><label>영화코드 확인하기</label></a><br>
		
		<label for="movie_grade">심의등급</label>
		<select id="movie_grade" name="movie_grade" required>
			<option>ALL</option>
			<option>12</option>
			<option>15</option>
			<option>19</option>
		</select><br>
	<!-- 	<input type="text" id="movie_grade" name="movie_grade" placeholder="예시 : ALL,12,15,19"><br> -->
		
		<label for="movie_release_date">개봉일</label>
		<input type="date" id="movie_release_date" name="movie_release_date" required><br>
		<label for="movie_close_date">종영일</label>
		<input type="date" id="movie_close_date" name="movie_close_date" required><br>
		
		<label for="movie_status">개봉상태</label>
		<select id="movie_status" name="movie_status" required>
			<option value="release">개봉</option>
			<option value="end">상영종료</option>
			<option value="coming">상영예정</option>
		</select>
	<!-- 	<input type="text" id="movie_status" name="movie_status" placeholder="예시 : 개봉, 상영종료"><br> -->
		
		<label for="movie_name_kr">영화제목</label>
		<input type="text" id="movie_name_kr" name="movie_name_kr" required><br>
		
		<label for="movie_name_en">영화제목(영문)</label>
		<input type="text" id="movie_name_en" name="movie_name_en" required><br>
		
		<label for="movie_running_time">러닝타임</label>
		<input type="text" id="movie_running_time" name="movie_running_time" required><br>
		
		<label for="movie_genre">장르</label>
		<select id="movie_genre" name="movie_genre" required>
			<option>코미디</option>
			<option>액션</option>
			<option>멜로</option>
			<option>스릴러</option>
			<option>미스터리</option>
			<option>공포</option>
			<option>어드벤처</option>
			<option>범죄</option>
			<option>판타지</option>
			<option>sf</option>
			<option>사극</option>
			<option>전쟁</option>
			<option>뮤지컬</option>
			<option>공연</option>
			<option>기타</option>
		</select>
	<!-- 	<input type="text" id="movie_genre" name="movie_genre"><br> -->
		
		<label for="movie_director">감독</label>
		<input type="text" id="movie_director" name="movie_director" required><br>
		
		<label for="movie_cast">배우</label>
		<input type="text" id="movie_cast" name="movie_cast" placeholder="홍길동 강감찬 이순신" required><br>
		
		<label for="movie_poster">포스터url</label>
		<textarea rows="3" cols="70" id="movie_poster" name="movie_poster" required></textarea><br>
		
		<label for="movie_photo">스틸컷url</label>
		<textarea rows="3" cols="70" id="movie_photo" name="movie_photo" required></textarea><br>
		
		<label for="movie_preview">티저url</label>
		<textarea rows="3"  cols="70"id="movie_preview" name="movie_preview" required></textarea><br>
		
		<label for="movie_content">줄거리</label>
		<textarea rows="3"  cols="70"id="movie_content" name="movie_content"required></textarea><br>
	<!-- 	<label for="movie_plot">Comments</label> -->
	<!-- 	<textarea rows="10" id="movie_plot"></textarea> -->
		
		<div class="btnArea" style="text-align : center">
			<input type="submit" class="regist_btn" value="등록">
			<input type="reset" class="reset_btn" value="초기화">
			<input type="button" class="close_btn" value="취소">
		</div>
	</form>
</div>
		    </div>
		</div>
	
		<div class="modal"> <!-- 수정 -->
		    <div class="modal_popup">
		        <h3>영화 수정</h3>
		        <div class="content">
		        	<form action="AdminMovieModify" method="post" name="modifyForm">
		        		<div id="resultArea"></div>  <!-- 수정 팝업 내용 들어갈 자리 -->
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
			
			// 아이템 삭제
			function confirmDelete(movie_code){
				if(confirm("삭제하시겠습니까?")) {
					location.href="MovieDelete?movie_code=" + movie_code;
				}
			}

			// -------------------------------------------------------------------------
			
			// 아이템 등록 - 팝업 오픈
			registBtn.onclick = function(){
				modal[0].classList.add('on');
			}
			
			// 아이템 등록 (카테고리 선택 -> 상품 아이디에 값 들어감)
			
			function selectCategory(category) {
				
		 		if(category == "Ticket"){ 
		 			document.registForm.item_id.value = category;
		 		}
		 		
		 		if(category == "Popcorn"){
		 			document.registForm.item_id.value = category;
		 		}
		 		
		 		if(category == "Drinks"){
		 			document.registForm.item_id.value = category;
		 		}
		 		
		 		if(category == "Goods"){
		 			document.registForm.item_id.value = category;
		 		}
			}
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
						url:"AdminMovieModify",
	    				data:{
	    					"movie_code": $(this).val()
	    					},
	    				method:"get",
	    				success: function (response) {
	    					$("#resultArea").html(response);
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
			
	
	
	
	
	
		<footer>
			<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
		</footer>
	</body>
	
</html>
	
	
	
	

