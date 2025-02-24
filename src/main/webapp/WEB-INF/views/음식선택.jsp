<%@page import="com.errorbros.entity.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember"); // 세션에서 로그인 정보 가져오기
    %>
    <% if (loginMember!= null) { %>
        <span><%= loginMember.getMem_nm() %>님 환영합니다.</span> <a href="logOut">로그아웃</a> <a href="goMypage">마이페이지</a>
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
        <a href="goMain">휴게소 찾기</a>
        <a href="goReview">리뷰게시판</a>
    </div>

    <!-- 음식 목록 -->
    <div class="food-container" id="foodContainer">
        <!-- 음식 아이템들이 추가될 자리 -->
    </div>

    <!-- 음식 주문 버튼 -->
    <div class="order-container">
        <span class="total-price">총 가격: 0원</span>
        <button class="order-btn" onclick="placeOrder()">음식 주문하기</button>
    </div>

    <script>
        
        let selectedFoods = [];

        // 더미 데이터 (실제 백엔드 없이 테스트용)
        const dummyFoods = [
            { name: "보리비빔밥", price: 9000, image: "img/비빔.png" },
            { name: "포크커틀렛", price: 6500 },
            { name: "왕돈까스", price: 11000 },
            { name: "칼국수", price: 8000 },
            { name: "우동", price: 7000 }
        ];

        // 음식 데이터를 화면에 표시
        function loadFoods() {
            const foodContainer = document.getElementById("foodContainer");
            foodContainer.innerHTML = ""; // 기존 목록 초기화

            dummyFoods.forEach(food => {
                let foodItem = document.createElement("div");
                foodItem.classList.add("food-item");

                foodItem.innerHTML = `
                <p><strong>${food.name}</strong></p>
                <img src="${food.image}" alt="${food.name}" />
                    <p>${food.price}원</p>
                    <button onclick="selectFood('${food.name}', ${food.price}, this)" style="background-color: blue; color: white;">선택</button>
        `;

            foodContainer.appendChild(foodItem);
            });
        }

        function selectFood(name, price, button) {
            let foodIndex = selectedFoods.findIndex(food => food.name === name);

            if (foodIndex === -1) {
                // 선택되지 않은 경우: 리스트에 추가 + 색 변경
                selectedFoods.push({ name, price });
                button.style.backgroundColor = "gray";
                button.textContent = "선택됨"; // 버튼 텍스트 변경
            } else {
                // 이미 선택된 경우: 리스트에서 제거 + 색 원래대로 복구
                selectedFoods.splice(foodIndex, 1);
                button.style.backgroundColor = "blue";
                button.textContent = "선택"; // 버튼 텍스트 원래대로 변경
            }

            updateTotalPrice();
        }

        function updateTotalPrice() {
            let totalPrice = selectedFoods.reduce((sum, food) => sum + food.price, 0);
            document.querySelector(".total-price").textContent = `총 가격: ${totalPrice.toLocaleString()}원`;
        }

        function placeOrder() {
            if (selectedFoods.length === 0) {
                alert("음식을 선택해주세요!");
                return;
            }

            let queryString = selectedFoods.map(food => `name=${food.name}&price=${food.price}`).join("&");
            window.location.href = `payment.html?${queryString}`;
        }

        // 페이지 로드 시 음식 데이터 불러오기
        document.addEventListener("DOMContentLoaded", loadFoods);
        
    </script>




</body>

<!-- 카카오 페이 기능 -->
<script type="text/javascript">
    // 카카오페이 결제 팝업창 연결
    $(function() {
        $("#btn-kakao-pay-ready").click(function(e) {
            // 아래 데이터 외에도 필요한 데이터를 원하는 대로 담고, Controller에서 @RequestBody로 받으면 됨
            let data = {
                name: '상품명',    // 카카오페이에 보낼 대표 상품명
                totalPrice: ${totalPrice.toLocaleString()}// 총 결제금액
            };
          
            $.ajax({
                type: 'POST',
                url: '/order/pay/ready',
                data: JSON.stringify(data),
                contentType: 'application/json',
                success: function(response) {
                    location.href = response.next_redirect_pc_url;
                }
            });
        });
    });
</script>


</html>