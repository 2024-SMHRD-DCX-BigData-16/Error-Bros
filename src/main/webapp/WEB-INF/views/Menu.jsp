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

</style>
		<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>

<body>
<jsp:include page="Head.jsp" />
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
	                window.location.href = "/controller/goMenu?rest_idx="+${hugesoInfo.rest_idx};
	            }
	        }
	    );
	};

	button.addEventListener("click", onClickPay);
 
        
    </script>



</body>


</html>