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