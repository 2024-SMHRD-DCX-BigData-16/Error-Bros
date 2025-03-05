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
   display: flex;
   flex-wrap: wrap;
   grid-template-columns: repeat(4, 1fr);
   gap: 10px;
   margin-top: 20px; 
   padding-bottom: 80px;
   align-content: space-around;	
   justify-content: space-around;
   flex-direction:row;
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



.food-item .select-btn.selected {
   background-color: gray;
   color: black;
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
.ang {
    display: flex;
    align-items: center;
    justify-content: space-between; /* 내부 요소 간격 균등 배치 */
    width: 100%; /* 가로 전체 차지 */
    height: 5vh; /* 높이를 화면 높이의 5%로 설정 */
    background-color: #f0f0f0; /* 배경색 추가 (가시성 확보) */
    padding: 0 20px; /* 좌우 여백 추가 */
    box-sizing: border-box; /* padding이 width에 포함되도록 설정 */
}

.ang a {
    font-size: 1.2vw; /* 글자 크기를 화면 너비에 비례하여 조절 */
    white-space: nowrap; /* 줄바꿈 방지 */
}
.buttonHome {
	display: flex;
	justify-content: space-around;
	flex-wrap: wrap;
}
.buttonHome button{
	margin: 2px;
}


</style>
		<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>

<body>

	<jsp:include page="Head.jsp" />
	<div class="ang">
		<% MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
		if (loginMember != null && "admin".equals(loginMember.getMem_id())) {
			String rest_idx = (String) request.getParameter("rest_idx");
		%>
		<a href="addMenu?rest_idx=${param.rest_idx}"
			>메뉴 추가하기</a>
		<%
		}
		%>
	<input type="hidden" id="hiddenmemid" value="${loginMember.mem_id}" >
	</div>
	<!-- 음식 목록 -->
	<%-- <div class="food-container" id="foodContainer">
		<c:forEach var="menu" items="${menuList}">
			<div class="food-item">
				<p>
					<strong>${menu.menu_nm}</strong>
				</p>
				<img src="resources/menuimg/${menu.menu_img}.jpg" alt="${menu.menu_nm}" />
				<p>${menu.menu_price}원</p>
				<div class="buttonHome">
				<button class="selectFoodbutton"
					onclick="selectFood('${menu.menu_nm}', ${menu.menu_price}, this)"
					style="background-color: #bdbdbd; color: white;">선택</button>
				<%
				if (loginMember != null && "admin".equals(loginMember.getMem_id())) {
				%>
				<button onclick="location.href='goEditMenu?rest_idx=${param.rest_idx }&menu_idx=${menu.menu_idx}' " class="admin-btn">수정</button>
				
				<button onclick="location.href='deleteMenu?rest_idx=${param.rest_idx }&menu_idx=${menu.menu_idx}' " class="admin-btn">삭제</button>
				
				</div>
				<%
				}
				%>
			</div>
		</c:forEach>
	</div> --%>
	<div class="food-container" id="foodContainer">
    <c:forEach var="menu" items="${menuList}">
        <div class="food-item">
            <p>
                <strong>${menu.menu_nm}</strong>
            </p>
            <img src="resources/menuimg/${menu.menu_img}.jpg" alt="${menu.menu_nm}" />
            <p>${menu.menu_price}원</p>
            <div class="buttonHome">
                <button class="selectFoodbutton"
                    onclick="selectFood('${menu.menu_nm}', ${menu.menu_price}, this)"
                    style="background-color: #bdbdbd; color: white;">선택</button>

                <!-- 관리자일 경우에만 버튼 표시 -->
                <c:if test="${loginMember != null && loginMember.mem_id eq 'admin'}">
                    <button onclick="location.href='goEditMenu?rest_idx=${param.rest_idx}&menu_idx=${menu.menu_idx}'" class="admin-btn">수정</button>
                    <button onclick="location.href='deleteMenu?rest_idx=${param.rest_idx}&menu_idx=${menu.menu_idx}'" class="admin-btn">삭제</button>
                </c:if>
            </div>
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
	           button.style.backgroundColor = "#bdbdbd";
	           button.style.color = "white";
	           button.textContent = "선택";
	           totalPrice -= menuPrice;
	           delete selectedMenus[menuName]; // 메뉴 목록에서 제거
	       } else {
	           // 선택
	           button.style.backgroundColor = "wheat";
	           button.style.color = "black";
	           button.textContent = "선택됨";
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
	            $(".food-item button").css("background-color", "#e0e0e0");
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
	const restIdx = "<%= request.getParameter("rest_idx") %>";
	console.log(restIdx)
	const hiddenmemid = document.getElementById("hiddenmemid").value;
	console.log(hiddenmemid);
	const onClickPay = async () => {
	    // 선택된 메뉴 이름들을 "메뉴1, 메뉴2" 형식으로 결합
	    const menuNames = Object.keys(selectedMenus).join(", ");
	    updateRestWaiting(restIdx);
	    insertPay();
		/* // newMerchantUid 요청하여 order_id 받기
		const response = await fetch('/controller/newMerchantUid', {
		    method: 'GET',
		});
		
		
		const data = await response.json();
		console.log('생성된 order_id:', data.orderId); */

	    IMP.request_pay(
	        {
	            channelKey: "channel-key-b9f4d268-bf41-4bdd-ba4d-1c5d1a65284f",
	            merchant_uid: storedUuid, // 주문 고유 번호
	            pay_method: "card",
	            name: menuNames, // 선택한 메뉴 이름들
	            amount: totalPrice, // 총 가격
	            buyer_email: `${loginMember.mem_email}`, // 세션 이메일 사용
	            buyer_name: `${loginMember.mem_id}`, // 세션 이름 사용
	            buyer_tel: `${loginMember.mem_phone}`, // 세션 폰번호 사용
	            m_redirect_url: "http://localhost:8089/controller/payment/redirect", // 모바일 리다이렉트 URL 추가
	            	notice_url: "https://9531-125-244-144-206.ngrok-free.app"
	        }, function(rsp) {
	            if ( rsp.success ) {
	                window.location.href = "/controller/goPaySuccess";
	            	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	            	jQuery.ajax({
	            		url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
	            		type: 'POST',
	            		dataType: 'json',
	            		data: {
	        	    		imp_uid : rsp.imp_uid
	        	    		//기타 필요한 데이터가 있으면 추가 전달
	            		}
	            	
	            	}).done(function(data) {
	            		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	            		if ( everythings_fine ) {
	            			var msg = '결제가 완료되었습니다.';
	            			msg += '\n고유ID : ' + rsp.imp_uid;
	            			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	            			msg += '\결제 금액 : ' + rsp.paid_amount;
	            			msg += '카드 승인번호 : ' + rsp.apply_num;
	            			
	            			alert(msg);
	            		    setTimeout(function () {
	            		        window.location.href = "/goPaySuccess";
	            		    }, 500);  // 0.5초 후 페이지 이동
	            		} else {
	            			//[3] 아직 제대로 결제가 되지 않았습니다.
	            			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	            		}
	            	});
	            } else {
	                var msg = '결제에 실패하였습니다.';
	                msg += '에러내용 : ' + rsp.error_msg;
	                window.location.href = "/controller/goMain";
	            }
	        }

	    );

	};

	button.addEventListener("click", onClickPay);
	function updateRestWaiting(restIdx) {
	    fetch('/controller/Uprest_waiting', {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/json'
	        },
	        body: JSON.stringify({ rest_idx: restIdx }) // JSON 형태로 서버에 데이터 전달
	    })
	    .then(response => response.json())
	    .then(data => {
	        if (data) {
	            console.log('업데이트 성공!');
	        } else {
	            console.log('업데이트 실패!');
	        }
	    })
	    .catch(error => {
	        console.error('요청 중 오류 발생:', error);
	    });
	}
	function updateRestWaiting(restIdx) {
	    fetch('/controller/Uprest_waiting', {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/json'
	        },
	        body: JSON.stringify({ rest_idx: restIdx }) // JSON 형태로 서버에 데이터 전달
	    })
	    .then(response => response.json())
	    .then(data => {
	        if (data) {
	            console.log('업데이트 성공!');
	        } else {
	            console.log('업데이트 실패!');
	        }
	    })
	    .catch(error => {
	        console.error('요청 중 오류 발생:', error);
	    });
	}    
	/* function insertPay() {
		const menuNames = Object.keys(selectedMenus).join(", ");
		const Order = {
				order_id :storedUuid ,
				mem_id : hiddenmemid,
				rest_idx : restIdx,
				order_amount : totalPrice,
				order_status : "결제 완료",
				pay_method : "card",
				order_menu : menuNames
		};
	    fetch('insertPay', {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/json'
	        },
	        body: JSON.stringify(Order) // JSON 형태로 서버에 데이터 전달
	    })
	    .then(response => response.json())
	    .then(data => {
	        if (data) {
	            console.log('업데이트 성공!');
	        } else {
	            console.log('업데이트 실패!');
	        }
	    })
	    .catch(error => {
	        console.error('요청 중 오류 발생:', error);
	    });
	}     */
	function insertPay() {
	    // 선택된 메뉴의 이름을 가져와 쉼표(,)로 구분하여 문자열로 만듦
	    const menuNames = Object.keys(selectedMenus).join(", ");

	    // 주문 정보를 JSON 객체로 생성
	    const Order = {
	        order_id: storedUuid,       // 주문 ID (고유한 식별자)
	        mem_id: hiddenmemid,        // 회원 ID
	        rest_idx: restIdx,          // 음식점 ID
	        order_amount: totalPrice,   // 총 결제 금액
	        order_status: "결제 완료",   // 주문 상태 (결제 완료)
	        pay_method: "card",         // 결제 방식 (카드)
	        order_menu: menuNames       // 주문한 메뉴 리스트 (쉼표로 구분된 문자열)
	    };
	    console.log(Order)
	    // jQuery의 AJAX 요청을 사용하여 서버에 데이터 전송
	    $.ajax({
	        url: 'insertPay', // 서버의 엔드포인트 (컨트롤러에서 매핑된 URL과 일치해야 함)
	        type: 'POST', // HTTP 메서드 (POST 요청)
	        contentType: 'application/json', // 서버로 전송할 데이터의 형식을 JSON으로 지정
	        data: JSON.stringify(Order), // JavaScript 객체를 JSON 문자열로 변환하여 전송
	        dataType: 'json', // 서버에서 받을 응답 데이터 형식 (JSON)
	        success: function(response) {
	            // 요청이 성공적으로 완료되었을 때 실행되는 콜백 함수
	            if (response) {
	                console.log('업데이트 성공!'); // 성공 메시지 출력
	            } else {
	                console.log('업데이트 실패!'); // 실패 메시지 출력
	            }
	        },
	        error: function(xhr, status, error) {
	            // 요청 중 오류가 발생했을 때 실행되는 콜백 함수
	            console.error('요청 중 오류 발생:', error); // 콘솔에 오류 메시지 출력
	        }
	    });
	}
    </script>



</body>


</html>