<%@page import="com.errorbros.entity.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Search</title>
   <style>
.center-container {
	width: 80%;
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

.member-table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	text-align: left;
	border: 1px solid #ddd;
}

th {
	background-color: #f5f5f5;
}

button {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 8px 15px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

button:hover {
	background-color: #e0e0e0;
}

a {
	text-decoration: none; 
 } 

#머리 th, #머리 td, #몸 td{
    text-align: center;      
    vertical-align: middle;        
}
</style>
</head>

<body>
	<jsp:include page="Head.jsp" />
  

    <div class="center-container">
        <h1>멤버 관리</h1>
        <table class="member-table">
            <thead id="머리">
                <tr>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>전화번호</th>
                    <th>이메일</th>
                    <th>생년월일</th>
                    <th>성별</th>
                    <th>수정</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody id="몸">
                <c:forEach var="member" items="${allMember}"> <%-- JSTL 사용 --%>
                        <tr>
                            <td>${member.mem_id}</td>
                            <td>${member.mem_nm}</td>
                            <td>${member.mem_phone}</td>
                            <td>${member.mem_email}</td>
                            <td>
                                <fmt:formatDate value="${member.mem_birthdate}" pattern="yyyy-MM-dd" />
                            </td> <%-- JSTL fmt 사용 --%>
                                <td>${member.mem_gender}</td>
                                 <td><a href="goUpdateMemberAdmin?mem_id=${member.mem_id}"><button>수정</button></a></td>
                                <td><a href="deleteMember?mem_id=${member.mem_id}"><button>삭제</button></a></td>
                        </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</body>

</html>