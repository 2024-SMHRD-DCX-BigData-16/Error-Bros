<%@page import="com.errorbros.entity.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

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

/* 휴게소 정보 컨테이너 */
.info-container {
	width: 80%;
	max-width: 800px;
	background: white;
	margin: 20px;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.info-title {
	font-size: 28px;
	font-weight: bold;
	color: green;
	margin-bottom: 10px;
}

.map-photo-wrapper {
	justify-content: space-between;
	display: flex;
	width: 100%;
	align-items: center;
	gap: 20px;
	/* 간격 */
}

.map-container {
	flex: 1;
	height: 300px;
	background-color: #ddd;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 10px;
}

.photo-container {
	flex: 1;
	height: 300px;
	background:;
	border-radius: 10px;
	background-color: #fff;
}

.info-details {
	font-size: 16px;
	margin-bottom: 20px;
}

.info-details p {
	margin-bottom: 5px;
}

/* 리뷰 섹션 */
.review-section {
	margin-top: 20px;
}

.review-title {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 10px;
}

.review-box {
	background: #f1f1f1;
	padding: 10px;
	border-radius: 5px;
	margin-bottom: 10px;
}

.review-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.left {
	text-align: left;
}

.right {
	text-align: right;
	font-weight: bold;
}

.review-text {
	margin-top: 5px;
}

/* 주문 버튼 */
.order-btn {
	position: fixed;
	bottom: 10px;
	/* 화면 하단에서 10px 위 */
	left: 50%;
	transform: translateX(-50%);
	max-width: auto;
	width: 90%;
	/* 버튼 너비 */
	background-color: orange;
	padding: 15px;
	font-size: 16px;
	color: white;
	border: none;
	text-align: center;
	cursor: pointer;
	border-radius: 5px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
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
		<a href="goMain">휴게소 찾기</a>
	</div>

	<!-- 휴게소 정보 컨테이너 -->
	<div class="info-container">
		<div class="info-title">${hugesoInfo.rest_nm }</div>

		<!-- 지도 + 사진을 가로로 배치하는 컨테이너 -->
		<div class="map-photo-wrapper">
			<!-- 지도 -->
			<div id="map" style="width: 750px; height: 350px;"></div>

			<script
				src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=766824df2f4642d0c1ee9b9d357b44a4"></script>
			<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(${hugesoInfo.lat}, ${hugesoInfo.lon}), // 지도의 중심좌표
		        level: 3, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// 지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new kakao.maps.ZoomControl();

		// 지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		// 지도 클릭 이벤트를 등록한다 (좌클릭 : click, 우클릭 : rightclick, 더블클릭 : dblclick)
		kakao.maps.event.addListener(map, 'click', function (mouseEvent) {
			console.log('지도에서 클릭한 위치의 좌표는 ' + mouseEvent.latLng.toString() + ' 입니다.');
		});	

		// 지도에 마커를 생성하고 표시한다
		var marker = new kakao.maps.Marker({
		    position: new kakao.maps.LatLng(${hugesoInfo.lat}, ${hugesoInfo.lon}), // 마커의 좌표
		    draggable : true, // 마커를 드래그 가능하도록 설정한다
		    map: map // 마커를 표시할 지도 객체
		});

		// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
		kakao.maps.event.addListener(marker, 'click', function() {
		    alert('마커를 클릭했습니다!');
		});

	</script>
		</div>

		<!-- 휴게소 사진 -->
		<div class="photo-container"></div>
	</div>

	<!-- 휴게소 정보 -->
	<div class="info-details">
		<p>
			<strong>주소:</strong> ${hugesoInfo.rest_addr }
		</p>
		<p>
			<strong>편의시설:</strong> ${hugesoInfo.rest_facilities }
		</p>
		<p>
			<a href="goReview">리뷰 작성</a>
		</p>
	</div>

	<div class="review-section">
		<div class="review-title">리뷰 후기</div>
		<div id="review-container"></div>
	</div>

	<!-- 스크립트 추가 -->
	<script>
            let reviewContainer = document.getElementById("review-container");
            let reviewsPerPage = 4; // 한 번에 4개씩 보여줌
            let currentPage = 0;
            let reviewData = []; // 리뷰 데이터를 저장할 배열

            function loadReviews() {
                let start = currentPage * reviewsPerPage;
                let end = start + reviewsPerPage;
                let reviews = reviewData.slice(start, end);

                reviews.forEach(review => {
                    let reviewBox = document.createElement("div");
                    reviewBox.classList.add("review-box");
                    reviewBox.innerHTML = `
                        <div class="review-header">
                            <div class="left">
                                <strong>${review.memId}</strong> | ⭐ ${review.reviewRatings} | 📅 ${review.createdAt}
                            </div>
                        </div>
                        <hr>
                        <p class="review-text">💬 ${review.reviewContent}</p>
                    `;
                    reviewContainer.appendChild(reviewBox);
                });

                currentPage++;
            }

            // 스크롤 이벤트 감지 (무한 스크롤)
            window.addEventListener("scroll", function() {
                if (window.innerHeight + window.scrollY >= document.body.offsetHeight - 10) {
                    loadReviews();
                }
            });

            // 초기 리뷰 로드
            $.ajax({
                url: "getReviews?rest_idx=${hugesoInfo.rest_idx}", // 리뷰 데이터를 가져오는 URL
                type: "GET",
                dataType: "json", // JSON 형식으로 데이터 받기
                success: function(data) {
                    reviewData = data; // reviewData 변수에 리뷰 데이터 저장
                    loadReviews(); // 리뷰 목록 표시
                },
                error: function() {
                    alert("리뷰 데이터를 가져오는 데 실패했습니다.");
                }
            });
        </script>

	<div class="buttons" id="buttons">
		<a href="goMenu?rest_idx=${hugesoInfo.rest_idx}"><button
				class="order-btn">음식 주문하기</button></a>
	</div>
	</div>

</body>

</html>