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
	</head>
	<body>
		<header>
			<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
		</header>
		<div class="inner">
			<section class="wrapper">
				<jsp:include page="/WEB-INF/views/inc/admin_side_nav.jsp"></jsp:include>
				<article class="main">
					<h3>상영관 조회 페이지</h3>
					
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
						
						<form action="AdminRoom">
							<div class="search">
								<span>Search</span>
								<input type="search" name="searchKeyword" value="${param.searchKeyword}" >
								<input type="submit" value="검색">
							</div>
						</form>
			
	<!-- 우측 상단 버튼 들어가는 자리 -->			
						<div>
							<button type="button" id="registBtn">등록</button>
<!-- 							<button type="button" id="categoryBtn">카테고리 관리</button> -->
						</div>
					</div>
						
					<div class="content">
						<table border="1" >
							<tr>
<!-- 								<th>지역</th> -->
								<th>극장명</th>
								<th>극장번호</th>
								<th>상영관명</th>
								<th>좌석수</th>
								<th>수정 및 삭제</th>
							</tr>
							
			
			<%-- 페이지번호(pageNum 파라미터) 가져와서 저장(없을 경우 기본값 1로 설정) --%>
			<c:set var="pageNum" value="1"/>
			
			<%-- pageNum 파라미터 존재할 경우(비어있지 않음) 판별 --%>
			<c:if test="${not empty param.pageNum}">
				<c:set var="pageNum" value="${param.pageNum}"/>
			</c:if>
			
			<%-- JSTL과 EL 활용하여 글목록 표시 작업 반복(boardList 객체 활용) --%>
			<c:forEach var="room" items="${roomList}">
				<tr class="theater_location_num_${room.room_theater_num}">
<%-- 					<td>${room.theater_location}</td> --%>
					<td>${room.theater_name}</td>
					<td class="room_theater_num_${room.room_theater_num}_${room.room_num}">${room.room_theater_num}</td>
					<td>${room.room_num}</td>
					<td>${room.room_seats}</td>
					<td>
						<button value="${room.room_theater_num}_${room.room_num}" class="modifyBtn">수정</button>
						<input type="button" value="삭제" onclick="confirmDelete('${room.room_num}', '${room.room_theater_num}')">
					</td>
				</tr>
			</c:forEach>
			<%--게시물 목록이 하나도 없을 경우 메세지 표시 --%>
			<c:if test="${empty roomList}">
				<tr>
									<td align="center" colspan="8">검색결과가 없습니다.</td>
								</tr>
			</c:if>
</table>
</div>
					
						<div id="pageList">
						<input type="button" value="이전" 
								onclick="location.href='AdminRoom?pageNum=${pageNum - 1}'">
						
						<c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
							<c:choose>
								<c:when test="${i eq pageNum}">
									<b>${i}</b> <%-- 현재 페이지 번호 --%>
								</c:when>
								<c:otherwise>
									<a href="AdminRoom?pageNum=${i}">${i}</a> <%-- 다른 페이지 번호 --%>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<input type="button" value="다음" 
								onclick="location.href='AdminRoom?pageNum=${pageNum + 1}'">
					</div>
				</article>
			</section>
		</div>
		
		<!--  ----------- 등록 페이지 ----------->	
			
		<div class="modal"> <!-- 등록 -->
		    <div class="modal_popup">
		        <h3>상영관 등록</h3>
		        <div class="content">
		        	<form action="AdminRoomRegist" method="post" name="registForm">
				        <div>
				        <span>지역</span>
					        <select class="category" id="theater_location"name="theater_location" >
					        <option value="" selected="selected">지역을 선택하세요.</option>
					        </select>
				        </div>
				        <div>
				        <span>극장명</span>
					        <select class="category" id="theater_name"name="theater_name"  onchange="selectTheaterNum(this.value)">
					        <option value="" selected="selected">극장명을 선택하세요.</option>
					        </select>
				        </div>
		
				        
				        <div>
				           	<span>극장번호</span> <br>
				        	<input type="text" name="room_theater_num" id="room_theater_num">
				        </div>
				        
				        <div>
				        	<span>상영관명</span> <br>
				        	<input type="number" name="room_num">
				        </div>
				        
				        <div>
				        	<span>좌석수</span> <br>
				        	<input type="text" name="room_seats">
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
		
		
	<!--  ----------- 수정 페이지 ----------->	
	
		
		<div class="modal"> <!-- 수정 -->
		    <div class="modal_popup">
		        <h3>상영관 수정</h3>
		        <div class="content">
		        	<form action="AdminRoomModify" method="post" name="modifyForm">
		        		<div id="resultArea"></div>  <!-- 수정 팝업 내용 들어갈 자리 -->
						<div class="btnArea" style="text-align : center">
				        	<input type="submit" class="regist_btn" value="등록">
				        	<input type="button" class="close_btn" value="취소">
				        </div>
			        </form>
				</div>
		    </div>
		</div>
		
