<%@page import="com.errorbros.entity.MemberDTO"%>
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

        .update-form {
            width: 150%;
            max-width: 500px;
            padding: 30px;
            border: 2px solid #ddd;
            border-radius: 10px;
            background-color: #f9f9f9;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .update-form h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .update-form input,
        .update-form select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .update-form button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border: none;
            color: white;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
        }

        .update-form button:hover {
            background-color: #0056b3;
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
        <form class="update-form" name="updateMemberForm" action="updateMember" method="post">
            <h2>회원 정보 수정</h2>

            <input type="password" name="mem_pw" placeholder="새 비밀번호" required>
            <input type="password" name="mem_pw_confirm" placeholder="새 비밀번호 확인" required>
            <input value="${loginMember.mem_phone}" type="text" name="mem_phone" placeholder="전화번호" required>
            <input value="${loginMember.mem_email}" type="email" id="mem_email" name="mem_email" placeholder="이메일" required>
            <button type="button" onclick="checkDuplicateEmail()" class="check-button">이메일 중복 확인</button><br>
            <span id="emailMessage" class="message"></span><br>
            <input type="date" name="mem_birthdate" required>
            <select name="mem_gender">
                <option value="M">남성</option>
                <option value="F">여성</option>
            </select>
            <button type="submit" id="updateButton" name="updateMember" class="active-button" disabled>수정하기</button>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // 이메일 중복 확인
        function checkDuplicateEmail() {
            var mem_email = document.getElementById("mem_email").value;

            $.ajax({
                type: "POST",
                url: "emailCheck?inputE=" + mem_email, // 이메일 중복 확인 요청
                dataType: "json",
                success: function (result) {
                    if (result) {
                        document.getElementById("emailMessage").innerHTML = "<span class='message'>사용 가능한 이메일입니다.</span>";
                        // 이메일 중복 확인 성공 시, 수정 버튼 활성화
                        document.getElementById("updateButton").disabled = false;
                    } else {
                        document.getElementById("emailMessage").innerHTML = "<span class='message'>이미 사용 중인 이메일입니다.</span>";
                        // 이메일 중복 확인 실패 시, 수정 버튼 비활성화
                        document.getElementById("updateButton").disabled = true;
                    }
                }
            });
        }
    </script>
</body>

</html>