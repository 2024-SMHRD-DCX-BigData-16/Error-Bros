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
        /* 중앙 error 텍스트 */
        .center-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            flex-grow: 1;
        }
        .error-text {
            font-size: 60px;
            font-weight: bold;
            color: green; /* 빨간색 */
            margin-bottom: 20px;
        }
        /* 검색창 스타일 */
        .search-container {
            display: flex;
            align-items: center;
            width: 500px;
            border: 1px solid #dfe1e5;
            border-radius: 25px;
            padding: 10px 15px;
            box-shadow: 0 1px 6px rgba(32, 33, 36, 0.28);
            background: white;
        }
        .search-container input {
            flex: 1;
            border: none;
            outline: none;
            font-size: 18px;
            padding: 5px;
        }
        .search-container .icon {
            width: 20px;
            height: 20px;
            margin-left: 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>

    <!-- 상단바 -->
    <div class="top-bar">
        <a href="#">로그인</a>
        <a href="#">마이페이지</a>
        <a href="#">회원가입</a>
        <a href="#">고객문의</a>
    </div>

    <!-- 내비게이션 -->
    <div class="nav">
        <div class="logo">404</div>
        </div>
    </div>

    <!-- 카테고리 메뉴 -->
    <div class="menu">
        <a href="#">휴게소 찾기</a>
        <a href="#">리뷰게시판</a>
    </div>

    <!-- 중앙 error 및 검색창 -->
    <div class="center-container">
        <div class="error-text">휴게소 검색</div>
        <div class="search-container">
            <input type="text" placeholder="휴게소 검색">
    </div>

</body>
</html>
