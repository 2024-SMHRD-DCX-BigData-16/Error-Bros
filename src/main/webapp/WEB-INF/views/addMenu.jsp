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
.center-container {
	width: 30%;
	margin: 80px auto 30px auto;
	background-color: #e9e9e9;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

h1 {
	text-align: center;
	margin-bottom: 20px;
}

.menu-box {
	width: 100%;
	max-width: 500px;
	margin: 0 auto;
}

.menu-box label {
	display: block;
	margin-bottom: 5px;
}

.menu-box input[type="number"], .menu-box input[type="text"], .menu-box select
	{
	width: calc(100% - 22px);
	padding: 8px;
	margin-bottom: 10px;
	border-radius: 5px;
	box-sizing: border-box;
	background-color: #f0f0f0;
	border: 1px solid #ddd;
}

.menu-box input[type="submit"] {
	width: 50%;
	background-color: #f0f0f0;
	color: #fff;
	border: 1px solid #ddd;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	display: flex; /* Flexbox 레이아웃 적용 */
	align-items: center; /* 세로 가운데 정렬 */
	justify-content: center; /* 가로 가운데 정렬 */
}

.menu-box input[type="submit"]:hover {
	background-color: #e9e9e9;
}

.menu {
	text-align: center;
	margin-bottom: 20px;
}

.menu a {
	display: inline-block;
	margin: 0 10px;
	padding: 8px 15px;
	background-color: #f0f0f0;
	color: #333;
	border: none;
	border-radius: 5px;
	text-decoration: none;
	transition: background-color 0.3s ease;
}

.menu a:hover {
	background-color: #e0e0e0;
}

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
        <form action="insertMenu" method="post" enctype="multipart/form-data">
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