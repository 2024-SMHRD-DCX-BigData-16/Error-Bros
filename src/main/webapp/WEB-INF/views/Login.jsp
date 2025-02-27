<%@page import="com.errorbros.entity.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">

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

    <!-- 로그인 폼 -->
    <div class="center-container">
        <div class="login-box" id="login-box">
            <h3>로그인</h3>
            <form action="loginMember" method="post">
	            <input type="text" id="login_id" name="login_id" placeholder="아이디">
	            <input type="password" id="login_pw" name="login_pw" placeholder="비밀번호">
	            <button type="submit" >로그인</button>
            </form>
        </div>
    </div>

</body>

</html>