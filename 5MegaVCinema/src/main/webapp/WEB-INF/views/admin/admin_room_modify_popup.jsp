<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <div> -->
<!-- 	<span>카테고리</span> <br> -->
<!-- 	<select class="category" disabled> -->
<%-- 		<option <c:if test="${selectedItem.item_type eq 'Ticket'}">selected</c:if>>티켓</option> --%>
<%-- 		<option <c:if test="${selectedItem.item_type eq 'Popcorn'}">selected</c:if>>팝콘</option> --%>
<%-- 		<option <c:if test="${selectedItem.item_type eq 'Drinks'}">selected</c:if>>음료</option> --%>
<%-- 		<option <c:if test="${selectedItem.item_type eq 'Goods'}">selected</c:if>>굿즈</option> --%>
<!-- 	</select> -->
<!-- </div> -->

<!-- item_id 는 hidden (수정은 불가능하게 할건데 where 절에 써야해서 파라미터 전달해야함 -->
<%-- <input type="hidden" name="item_id" value="${selectedItem.item_id}" >  --%>

<!-- <div> -->
<!-- 	<span>상품명</span> <br> -->
<%-- 	<input type="text" name="item_name" value="${selectedItem.item_name}"> --%>
<!-- </div> -->
	
<!-- <div> -->
<!-- 	<span>부연설명</span> <br> -->
<%-- 	<textarea rows="1" cols="40" name="item_content" required>${selectedItem.item_content}</textarea> --%>
<!-- </div> -->

<!-- <div> -->
<!-- 	<span>가격</span> <br> -->
<%-- 	<input type="text" name="item_price" value="${selectedItem.item_price}"> --%>
<!-- </div> -->


		<div class="modal"> <!-- 등록 -->
		    <div class="modal_popup">
		        <h3>상영관 수정</h3>
				        <div>
				        <span>지역</span>
					        <select class="category" id="theater_location"name="theater_location" disabled>
					        <option value="${selectedRoom.theater_location}" selected="selected"></option>
					        </select>
				        </div>
				        <div>
				        <span>극장명</span>
					        <select class="category" id="theater_name"name="theater_name"  onchange="selectTheaterNum(this.value)">
					        <option value="${selectedRoom.theater_name}" selected="selected">극장명을 선택하세요.</option>
					        </select>
				        </div>
		
	<script>

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
			  var subjectSel = document.getElementById("location");
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
	}
	
			</script>
				        
				        
				        <div>
				           	<span>극장번호</span> <br>
				        	<input type="text" name="room_theater_num" id="room_theater_num" value="${selectedRoom.room_theater_num}">
				        </div>
				        
				        <div>
				        	<span>상영관명</span> <br>
				        	<input type="number" name="room_num" value="${selectedRoom.room_num}">
				        </div>
				        
				        <div>
				        	<span>좌석수</span> <br>
				        	<input type="text" name="room_seats" value="${selectedRoom.room_seats}">
				        </div>
				        
				        
				        
				        
				        
				        