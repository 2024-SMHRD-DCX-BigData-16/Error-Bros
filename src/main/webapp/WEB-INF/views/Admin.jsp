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

        .admin-panel {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .admin-panel button {
            margin: 10px;
            padding: 15px 30px;
            border: none;
            border-radius: 8px;
            /* 더 둥글게 */
            background-color: #3498db;
            /* 세련된 파란색 */
            color: white;
            font-size: 18px;
            font-weight: 500;
            /* 약간 더 두껍게 */
            cursor: pointer;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
            /* 그림자 효과 */
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            /* 클릭 시 효과 추가 */
        }

        .admin-panel button:hover {
            background-color: #2980b9;
            /* 약간 더 진한 파란색 */
            transform: translateY(-2px);
            /* 위로 살짝 이동 */
            box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.2);
            /* 그림자 더 진하게 */
        }

        .admin-panel button:active {
            transform: translateY(0);
            /* 클릭 시 원래 위치로 */
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
            /* 그림자 원래대로 */
        }
    </style>
</head>

<body>

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