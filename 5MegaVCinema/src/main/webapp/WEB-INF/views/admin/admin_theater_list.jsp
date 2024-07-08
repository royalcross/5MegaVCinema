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
		
/* 			/* 탭 메뉴 */ */
			
/* 			.tab{ */
/* 				width: 720px; */
/* 				margin: 0 auto; */
/* 				text-align: center; */
/* 			} */
/* 			.tab > ul { */
/* 				display: flex; */
/* 				justify-content: space-between; */
/* 			} */
/* 			.tab > ul > li { */
/* 				width:50%; */
/* 				background-color: #eee; */
/* 			} */
/* 			.tab > ul > li a { */
/* 				display: block; */
/* 				width: 100%; */
/* 			} */
			
/* 			.tab > ul > li.on { */
/* 				background-color: #ccc; */
/* 				color: rgb(211, 84, 0); */
/* 				font-weight: bold; */
/* 			} */
			
		
		
		
		
		
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
		
// 			function confirmAdmin(id, isadmin, isAuthorize){
// 				let msg = "";
				
// 				if(isAuthorize == 'Y') {
// 					msg = "부여";
// 				} else {
// 					msg = "해제";
// 				}
				
// 				if(confirm("관리자 권한을 " + msg + "하시겠습니까?")){
// 					location.href="ChangeAdminAuthorize?member_id=" + id + "&member_isAdmin=" + isadmin + "&isAuthorize=" + isAuthorize;
// 				}
// 			}
			
			function insertPlay() {
				window.open('adminInsertPlay', 'target="self"', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
			}
			function detailMovie(movie_code) {
				window.open('adminMovieDetail?movie_code=' + movie_code, 'target="self"', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
			}
			
			
			
// 			let tabMenu = document.querySelectorAll('.tabMenu');
// 			let loginCon = document.querySelectorAll('.login');
			
// 			for(let i = 0; i < tabMenu.length; i++){
// 		        tabMenu[i].onclick = function () {
// 		            tabMenu[0].classList.remove('on');
// 		            tabMenu[1].classList.remove('on');
// 		            tabMenu[2].classList.remove('on');
// 		            tabMenu[3].classList.remove('on');
		                  
// 		            tabMenu[i].classList.add('on');
		
// 		            loginCon[0].classList.remove('on');
// 		            loginCon[1].classList.remove('on');
// 		            loginCon[2].classList.remove('on');
// 		            loginCon[3].classList.remove('on');
		
// 		            loginCon[i].classList.add('on');
// 		        }
// 	    	}
			
			
			
			
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
	
	
<style>
  .tab_menu{position:relative;}
  .tab_menu .list{overflow:hidden;}
  .tab_menu .list li{float:left; margin-right:14px;}
  .tab_menu .list li.is_on .btn{font-weight:bold; color:green;}
  .tab_menu .list .btn{font-size:13px;}
  .tab_menu .cont_area{margin-top:10px;}
  .tab_menu .cont_area .cont{display:none; background:#555; color:#fff; text-align:center; width:250px; height:100px; line-height:100px;}
</style>

<div class="tab_menu">
  <ul class="list">
    <li class="is_on">
      <a href="#tab1" class="btn" name="1000">서울/경기/인천</a>
    </li>
    <li>
      <a href="#tab2" class="btn" name="1001">충청</a>
    </li>
    <li>
      <a href="#tab3" class="btn" name="1002">경상</a>
    </li>
    <li>
      <a href="#tab4" class="btn">작은 영화관</a>
    </li>
  </ul>
  
  <div class="cont_area">
    <div id="tab1" class="cont">
      Tab Content1
    </div>
    <div id="tab2" class="cont">
      Tab Content2
    </div>
    <div id="tab3" class="cont">
      Tab Content3
    </div>
    <div id="tab4" class="cont">
      Tab Content3
    </div>
  </div>
</div>

<script>
  const tabList = document.querySelectorAll('.tab_menu .list li');
  const contents = document.querySelectorAll('.tab_menu .cont_area .cont')
  let activeCont = ''; // 현재 활성화 된 컨텐츠 (기본:#tab1 활성화)

  for(var i = 0; i < tabList.length; i++){
    tabList[i].querySelector('.btn').addEventListener('click', function(e){
      e.preventDefault();
      for(var j = 0; j < tabList.length; j++){
        // 나머지 버튼 클래스 제거
        tabList[j].classList.remove('is_on');

        // 나머지 컨텐츠 display:none 처리
        contents[j].style.display = 'none';
      }

      // 버튼 관련 이벤트
      this.parentNode.classList.add('is_on');

      // 버튼 클릭시 컨텐츠 전환
      activeCont = this.getAttribute('href');
      document.querySelector(activeCont).style.display = 'block';
    });
  }
</script>
	
	
	
	
	
	
	
	
	
	
	
	
								<!-- 영화 등록버튼 -->
	<section id="buttonArea" >
		<input type="button" value="등록" onclick="insertPlay()">
						
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
			<tr>
			<td>${theater.theater_num}</td>
			<td>${theater.theater_name}</td>
			<td>${theater.theater_content}</td>
			<td>${theater.theater_address}</td>
			<td>
			<input type="button" value="상세보기">
			<input type="button" value="상영종료">
			
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
	</body>
</html>
	
	
	
	
	
	
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
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
<footer>
			<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
		</footer>
	</body>
</html>
