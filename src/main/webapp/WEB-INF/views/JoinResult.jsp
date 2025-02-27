<%@page import="com.errorbros.entity.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


    <div class="center-container">
        <div class="welcome-message">
            환영합니다!
        </div>
        <div class="user-info">
            ${mem_id}님, 404에 오신 것을 환영합니다!
        </div>
        <div class="additional-info">
            <p>이제 404의 다양한 서비스를 이용하실 수 있습니다.</p>
            <p>
                <a href="goMain">메인으로 가기</a>
            </p>
        </div>
    </div>

    <script>

    </script>
</body>

</html>