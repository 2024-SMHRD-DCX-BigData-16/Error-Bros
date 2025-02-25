<%@page import="com.errorbros.entity.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>휴게소 정보</title>
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
	background-color: #f8f9fa;
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

/* 음식 리스트 스타일 */
.food-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 10px;
	margin-top: 20px;
}

.food-item {
	background: white;
	padding: 15px;
	border-radius: 5px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	text-align: center;
	width: 150px;
	border: 1px solid #ddd;
}

.food-item img {
	width: 100%;
	height: 100px;
	object-fit: cover;
	border-radius: 5px;
}

.food-item p {
	margin: 5px 0;
	font-size: 14px;
}

.food-item button {
	margin-top: 5px;
	background-color: blue;
	color: white;
	border: none;
	padding: 5px;
	cursor: pointer;
	border-radius: 3px;
}

.food-item button.admin-btn {
	background-color: #f0f0f0;
	color: #333;
	border: 1px solid #ccc;
	padding: 5px 10px;
	margin: 5px;
	cursor: pointer;
	border-radius: 3px;
}

/* 음식 주문 버튼 */
.order-btn {
	background-color: blue;
	padding: 10px 15px;
	font-size: 16px;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	white-space: nowrap; /* 버튼이 너무 길어지는 걸 방지 */
}

.order-container {
	position: fixed;
	bottom: 10px;
	left: 50%;
	transform: translateX(-50%);
	width: 90%;
	background-color: orange;
	padding: 15px;
	font-size: 16px;
	color: white;
	display: flex;
	justify-content: space-between;
	align-items: center;
	border-radius: 5px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.total-price {
	font-weight: bold;
	font-size: 18px;
	color: white;
}
</style>
</head>

<body>

	<!-- 상단바 -->
	<div class="top-bar">
		<%
		MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
		%>
		<%
		if (loginMember != null) {
		%>
		<span><%=loginMember.getMem_nm()%>님 환영합니다.</span> <a href="logOut">로그아웃</a>
		<a href="goMypage">마이페이지</a>
		<%
		if ("admin".equals(loginMember.getMem_id())) {
		%>
		<a href="goAdmin">관리하기</a>
		<%
		}
		%>
		<%
		} else {
		%>
		<a href="goLogin">로그인</a> <a href="goJoin">회원가입</a>
		<%
		}
		%>
	</div>

	<<<<<<< HEAD
	<!-- 내비게이션 -->
	<div class="nav">
		<div class="logo">404</div>
	</div>

	<!-- 카테고리 메뉴 -->
	<div class="menu">
		<a href="goMain">휴게소 찾기</a> <a href="goReview">리뷰게시판</a>
		<%
		if (loginMember != null && "admin".equals(loginMember.getMem_id())) {
			String rest_idx = (String) request.getParameter("rest_idx");
		%>
		<a href="addMenu?rest_idx=${param.rest_idx}"
			style="position: absolute; right: 20px;">메뉴 추가하기</a>
		<%
		}
		%>
	</div>

	<!-- 음식 목록 -->
	<div class="food-container" id="foodContainer">
		<c:forEach var="menu" items="${menuList}">
			<div class="food-item">
				<p>
					<strong>${menu.menu_nm}</strong>
				</p>
				<img src="${menu.menu_img}" alt="${menu.menu_nm}" />
				<p>${menu.menu_price}원</p>
				<button
					onclick="selectFood('${menu.menu_nm}', ${menu.menu_price}, this)"
					style="background-color: blue; color: white;">선택</button>
				<%
				if (loginMember != null && "admin".equals(loginMember.getMem_id())) {
				%>
				<button class="admin-btn"
					onclick="location.href='editMenu/${menu.menu_idx}'">수정</button>
				<button class="admin-btn"
					onclick="location.href='deleteMenu/${menu.menu_idx}'">삭제</button>
				<%
				}
				%>
			</div>
		</c:forEach>
	</div>

	<div class="order-container">
		<span class="total-price" id="totalPriceDisplay">총 가격: 0원</span>
		<button class="order-btn" onclick="placeOrder()">음식 주문하기</button>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
    let totalPrice = 0; // 총 가격 변수

    function selectFood(menuName, menuPrice, button) {
        // 선택된 메뉴 정보 (필요에 따라 사용)
        console.log("선택된 메뉴:", menuName, menuPrice);

        // 총 가격 업데이트
        totalPrice += menuPrice;
        $("#totalPriceDisplay").text("총 가격: " + totalPrice + "원");

        // 선택 효과 (선택/취소 토글)
        if (button.style.backgroundColor === "blue") {
            button.style.backgroundColor = "gray"; // 선택 취소
            button.style.color = "black";
        } else {
            button.style.backgroundColor = "blue"; // 선택
            button.style.color = "white";
        }
    }

    function placeOrder() {
        if (totalPrice === 0) {
            alert("음식을 선택해주세요.");
            return;
        }
        // 주문 처리 로직 (예: 서버에 주문 정보 전송)
        alert("총 " + totalPrice + "원 주문 완료!");
        // 주문 후 초기화 (선택 취소, 총 가격 0으로 초기화 등)
        totalPrice = 0;
        $("#totalPriceDisplay").text("총 가격: 0원");
        // 모든 선택된 버튼의 스타일 초기화
        $(".food-item button").css("background-color", "blue");
        $(".food-item button").css("color", "white");

        // 추가적으로 필요한 로직 (예: 주문 내역 저장, 페이지 이동 등)
    }
        
 
        
    </script>



</body>


</html>