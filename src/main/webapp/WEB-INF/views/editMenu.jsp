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
<<<<<<< HEAD
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 100vh;
	background-color: #fff;
}
/* 상단바 */
.top-bar {
	background-color: rgb(51, 199, 17);
	text-align: right;
	padding: 8px 20px;
	font-size: 14px;
	width: 100%;
	position: fixed;
	top: 0;
	left: 0;
}

.top-bar a {
	color: red;
	text-decoration: none;
	margin-left: 15px;
}
/* 내비게이션 */
.nav {
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 15px 20px;
	position: relative;
	width: 100%;
	margin-top: 40px;
}

.logo {
	font-size: 24px;
	font-weight: bold;
	color: rgb(199, 126, 17);
	text-align: center;
}
/* 카테고리 메뉴 */
.menu {
	display: flex;
	justify-content: left;
	padding: 10px 20px;
	border-top: 1px solid blue;
	width: 100%;
}

.menu a {
	margin-right: 20px;
	text-decoration: none;
	color: black;
	font-weight: bold;
}

.center-container {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	flex-grow: 1;
}
/* 폼 스타일 */
form {
	display: flex;
	flex-direction: column;
	width: 300px;
}

label {
	margin-bottom: 5px;
}

input[type="text"], input[type="number"] {
	padding: 8px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

input[type="submit"] {
	background-color: blue;
	color: white;
	padding: 10px;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}
</style>
</head>
<body>

=======

</style>
</head>
<body>
<jsp:include page="Head.jsp" />
>>>>>>> a5779b3 (커밋메세지)
	<div class="top-bar">
        <% MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember"); %>
        <% if (loginMember!= null) { %>
            <span><%= loginMember.getMem_nm() %>님 환영합니다.</span>
            <a href="logOut">로그아웃</a>
            <a href="goMypage">마이페이지</a>
            <% if ("admin".equals(loginMember.getMem_id())) { %> <a href="goAdmin">관리하기</a> <% } %>
        <% } else { %>
            <a href="goLogin">로그인</a>
            <a href="goJoin">회원가입</a>
        <% } %>
    </div>

	<div class="nav">
		<div class="logo">404</div>
	</div>

	<div class="menu">
		<a href="goMain">휴게소 찾기</a> <a href="goReview">리뷰게시판</a>
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
		<form action="../updateMenu" method="post">
			<input type="hidden" name="menuIdx" value="${menu.menuIdx}" /> <label
				for="restIdx">휴게소 번호:</label> 
			<input type="number" id="restIdx"
				name="restIdx" value="${menu.restIdx}" /><br /> 
			<label for="menuNm">메뉴 이름:</label> <input type="text" id="menuNm"
				name="menuNm" value="${menu.menuNm}" /><br /> 
			<label
				for="menuType">메뉴 타입:</label> <input type="text" id="menuType"
				name="menuType" value="${menu.menuType}" /><br /> 
			<label
				for="menuPrice">메뉴 가격:</label> <input type="number" id="menuPrice"
				name="menuPrice" value="${menu.menuPrice}" /><br /> 
			<label
				for="menuImg">메뉴 이미지 URL:</label> <input type="text" id="menuImg"
				name="menuImg" value="${menu.menuImg}" /><br />
			<input	type="submit" value="수정" />
		</form>
	</div>

	<script>
		// 필요한 스크립트 추가
	</script>
</body>
</html>