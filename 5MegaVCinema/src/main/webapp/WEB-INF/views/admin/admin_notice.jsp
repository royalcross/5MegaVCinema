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
		<script>
			// 게시글 수 
			function showListLimit(limit){
				location.href="AdminNotice?listLimit=" + limit;
			}
			
			function confirmDelete(notice_num){
				if(confirm("공지사항을 삭제하시겠습니까?")){
					location.href="AdminNoticeDelete?notice_num=" + notice_num;
				}
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
					<h3>공지사항</h3>
					<div class="wrapper_top">
						<div>
							<span>Show</span>
							<select onchange="showListLimit(this.value)">
								<option value="5" <c:if test="${param.listLimit eq 5}">selected</c:if>>5</option>
								<option value="10" <c:if test="${param.listLimit eq 10}">selected</c:if>>10</option>
								<option value="20" <c:if test="${param.listLimit eq 20}">selected</c:if>>20</option>
								<option value="30" <c:if test="${param.listLimit eq 30}">selected</c:if>>30</option>
							</select>
							<span>entries</span>
						</div>
						
						<form action="AdminNotice">
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
						<table border="1">
							<tr>
								<th width="80px">글번호</th>
								<th width="80px">극장</th>
								<th width="300px">제목</th>
								<th width="120px">작성일</th>
								<th width="120px">수정 및 삭제</th>
							</tr>
							<%-- 페이지번호(pageNum 파라미터) 가져와서 저장(없을 경우 기본값 1로 설정) --%>
							<c:set var="pageNum" value="1" />
							<%-- pageNum 파라미터 존재할 경우(= 비어있지 않음) 판별 --%>
							<c:if test="${not empty param.pageNum}">
								<%-- pageNum 변수에 pageNum 파라미터값 저장 --%>
								<c:set var="pageNum" value="${param.pageNum}" />
							</c:if>
							
							<c:forEach var="notice" items="${noticeList}">
								<tr align="center">
									<td>${notice.notice_num}</td>
									<td>${notice.notice_theater_name}</td>
									<td>${notice.notice_subject}</td>
									<td>${notice.notice_date}</td>
									<td>
<!-- 										<input type="button" class="modifyBtn" value="수정" > -->
<!-- 										<input type="button" id="modifyBtn" value="수정" onclick="console.log('location.href')"> 뭐가 먼저 작동되는지 확인용 -->
										<button value="${notice.notice_num}" class="modifyBtn">수정</button>
										<input type="button" class="delete" value="삭제" onclick="confirmDelete('${notice.notice_num}')">
									</td>
								</tr>
							</c:forEach>
							
							<c:if test="${empty noticeList}">
								<tr>
									<td align="center" colspan="7">검색결과가 없습니다.</td>
								</tr>
							</c:if>
						</table>
					</div>
					
					<div id="pageList">
						<input type="button" value="이전" 
								onclick="location.href='AdminNotice?pageNum=${pageNum - 1}'">
						
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
									<a href="AdminNotice?pageNum=${i}">${i}</a> <%-- 다른 페이지 번호 --%>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<%-- [다음] 버튼 클릭 시 BoardList 서블릿 요청(파라미터 : 현재 페이지번호 + 1) --%>
						<%-- 현재 페이지 번호(pageNum)가 URL 파라미터로 전달되므로 ${param.pageNum} 활용 --%>
						<%-- 단, 현재 페이지 번호가 최대 페이지번호(maxPage)보다 작을 경우에만 동작(아니면, 버튼 비활성화 처리) --%>
						<%-- 두 가지 경우의 수에 따라 버튼을 달리 생성하지 않고, disabled 만 추가 여부 설정 --%>
						<%-- pageNum 파라미터값이 최대 페이지번호 이상일 때 disabled 속성 추가 --%>
						<input type="button" value="다음" 
								onclick="location.href='AdminNotice?pageNum=${pageNum + 1}'">
					</div>
				</article>
			</section>
		</div>
		
		<div class="modal"> <!-- 등록 -->
		    <div class="modal_popup">
		        <h3>공지사항 등록</h3>
		        <div class="content">
		        	<form action="AdminNoticeRegist" method="post" name="registForm">
				        <div>
				        	<span>극장</span> <br>
				        	<select class="category" name="notice_theater_name">
					        	<option value="">선택</option>
					        	<option value="신도림">신도림</option>
					        	<option value="청라">청라</option>
					        	<option value="동탄">동탄</option>
					        	<option value="남양주">남양주</option>
					        	<option value="다산">다산</option>
					        	<option value="천안불당">천안불당</option>
					        	<option value="경주보문">경주보문</option>
					        	<option value="구미봉곡">구미봉곡</option>
					        	<option value="대구이시아">대구이시아</option>
					        	<option value="칠곡호이">칠곡호이</option>
					        	<option value="보문">보문</option>
					        	<option value="영덕예주">영덕예주</option>
					        </select>
				        </div>
				        <div>
				        	<span>제목</span> <br>
				        	<input type="text" name="notice_subject">
				        </div>
				        
				        <div>
				        	<span>공지내용</span> <br>
				        	<textarea rows="10" cols="40" name="notice_content"></textarea>
				        </div>
				        
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
		        <h3>공지사항 수정</h3>
		        <div class="content">
		        	<form action="AdminNoticeModify" method="post" name="modifyForm">
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
			
			// -------------------------------------------------------------------------
			
			// 등록 팝업 띄우기
			registBtn.onclick = function(){
				modal[0].classList.add('on');
			}
			
			// -------------------------------------------------------------------------
			
			// 수정 팝업 띄우기
			for(let i = 0; i < modifyBtn.length ; i++) {
				modifyBtn[i].onclick = function(){
// 					console.log("modal")
					modal[1].classList.add('on');
				}
			}
			
			// 상세 내용 가져오는 AJAX - resources 에 js 있어야함 (script 태그에 주소 연결도 해야함)
			$(function() {
				$(modifyBtn).click(function() {
					$.ajax({
						url:"AdminNoticeModify",
	    				data:{
	    					"notice_num": $(this).val()
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




















