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
            width: 50%;
            /* 가운데 정렬을 위해 width 설정 */
            margin: 20px auto;
            /* 가운데 정렬을 위한 margin 설정 */
            border: 1px solid #ccc;
            /* 테두리 추가 */
            padding: 20px;
            /* 내부 여백 추가 */
            border-radius: 5px;
            /* 둥근 모서리 */
        }

        #reviewForm label {
            display: block;
            /* label을 블록 요소로 만들어 한 줄에 하나씩 표시 */
            margin-bottom: 5px;
        }

        #reviewForm textarea,
        #reviewForm select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .star-rating {
            font-size: 20px;
            color: lightgray;
            cursor: pointer;
        }

        .star-rating .star {
            display: inline-block;
            width: 1em;
            /* 별표 문자 폭만큼 공간 확보 */
            height: 1em;
            /* 별표 문자 높이만큼 공간 확보 */
            position: relative;
            /* 자식 요소 위치 기준점 설정 */
            overflow: hidden;
            /* 별표 문자 반쪽만 보이도록 숨김 */
            color: lightgray;
            /* 기본 별 색상 */
            cursor: pointer;
        }

        .star-rating .star::before {
            content: '\2605';
            /* 별표 문자 */
            position: absolute;
            /* 부모 요소 기준 위치 설정 */
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }

        .star-rating .star.active::before {
            color: gold;
            /* 활성화된 별 색상 */
        }

        /* 반쪽 별표를 위한 스타일 */
        .star-rating .star[data-rating="0.5"]::before,
        .star-rating .star[data-rating="1.5"]::before,
        .star-rating .star[data-rating="2.5"]::before,
        .star-rating .star[data-rating="3.5"]::before,
        .star-rating .star[data-rating="4.5"]::before {
            width: 50%;
            /* 별표 문자 반쪽만 보이도록 폭 조절 */
            overflow: hidden;
        }
    </style>
</head>

<body>

    <!-- 상단바 -->
    <!-- 상단바 -->
    <div class="top-bar">
        <% MemberDTO loginMember=(MemberDTO) session.getAttribute("loginMember"); // 세션에서 로그인 정보 가져오기 %>
            <% if (loginMember!=null) { %>
                <span>
                    <%= loginMember.getMem_nm() %>님 환영합니다.
                </span> <a href="logOut">로그아웃</a> <a href="goMypage">마이페이지</a>
                <% } else { %>
                    <a href="goLogin">로그인</a>
                    <a href="goJoin">회원가입</a>
                    <% } %>
    </div>

    <!-- 내비게이션 -->
    <div class="nav">
        <div class="logo">404</div>
    </div>

    <!-- 카테고리 메뉴 -->
    <div class="menu">
        <a href="#">휴게소 찾기</a>
        <a href="#">리뷰게시판</a>
    </div>


    <div class="center-container">
        <h2>리뷰 작성</h2>
        <form id="reviewForm">
            <label for="reviewContent">리뷰 내용:</label><br>
            <textarea id="reviewContent" name="reviewContent" rows="4" cols="50" required></textarea><br><br>

            <label for="reviewRating">평점:</label>
            <div id="starRating" class="star-rating">
                <span class="star" data-rating="0.5">★</span>
                <span class="star" data-rating="1">★</span>
                <span class="star" data-rating="1.5">★</span>
                <span class="star" data-rating="2">★</span>
                <span class="star" data-rating="2.5">★</span>
                <span class="star" data-rating="3">★</span>
                <span class="star" data-rating="3.5">★</span>
                <span class="star" data-rating="4">★</span>
                <span class="star" data-rating="4.5">★</span>
                <span class="star" data-rating="5">★</span>
            </div>
            <input type="hidden" id="reviewRating" name="reviewRating" value="0">
            <button type="submit">리뷰 등록</button>
        </form>
    </div>

    <button type="submit">리뷰 등록</button>
    </form>
    </div>

    <script>
        const stars = document.querySelectorAll('#starRating .star');
        const reviewRatingInput = document.getElementById('reviewRating');

        stars.forEach(star => {
            star.addEventListener('click', () => {
                const rating = parseFloat(star.dataset.rating); // 반점수 포함

                stars.forEach(s => s.classList.remove('active'));

                for (let i = 0; i < stars.length; i++) {
                    if (parseFloat(stars[i].dataset.rating) <= rating) {
                        stars[i].classList.add('active');
                    }
                }

                reviewRatingInput.value = rating;
            });
        });
    </script>
</body>

</html>