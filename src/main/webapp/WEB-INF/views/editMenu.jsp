<%@page import="com.errorbros.entity.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Error Search - 메뉴 수정</title>
<style>
.center-container {
	width: 80%;
	max-width: 600px;
	margin: 20px auto;
	background-color: #e9e9e9;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

h1 {
	text-align: center;
	margin-bottom: 30px;
	color: #333;
}

form {
	display: flex;
	flex-direction: column;
}

label {
	margin-bottom: 8px;
	color: #555;
}

input[type="text"], input[type="number"], select {
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ddd;
	border-radius: 5px;
	box-sizing: border-box;
	font-size: 16px;
	background-color: #f0f0f0;
}

input[type="submit"] {
	background-color: #e9e9e9;
	color: #fff;
	padding: 12px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
	transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
	background-color: #e9e9e9;
}
</style>
</head>
<body>
<jsp:include page="Head.jsp" />

        <% MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember"); %>
       
		<%
		if (loginMember != null && "admin".equals(loginMember.getMem_id())) {
		%>
		<a href="addMenu" style="position: absolute; right: 20px;">메뉴 추가하기</a>
		<%
		}
		%>
	</div>

	<div class="center-container">
		<h1>메뉴 수정</h1>
		<form action="updateMenu" method="post">
			<input type="hidden" name="menu_idx" value="${menu.menu_idx}" /> 
			<label	for="rest_idx">휴게소 번호:</label> 
			<input type="number" id="rest_idx" name="rest_idx" value="${menu.rest_idx}" /><br /> 
			<label for="menu_nm">메뉴 이름:</label> 
			<input type="text" id="menu_nm" name="menu_nm" value="${menu.menu_nm}" /><br /> 
			<label for="menu_type">메뉴 타입:</label>
            <select id="menu_type" name="menu_type">
            	<option>한식
            	<option>중식
            	<option>양식
            	<option>분식
            	<option>일식
            </select>
			<label
				for="menu_price">메뉴 가격:</label> <input type="number" id="menu_price"
				name="menu_price" value="${menu.menu_price}" /><br /> 
			<label
				for="menu_img">메뉴 이미지 URL:</label> <input type="text" id="menu_img"
				name="menu_img" value="${menu.menu_img}" /><br />
			<input	type="submit" value="수정" />
		</form>
	</div>

	<script>
		// 필요한 스크립트 추가
	</script>
</body>
</html>