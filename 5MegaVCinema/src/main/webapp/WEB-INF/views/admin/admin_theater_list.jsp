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
		<script>
			// 게시글 수 
			function showListLimit(limit){
				location.href="AdminTheater?listLimit=" + limit;
			}
		</script>
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
					<h3>영화관 조회 페이지</h3>
					
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
							<select onchange="showListLimit(this.value)">
								<option value="5" <c:if test="${param.listLimit eq 5}">selected</c:if>>5</option>
								<option value="10" <c:if test="${param.listLimit eq 10}">selected</c:if>>10</option>
								<option value="20" <c:if test="${param.listLimit eq 20}">selected</c:if>>20</option>
								<option value="30" <c:if test="${param.listLimit eq 30}">selected</c:if>>30</option>
							</select>
							<span>entries</span>
						</div>
						
						<form action="AdmintTheater">
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
								<th>영화관 번호</th>
								<th>영화관 이름</th>
								<th>영화관 설명</th>
								<th>영화관 주소</th>
								<th>영화관 및 삭제</th>
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
									<button value="${theater.theater_num}" class="modifyBtn">수정</button>
									<input type="button" class="delete" value="삭제" onclick="confirmDelete('${theater.theater_num}')">
								
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
								onclick="location.href='AdminTheater?pageNum=${pageNum - 1}'">
						
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
									<a href="AdminTheaterpageNum=${i}">${i}</a> <%-- 다른 페이지 번호 --%>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<%-- [다음] 버튼 클릭 시 BoardList 서블릿 요청(파라미터 : 현재 페이지번호 + 1) --%>
						<%-- 현재 페이지 번호(pageNum)가 URL 파라미터로 전달되므로 ${param.pageNum} 활용 --%>
						<%-- 단, 현재 페이지 번호가 최대 페이지번호(maxPage)보다 작을 경우에만 동작(아니면, 버튼 비활성화 처리) --%>
						<%-- 두 가지 경우의 수에 따라 버튼을 달리 생성하지 않고, disabled 만 추가 여부 설정 --%>
						<%-- pageNum 파라미터값이 최대 페이지번호 이상일 때 disabled 속성 추가 --%>
						<input type="button" value="다음" 
								onclick="location.href='AdminTheater?pageNum=${pageNum + 1}'">
					</div>
				</article>
			</section>
		</div>
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
	
		
			<div class="modal"> <!-- 등록 -->
			    <div class="modal_popup">	
			        <h3>영화관 등록</h3>
			        <div class="content">	
						<form action="AdminTheaterRegist" method="post" name="registForm">
								<label for="theater_location">지역</label>
								<select id="theater_location" name="theater_location" onchange="selectedLocation(this.value)" >
									<option>지역을 선택해주세요</option>
									<option value="1000">서울/경기/인천</option>
									<option value="1001">충청</option>
									<option value="1002">경상</option>
								</select>
<%-- 								${theater_location } --%>
<%-- 								<c:set var="theater_location" value="${theater_location}"/> --%>
								<label for="theater_location_num">지역 번호</label>
								<input type="text"  id="theater_location_num" name="theater_location_num" readonly placeholder="지역 선택 시 자동 입력됨"><br>
