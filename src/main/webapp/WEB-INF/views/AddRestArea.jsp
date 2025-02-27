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

</style>
</head>

<body>
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