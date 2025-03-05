<%@page import="com.errorbros.entity.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Search</title>
    <style>
body {
	font-family: sans-serif;
	background-color: #f2f2f2;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	margin: 0;
}

.center-container {
	background-color: #fff;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	width: 400px;
}

.login-box h3 {
	text-align: center;
	margin-bottom: 20px;
}

.login-box input[type="text"], .login-box input[type="password"] {
	width: calc(100% - 22px);
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ddd;
	border-radius: 5px;
	box-sizing: border-box;
}

.login-box button[type="submit"] {
	width: 95%;
	padding: 10px;
	background-color: #e0e0e0;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	display: flex; /* Flexbox 레이아웃 적용 */
	align-items: center; /* 세로 가운데 정렬 */
	justify-content: center; /* 가로 가운데 정렬 */
}

.login-box button[type="submit"]:hover {
	background-color: #e0e0e0;
}
.center-container{
	width: 40% !important;
}
</style>
</head>

<body>

   <jsp:include page="Head.jsp" />
   
   
    <!-- 로그인 폼 -->
    <div class="center-container">
        <div class="login-box" id="login-box">
            <h3>로그인</h3>
            <form action="loginMember" method="post">
	            <input type="text" id="login_id" name="login_id" placeholder="아이디">
	            <input type="password" id="login_pw" name="login_pw" placeholder="비밀번호">
	            <button type="submit" >로그인</button>
            </form>
        </div>
    </div>

</body>

</html>