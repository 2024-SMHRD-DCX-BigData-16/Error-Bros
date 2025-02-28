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
			<input type="hidden" name="menuIdx" value="${menu.menu_idx}" /> <label
				for="restIdx">휴게소 번호:</label> 
			<input type="number" id="restIdx"
				name="restIdx" value="${menu.rest_idx}" /><br /> 
			<label for="menuNm">메뉴 이름:</label> <input type="text" id="menuNm"
				name="menuNm" value="${menu.menu_nm}" /><br /> 
			<label for="menuType">메뉴 타입:</label>
            <select id="menu_type" name="menu_type">
            	<option>한식
            	<option>중식
            	<option>양식
            	<option>분식
            	<option>일식
            </select>
			<label
				for="menuPrice">메뉴 가격:</label> <input type="number" id="menuPrice"
				name="menuPrice" value="${menu.menu_price}" /><br /> 
			<label
				for="menuImg">메뉴 이미지 URL:</label> <input type="text" id="menuImg"
				name="menuImg" value="${menu.menu_img}" /><br />
			<input	type="submit" value="수정" />
		</form>
	</div>

	<script>
		// 필요한 스크립트 추가
	</script>
</body>
</html>