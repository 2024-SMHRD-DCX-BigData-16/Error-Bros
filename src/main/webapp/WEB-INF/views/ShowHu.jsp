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

</style>
</head>
<body>
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

</body>
</html>
