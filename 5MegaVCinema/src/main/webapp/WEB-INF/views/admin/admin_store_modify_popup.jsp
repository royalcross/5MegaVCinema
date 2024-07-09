<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<span>카테고리</span> <br>
	<select class="category" disabled>
		<option <c:if test="${selectedItem.item_type eq 'Ticket'}">selected</c:if>>티켓</option>
		<option <c:if test="${selectedItem.item_type eq 'Popcorn'}">selected</c:if>>팝콘</option>
		<option <c:if test="${selectedItem.item_type eq 'Drinks'}">selected</c:if>>음료</option>
		<option <c:if test="${selectedItem.item_type eq 'Goods'}">selected</c:if>>굿즈</option>
	</select>
</div>

<!-- item_id 는 hidden (수정은 불가능하게 할건데 where 절에 써야해서 파라미터 전달해야함 -->
<input type="hidden" name="item_id" value="${selectedItem.item_id}" > 

<div>
	<span>상품명</span> <br>
	<input type="text" name="item_name" value="${selectedItem.item_name}">
</div>
	
<div>
	<span>부연설명</span> <br>
	<textarea rows="1" cols="40" name="item_content" required>${selectedItem.item_content}</textarea>
</div>

<div>
	<span>가격</span> <br>
	<input type="text" name="item_price" value="${selectedItem.item_price}">
</div>
