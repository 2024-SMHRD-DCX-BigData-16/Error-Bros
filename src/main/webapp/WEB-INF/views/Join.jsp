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
<<<<<<< HEAD
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
            margin-bottom: 20px;
        }

        .signup-form input,
        .signup-form select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .signup-form button {
            width: 100%;
            padding: 8px;
            /* padding 값 증가 */
            background-color: #007bff;
            /* 파란색 계열로 변경 */
            
            border: none;
            color: white;
            font-size: 16px;
            font-weight: 500;
            /* 폰트 굵기 조절 */
            cursor: pointer;
            border-radius: 8px;
            /* 둥근 모서리 적용 */
            transition: background-color 0.3s ease;
            /* 호버 효과 부드럽게 적용 */
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
            /* 그림자 효과 추가 */
        }

        .signup-form button:hover {
            background-color: #0056b3;
            /* 호버 시 색상 변경 */
        }

        /* 아이디/이메일 중복 확인 버튼 스타일 */
        .check-button {
            width: auto;
            /* width 자동 조절 */
            height: auto;
            /* height 자동 조절 */
            padding: 8px 16px;
            /* padding 값 조절 */
            margin-left: 5px;
            font-size: 14px;
            /* 폰트 크기 조절 */
            background-color: #6c757d;
            /* 회색 계열로 변경 */
            border: none;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            /* 호버 효과 부드럽게 적용 */
        }

        .check-button:hover {
            background-color: #5a6268;
            /* 호버 시 색상 변경 */
        }
=======
 
>>>>>>> a5779b3 (커밋메세지)
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
<<<<<<< HEAD

=======
<jsp:include page="Head.jsp" />
>>>>>>> a5779b3 (커밋메세지)
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