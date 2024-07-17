<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<%-- jquery 라이브러리 포함시키기 --%>
<script src="${pageContext.request.servletContext.contextPath}/resources/js/jquery-3.7.1.js"></script>
<%-- 다음 우편번호 API --%>
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
	document.theaterForm.theater_location_num.value = location;
}

</script>

</head>
<body>
<header>
		<%-- 기본 메뉴 표시 영역(inc/top.jsp) 페이지 삽입 --%>
		<%-- 현재 위치는 컨텍스트 루트(/test2 = webapp) 이며, inc 디렉토리의 top.jsp 지정 --%>
		<%-- 단, JSP 때와 달리 디렉토리 구조가 다르므로 주의! --%>
		<%-- JSP 파일의 루트는 webapp 이 맞지만, 하위 디렉토리로 WEB-INF/views 가 포함되어야함 --%>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<h1>영화관 등록 페이지</h1>                                                                            
	<form action="adminInsertTheater" method="post" name="theaterForm">
		<label for="theater_location">지역</label>
		<select id="theater_location" name="theater_location" onchange="selectedLocation(this.value)" >
			<option value="1000">서울/경기/인천</option>
			<option value="1001">충청</option>
			<option value="1002">경상</option>
		</select><br>
		${theater_location }
		<c:set var="theater_location" value="${theater_location}"/>
		<label for="theater_location_num">지역 번호</label>
		<input type="text" name="theater_location_num" readonly>
		<br>
		
		<label for="theater_num">극장 번호</label>
		<input type="text"  id="theater_num" name="theater_num" required><br>
		
		<label for="theater_name">극장명</label>
		<input type="text"  id="theater_name" name="theater_name" required><br>
		
		<label for="theater_content">극장 설명</label>
		<textarea id="theater_content" name="theater_content" required></textarea><br>
		
		극장 주소<br>
		<input type="text" placeholder="우편번호 입력" name="theater_post_code" id="theater_post_code"readonly>
		<input type="button" value="우편번호 찾기" id="btnSearchAddress"><br>
		<input type="text" placeholder="주소 입력" name="theater_address" id="theater_address"><br>
		<input type="text" placeholder="상세주소 입력" name="theater_address_detail" id="theater_address_detail"><br>
		
		
		<input type="submit" value="등록">
		<input type="reset" value="초기화">
		<input type="button" value="돌아가기" onclick="history.back()">
	
	</form>
	<footer>
		<%-- 회사 소개 영역(inc/bottom.jsp) 페이지 삽입 --%>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
	
</body>
</html>