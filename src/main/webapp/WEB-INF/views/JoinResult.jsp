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
body {
	font-family: sans-serif;
	background-color: #f2f2f2;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	margin: 0;
	flex-direction: column; /* 컨텐츠를 세로로 배치 */
	gap: 20px; /* 컨텐츠 간 간격 */
}

.center-container {
	background-color: #fff;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	text-align: center;
	animation: slide-up 1s ease; /* 애니메이션 추가 */
}

.welcome-message {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 10px;
}

.user-info {
	font-size: 18px;
	margin-bottom: 20px;
}

.additional-info p {
	margin-bottom: 10px;
}

.additional-info a {
	display: inline-block;
	padding: 10px 20px;
	background-color: #f2f2f2;
	text-decoration: none;
	border-radius: 5px;
	transition: background-color 0.3s ease;
}

.additional-info a:hover {
	background-color: #e0e0e0;
}
</style>


      

</head>

<body>

    <jsp:include page="Head.jsp" />


    <div class="center-container">
        <div class="welcome-message">
            환영합니다!
        </div>
        <div class="user-info">
            ${IMember.mem_nm}님, Go Stop에 오신 것을 환영합니다!
        </div>
        <div class="additional-info">
            <p>이제 Go Stop의 다양한 서비스를 이용하실 수 있습니다.</p>
            <p>
                <a href="goMain">메인으로 가기</a>
            </p>
        </div>
    </div>
    <script>

    </script>
</body>

</html>