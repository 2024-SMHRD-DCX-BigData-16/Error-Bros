<%@page import="com.errorbros.entity.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Search</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
            cursor: pointer;
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

        .center-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            flex-grow: 1;
        }

        .hu-text {
            font-size: 60px;
            font-weight: bold;
            color: green;
            margin-bottom: 20px;
        }
        /* 검색창 스타일 */
        .search-container {
            position: relative;
            width: 500px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .search-box {
            display: flex;
            align-items: center;
            width: 100%;
            border: 1px solid #dfe1e5;
            border-radius: 25px;
            padding: 10px 15px;
            box-shadow: 0 1px 6px rgba(32, 33, 36, 0.28);
            background: white;
        }
        .search-box input {
            flex: 1;
            border: none;
            outline: none;
            font-size: 18px;
            padding: 5px;
        }
        .search-btn {
            background-color: yellow;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
        }
        
        .buttons {
            display: none;
            margin-top: 20px;
        }
        .buttons button {
            padding: 10px 15px;
            margin: 5px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .order-btn { background-color: orange; color: white; }
        .info-btn { background-color: blue; color: white; }
    </style>
</head>
<body>

    <!-- 상단바 -->
    <div class="top-bar">
        <% MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember"); %>
        <% if (loginMember!= null) { %>
            <span><%= loginMember.getMem_nm() %>님 환영합니다.</span>
            <a href="logOut">로그아웃</a>
            <a href="goMypage">마이페이지</a>
            <% if ("admin".equals(loginMember.getMem_id())) { %> <a href="goAdmin">관리하기</a> <% } %> <% } else { %> <a href="goLogin">로그인</a>
            <a href="goJoin">회원가입</a>
            <% } %>
    </div>


    <!-- 내비게이션 -->
    <div class="nav">
        <div class="logo">404</div>
    </div>

    <!-- 카테고리 메뉴 -->
    <div class="menu">
        <a href="goMain">휴게소 찾기</a>
        <a href="goReview">리뷰게시판</a>
    </div>

    <!-- 중앙 휴게소 검색창 -->
    <div class="center-container">
        <div class="hu-text">휴게소 검색</div>
        <div class="search-container">
        <c:choose>
			<c:when test="${empty sessionScope.hugesoList }">            
				<div class="search-box">
	           	<form action="searchHugeso" method="post">
	               	<input type="text" name="searchInput" id="searchInput" placeholder="휴게소 검색">
	               	<button type="submit" class="search-btn" onclick="showButtons()">검색</button>
	           	</form>
	           </div>
			</c:when>
         	<c:otherwise>
			  <div class="search-box">
	           	<form action="searchHugeso" method="post">
	               	<input type="text" name="searchInput" id="searchInput" placeholder="휴게소 검색" value="${sessionScope.searchInput}">
	               	<button type="submit" class="search-btn" onclick="showButtons()">검색</button>
	           	</form>
	           </div>
			      <c:forEach items="${hugesoList }" var="hugeso" varStatus="status">
					<!-- 검색 버튼을 누르면 나타나는 리스트 -->
					<table>
					<tr>
						<th>휴게소 이름</th>
						<th><a href="goMap"><button class="order-btn">음식 주문하기</button></a></th>
					</tr>
					<tr>
						<td>
							${hugeso.rest_nm}        
						</td>
						<td>
							<a href="showHugeso?rest_idx=${hugeso.rest_idx}"><button class="info-btn">휴게소 정보보기</button></a>
						</td>
					</tr>
			      </c:forEach>
			      
					</table>
			   </table>
			</c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>

