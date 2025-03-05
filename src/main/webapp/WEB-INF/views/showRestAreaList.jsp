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



h1 {
	text-align: center;
	margin-bottom: 20px;
}

.rest-table {
	width: 100%;
	border-collapse: collapse;
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
	background-color: #e9e9e9;
}

a {
	text-decoration: none; /* 링크 밑줄 제거 */
	text-decoration-line: none; !important
}

.pagination {
	margin-top: 20px;
	text-align: center;
}

.pagination a {
	display: inline-block;
	margin: 0 5px;
	padding: 8px 12px;
	background-color: #f0f0f0;
	color: #333;
	border: 1px solid #ddd;
	border-radius: 5px;
	transition: background-color 0.3s ease;
}

.pagination a:hover {
	background-color: #e0e0e0;
}

.pagination a.active {
	background-color: #007bff;
	color: #fff;
	border-color: #007bff;
}
#머리 th {
    text-align: center;       /* 가로 중앙 정렬 */
    vertical-align: middle;   /* 세로 중앙 정렬 */       
}
#머리 td {
    text-align: center;       /* 가로 중앙 정렬 */
    vertical-align: middle;   /* 세로 중앙 정렬 */
} 
#몸 td {
    text-align: center;       /* 가로 중앙 정렬 */
    vertical-align: middle;   /* 세로 중앙 정렬 */
} 
</style>
</head>

<body>
	<jsp:include page="Head.jsp" />
	

	<div class="center-container">
        <h1>휴게소 관리 <a href="goAddRestArea"><button class="addRestArea">휴게소 추가</button></a></h1>

            


        <table class="rest-table">
            <thead id="머리">
                <tr>
                    <th>ID</th>
                    <th>이름</th>
                    <th>주소</th>
                    <th>편의시설</th>
                    <th>리뷰</th>
                    <th>메뉴</th>
                    <th>수정</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody id="몸">
                <c:forEach var="hugeso" items="${adminhugesoList}">
                    <tr>
                        <td>${hugeso.rest_idx}</td>
                        <td>${hugeso.rest_nm}</td>
                        <td>${hugeso.rest_addr}</td>
                        <td>${hugeso.rest_facilities}</td>
                        <td><a href="goAdminReviewList?rest_idx=${hugeso.rest_idx}"><button class="AdminReview">리뷰 관리</button></a></td>
                        <td><a href="goAdminMenu?rest_idx=${hugeso.rest_idx}"><button class="AdminMenu">메뉴 관리</button></a></td>
                        <td><a href="goUpdateRestArea?rest_idx=${hugeso.rest_idx}"><button class="addrestarea">수정</button></a></td>
                        <td><a href="deleteRestArea?rest_idx=${hugeso.rest_idx}"><button >삭제</button></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="pagination">
            <c:if test="${adminHugesoListpage > 1}">
                <a href="hugesoList?page=${adminHugesoListpage - 1}">이전</a>
            </c:if>

            <c:forEach var="i" begin="1" end="${(adminHugesoTotalCount + 9) / 10}">
                <a href="hugesoList?page=${i}" ${adminHugesoListpage == i ? 'class="active"' : ''}>${i}</a>
            </c:forEach>

            <c:if test="${adminHugesoListpage < (adminHugesoTotalCount + 9) / 10}">
                <a href="hugesoList?page=${adminHugesoListpage + 1}">다음</a>
            </c:if>
        </div>

    </div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


</body>

</html>