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
		
		<!--  ----------- 등록 페이지 ----------->	
			
		<div class="modal"> <!-- 등록 -->
		    <div class="modal_popup">
		        <h3>상영관 등록</h3>
		        <div class="content">
		        	<form action="AdminRoomRegist" method="post" name="registForm">
				        <div>
				        <span>지역</span>
					        <select class="category" id="first-select"name="theater_num" >
					        	<option value="1000">서울/경기/인천</option>
					        	<option value="1001">충청</option>
					        	<option value="1002">경상</option>
					        </select>
				        </div>
				        
				        
				        		
		<select name="location" id="location">
			<option value="" selected="selected"></option>
		</select>
		<select name="theater" id="theater">
			<option value="" selected="selected"></option>
		</select>
			Subjects: <select name="subject" id="subject">
    <option value="" selected="selected">Select subject</option>
  </select>
  <br><br>
Topics: <select name="topic" id="topic">
    <option value="" selected="selected">Please select subject first</option>
  </select>
  <br><br>	
		
		
	<script>

	let locationObject = {
			"서울/경기/인천" : {"신도림", "청라", "동탄", "남양주다산"},
			"충청" : {"천안불당", "보은"},
			"경상" : {"경주보문", "구미봉곡", "대구이시아", "칠곡호이", "영덕예주"}
			
	}
	
	window.onload = function() {
		let locationSel = document.getElementById("location");
		let theaterSel = document.getElementById("theater");
		for(let x in locationObject) {
			locationSel.options[locationSel.options.length] = new Option(x, x);
		}
		
		locationSel.onchange = function() {
			theaterSel.length = 1;
			for(let y in locationObject[this.value]) {
				theaterSel.options[theaterSel.options.length] = new Option(y,y);
			}
		}
		
		
		
	}
	
	
	
	//--------------------------------
	
	var subjectObject = {
  "Front-end": {
    "HTML": ["Links", "Images", "Tables", "Lists"],
    "CSS": ["Borders", "Margins", "Backgrounds", "Float"],
    "JavaScript": ["Variables", "Operators", "Functions", "Conditions"]    
  },
  "Back-end": {
    "PHP": ["Variables", "Strings", "Arrays"],
    "SQL": ["SELECT", "UPDATE", "DELETE"]
  }
}
window.onload = function() {
  var subjectSel = document.getElementById("subject");
  var topicSel = document.getElementById("topic");
  var chapterSel = document.getElementById("chapter");
  for (var x in subjectObject) {
    subjectSel.options[subjectSel.options.length] = new Option(x, x);
  }
  subjectSel.onchange = function() {
    //empty Chapters- and Topics- dropdowns
    chapterSel.length = 1;
    topicSel.length = 1;
    //display correct values
    for (var y in subjectObject[this.value]) {
      topicSel.options[topicSel.options.length] = new Option(y, y);
    }
  }
  topicSel.onchange = function() {
    //empty Chapters dropdown
    chapterSel.length = 1;
    //display correct values
    var z = subjectObject[subjectSel.value][this.value];
    for (var i = 0; i < z.length; i++) {
      chapterSel.options[chapterSel.options.length] = new Option(z[i], z[i]);
    }
  }
}
	
	</script>
				        
				        <div>
				        <span>극장명</span>
					        <select class="category" id="second-select"name="theater_num">
					        </select>
				        </div>
				        
				        
				        
				        <script type="text/javascript">
				        
				        
				        
				        </script>
				        
				        
				        <div>
				           	<span>극장번호</span> <br>
				        	<input type="text" name="item_id" id="item_id">
				        </div>
				        
				        <div>
				        	<span>상영관명</span> <br>
				        	<input type="text" name="item_name">
				        </div>
				        
				        <div>
				        	<span>좌석수</span> <br>
				        	<textarea rows="1" cols="40" name="item_content" required></textarea>
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
		        <h3>스토어 수정</h3>
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
		
		<script>
			let modal = document.querySelectorAll('.modal');
			let registBtn = document.querySelector('#registBtn');
			let modifyBtn = document.querySelectorAll('.modifyBtn'); // 반복문으로 버튼이 여러 개 뜨니까 버튼도 여러개임을 인지하고, 팝업 뜨는 것도 반복문 작성필요
			let closeBtn = document.querySelectorAll('.close_btn');
			let categoryBtn = document.querySelector('#categoryBtn');
			
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
			
			
			// -------------------------------------------------------------------------
			// 카테고리 관z
		</script>

	
</body>
			<footer>
			<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
		</footer>
	</body>
</html>