<!-- 								<input type="text" name="theater_location_num" id="theater_location_num" disabled placeholder="지역 선택 시 자동 입력됨"> -->
								<br>
								
								<input type="button" id="btnTheaterNum" value="▶▶ new 영화관 번호 입력 ▶▶"> 
								<label for="theater_num">영화관 번호</label>
								<input type="text" name="theater_num" id="theater_num" readonly placeholder="버튼 클릭 시 자동 입력됨"> <br>
								<br>
								<label for="theater_name">영화관 이름</label>
								<input type="text"  id="theater_name" name="theater_name" required><br>
								
								<label for="theater_content">영화관 설명</label>
								<textarea rows="5" cols="50" id="theater_content" name="theater_content" required></textarea><br><br>
								
								영화관 주소<br>
								<input type="text" placeholder="우편번호 입력" name="theater_post_code" id="theater_post_code"readonly>
								<input type="button" value="우편번호 찾기" id="btnSearchAddress"><br>
								<input type="text" size="40" placeholder="주소 입력" name="theater_address" id="theater_address">
								<input type="text" placeholder="상세주소 입력" name="theater_address_detail" id="theater_address_detail"><br>
								
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
		        <h3>영화관 수정</h3>
		        <div class="content">
		        	<form action="AdminTheaterModify" method="post" name="modifyForm">
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
			$(function() {
				$("#btnTheaterNum").on("click", function() {
					$.ajax({
						type : "GET",
						url : "getNewTheaterNum",
// 						data : {play_movie_name_kr : $("#play_movie_name_kr").val()},
						success : function(response) {
								
							$("#theater_num").val(response);
			// 				$("#resultArea").html(response);
						},
						error : function(jqXHR, textStatus, errorThrown) { // 요청 처리 실패(= 응답 에러 발생) 시 자동으로 호출되는 콜백함수
							
							$("#resultArea").html("요청 에러 발생! - " + jqXHR + ", " + textStatus + ", " + errorThrown);
						}
					});
				})
			});
		
		
		
		
			let modal = document.querySelectorAll('.modal');
			let registBtn = document.querySelector('#registBtn');
			let modifyBtn = document.querySelectorAll('.modifyBtn'); // 반복문으로 버튼이 여러 개 뜨니까 버튼도 여러개임을 인지하고, 팝업 뜨는 것도 반복문 작성필요
			let closeBtn = document.querySelectorAll('.close_btn');
			
			// 아이템 삭제
			function confirmDelete(theater_num){
				if(confirm("삭제하시겠습니까?")) {
					location.href="AdminTheaterDelete?theater_num=" + theater_num;
				}
			}

			// -------------------------------------------------------------------------
			
			// 아이템 등록 - 팝업 오픈
			registBtn.onclick = function(){
				modal[0].classList.add('on');
			}
			
			// 아이템 등록 (카테고리 선택 -> 상품 아이디에 값 들어감)
			
// 			function selectedLocation(location) {
				
// 		 		if(theater_location == "서울/경기/인천"){ 
// 		 			document.registForm.theater_location_num.value = location;
// 		 		}
		 		
// 		 		if(theater_location == "충청"){
// 		 			document.registForm.theater_location_num.value = location;
// 		 		}
		 		
// 		 		if(theater_location == "경상"){
// 		 			document.registForm.theater_location_num.value = location;
// 		 		}
		 		
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
					$.ajax({
						url:"AdminTheaterModify",
	    				data:{
	    					"theater_num": $(this).val()
// 	    					"theater_location_num": $(this).val()
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
					<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script type="text/javascript">
			//주소 검색 API 활용 기능 추가
			// "t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js" 스크립트 파일 로딩 필수!
			$(function() {
				$("#btnSearchAddress").click(function() {
					new daum.Postcode({
						// 주소검색 창에서 주소 검색 후 검색된 주소를 클릭 시
						// oncomplete 속성 뒤의 익명함수가 실행(호출)됨
						// => 어떤 함수를 실행한 후 해당 함수가 나의 함수를 호출하는 경우
						//    호출되는 나의 함수를 콜백 함수(callback function)라고 함
				        oncomplete: function(data) { 
				            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				            // => 검색 결과는 모두 익명함수 파라미터 data 에 저장되어 있으므로
				            //    data.xxx 형식으로 검색 결과에 접근 가능함
							// 1) 우편번호(zonecode) 가져와서 우편번호 항목(postCode)에 출력              
				            $("#theater_post_code").val(data.zonecode);
					
							// 2) 기본주소(address) 또는 도로명주소(roadAddress) 가져와서 
							//    기본주소 항목(address1)에 출력
			//					$("#address1").val(data.address);
							let address = data.address;
				            
				            // 3) 만약, 건물명(buildingName)이 존재할 경우(= 널스트링이 아님)
				            //    기본 주소 뒤에 건물명 결합
				            if(data.buildingName !== ''){
				               address += "(" + data.buildingName + ")";
				            }
				            
				            // 4) 기본주소(+ 건물명)를 기본주소 항목(address1)에 출력
				            $("#theater_address").val(address);
				            
				            // 5) 상세주소 항목(address2)에 포커스 요청
				            $("#theater_address_detail").focus();
				        }
				    }).open();
				});
			});
			
			
			function selectedLocation(location) {
				document.registForm.theater_location_num.value = location;
				console.log(document.registForm.theater_location_num.value);
			}
			
			
// 			   function selectedLocation(locationValue) {
// 			        // locationValue에 따라 theater_location_num 값을 설정
// 			        var locationNum = ''; // 위치에 따라 적절한 값을 설정
// 			        document.getElementById('theater_location_num').value = locationNum;
// 			    }
			</script>
		<footer>
			<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
		</footer>
	</body>
	
</html>
