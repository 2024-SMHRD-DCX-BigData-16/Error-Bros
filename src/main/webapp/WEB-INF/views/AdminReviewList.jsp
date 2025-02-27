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

</style>
</head>
<body>
<jsp:include page="Head.jsp" />
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
