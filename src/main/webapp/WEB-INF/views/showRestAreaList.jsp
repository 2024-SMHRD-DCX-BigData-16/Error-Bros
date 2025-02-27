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
        <h1>휴게소 관리</h1>
        <div>
            <a href="goAddRestArea"><button class="addRestArea">휴게소 추가</button></a>
        </div>

        <table class="rest-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>이름</th>
                    <th>주소</th>
                    <th>편의시설</th>
                    <th>리뷰</th>
                    <th>메뉴</th>
                    <th>수정</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="hugeso" items="${adminhugesoList}">
                    <tr>
                        <td>${hugeso.rest_idx}</td>
                        <td>${hugeso.rest_nm}</td>
                        <td>${hugeso.rest_addr}</td>
                        <td>${hugeso.rest_facilities}</td>
                        <td><a href="goAdminReviewList?rest_idx=${hugeso.rest_idx}"><button class="AdminReview">리뷰 관리</button></a></td>
                        <td><a href="goAdminMenu?rest_idx=${hugeso.rest_idx}"><button class="AdminMenu">메뉴 관리</button></a></td>
                        <td><a href="goUpdateRestArea?rest_idx=${hugeso.rest_idx}"><button class="addrestarea">수정</button></a></td>
                        <td><a href="deleteRestArea?rest_idx=${hugeso.rest_idx}"><button >삭제</button></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="pagination">
            <c:if test="${adminHugesoListpage > 1}">
                <a href="hugesoList?page=${adminHugesoListpage - 1}">이전</a>
            </c:if>

            <c:forEach var="i" begin="1" end="${(adminHugesoTotalCount + 9) / 10}">
                <a href="hugesoList?page=${i}" ${adminHugesoListpage == i ? 'class="active"' : ''}>${i}</a>
            </c:forEach>

            <c:if test="${adminHugesoListpage < (adminHugesoTotalCount + 9) / 10}">
                <a href="hugesoList?page=${adminHugesoListpage + 1}">다음</a>
            </c:if>
        </div>

    </div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


</body>

</html>