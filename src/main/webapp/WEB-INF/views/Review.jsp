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

#reviewForm button[type="submit"] {
	padding: 10px 20px;
	font-size: 16px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	margin-top: 20px; /* 버튼과 별점 사이 여백 추가 */
}

.review-wrapper {
	border: 2px solid #ccc;
	/* 테두리 스타일 */
	padding: 20px;
	/* 내부 여백 */
	border-radius: 10px;
	/* 모서리 둥글게 */
	margin-bottom: 20px;
	/* 아래쪽 여백 */
}

.center-container {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	flex-grow: 1;
}

.star-rating {
	font-size: 24px;
	color: lightgray;
	cursor: pointer;
	display: flex;
}

.star {
	font-size: 2rem;
	color: lightgray;
	cursor: pointer;
	display: inline-block;
	position: relative;
	width: 30px;
}

.star::before {
	content: '\2605';
	position: absolute;
	left: 0;
	width: 100%;
	overflow: hidden;
	color: lightgray;
}

.star.full::before {
	color: gold;
}

.star.half::before {
	content: '\2605';
	position: absolute;
	width: 50%;
	color: gold;
	overflow: hidden;
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

	<!-- 내비게이션 -->
	<div class="nav">
		<div class="logo">404</div>
	</div>

	<!-- 카테고리 메뉴 -->
	<div class="menu">
		<a href="goMain">휴게소 찾기</a> <a href="goReview">리뷰게시판</a>
	</div>


	<div class="center-container">
		<div class="review-wrapper" id="review-wrapper">
			<h2>리뷰 작성</h2>
			<form id="reviewForm">
				<label for="reviewContent">리뷰 내용:</label><br>
				<textarea id="reviewContent" name="reviewContent" rows="4" cols="50"
					required></textarea>
				<br> <br> <label for="reviewRating">평점:</label>
				<div id="starRating" class="star-rating">
					<span class="star" data-rating="1"></span> <span class="star"
						data-rating="2"></span> <span class="star" data-rating="3"></span>
					<span class="star" data-rating="4"></span> <span class="star"
						data-rating="5"></span>
				</div>
				<br> <input type="hidden" id="reviewRating" name="reviewRating"
					value="0"> <br>
				<button type="submit">리뷰 등록</button>
			</form>
		</div>
	</div>

	<script>
	document.addEventListener("DOMContentLoaded", function () {
	    const stars = document.querySelectorAll('#starRating .star');
	    const reviewRatingInput = document.getElementById('reviewRating');
	    let currentRating = 0;

	    stars.forEach(star => {
	        star.addEventListener('mousemove', (event) => {
	            const rect = star.getBoundingClientRect();
	            const offsetX = event.clientX - rect.left;
	            const width = rect.width;
	            let rating = parseInt(star.dataset.rating);

	            if (offsetX < width / 2) {
	                rating -= 0.5;
	            }

	            highlightStars(rating);
	        });

	        star.addEventListener('click', (event) => {
	            const rect = star.getBoundingClientRect();
	            const offsetX = event.clientX - rect.left;
	            const width = rect.width;
	            let rating = parseInt(star.dataset.rating);

	            if (offsetX < width / 2) {
	                rating -= 0.5;
	            }

	            currentRating = rating;
	            reviewRatingInput.value = rating;
	            highlightStars(rating);
	        });

	        star.addEventListener('mouseleave', () => {
	            highlightStars(currentRating);
	        });
	    });

	    function highlightStars(rating) {
	        const roundedRating = Math.round(rating * 2) / 2; // 0.5 단위 반올림
	        stars.forEach(star => {
	            const starRating = parseInt(star.dataset.rating);
	            star.classList.remove('full', 'half');

	            if (starRating <= roundedRating) {
	                star.classList.add('full');
	            } else if (starRating - 0.5 === roundedRating) {
	                star.classList.add('half');
	            }
	        });
	    }

	    if (reviewRatingInput.value > 0) {
	        currentRating = parseFloat(reviewRatingInput.value);
	        highlightStars(currentRating);
	    }
	});
    </script>
</body>

</html>