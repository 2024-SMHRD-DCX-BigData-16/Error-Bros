<%@page import="com.errorbros.entity.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Error Search</title>
<style>
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

.review-wrapper {
	border: 2px solid #ccc;
	/* 테두리 스타일 */
	padding: 30px;
	/* 내부 여백 */
	border-radius: 10px;
	/* 모서리 둥글게 */
	margin-bottom: 20px;
	/* 아래쪽 여백 */
}

.center-container {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	flex-grow: 1;
}

.form-container {
	width: 100%; /* 넓이 확장 */
	max-width: 900px; /* 최대 넓이 설정 (선택적) */
	margin-top: 20px;
}

.form-container label, .form-container input, .form-container textarea {
	margin-bottom: 15px; /* 간격 조정 */
	padding: 10px; /* 패딩 조정 */
	font-size: 16px; /* 폰트 크기 조정 (선택적) */
}

.form-container button {
	padding: 12px 25px;
	font-size: 16px;
	background-color: #007bff; /* Blue */
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease; /* 0.3초 동안 부드럽게 변경 */
}

.form-container button:hover {
	background-color: #0056b3; /* 더 진한 파란색으로 변경 */
	cursor: pointer; /* 마우스 커서를 손가락 모양으로 변경 */
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* 그림자 효과 추가 */
}

.form-container button:active {
	background-color: #003f8a; /* 클릭 시 더 어두운 파란색 */
	box-shadow: none; /* 클릭 시 그림자 제거 */
}

.input-table {
	width: 100%;
}

.input-table td {
	padding: 8px;
	vertical-align: top; /* 텍스트 상단 정렬 */
}

.input-table label {
	text-align: right; /* 레이블 오른쪽 정렬 */
	padding-right: 10px;
}

.image-upload {
	display: flex;
	flex-direction: column;
	align-items: flex-start; /* Align items to the left */
}

.image-upload label {
	margin-bottom: 5px;
}

.image-upload input[type="file"] {
	margin-bottom: 10px;
}

.image-preview-container {
	display: flex;
	flex-wrap: wrap; /* Allow multiple images to wrap */
}

.image-preview {
	max-width: 200px;
	margin-right: 10px;
	margin-bottom: 10px;
}
</style>
</head>

<body>

	<!-- 상단바 -->
	<div class="top-bar">
		<%
		MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
		%>
		<%
		if (loginMember != null) {
		%>
		<span><%=loginMember.getMem_nm()%>님 환영합니다.</span> <a href="logOut">로그아웃</a>
		<a href="goMypage">마이페이지</a>
		<%
		if ("admin".equals(loginMember.getMem_id())) {
		%>
		<a href="goAdmin">관리하기</a>
		<%
		}
		%>
		<%
		} else {
		%>
		<a href="goLogin">로그인</a> <a href="goJoin">회원가입</a>
		<%
		}
		%>
	</div>

	<!-- 내비게이션 -->
	<div class="nav">
		<div class="logo">404</div>
	</div>

	<!-- 카테고리 메뉴 -->
	<div class="menu">
		<a href="#">휴게소 찾기</a> <a href="#">리뷰게시판</a>
	</div>


	<div class="center-container">
		<h1>휴게소 추가</h1>

		<div class="form-container">
			<div class="review-wrapper" id="review-wrapper">
				<form action="addRestArea" method="post"
					enctype="multipart/form-data">
					<table class="input-table">
						<tr>
							<td><label for="rest_nm">휴게소 이름:</label></td>
							<td><input type="text" id="rest_nm" name="rest_nm" required></td>
						</tr>
						<tr>
							<td><label for="rest_addr">주소:</label></td>
							<td><input type="text" id="rest_addr" name="rest_addr"
								required></td>
						</tr>
						<tr>
							<td><label for="lat">위도:</label></td>
							<td><input type="number" step="any" id="lat" name="lat"
								required></td>
						</tr>
						<tr>
							<td><label for="lon">경도:</label></td>
							<td><input type="number" step="any" id="lon" name="lon"
								required></td>
						</tr>
						<tr>
							<td><label for="rest_facilities">편의시설:</label></td>
							<td><textarea id="rest_facilities" name="rest_facilities"></textarea></td>
						</tr>
						<tr>
							<td><label for="rest_img">이미지:</label></td>
							<td><input type="file" id="rest_img" name="rest_img"></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;">
								<button type="submit">추가</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>

	<script>
		// "추가" 버튼 기능 구현 
		document
				.querySelector('.form-container button[type="submit"]')
				.addEventListener(
						'click',
						function(event) {
							// 입력값 유효성 검사 (예: 필수 필드 확인)
							if (document.getElementById('rest_nm').value === ""
									|| document.getElementById('rest_addr').value === ""
									|| document.getElementById('lat').value === ""
									|| document.getElementById('lon').value === "") {
								alert("모든 필수 필드를 입력해주세요.");
								event.preventDefault(); // 폼 제출 방지
								return;
							}

							// 추가적인 작업 (예: 서버에 데이터 전송)

							// 폼 제출 전에 alert 메시지 표시
							let confirmation = confirm("휴게소를 추가하시겠습니까?");
							if (confirmation) {
								alert("휴게소 추가 요청을 처리중입니다.");
							} else {
								event.preventDefault(); // 취소 시 폼 제출 방지
								return;
							}
						});

		//이미지 미리보기 기능 
		document.getElementById('rest_img').addEventListener('change', function(event) {
			const files = event.target.files;
			const previewContainer = document.querySelector('.image-preview-container');
			previewContainer.innerHTML = ''; // Clear previous previews

			for (const file of files) {
				const reader = new FileReader();

				reader.onload = function(e) {
					const imgPreview = document.createElement('img');
					imgPreview.src = e.target.result;
					imgPreview.classList.add('image-preview'); // Add class for styling
					previewContainer.appendChild(imgPreview);
				}

				reader.readAsDataURL(file);
			}
		});
	</script>
</body>

</html>