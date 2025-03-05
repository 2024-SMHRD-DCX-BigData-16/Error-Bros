<%@page import="com.errorbros.entity.MemberDTO"%>
<%@page import="com.errorbros.entity.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Error Search</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
h1 {
	text-align: center;
	margin-bottom: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

.tr:hover {
	background-color: #f0f0f0;
}
</style>
</head>
<body>
<jsp:include page="Head.jsp" />
<div class="center-container">
<div>
	<h1>결제 내역</h1><a href="/controller/goMain">메인 페이지로 이동</a>
</div>
	<table>
		<thead>
			<tr>
				<th>주문 번호</th>
				<th>주문 메뉴</th>
				<th>결제 금액</th>
				<th>구매자 이메일</th>
				<th>구매자 이름</th>
				<th>구매자 전화번호</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="payment" items="${paymentList}">
				<tr>
					<td>${payment.order_id}</td>
					<td>${payment.order_menu}</td>
					<td>${payment.order_amount}원</td>
					<td>${loginMember.mem_email}</td>
					<td>${loginMember.mem_nm}</td>
					<td>${loginMember.mem_phone}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>	
</body>
</html>
