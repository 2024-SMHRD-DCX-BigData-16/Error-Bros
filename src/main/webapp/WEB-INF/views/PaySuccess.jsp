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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style type="text/css">
h1 	{
	text-align: center;
}
</style>
</head>

<body>
	<jsp:include page="Head.jsp" />
	
	<div class="center-container">
	<h1 >결제 완료</h1>
	<table>
            <thead>
               <tr>
                  <th>회원 아이디</th>
                  <th>주문 내역</th>
                  <th>결제 금액</th>
                  <th>대기 번호</th>
               </tr>
            </thead>
            <tbody>
                  <tr>
                     <td>${successorder.mem_id}</td>
                     <td>${successorder.order_menu}</td>
                     <td>${successorder.order_amount}</td>
                     <td>${hugesoInfo.rest_waiting }</td>
                  </tr>
               <c:if test="${empty successorder}">
                  <tr>
                     <td colspan="5">결제 되지 않았습니다</td>
                  </tr>
               </c:if>
            </tbody>
         </table>
	</div>
	
	
</body>
</html>