<%@page import="com.errorbros.entity.MemberDTO"%>
<%@page import="com.errorbros.entity.HugesoDTO"%>
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
.center-container {
	width: 30%;
	margin: 20px auto;
	background-color: #e9e9e9;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	margin-bottom: 20px;
}

.input-table {
	width: 100%;
}

.input-table td {
	padding: 10px;
}

.input-table input[type="text"], .input-table input[type="number"],
	.input-table input[type="file"] {
	width: calc(100% - 22px);
	padding: 8px;
	border: 1px solid #ddd;
	border-radius: 5px;
	box-sizing: border-box;
}

.input-table input[type="submit"] {
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
	width: 100%;
	color: #fff;
	border: none;
	padding: 10px 20px;
}

.input-table input[type="submit"]:hover {
	background-color: #0056b3;
}
</style>
</head>

<body>
<jsp:include page="Head.jsp" />


    <div class="center-container">
    	
            <h2>휴게소 정보를 입력 하세요</h2>
    	<div class="review-wrapper" id="review-wrapper">
        <form class="update-form" name="addRestAreaForm" action="addRestArea" method="post">
			<table class="input-table">
			<tr><td><input type="text" name="rest_nm" placeholder="휴게소 이름" required></td></tr>
            <tr><td><input type="text" name="rest_addr" placeholder="휴게소 주소" required></td></tr>
            <tr><td><input type="number" step="0.000001" id="lat" name="lat" placeholder="위도" required></td></tr>
            <tr><td><input type="number" step="0.000001" id="lon" name="lon" placeholder="경도" required></td></tr>
            <tr><td><input type="number"  id="lon" name="parking_lot" placeholder="주차장 수" required></td></tr>
            <tr><td><input type="text" name="rest_facilities" placeholder="편의 시설" required></td></tr>
            <tr><td><input type="text" name="rest_phone" placeholder="휴게소 연락처" required></td></tr>
            <tr><td><input type="file" name="rest_img" placeholder="휴게소 사진" style="float: right;"></td></tr>
            <tr><td><input type="submit" value="휴게소 추가하기"></td></tr>
            </table>
        </form>
        
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   
</body>

</html>