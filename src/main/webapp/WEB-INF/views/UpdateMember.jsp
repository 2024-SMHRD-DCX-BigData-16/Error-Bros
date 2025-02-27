<%@page import="com.errorbros.entity.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <form class="update-form" name="updateMemberForm" action="updateMember" method="post">
            <h2>회원 정보 수정</h2>

            <input type="password" name="mem_pw" placeholder="새 비밀번호" required>
            <input type="password" name="mem_pw_confirm" placeholder="새 비밀번호 확인" required>
            <input type="text" name="mem_phone" placeholder="전화번호" required>
            <input type="email" id="mem_email" name="mem_email" placeholder="이메일" required>
            <button type="button" onclick="checkDuplicateEmail()" class="check-button">이메일 중복 확인</button><br>
            <span id="emailMessage" class="message"></span><br>
            <input type="date" name="mem_birthdate" required>
            <select name="mem_gender">
                <option value="M">남성</option>
                <option value="F">여성</option>
            </select>
            <button type="submit" id="updateButton" name="updateMember" class="active-button" disabled>수정하기</button>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // 이메일 중복 확인
        function checkDuplicateEmail() {
            var mem_email = document.getElementById("mem_email").value;

            $.ajax({
                type: "POST",
                url: "emailCheck?inputE=" + mem_email, // 이메일 중복 확인 요청
                dataType: "json",
                success: function (result) {
                    if (result) {
                        document.getElementById("emailMessage").innerHTML = "<span class='message'>사용 가능한 이메일입니다.</span>";
                        // 이메일 중복 확인 성공 시, 수정 버튼 활성화
                        document.getElementById("updateButton").disabled = false;
                    } else {
                        document.getElementById("emailMessage").innerHTML = "<span class='message'>이미 사용 중인 이메일입니다.</span>";
                        // 이메일 중복 확인 실패 시, 수정 버튼 비활성화
                        document.getElementById("updateButton").disabled = true;
                    }
                }
            });
        }
    </script>
</body>

</html>