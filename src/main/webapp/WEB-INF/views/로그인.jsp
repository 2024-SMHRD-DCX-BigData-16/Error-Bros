<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
            cursor: pointer;
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

        /* 중앙 로그인 폼 */
        .center-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            flex-grow: 1;
        }

        .login-box {
            padding: 100px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
        }

        .login-box input {
            display: block;
            width: 400px;
            margin: 10px 0;
            padding: 8px;
        }

        .login-box button {
            width: 100%;
            padding: 8px;
            background-color: rgb(51, 199, 17);
            color: white;
            border: none;
            cursor: pointer;
        }
    </style>
</head>

<body>

    <!-- 상단바 -->
    <div class="top-bar">
        <a href="#" id="login-link" onclick="toggleLogin()">로그인</a>
        <a href="#">마이페이지</a>
        <a href="#">회원가입</a>
        <a href="#">고객문의</a>
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

    <!-- 로그인 폼 -->
    <div class="center-container">
        <div class="login-box" id="login-box">
            <h3>로그인</h3>
            <input type="text" id="username" placeholder="아이디">
            <input type="password" id="password" placeholder="비밀번호">
            <button onclick="login()">로그인</button>
        </div>
    </div>

    <script>
        async function login() {
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;

            if (!username || !password) {
                alert('아이디와 비밀번호를 입력하세요.');
                return;
            }


            if (result.success) {
                alert('로그인 성공!');
                document.getElementById('login-link').textContent = '로그아웃';
                document.getElementById('login-box').style.display = 'none';
            } else {
                alert('로그인 실패! 아이디 또는 비밀번호를 확인하세요.');
            }
        }

        function toggleLogin() {
            const loginLink = document.getElementById('login-link');
            if (loginLink.textContent === '로그아웃') {
                // 로그아웃 처리
                loginLink.textContent = '로그인';
                document.getElementById('login-box').style.display = 'block';
                alert('로그아웃 되었습니다.');
            } else {
                document.getElementById('login-box').style.display = 'block';
            }
        }
    </script>
</body>

</html>