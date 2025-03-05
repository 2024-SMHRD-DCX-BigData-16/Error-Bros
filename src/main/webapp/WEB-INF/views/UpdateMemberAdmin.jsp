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
body {
	background-color: #f8f8f8;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: flex-start;
	min-height: 100vh;
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
}

.center-container {
	width: 80%;
	max-width: 600px;
	padding: 20px;
	box-sizing: border-box;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	min-height: calc(100vh - 100px);
}

.update-form {
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 100%;
}

.update-form h2 {
	text-align: center;
	margin-bottom: 20px;
}

.update-form input, .update-form select, .update-form button {
	width: calc(105% - 22px);
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
	text-align: center; /* 텍스트 중앙 정렬 */
}

.update-form button {
	background-color: #f8f8f8; /* 버튼 배경색 설정 */
	color: black;
	border: 1px solid #ccc;
	cursor: pointer;
	display: flex; /* flexbox 사용 */
	justify-content: center; /* 가로 중앙 정렬 */
	align-items: center; /* 세로 중앙 정렬 */
}

.update-form button.active-button {
	background-color: #f8f8f8; /* 활성 버튼 배경색 설정 */
}

.update-form button:hover {
	background-color: #e0e0e0;
}

.message {
	text-align: center;
	display: block;
	width: 100%;
}
</style>
</head>

<body>
	<jsp:include page="Head.jsp" />

    <div class="center-container">
        <form class="update-form" name="updateMemberForm" action="updateMember" method="post">
            <h2>회원 정보 수정</h2>
			<input type="text" name="mem_id" value="${uMember.mem_id }" readonly="readonly">
            <input type="password" name="mem_pw" placeholder="새 비밀번호" required>
            <input type="password" name="mem_pw_confirm" placeholder="새 비밀번호 확인" required>
            <input type="text" name="mem_phone" value="${uMember.mem_phone }" placeholder="전화번호" required>
            <input type="email" id="mem_email" name="mem_email" value="${uMember.mem_email }" placeholder="이메일" required>
            <button type="button" onclick="checkDuplicateEmail()" class="check-button">이메일 중복 확인</button><br>
            <span id="emailMessage" class="message"></span><br>
            <input type="date"  name="mem_birthdate"  value="${uMember.mem_birthdate }" required>
            <select name="mem_role"  value="${uMember.mem_role }" >
                <option value="nomal">일반회원</option>
                <option value="admin">관리자</option>
            </select>
            <select name="mem_gender"  value="${uMember.mem_gender }" >
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
            var uMemberEmail = "<%= session.getAttribute("uMember") != null ? ((MemberDTO) session.getAttribute("uMember")).getMem_email() : "" %>";
            
            if (mem_email === uMemberEmail) {
                document.getElementById("updateButton").disabled = false;
                document.getElementById("emailMessage").innerHTML = "<span class='message'>기존 이메일을 사용합니다.</span>";
                return;
            }
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