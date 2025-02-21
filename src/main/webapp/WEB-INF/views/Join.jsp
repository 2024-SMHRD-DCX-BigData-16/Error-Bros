<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
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
            margin: 0;
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

        /* 중앙 휴게소 검색 텍스트 */
        .center-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            flex-grow: 1;
        }

        /* 회원가입 폼 스타일 */
        .signup-form {
            width: 150%;
            /* 화면 크기에 맞춰 조절 */
            max-width: 500px;
            /* 최대 크기 제한 */
            padding: 30px;
            border: 2px solid #ddd;
            border-radius: 10px;
            background-color: #f9f9f9;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .signup-form h2 {
            text-align: center;
            margin-bottom: 10px;
        }

        .signup-form input,
        .signup-form select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .signup-form button {
            width: 100%;
            padding: 10px;
            background-color: gold;
            border: none;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        .signup-form button:hover {
            background-color: navy;
        }
    </style>
</head>

<body>

    <!-- 상단바 -->
    <div class="top-bar">
        <a href="goLogin">로그인</a>
        <a href="#">마이페이지</a>
        <a href="goJoin">회원가입</a>
        <a href="#">고객문의</a>
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

    <!-- 회원가입 폼 -->
    <div class="center-container">
        <form class="signup-form" name="insertMember" action="insertMember" method="post">
            <h2>회원가입</h2>
            <input type="text" name="mem_id" placeholder="아이디" required>
            <input type="password" name="mem_pw" placeholder="비밀번호" required>
            <input type="text" name="mem_nm" placeholder="이름" required>
            <input type="text" name="mem_phone" placeholder="전화번호" required>
            <input type="email" name="mem_email" placeholder="이메일" required>
            <input type="date" name="mem_birthdate" required>
            <input type="text" name="mem_role" placeholder="회원 역할" required>
            <select name="mem_gender">
                <option value="M">남성</option>
                <option value="F">여성</option>
            </select>
            <button type="submit">가입하기</button>
        </form>
    </div>

  
</body>

</html>