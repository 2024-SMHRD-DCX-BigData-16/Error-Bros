<%@page import="com.errorbros.entity.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Error Search</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
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
	cursor: pointer;
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
	justify-content: flex-start; /* Align items to the top */
	flex-grow: 1;
	width: 80%; /* Set a maximum width for the table */
	margin-top: 100px;
	/* Add some top margin to account for the top bar and nav */
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

.pagination {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.pagination a {
	display: inline-block;
	padding: 5px 10px;
	margin: 2px;
	border: 1px solid #ccc;
	text-decoration: none;
	color: #333;
}

.pagination a.active {
	background-color: #007bff;
	color: white;
}

.back-button {
	margin-top: 20px;
}
</style>
</head>
<body>

	<!-- 상단바 -->
	<div class="top-bar">
		<%
		MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
		%>
		<%
		if (loginMember != null) {
		%>
		<span><%=loginMember.getMem_nm()%>님 환영합니다.</span> <a href="logOut">로그아웃</a>
		<a href="goMypage">마이페이지</a>
		<%
		if ("admin".equals(loginMember.getMem_id())) {
		%>
		<a href="goAdmin">관리하기</a>
		<%
		}
		%>
		<%
		} else {
		%>
		<a href="goLogin">로그인</a> <a href="goJoin">회원가입</a>
		<%
		}
		%>
	</div>


	<!-- 내비게이션 -->
	<div class="nav">
		<div class="logo">404</div>
	</div>

	<!-- 카테고리 메뉴 -->
	<div class="menu">
		<a href="goMain">휴게소 찾기</a> <a href="goReview">리뷰게시판</a>
	</div>

	<div class="center-container">
		<h1>휴게소 리뷰 목록</h1>

		<table>
			<thead>
				<tr>
					<th>리뷰 인덱스</th>
					<th>휴게소 인덱스</th>
					<th>회원 아이디</th>
					<th>리뷰 내용</th>
					<th>리뷰 좋아요</th>
					<th>리뷰 평점</th>
					<th>작성일</th>
					<th>리뷰 삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="review" items="${AdminReviewList}">
					<tr>					
						<td>${review.review_idx}</td>
						<td>${review.rest_idx}</td>
						<td>${review.mem_id}</td>
						<td>${review.review_content}</td>
						<td>${review.review_like}</td>
						<td>${review.review_ratings}</td>
						<td>${review.created_at}</td>
						<td>
							<a href="deleteReview?rest_idx=${review.rest_idx}&review_idx=${review.review_idx}">
							<button type="button">삭제</button>
							</a>
						</td>
						<%-- 삭제 버튼 추가 --%>
					</tr>
				</c:forEach>
				<c:if test="${empty AdminReviewList}">
					<tr>
						<td colspan="5">작성된 리뷰가 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>

		<div class="pagination">
			<%-- 페이지네이션 필요시 추가 --%>
		</div>
		<% if ("admin".equals(loginMember.getMem_id())) {%>
		<div class="back-button">
		<a href="hugesoList">휴게소 관리 리스트로 돌아가기</a>
		</div>
		<%}%>
		
		<div class="back-button">
			<a href="showHugeso?rest_idx=${rest_idx}">휴게소 정보 페이지로 돌아가기</a>
		</div>
	</div>

</body>

</html>
