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
    
    </style>
</head>

<body>

   	<jsp:include page="Head.jsp" />
        <% MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember"); %>


    <div class="center-container">
    <h1>${loginMember.mem_id }님 환영합니다</h1>
        <div class="admin-panel">
            <div>
            <a href="goUpdateMember"><button class="member-list">개인 정보 수정</button></a>
            </div>
            <div>
            <a href="goUserPayList"><button class="show-restarealist">결제 내역 확인</button></a>
            </div>
        </div>
    </div>

    <script>

    </script>
</body>

</html>