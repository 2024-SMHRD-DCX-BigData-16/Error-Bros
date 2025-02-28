<%@page import="com.errorbros.entity.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>휴게소 정보</title>
<style>


</style>
</head>

<body>
<jsp:include page="Head.jsp" />


	<!-- 휴게소 정보 컨테이너 -->
	<div class="info-container">
		<div class="info-title">${hugesoInfo.rest_nm }</div>

		<!-- 지도 + 사진을 가로로 배치하는 컨테이너 -->
		<div class="map-photo-wrapper">
			<!-- 지도 -->
			<div id="map" style="width: 750px; height: 350px;"></div>

			<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=766824df2f4642d0c1ee9b9d357b44a4"></script>
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

	<div class="center-container">
		<h1>휴게소 리뷰 목록</h1>

		<table>
			<thead>
				<tr>
					<th>회원 아이디</th>
					<th>리뷰 내용</th>
					<th>리뷰 평점</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="review" items="${ReviewList}">
					<tr>
						<td>${review.mem_id}</td>
						<td>${review.review_content}</td>
						<td>${review.review_ratings}</td>
						<td>${review.created_at}</td>
					</tr>
				</c:forEach>
				<c:if test="${empty ReviewList}">
					<tr>
						<td colspan="5">작성된 리뷰가 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>

		<div class="pagination">
			<%-- 페이지네이션 필요시 추가 --%>
		</div>
	</div>


	<!-- 스크립트 추가 -->
	<script>
            
        </script>

	<div class="buttons" id="buttons">
		<a href="goMenu?rest_idx=${hugesoInfo.rest_idx}">
		<button class="order-btn">음식 주문하기</button></a>
	</div>
	</div>

</body>

</html>