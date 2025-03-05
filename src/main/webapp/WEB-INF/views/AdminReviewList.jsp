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
.center-container {
	width: 80%;
	margin: 20px auto;
	background-color: #e9e9e9;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

h1 {
	text-align: center;
	margin-bottom: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	text-align: left;
	border: 1px solid #ddd;
}

th {
	background-color: #f5f5f5;
}

button {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 8px 15px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

button:hover {
	background-color: #e9e9e9;
}

.back-button {
	margin-top: 20px;
	text-align: center;
}

.back-button a {
	text-decoration: none;
	background-color: #f0f0f0;
	color: #333;
	padding: 8px 15px;
	border-radius: 5px;
	transition: background-color 0.3s ease;
}

.back-button a:hover {
	background-color: #e0e0e0;
}
</style>
</head>
<body>
<jsp:include page="Head.jsp" />

		<%
		MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
		%>

	<div class="center-container">
		<h1>휴게소 리뷰 목록</h1>

		<table>
			<thead>
				<tr>
					<th>리뷰 인덱스</th>
					<th>휴게소 인덱스</th>
					<th>회원 아이디</th>
					<th>리뷰 내용</th>
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
						<td colspan="7">작성된 리뷰가 없습니다.</td>
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