</body>
		<script>
			let modal = document.querySelectorAll('.modal');
			let registBtn = document.querySelector('#registBtn');
			let modifyBtn = document.querySelectorAll('.modifyBtn'); // 반복문으로 버튼이 여러 개 뜨니까 버튼도 여러개임을 인지하고, 팝업 뜨는 것도 반복문 작성필요
			let closeBtn = document.querySelectorAll('.close_btn');
			let categoryBtn = document.querySelector('#categoryBtn');
			
			// 아이템 삭제
			function confirmDelete(room_num, room_theater_num){
				if(confirm("삭제하시겠습니까?")) {
					location.href="AdminRoomDelete?room_num=" + room_num + "&room_theater_num=" + room_theater_num;
				}
			}

			// -------------------------------------------------------------------------
			
			// 아이템 등록 - 팝업 오픈
			registBtn.onclick = function(){
				modal[0].classList.add('on');
			}
			
			
			// -------------------------------------------------------------------------
			// 카테고리 관리
// 			categoryBtn.onclick = function(){
// 				modal[1].classList.add('on');
// 			}
			
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
					
					console.log("(this).val() : " + $(this).val());
					console.log(".room_theater_num_ + $(this).val().text() : " + $(".room_theater_num_" + $(this).val()).text());
					console.log(".room_theater_num_ + $(this).val().text() : " + $(".room_theater_num_" + $(this).val()).text());
					$.ajax({
						url:"AdminRoomModify",
	    				data:{
	    					"room_num": $(this).val().split("_")[1], 
	    					"room_theater_num" : $(".room_theater_num_" + $(this).val()).text()
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
	

	var subjectObject = {
			  "서울/경기/인천": {
			    "신도림": ["Links", "Images", "Tables", "Lists"],
			    "청라": ["Borders", "Margins", "Backgrounds", "Float"],
			    "동탄": ["Variables", "Operators", "Functions", "Conditions"],
			    "남양주다산": ["Variables", "Operators", "Functions", "Conditions"] 
			  },
			  "충청": {
			    "천안불당": ["Variables", "Strings", "Arrays"],
			    "보은": ["SELECT", "UPDATE", "DELETE"]
			  },
			    "경상": {
			    "경주보문": ["Links", "Images", "Tables", "Lists"],
			    "구미봉곡": ["Borders", "Margins", "Backgrounds", "Float"],
			    "대구이시아": ["Variables", "Operators", "Functions", "Conditions"],
			    "칠곡호이": ["Variables", "Operators", "Functions", "Conditions"],
			    "영덕예주": ["Variables", "Operators", "Functions", "Conditions"]
			  }
			}
			window.onload = function() {
			  var subjectSel = document.getElementById("theater_location");
			  var topicSel = document.getElementById("theater_name");
			  for (var x in subjectObject) {
			    subjectSel.options[subjectSel.options.length] = new Option(x, x);
			  }
			  subjectSel.onchange = function() {
			    //empty Chapters- and Topics- dropdowns
			    topicSel.length = 1;
			    //display correct values
			    for (var y in subjectObject[this.value]) {
			      topicSel.options[topicSel.options.length] = new Option(y, y);
			    }
			  }
			}
	
	
	// 아이템 등록 (카테고리 선택 -> 상품 아이디에 값 들어감)
	
	function selectTheaterNum(theater) {
		
 		if(theater == "신도림"){ 
 			document.registForm.room_theater_num.value = 1001;
 		} else if(theater == "청라") {
 			document.registForm.room_theater_num.value = 1002;
 		} else if(theater == "동탄") {
 			document.registForm.room_theater_num.value = 1003;
 		} else if(theater == "남양주다산") {
 			document.registForm.room_theater_num.value = 1004;
 		} else if(theater == "천안불당") {
 			document.registForm.room_theater_num.value = 1005;
 		} else if(theater == "경주보문") {
 			document.registForm.room_theater_num.value = 1006;
 		} else if(theater == "구미봉곡") {
 			document.registForm.room_theater_num.value = 1007;
 		} else if(theater == "대구이시아") {
 			document.registForm.room_theater_num.value = 1008;
 		} else if(theater == "보은") {
 			document.registForm.room_theater_num.value = 1009;
 		} else if(theater == "칠곡호이") {
 			document.registForm.room_theater_num.value = 1010;
 		} else if(theater == "영덕예주") {
 			document.registForm.room_theater_num.value = 1011;
 		}
 		console.log(document.registForm.room_theater_num.value);
	}
	
	</script>
	
			<footer>
			<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
		</footer>
	</body>
</html>
