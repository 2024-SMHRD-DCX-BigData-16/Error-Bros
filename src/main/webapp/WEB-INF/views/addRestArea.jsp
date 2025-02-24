<%@page import="com.errorbros.entity.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Search</title>
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
            justify-content: center;
            flex-grow: 1;
        }

        .form-container {
            width: 80%;
            margin-top: 20px;
        }

        .form-container label,
        .form-container input,
        .form-container textarea {
            display: block;
            width: 100%;
            margin-bottom: 10px;
            padding: 8px;
            box-sizing: border-box;
        }

        .form-container button {
            background-color: #33C711;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }
    </style>
</head>

<body>

    <!-- 상단바 -->
    <div class="top-bar">
        <% MemberDTO loginMember=(MemberDTO) session.getAttribute("loginMember"); // 세션에서 로그인 정보 가져오기 %>
            <% if (loginMember!=null) { %>
                <span>
                    <%= loginMember.getMem_nm() %>님 환영합니다.
                </span> <a href="logOut">로그아웃</a> <a href="goMypage">마이페이지</a>
                <% } else { %>
                    <a href="goLogin">로그인</a>
                    <a href="goJoin">회원가입</a>
                    <% } %>
    </div>

    <!-- 내비게이션 -->
    <div class="nav">
        <div class="logo">404</div>
    </div>

    <!-- 카테고리 메뉴 -->
    <div class="menu">
        <a href="#">휴게소 찾기</a>
        <a href="#">리뷰게시판</a>
    </div>


    <div class="center-container">
        <h1>휴게소 추가</h1>

        <div class="form-container">
            <form action="addRestArea" method="post" enctype="multipart/form-data">
                <label for="rest_nm">휴게소 이름:</label>
                <input type="text" id="rest_nm" name="rest_nm" required>

                <label for="rest_addr">주소:</label>
                <input type="text" id="rest_addr" name="rest_addr" required>

                <label for="lat">위도:</label>
                <input type="number" step="any" id="lat" name="lat" required>

                <label for="lon">경도:</label>
                <input type="number" step="any" id="lon" name="lon" required>

                <label for="rest_facilities">편의시설:</label>
                <textarea id="rest_facilities" name="rest_facilities"></textarea>

                <label for="rest_img">이미지:</label>
                <input type="file" id="rest_img" name="rest_img">

                <button type="submit">추가</button>
            </form>
        </div>
    </div>

    <script>

    </script>
</body>

</html>