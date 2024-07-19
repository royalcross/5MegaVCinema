<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<label for="theater_location">지역</label>
		<select id="theater_location" name="theater_location" onchange="selectedLocation(this.value)"  disabled>
		<option value="">지역을 선택해주세요</option>
		<option value="1000"<c:if test="${selectedTheater.theater_location eq '서울/경기/인천'}">selected</c:if>>서울/경기/인천</option>
		<option value="1001" <c:if test="${selectedTheater.theater_location eq '충청'}">selected</c:if>>충청</option>
		<option value="1002" <c:if test="${selectedTheater.theater_location eq '경상'}">selected</c:if>>경상</option>
		</select>
<%-- 								${theater_location } --%>
<%-- 								<c:set var="theater_location" value="${theater_location}"/> --%>
		<label for="theater_location_num">지역 번호</label>
		<input type="text"  id="theater_location_num" name="theater_location_num" placeholder="지역 선택 시 자동 입력됨"
		value="${selectedTheater.theater_location_num}">
		<br>
<!-- 	<input type="text" name="theater_location_num" id="theater_location_num" disabled placeholder="지역 선택 시 자동 입력됨">  -->
<!-- 		<br> -->
								
<!-- 		<input type="button" id="btnTheaterNum" value="▶▶ new 영화관 번호 입력 ▶▶">  -->
		<label for="theater_num">영화관 번호(자동증가로 수정 불가)</label>
		<input type="text" name="theater_num" id="theater_num" placeholder="버튼 클릭 시 자동 입력됨" value="${selectedTheater.theater_num}" > <br>
		<br>
		<label for="theater_name">영화관 이름</label>
		<input type="text"  id="theater_name" name="theater_name" required value="${selectedTheater.theater_name}"><br>
							
		<label for="theater_content">영화관 설명</label>
		<textarea rows="5" cols="50" id="theater_content" name="theater_content" required>${selectedTheater.theater_content}</textarea><br><br>
								
		영화관 주소<br>
		<input type="text" placeholder="우편번호 입력" name="theater_post_code" id="theater_post_code" value="${selectedTheater.theater_post_code}">
		<input type="button" value="우편번호 찾기" id="btnSearchAddress"><br>
		<input type="text" size="40" placeholder="주소 입력" name="theater_address" id="theater_address" value="${selectedTheater.theater_address}">
		<input type="text" placeholder="상세주소 입력" name="theater_address_detail" id="theater_address_detail" value="${selectedTheater.theater_address_detail}"><br>
					
					
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
			
			</script>