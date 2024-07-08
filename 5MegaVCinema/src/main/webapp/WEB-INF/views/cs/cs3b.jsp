<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의양식</title>
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<style type="text/css">
    body {
        font-family: Arial, sans-serif;
        padding: 20px;
    }
    table {
        width: 60%; 
        border-collapse: collapse; 
    }
    th, td {
        border: 1px solid #ccc; 
        padding: 8px; 
        text-align: left; 
    }
    input[type="text"] {
        width: 100%; 
        padding: 8px; 
        box-sizing: border-box; 
    }
    textarea{
	resize: none;	
	}
	.btn {
	text-align: center; 
    padding-top: 10px; 
	}
</style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<div align="center">
		<h2>1:1문의</h2>
		<form action="">
			<table border="1">
			<tr>
				<th>문의유형 ${cs_category}</th> 
				<td >
					<input type="radio" name="type">문의
					<input type="radio" name="type">건의
					<input type="radio" name="type">칭찬
					<input type="radio" name="type">불만
					<input type="radio" name="type">기타
					<input type="radio" name="type">제휴
					<input type="radio" name="type">대관
				</td>
			</tr>
				<tr>
					<th>영화관</th>
					<td >
						<select>
							<option>영화관 선택</option>
							<option>1</option>
							<option>2</option>
						</select>
					</td>
				</tr>						
				<tr>
					<th>제목</th>
					<td><input type="text">${cs_subject}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td >
						<textarea rows="30" cols="150">${cs_content}</textarea>
					</td>
				</tr>
				<div>			
					<td colspan="2" align="center" class="btn">
						<input type="submit" value="전송">
						<input type="reset" value="초기화">
						<input type="button" value="돌아가기">
					</td>				
				</div>
			</table>
		</form>   	
	</div>
	<footer>		
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>