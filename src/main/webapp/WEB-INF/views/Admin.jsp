<%@page import="com.errorbros.entity.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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


    <div class="center-container">
        <div class="admin-panel">
            <div>
            <a href="goshowMemberList"><button class="member-list">회원관리</button></a>
            </div>
            <div>
            <a href="hugesoList"><button class="show-restarealist">휴게소 관리</button></a>
                
            </div>
        </div>
    </div>

    <script>

    </script>
</body>

</html>