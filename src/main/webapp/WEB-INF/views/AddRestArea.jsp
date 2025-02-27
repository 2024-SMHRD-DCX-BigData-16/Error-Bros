<%@page import="com.errorbros.entity.MemberDTO"%>
<%@page import="com.errorbros.entity.HugesoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Search</title>
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

.review-wrapper {
	border: 2px solid #ccc;
	/* 테두리 스타일 */
	padding: 30px;
	/* 내부 여백 */
	border-radius: 10px;
	/* 모서리 둥글게 */
	margin-bottom: 20px;
	/* 아래쪽 여백 */
}

.center-container {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	flex-grow: 1;
}

.form-container {
	width: 100%; /* 넓이 확장 */
	max-width: 900px; /* 최대 넓이 설정 (선택적) */
	margin-top: 20px;
}

.form-container label, .form-container input, .form-container textarea {
	margin-bottom: 15px; /* 간격 조정 */
	padding: 10px; /* 패딩 조정 */
	font-size: 16px; /* 폰트 크기 조정 (선택적) */
}

.form-container button {
	padding: 12px 25px;
	font-size: 16px;
	background-color: #007bff; /* Blue */
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease; /* 0.3초 동안 부드럽게 변경 */
}

.form-container button:hover {
	background-color: #0056b3; /* 더 진한 파란색으로 변경 */
	cursor: pointer; /* 마우스 커서를 손가락 모양으로 변경 */
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* 그림자 효과 추가 */
}

.form-container button:active {
	background-color: #003f8a; /* 클릭 시 더 어두운 파란색 */
	box-shadow: none; /* 클릭 시 그림자 제거 */
}

.input-table {
	width: 100%;
}

.input-table td {
	padding: 8px;
	vertical-align: top; /* 텍스트 상단 정렬 */
}

.input-table label {
	text-align: right; /* 레이블 오른쪽 정렬 */
	padding-right: 10px;
}

.image-upload {
	display: flex;
	flex-direction: column;
	align-items: flex-start; /* Align items to the left */
}

.image-upload label {
	margin-bottom: 5px;
}

.image-upload input[type="file"] {
	margin-bottom: 10px;
}

.image-preview-container {
	display: flex;
	flex-wrap: wrap; /* Allow multiple images to wrap */
}

.image-preview {
	max-width: 200px;
	margin-right: 10px;
	margin-bottom: 10px;
}
=======

>>>>>>> a5779b3 (커밋메세지)
</style>
</head>

<body>
<<<<<<< HEAD

=======
<jsp:include page="Head.jsp" />
>>>>>>> a5779b3 (커밋메세지)
    <!-- 상단바 -->
    <div class="top-bar">
        <% MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember"); %>
        <% if (loginMember!= null) { %>
            <span><%= loginMember.getMem_nm() %>님 환영합니다.</span>
            <a href="logOut">로그아웃</a>
            <a href="goMypage">마이페이지</a>
            <% if ("admin".equals(loginMember.getMem_id())) { %> <a href="goAdmin">관리하기</a> <% } %> <% } else { %> <a href="goLogin">로그인</a>
            <a href="goJoin">회원가입</a>
            <% } %>
    </div>


    <!-- 내비게이션 -->
    <div class="nav">
        <div class="logo">404</div>
    </div>

    <!-- 카테고리 메뉴 -->
    <div class="menu">
        <a href="goMain">휴게소 찾기</a>
        <a href="goReview">리뷰게시판</a>
    </div>

    <div class="center-container">
    	
            <h2>휴게소 정보를 입력 하세요</h2>
    	<div class="review-wrapper" id="review-wrapper">
        <form class="update-form" name="addRestAreaForm" action="addRestArea" method="post">
			<table class="input-table">
			<tr><td><input type="text" name="rest_nm" placeholder="휴게소 이름" required></td></tr>
            <tr><td><input type="text" name="rest_addr" placeholder="휴게소 주소" required></td></tr>
            <tr><td><input type="number" step="0.000001" id="lat" name="lat" placeholder="위도" required></td></tr>
            <tr><td><input type="number" step="0.000001" id="lon" name="lon" placeholder="경도" required></td></tr>
            <tr><td><input type="number"  id="lon" name="parking_lot" placeholder="주차장 수" required></td></tr>
            <tr><td><input type="text" name="rest_facilities" placeholder="편의 시설" required></td></tr>
            <tr><td><input type="text" name="rest_phone" placeholder="휴게소 연락처" required></td></tr>
            <tr><td><input type="file" name="rest_img" placeholder="휴게소 사진" style="float: right;"></td></tr>
            <tr><td><input type="submit" value="휴게소 추가하기"></td></tr>
            </table>
        </form>
        
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   
</body>

</html>