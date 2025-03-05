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
.info-container {
   width: 70%;
   margin: 20px auto;
   background-color: white;
   border-radius: 8px;
   box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
   padding: 20px;
}

.info-title {
   font-size: 24px;
   font-weight: bold;
   margin-bottom: 20px;
   text-align: center;
}

.map-info-wrapper {
   display: flex;
   justify-content: flex-start;
}

.map-box {
   border: 1px solid #ddd;
   padding: 10px;
   border-radius: 8px;
   margin-right: 10px; /* info-details와의 간격 추가 */
   box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.info-details-box {
   border: 1px solid #ddd;
   padding: 10px;
   border-radius: 8px;
   width: 40%;
   box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
   overflow: auto;
}

.info-details {
   margin-top: 55px;
}

.center-container {
   width: 80%;
   margin: 20px auto;
   background-color: white;
   border: 1px solid #ddd;
   box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
   padding: 20px;
   text-align: center;
   border-radius: 8px;
    overflow: auto;
}

.center-container h1 {
   font-size: 24px;
   margin-bottom: 20px;
}

table {
   width: 100%;
   border-collapse: collapse;
   margin-top: 20px;
}

th, td {
   border: 1px solid #ddd;
   padding: 8px;
   text-align: center;
}

th {
   background-color: #f2f2f2;
}

.order-btn {
   background-color: #e0e0e0;
   color: black;
   padding: 10px 20px;
   border: none;
   border-radius: 5px;
   cursor: pointer;
   font-size: 16px;
}
.map-box {
    width: 50%; /* 가로의 50% 차지 */
    height: auto; /* 높이는 내용에 맞게 자동 조절 */
    left: 0; /* 왼쪽 정렬 */
    top: 0; /* 필요에 따라 조정 가능 */
    display: flex;
    justify-content: center; /* 내부 요소 가운데 정렬 */
    align-items: center;
}

#map {
    width: 100%;
    height: 100%;
    max-width: 750px; /* 최대 너비 제한 */
    max-height: 350px; /* 최대 높이 제한 */
    aspect-ratio: 750 / 350; /* 비율 유지 */
}
.buttons {
    display: flex;
    justify-content: left;
    margin-top: 10px;
    gap: 10px; /* 버튼 간격 조정 */
}

.buttons .order-btn {
    background-color: #e0e0e0;
    color: black;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 0.8vw; /* 화면 크기에 맞춰 글자 크기 조정 */
    white-space: nowrap; /* 줄바꿈 방지 */
    display: flex; /* Flexbox 적용 */
    justify-content: center;
    align-items: center;
    text-align: center;
    height: 40px; /* 버튼 높이 고정 */
}

/* 작은 화면 (모바일) 대응 */
@media (max-width: 600px) {
    .buttons .order-btn {
        font-size: 3vw; /* 화면이 작아지면 글자 크기 증가 */
        height: 50px; /* 버튼 높이 조정 */
        padding: 10px 15px;
    }
}

/* 중간 크기 화면 (태블릿) 대응 */
@media (min-width: 601px) and (max-width: 1024px) {
    .buttons .order-btn {
        font-size: 2vw; /* 태블릿에서는 적절한 크기로 조정 */
    }
}


</style>
</head>

<body>
   <jsp:include page="Head.jsp" />

   <div class="info-container">
      <div class="info-title">${hugesoInfo.rest_nm }</div>

      <div class="map-info-wrapper">
         <div class="map-box">
            <div id="map" style="width: 750px; height: 350px;"></div>
         </div>

         <div class="info-details-box">
            <div class="info-details">
               <p>
                  <strong>주소:</strong> ${hugesoInfo.rest_addr }
               </p>
               <p>
                  <strong>편의시설:</strong><br> ${hugesoInfo.rest_facilities }
               </p>
               <p>
                  <strong>음식 대기 순번:</strong> <span id="waitingNumber"
                     style="font-weight: bold; color: #007bff; margin-left: 5px;">${hugesoInfo.rest_waiting }</span>
               </p>
               <div class="buttons" id="buttons"
                  style="display: flex; justify-content: left; margin-top: 10px;">
                  <a href="goReview?rest_idx=${hugesoInfo.rest_idx}" class="order-btn" style="margin-right: 10px;">리뷰
                     작성</a><a href="goMenu?rest_idx=${hugesoInfo.rest_idx}"
                     class="order-btn">음식 주문하기</a>
               </div>
            </div>
         </div>
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
   </div>

   <script
      src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=766824df2f4642d0c1ee9b9d357b44a4"></script>
   <script>
        var mapContainer = document.getElementById('map'),
            mapOption = {
                center: new kakao.maps.LatLng(${hugesoInfo.lat}, ${hugesoInfo.lon}),
                level: 7,
                mapTypeId: kakao.maps.MapTypeId.ROADMAP
            };
        var map = new kakao.maps.Map(mapContainer, mapOption);
        var zoomControl = new kakao.maps.ZoomControl();
        map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
        kakao.maps.event.addListener(map, 'click', function (mouseEvent) {
            console.log('지도에서 클릭한 위치의 좌표는 ' + mouseEvent.latLng.toString() + ' 입니다.');
        });
        var marker = new kakao.maps.Marker({
            position: new kakao.maps.LatLng(${hugesoInfo.lat}, ${hugesoInfo.lon}),
            draggable: true,
            map: map
        });
        kakao.maps.event.addListener(marker, 'click', function () {
            alert('마커를 클릭했습니다!');
        });
        
    </script>
</body>

</html>