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
		</style>
		<script>
			function confirmAdmin(id, isadmin, isAuthorize){
				let msg = "";
				
				if(isAuthorize == 'Y') {
					msg = "부여";
				} else {
					msg = "해제";
				}
				
				if(confirm("관리자 권한을 " + msg + "하시겠습니까?")){
					location.href="ChangeAdminAuthorize?member_id=" + id + "&member_isAdmin=" + isadmin + "&isAuthorize=" + isAuthorize;
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
					<h3>회원목록</h3>
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
						
						<form action="AdminMemberList">
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
						<table border="1">
							<tr>
								<th>회원번호</th>
								<th>회원아이디</th>
								<th>이름</th>
								<th>가입일</th>
								<th>회원상태</th>
								<th>관리자여부</th>
								<th>관리자 권한관리</th>
							</tr>
							<%-- 페이지번호(pageNum 파라미터) 가져와서 저장(없을 경우 기본값 1로 설정) --%>
							<c:set var="pageNum" value="1" />
							<%-- pageNum 파라미터 존재할 경우(= 비어있지 않음) 판별 --%>
							<c:if test="${not empty param.pageNum}">
								<%-- pageNum 변수에 pageNum 파라미터값 저장 --%>
								<c:set var="pageNum" value="${param.pageNum}" />
							</c:if>
							
							<c:forEach var="member" items="${memberList}">
								<tr align="center">
									<td>${member.member_num}</td>
									<td>${member.member_id}</td>
									<td>${member.member_name}</td>
									<td>${member.member_join_date}</td>
									<td>${member.member_status}</td>
									<td>${member.member_isAdmin}</td>
									<td>
										<c:choose>
											<c:when test="${member.member_isAdmin eq 0}">
<%-- 												<input type="button" value="관리자 권한 부여" onclick="confirmYAdmin('${member.member_id}',${member.member_isAdmin})"> --%>
												<input type="button" value="관리자 권한 부여" onclick="confirmAdmin('${member.member_id}',${member.member_isAdmin}, 'Y')"
													<c:if test="${member.member_status eq '탈퇴'}"> disabled</c:if>>
											</c:when>
											<c:otherwise>
<%-- 												<input type="button" value="관리자 권한 해제" onclick="confirmNAdmin('${member.member_id}',${member.member_isAdmin})"> --%>
												<input type="button" value="관리자 권한 해제" id="yAdmin" onclick="confirmAdmin('${member.member_id}',${member.member_isAdmin}, 'N')">
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
							<c:if test="${empty memberList}">
								<tr>
									<td align="center" colspan="7">검색결과가 없습니다.</td>
								</tr>
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




















