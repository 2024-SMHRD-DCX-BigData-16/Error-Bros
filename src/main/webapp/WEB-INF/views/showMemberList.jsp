<%@page import="com.errorbros.entity.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Search</title>
    <style>

    </style>
</head>

<body>
<jsp:include page="Head.jsp" />

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
        <h1>멤버 관리</h1>
        <table class="member-table">
            <thead>
                <tr>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>전화번호</th>
                    <th>이메일</th>
                    <th>생년월일</th>
                    <th>성별</th>
                    <th>수정</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="member" items="${allMember}"> <%-- JSTL 사용 --%>
                        <tr>
                            <td>${member.mem_id}</td>
                            <td>${member.mem_nm}</td>
                            <td>${member.mem_phone}</td>
                            <td>${member.mem_email}</td>
                            <td>
                                <fmt:formatDate value="${member.mem_birthdate}" pattern="yyyy-MM-dd" />
                            </td> <%-- JSTL fmt 사용 --%>
                                <td>${member.mem_gender}</td>
                                 <td><a href="updateMember?mem_id=${member.mem_id}"><button>수정</button></a></td>
                                <td><a href="deleteMember?mem_id=${member.mem_id}"><button>삭제</button></a></td>
                        </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</body>

</html>