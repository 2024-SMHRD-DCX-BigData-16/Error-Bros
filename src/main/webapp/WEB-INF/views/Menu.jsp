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
.food-container {
   display: grid;
   grid-template-columns: repeat(4, 1fr);
   gap: 10px;
   margin-top: 20px; 
   padding-bottom: 80px;
}

.food-item {
   background: white;
   padding: 15px;
   border-radius: 5px;
   box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
   text-align: center;
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

.food-item .select-btn {
   margin-top: 5px;
   background-color: blue;
   color: white;
   border: none;
   padding: 5px 10px;
   cursor: pointer;
   border-radius: 3px;
}

.food-item .select-btn.selected {
   background-color: gray;
   color: black;
}

.food-item .admin-btn {
   background-color: #f0f0f0;
   color: #333;
   border: 1px solid #ccc;
   padding: 5px 10px;
   margin: 5px;
   cursor: pointer;
   border-radius: 3px;
}

.order-btn {
    background-color: white;
    padding: 5px 10px;
    font-size: 16px;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    white-space: nowrap;
    height: 30px;
    display: flex; /* Flexbox 레이아웃 사용 */
    justify-content: center; /* 가로 방향 가운데 정렬 */
    align-items: center; /* 세로 방향 가운데 정렬 */
    height: 60px; /* 기본 높이 설정 */
}

.order-container {
    position: fixed;
    bottom: 5px;
    left: 50%;
    transform: translateX(-50%);
    width: 20%;
    background-color: gray;
    padding: 5px;
    font-size: 16px;
    color: white;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-radius: 5px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    height: 70px; /* 기본 높이 설정 */
}

@media (max-width: 768px) {
    .order-container {
        height: 60px; /* 모바일 환경에서 높이 증가 */
        font-size: 18px; /* 모바일 환경에서 폰트 크기 증가 */
        padding: 10px; /* 모바일 환경에서 패딩 증가 */
        width: 80%; /* 모바일 환경에서 width값 증가 */
    }
}

@media (min-width: 769px) and (max-width: 1024px) {
    .order-container {
        height: 50px; /* 태블릿 환경에서 높이 중간 크기로 설정 */
    }
}

.total-price {
   font-weight: bold;
   font-size: 16px;
   color: white;
}
</style>
		<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>

<body>

	<jsp:include page="Head.jsp" />
	
		<% MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
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
				<img src="resources/menuimg/${menu.menu_img}.jpg" alt="${menu.menu_nm}" />
				<p>${menu.menu_price}원</p>
				<button
					onclick="selectFood('${menu.menu_nm}', ${menu.menu_price}, this)"
					style="background-color: wheat; color: white;">선택</button>
				<%
				if (loginMember != null && "admin".equals(loginMember.getMem_id())) {
				%>
				<a href='goEditMenu?rest_idx=${param.rest_idx }&menu_idx=${menu.menu_idx}'>
				<button class="admin-btn">수정</button>
				</a>
				<a href='deleteMenu?rest_idx=${param.rest_idx }&menu_idx=${menu.menu_idx}'>
				<button class="admin-btn">삭제</button>
				</a>
				<%
				}
				%>
			</div>
		</c:forEach>
	</div>

	<div class="order-container">
		<span class="total-price" id="totalPriceDisplay">총 가격: 0원</span>
		<button class="order-btn" id="payButton">음식 주문하기</button>

	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	let totalPrice = 0; // 총 가격 변수
	let selectedMenus = {}; // 선택된 메뉴 목록 (객체로 변경)

	function selectFood(menuName, menuPrice, button) {
	    // 선택된 메뉴 정보 (필요에 따라 사용)
	    console.log("선택된 메뉴:", menuName, menuPrice);

	    // 선택 효과 (선택/취소 토글)
	    if (selectedMenus[menuName]) {
	        // 선택 취소
	        button.style.backgroundColor = "blue";
	        button.style.color = "white";

	        totalPrice -= menuPrice;
	        delete selectedMenus[menuName]; // 메뉴 목록에서 제거
	    } else {
	        // 선택
	        button.style.backgroundColor = "gray";
	        button.style.color = "black";

	        totalPrice += menuPrice;
	        selectedMenus[menuName] = menuPrice; // 메뉴 목록에 추가
	    }

	    // 총 가격 업데이트
	    $("#totalPriceDisplay").text("총 가격: " + totalPrice + "원");
	}

	function placeOrder() {
	    if (totalPrice === 0) {
	        alert("음식을 선택해주세요.");
	        return;
	    }

	    // 서버에 주문 정보 전송 (AJAX 사용 예시)
	    $.ajax({
	        url: "/order", // 주문 처리 URL
	        type: "POST",
	        contentType: "application/json",
	        data: JSON.stringify({
	            totalPrice: totalPrice,
	            menus: Object.keys(selectedMenus).map(name => ({
	                name: name,
	                price: selectedMenus[name],
	            })), // 선택된 메뉴 목록을 서버로 전송
	        }),
	        success: function (response) {
	            alert("주문이 완료되었습니다.");
	            // 주문 완료 후 처리 (예: 주문 내역 표시)
	        },
	        error: function (error) {
	            console.error(error);
	            alert("주문 처리 중 오류가 발생했습니다.");
	        },
	        complete: function () {
	            // 주문 후 초기화
	            totalPrice = 0;
	            selectedMenus = {};
	            $("#totalPriceDisplay").text("총 가격: 0원");

	            // 모든 선택된 버튼의 스타일 초기화
	            $(".food-item button").css("background-color", "blue");
	            $(".food-item button").css("color", "white");
	        },
	    });

	    // 추가적으로 필요한 로직 (예: 주문 내역 저장, 페이지 이동 등)
	}


	let uuid = self.crypto.randomUUID();
	console.log(uuid);
	IMP.init("imp66154156");
	sessionStorage.setItem('uuid', uuid);
	let storedUuid = sessionStorage.getItem('uuid');
	console.log('세션에 저장된 UUID:', storedUuid);
	const button = document.querySelector("#payButton");

	const onClickPay = async () => {
	    // 선택된 메뉴 이름들을 "메뉴1, 메뉴2" 형식으로 결합
	    const menuNames = Object.keys(selectedMenus).join(", ");
	    
		/* // newMerchantUid 요청하여 order_id 받기
		const response = await fetch('/controller/newMerchantUid', {
		    method: 'GET',
		});

		
		const data = await response.json();
		console.log('생성된 order_id:', data.orderId); */

	    IMP.request_pay(
	        {
	            channelKey: "channel-key-b9f4d268-bf41-4bdd-ba4d-1c5d1a65284f",
	            pay_method: "card",
	            merchant_uid: storedUuid, // 주문 고유 번호
	            name: menuNames, // 선택한 메뉴 이름들
	            amount: totalPrice, // 총 가격
	            buyer_email: `${loginMember.mem_email}`, // 세션 이메일 사용
	            buyer_name: `${loginMember.mem_id}`, // 세션 이름 사용
	            buyer_tel: `${loginMember.mem_phone}`, // 세션 폰번호 사용
	            m_redirect_url: "http://localhost:8089/controller/payment/redirect" // 모바일 리다이렉트 URL 추가
	        },
	        async (response) => {
	            if (response.error_code != null) {
	                return alert(`결제에 실패하였습니다. 에러 내용: ${response.error_msg}`);
	            }

	            // PC 환경: 결제 성공 시 서버에 결제 정보 전달하여 검증
	            const notified = await fetch(`http://localhost:8089/controller/payment/complete`, {
	                method: "POST",
	                headers: { "Content-Type": "application/json" },
	                body: JSON.stringify({
	                    imp_uid: response.imp_uid,
	                    merchant_uid: response.merchant_uid,
	                    pay_method: "card",
	    	            name: menuNames, // 선택한 메뉴 이름들
	    	            amount: totalPrice, // 총 가격
	    	            buyer_email: `${loginMember.mem_email}`, // 세션 이메일 사용
	    	            buyer_name: `${loginMember.mem_id}`, // 세션 이름 사용
	    	            buyer_tel: `${loginMember.mem_phone}` // 세션 폰번호 사용
	                }),
	            });
				console.log(notified)
	            if (notified.ok) {
	                window.location.href = "/controller/goMain";
	            } else {
	                window.location.href = `/controller/goMenu?rest_idx=${param.rest_idx}`;
	            }
	        }
	    );
	};

	button.addEventListener("click", onClickPay);
 
        
    </script>



</body>


</html>