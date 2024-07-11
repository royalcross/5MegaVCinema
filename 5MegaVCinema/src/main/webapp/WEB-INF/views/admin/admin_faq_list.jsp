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
			    width: 500px;
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
		
		<script type="text/javascript">
			
		
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
					<h3>자주묻는 질문 조회</h3>
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
						
						<form action="AdminStore">
							<div class="search">
								<span>Search</span>
								<input type="search" name="searchKeyword" value="${param.searchKeyword}" >
								<input type="submit" value="검색">
							</div>
						</form>
			
						<!-- 우측 상단 버튼 들어가는 자리 -->			
						<div>
							<button type="button" class="registBtn">등록</button>
							<button type="button" class="categoryBtn">카테고리 관리</button>
						</div>
					</div>
						
					<div class="content">
						<table border="1" >
							<tr>
								<th width="80px">번호</th>
								<th width="120px">카테고리</th>
								<th width="120px">제목</th>
								<th width="300px">작성일</th>
								<th width="120px">수정 및 삭제</th>
							</tr>
							
							<%-- 페이지번호(pageNum 파라미터) 가져와서 저장(없을 경우 기본값 1로 설정) --%>
							<c:set var="pageNum" value="1" />
							<%-- pageNum 파라미터 존재할 경우(= 비어있지 않음) 판별 --%>
							<c:if test="${not empty param.pageNum}">
								<%-- pageNum 변수에 pageNum 파라미터값 저장 --%>
								<c:set var="pageNum" value="${param.pageNum}" />
							</c:if>
							
							<c:forEach var="item" items="${itemList}">
								<tr>
									<td>${item.item_id}</td>
									<td>${item.item_type}</td>
									<td>${item.item_name}</td>
									<td>${item.item_content}</td>
									<td>${item.item_price}</td>
									<td>
<%-- 										<input type="button" class="modifyBtn" value="수정" onclick="location.href='AdminStoreModify?item_id=${item.item_id }'"> --%>
										<input type="button" class="modifyBtn" value="수정" onclick="console.log('location.href')"> <!-- 뭐가 먼저 작동되는지 확인용 -->
<%-- 										<button value="${item.item_id}" class="modifyBtn">수정</button> --%>
										<input type="button" class="delete" value="삭제" onclick="confirmDelete('${item.item_id}')">
									</td>
								</tr>
							</c:forEach>
							<c:if test="${empty itemList}">
								<tr>
									<td align="center" colspan="8">검색결과가 없습니다.</td>
								</tr>
							</c:if>
						</table>
					</div>
					
					<div id="pageList">
						<input type="button" value="이전" 
								onclick="location.href='AdminStore?pageNum=${pageNum - 1}'">
						
						<c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
							<c:choose>
								<c:when test="${i eq pageNum}">
									<b>${i}</b> <%-- 현재 페이지 번호 --%>
								</c:when>
								<c:otherwise>
									<a href="AdminStore?pageNum=${i}">${i}</a> <%-- 다른 페이지 번호 --%>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<input type="button" value="다음" 
								onclick="location.href='AdminStore?pageNum=${pageNum + 1}'">
					</div>
				</article>
			</section>
		</div>
		
		<div class="modal"> <!-- 등록 -->
		    <div class="modal_popup">
		        <h3>스토어 등록</h3>
		        <div class="content">
		        	<form action="AdminItemRegist" method="post" name="registForm">
				        <div>
					        <select class="category" name="item_type" onchange="selectCategory(this.value)">
					        	<option value="">선택</option>
					        	<option value="Ticket">티켓</option>
					        	<option value="Popcorn">팝콘</option>
					        	<option value="Drinks">음료</option>
					        	<option value="Goods">굿즈</option>
					        </select>
				        </div>
				        
				        <div>
				        	<span>상품 아이디</span> <br>
				        	<input type="text" name="item_id" id="item_id">
				        </div>
				        
				        <div>
				        	<span>상품명</span> <br>
				        	<input type="text" name="item_name">
				        </div>
				        
				        <div>
				        	<span>부연설명</span> <br>
				        	<textarea rows="1" cols="40" name="item_content" required></textarea>
				        </div>
				        
				        <div>
				        	<span>가격</span> <br>
				        	<input type="text" name="item_price">
				        </div>
				        
				        <div>
				        	<span>상품사진</span> <br>
				        	<input type="file" name="item_image">
				        </div>
				        
				        <div>
				        	<span>수량</span> <br>
				        	<input type="number" name="item_quantity">
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
		
		<div class="modal"> <!-- 카테고리 관리 -->
		    <div class="modal_popup">
		        <h3>카테고리 관리</h3>
		        <div class="content">
		        	<h4>카테고리 조회</h4>
		        	<form action="AdminItemCategoryManage" method="post" name="categoryManage">
				        <table border="1">
					        <tr>
					        	<th>카테고리 명</th>
					        	<th>삭제</th>
					        </tr>
					        
					        <!-- AJAX 로 수정 -->
					        <c:forEach var="item" items="${itemList}">
						        <tr>
						        	<td>${item.item_type}</td>
						        	<td>
						        		<input type="button" value="삭제" id="delete" onclick="confirmDelete(${review.review_num})">
						        	</td>
						        </tr>
						    </c:forEach>
				        </table>
				        
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
		        <h3>스토어 수정</h3>
		        <div class="content">
		        	<form action="AdminStore" method="post" name="modifyForm">
					        <div>
						        <select class="category">
						        	<option>티켓</option>
						        	<option>팝콘</option>
						        	<option>음료</option>
						        	<option>굿즈</option>
						        </select>
					        </div>
					        
					        <div>
					        	<span>상품명</span> <br>
					        	<input type="text" value="${selectedItem.item_name}">
					        </div>
					        
					        <div>
					        	<span>부연설명</span> <br>
					        	<textarea rows="1" cols="40" name="motivation" required>${selectedItem.item_content}</textarea>
					        </div>
					        
					        <div>
					        	<span>가격</span> <br>
					        	<input type="text" value="${selectedItem.item_price}">
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
		
		<script>
			let modal = document.querySelectorAll('.modal');
			let registBtn = document.querySelector('.registBtn');
			let modifyBtn = document.querySelector('.modifyBtn');
			let closeBtn = document.querySelectorAll('.close_btn');
			let categoryBtn = document.querySelector('.categoryBtn');
			
			// 아이템 삭제
			function confirmDelete(itemId){
				if(confirm("삭제하시겠습니까?")) {
					location.href="AdminStoreDelete?item_id=" + itemId;
				}
			}

			// -------------------------------------------------------------------------
			
			// 아이템 등록 - 팝업 오픈
			registBtn.onclick = function(){
				modal[0].classList.add('on');
			}
			
			// 아이템 등록 (카테고리 선택 -> 상품 아이디에 값 들어감)
			
			function selectCategory(category) {
				
		 		if(category == "Ticket"){ //equals 가 안 먹어서 일단 .. == .. / 왜 안먹노 ? 오타났나 ?
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
			// 카테고리 관리
			categoryBtn.onclick = function(){
				modal[1].classList.add('on');
			}
			
			// -------------------------------------------------------------------------
			
			// 아이템 수정
			modifyBtn.onclick = function(){
				// Ajex 듣고 작업하기 (0708 - 해원)
				// -> location 이 먼저 작동해야하는데 modal 이 먼저 작동해서 값을 가져올 수가 없음 ㅇㅇ
				// 수업 들으면 할 수 있을거야 ....
				
				console.log("modal")
				modal[2].classList.add('on');
			}
			
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




















