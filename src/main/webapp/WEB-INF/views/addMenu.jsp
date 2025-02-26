<%@page import="com.errorbros.entity.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Search - 메뉴 추가</title>

    
<style>


</style>
</head>
<body>
<jsp:include page="Head.jsp" />

    
        <% MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember"); %>
       

    <div class="menu">
        <a href="goMain">휴게소 찾기</a> <a href="goReview">리뷰게시판</a>
        <% String rest_idx= (String)request.getParameter("rest_idx"); %>
        <% if (loginMember!= null && "admin".equals(loginMember.getMem_id())) { %>
            <a href="goMenu?rest_idx=${param.rest_idx }"  style="text-align: right;">메뉴 리스트로 돌아가기</a>
            <a href="addMenu" style="text-align: right; ">메뉴 추가하기</a>
        <% } %>
    </div>

    <div class="center-container">
    <div class="menu-box" id="menu-box">
        <h1>메뉴 추가</h1>
        <form action="insertMenu?rest_idx=${param.rest_idx }" method="get">
            <label for="restIdx">휴게소 번호:</label>
            <input type="number" id="rest_idx" name="rest_idx" value=${param.rest_idx } readonly="readonly"/><br />
            <label for="menuNm">메뉴 이름:</label>
            <input type="text" id="menu_nm" name="menu_nm" /><br />
            <label for="menuType">메뉴 타입:</label>
            <select id="menu_type" name="menu_type">
            	<option>한식
            	<option>중식
            	<option>양식
            	<option>분식
            	<option>일식
            </select>
            <label for="menuPrice">메뉴 가격:</label>
            <input type="number" id="menu_price" name="menu_price" /><br />
            <label for="menuImg">메뉴 이미지 :</label>
            <input type="file" id="menu_img" name="menu_img" /><br />
            <input type="submit" value="추가" />
        </form>
        </div>
    </div>

    <script>
        // 필요한 스크립트 추가
    </script>
</body>
</html>