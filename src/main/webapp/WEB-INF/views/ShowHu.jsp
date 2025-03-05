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

<style>
.center-container {
	width: 80%;
	margin: 20px auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.search-container {
	text-align: center;
	margin-bottom: 20px;
}

.search-box {
	position: relative;
	display: inline-block;
	width: 100%;
	max-width: 400px;
	display: flex; 
	margin-top: 5px;
	margin-top: 10px;
}

.search-box input[type="text"] {
	width: 125%;
	padding: 10px;
	padding-right: 90px; /* 버튼 공간 확보 */
	border: 1px solid #ddd;
	border-radius: 5px;
	box-sizing: border-box;
	height: 40px;
	flex-grow: 1;
	
}

.search-btn {
	position: absolute;
	right: 0;
	top: 0;
	width: 60px; /* 버튼 길이 늘리기 */
	height: 50%; /* 검색창과 높이 맞추기 */
	background-color: #e0e0e0;
	border: none;
	border-radius: 0 5px 5px 0; /* 오른쪽 모서리 둥글게 */
	cursor: pointer;
	transition: background-color 0.3s ease;
	padding: 5px 10px;
	font-size: 14px;
	display: flex; /* Flexbox 레이아웃 적용 */
    align-items: center; /* 세로 가운데 정렬 */
    justify-content: center; /* 가로 가운데 정렬 */
}

.search-btn:hover {
	background-color: #e0e0e0;
}

.search-result-table {
	width: 100%;
	border-collapse: collapse;
}

.search-result-table th, .search-result-table td {
	padding: 10px;
	text-align: left;
	border: 1px solid #ddd;
}

.search-result-table th {
	background-color: #f5f5f5;
}

.order-btn, .info-btn {
	background-color: #f0f0f0;
	color: #333;
	border: none;
	padding: 8px 15px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	display: flex; /* Flexbox 레이아웃 적용 */
    align-items: center; /* 세로 가운데 정렬 */
    justify-content: center; /* 가로 가운데 정렬 */
     margin: auto; /* 버튼이 셀 내부에서 가운데 정렬되도록 설정 */
}

.order-btn:hover, .info-btn:hover {
	background-color: #e9e9e9;
}

.no-result-message {
	text-align: center;
	font-size: 18px;
	color: #888;
}

a {
	text-decoration: none; /* 링크 밑줄 제거 */
}
</style>
</head>
<%-- <body>
<jsp:include page="Head.jsp" />

          		<!-- 중앙 휴게소 검색창 -->
			<div class="center-container">
				<div class="search-container">
					<div class="search-box">
						<form action="searchHugeso" method="post">
			           	     <table class="search-result-table">
			                        <tr>
			                            <td><input type="text" name="searchInput" id="searchInput"
			                            placeholder="휴게소 검색" value="${sessionScope.searchInput}"></td>
				                            <td>
				                          			<button type="submit" class="search-btn">검색</button>
				                            </td>
			                        </tr>
			                </table>
						</form>
					</div>
				</div>
             </div> 
  
     
                

	
	<div class="center-container">
			<c:choose>
				<c:when test="${not empty hugesoList}">
					<table class="search-result-table">
						<thead>
							<tr>
								<th>휴게소 이름</th>
								<th>음식 주문</th>
								<th>휴게소 정보</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${hugesoList}" var="hugeso" end="13" >
								<tr>
									<td>${hugeso.rest_nm}</td>
									<td><a href="goMenu?rest_idx=${hugeso.rest_idx}"><button class="order-btn">음식
												주문하기</button></a></td>
									<td><a href="showHugeso?rest_idx=${hugeso.rest_idx}"><button
												class="info-btn">휴게소 정보보기</button></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:when>
				<c:otherwise>
					<div class="no-result-message">검색 결과가 없습니다.</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

</body> --%>
<body>
	<jsp:include page="Head.jsp" />

	<!-- 중앙 휴게소 검색창 -->
	<div class="center-container">
		<div class="search-container">
			<div class="search-box">
				<form action="searchHugeso" method="post">
					<input type="text" name="searchInput" id="searchInput"
						placeholder="휴게소 검색" value="${sessionScope.searchInput}">
					<button type="submit" class="search-btn">검색</button>
				</form>
			</div>
		</div>

		<div class="result-container">
			<c:choose>
				<c:when test="${not empty hugesoList}">
					<table class="search-result-table">
						<thead>
							<tr>
								<th>휴게소 이름</th>
								<th>음식 주문</th>
								<th>휴게소 정보</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${hugesoList}" var="hugeso" end="13">
								<tr>
									<td>${hugeso.rest_nm}</td>
									<td><a href="goMenu?rest_idx=${hugeso.rest_idx}"><button
												class="order-btn">음식 주문하기</button></a></td>
									<td><a href="showHugeso?rest_idx=${hugeso.rest_idx}"><button
												class="info-btn">휴게소 정보보기</button></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:when>
				<c:otherwise>
					<div class="no-result-message">검색 결과가 없습니다.</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

</body>
</html>
