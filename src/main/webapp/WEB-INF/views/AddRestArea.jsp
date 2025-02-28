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
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  min-height: 300px;
  gap: 20px;
}

.admin-panel {
  display: flex;
  gap: 20px;
}

.member-list, .show-restarealist {
  background-color: #f2f2f2; /* 배경색과 동일한 색상 */
  color: #333; /* 글자색 */
  border: 1px solid #ccc; /* 테두리 추가 */
  padding: 15px 30px;
  font-size: 18px;
  cursor: pointer;
  border-radius: 8px;
  transition: all 0.3s ease;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 그림자 효과 감소 */
  display: flex;
  justify-content: center;
  align-items: center;
}

.member-list:hover, .show-restarealist:hover {
  border: 1px solid #aaa; /* 호버 시 테두리 색상 변경 */
  box-shadow: 0 3px 7px rgba(0, 0, 0, 0.15); /* 호버 시 그림자 효과 증가 */
  transform: translateY(-2px); /* 호버 시 살짝 위로 이동 */
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