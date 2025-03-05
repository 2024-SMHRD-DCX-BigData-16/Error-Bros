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
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	width: 400px;
}

.signup-form h2 {
	text-align: center;
	margin-bottom: 20px;
}

.signup-form input[type="text"], .signup-form input[type="password"],
	.signup-form input[type="email"], .signup-form input[type="date"],
	.signup-form select {
	width: calc(100% - 22px);
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	box-sizing: border-box;
	font-size: 16px; /* 입력 칸 글자 크기 */
}

.signup-form button[type="button"], .signup-form button[type="submit"] {
	width: calc(100% - 22px);
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	box-sizing: border-box;
	background-color: #f0f0f0;
	color: #333;
	cursor: pointer;
	text-align: center; 
	display: flex;
	justify-content: center;
	align-items: center;
}

.signup-form button[type="button"]:hover, .signup-form button[type="submit"]:hover
	{
	background-color: #e0e0e0;
}

.signup-form span {
	display: block;
	margin-bottom: 10px;
	color: #888;
}
 
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

    <!-- 회원가입 폼 -->
    <div class="center-container">
        <form class="signup-form" name="insertMember" action="insertMember" method="post">
            <h2>회원가입</h2>
            <input type="text" id="mem_id", name="mem_id" placeholder="아이디" required>
            <button type="button" onclick="checkDuplicateId()">아이디 중복 확인</button>
            <!-- 중복확인 버튼 -->
            <span id="idMessage"></span>
            <input type="password" name="mem_pw" placeholder="비밀번호" required>
            <input type="text" name="mem_nm" placeholder="이름" required>
            <input type="text" name="mem_phone" placeholder="전화번호" required>
            <input type="email" id="mem_email", name="mem_email" placeholder="이메일" required>
            <button type="button" onclick="checkDuplicateEmail()">이메일 중복 확인</button>
            <!-- 중복확인 버튼 -->
            <span id="emailMessage"></span>
            <input type="date" name="mem_birthdate" required>
            <input type="hidden" name="mem_role" value="nomal" placeholder="회원 역할" required>
            <select name="mem_gender">
                <option value="M">남성</option>
                <option value="F">여성</option>
            </select>
            <button type="submit">가입하기</button>
        </form>
    </div>
	
  
</body>

</html>