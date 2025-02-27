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
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    // 아이디 중복 확인
    function checkDuplicateId() {
      var mem_id = document.getElementById("mem_id").value;

      $.ajax({
        type: "POST",
        url: "idCheck?inputI=" + mem_id,
        dataType: "json",
        success: function(result) {
          if (result) {
            document.getElementById("idMessage").innerHTML = "사용 가능한 아이디입니다.";
          } else {
            document.getElementById("idMessage").innerHTML = "이미 사용 중인 아이디입니다.";
          }
        }
      });
    }

    // 이메일 중복 확인
    function checkDuplicateEmail() {
      var mem_email = document.getElementById("mem_email").value;

      $.ajax({
        type: "POST",
        url: "emailCheck?inputE=" + mem_email,
        dataType: "json",
        success: function(result) {
          if (result) {
            document.getElementById("emailMessage").innerHTML = "사용 가능한 이메일입니다.";
          } else {
            document.getElementById("emailMessage").innerHTML = "이미 사용 중인 이메일입니다.";
          }
        }
      });
    }
  </script>
  
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

    <!-- 회원가입 폼 -->
    <div class="center-container">
        <form class="signup-form" name="insertMember" action="insertMember" method="post">
            <h2>회원가입</h2>
            <input type="text" id="mem_id", name="mem_id" placeholder="아이디" required>
            <button type="button" onclick="checkDuplicateId()">아이디 중복 확인</button><br>
            <!-- 중복확인 버튼 -->
            <span id="idMessage"></span><br>
            <input type="password" name="mem_pw" placeholder="비밀번호" required>
            <input type="text" name="mem_nm" placeholder="이름" required>
            <input type="text" name="mem_phone" placeholder="전화번호" required>
            <input type="email" id="mem_email", name="mem_email" placeholder="이메일" required>
            <button type="button" onclick="checkDuplicateEmail()">이메일 중복 확인</button><br>
            <!-- 중복확인 버튼 -->
            <span id="emailMessage"></span><br>
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