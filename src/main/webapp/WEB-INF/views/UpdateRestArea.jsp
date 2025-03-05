<%@page import="com.errorbros.entity.MemberDTO"%>
<%@ page import="com.errorbros.entity.HugesoDTO"%>
<%@ page import="java.util.List"%>
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
.center-container {
	width: 30%;
	margin: 20px auto;
	background-color: #e9e9e9;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

h1 {
	text-align: center;
	margin-bottom: 20px;
}

.form-container {
	width: 100%;
	max-width: 600px;
	margin: 0 auto;
}

.input-table {
	width: 100%;
}

.input-table td {
	padding: 10px;
}

.input-table label {
	display: block;
	margin-bottom: 5px;
}

.input-table input[type="text"], .input-table input[type="number"],
	.input-table textarea {
	width: calc(100% - 22px);
	padding: 8px;
	border: 1px solid #ddd;
	border-radius: 5px;
	box-sizing: border-box;
}

.input-table textarea {
	height: 100px;
}

button[type="submit"] {
	background-color: #e9e9e9;
	width: 100%;
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	display: flex; 
    align-items: center;
    justify-content: center; 
}

button[type="submit"]:hover {
	background-color: #0056b3;
}

.image-preview-container {
	margin-top: 20px;
	text-align: center;
}

.image-preview {
	max-width: 200px;
	max-height: 200px;
}
</style>
</head>

<body>

   	<jsp:include page="Head.jsp" />

	<div class="center-container">
		<h1>휴게소 정보 수정</h1>

		<div class="form-container">
			<div class="review-wrapper" id="review-wrapper">
				<form action="updateRestArea" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="rest_idx" id="rest_idx" value="${selectedHugesoDTO.rest_idx }">
					<table class="input-table">
						<tr>
							<td><label for="rest_nm">휴게소 이름:</label></td>
							<td><input type="text" id="rest_nm" name="rest_nm" value="${selectedHugesoDTO.rest_nm }" required></td> 
						</tr>
						<tr>
							<td><label for="rest_addr">주소:</label></td>
							<td><input type="text" id="rest_addr" name="rest_addr"
								value="${selectedHugesoDTO.rest_addr }" required> 
						</tr>
						<tr>
							<td><label for="lat">위도:</label></td>
							<td><input type="number" step="any" id="lat" name="lat"
								value="${selectedHugesoDTO.lat }" required> 
						</tr>
						<tr>
							<td><label for="lon">경도:</label></td>
							<td><input type="number" step="any" id="lon" name="lon"
								value="${selectedHugesoDTO.lon }" required> 
						</tr>
						<tr>
							<td><label for="parking_lot">주차장 수:</label></td>
							<td><input type="number" step="1" id="parking_lot" name="parking_lot"
								value="${selectedHugesoDTO.parking_lot }" required>
						</tr>
						<tr>
							<td><label for="rest_facilities">편의시설:</label></td>
							<td><textarea id="rest_facilities" name="rest_facilities">${selectedHugesoDTO.rest_facilities }</textarea> 
						</tr>
						<tr>
							<td><label for="rest_phone">휴게소 연락처:</label></td>
							<td><input type="text" name="rest_phone" id="rest_phone" value="${selectedHugesoDTO.rest_phone }" required></td> 
						</tr>
						<tr>
							<td><label for="rest_img">이미지:</label></td>
							<td><input type="file" id="rest_img" name="rest_img"> </td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;">
								<button type="submit">수정</button> 
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
							let confirmation = confirm("휴게소를 수정하시겠습니까?");
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