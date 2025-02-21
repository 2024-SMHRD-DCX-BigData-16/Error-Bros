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
        <a href="goLogin" id="login-link" onclick="toggleLogin()">로그인</a>
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
        <a href="goHu">휴게소 찾기</a>
        <a href="#">리뷰게시판</a>
    </div>

		<!-- Wrapper -->
	<div id="wrapper">
		<!-- Menu -->
			<nav id="Update">	
				<ul class="actions vertical">
					<li><h1>환영합니다!</h1></li>
					<li>회원가입을 축하합니다.</li>
					<!-- Q2. 회원가입 한 회원정보 중 이메일을 출력하시오.(request영역 활용) -->
					<%-- <%String email = (String)request.getAttribute("email")); %> --%>
					<li>${mem_nm }님 환영합니다.</li>
					<li><button onclick='location.href="goMain"'>시작하기</button></li>
				</ul>
			</nav>			
	</div>

	</body>
</html>