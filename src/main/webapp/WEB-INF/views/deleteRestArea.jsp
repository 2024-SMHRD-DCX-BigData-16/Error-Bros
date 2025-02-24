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

        .rest-table {
            width: 80%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        .rest-table th,
        .rest-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .rest-table th {
            background-color: #f2f2f2;
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
        <a href="#">휴게소 찾기</a>
        <a href="#">리뷰게시판</a>
    </div>


    <div class="center-container">
        <h1>휴게소 삭제</h1>

        <table class="rest-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>이름</th>
                    <th>주소</th>
                    <th>편의시설</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="hugeso" items="${hugesoList}">
                    <tr>
                        <td>${hugeso.rest_idx}</td>
                        <td>${hugeso.rest_nm}</td>
                        <td>${hugeso.rest_addr}</td>
                        <td>${hugeso.rest_facilities}</td>
                        <td><button onclick="deleteRestArea('${hugeso.rest_idx}')">삭제</button></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function deleteRestArea(restIdx) {
            if (confirm("정말 삭제하시겠습니까?")) {
                $.ajax({
                    url: "deleteRestArea",
                    type: "POST",
                    data: { rest_idx: restIdx },
                    success: function (result) {
                        if (result.success) {
                            alert("삭제되었습니다.");
                            location.reload();
                        } else {
                            alert("삭제 실패: " + result.message);
                        }
                    },
                    error: function () {
                        alert("삭제 요청 중 오류 발생");
                    }
                });
            }
        }
    </script>
</body>

</html>