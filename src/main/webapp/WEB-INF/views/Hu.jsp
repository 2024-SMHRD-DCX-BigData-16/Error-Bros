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
   justify-content: flex-start;;
}

.info-details {
    width: 40%;
    margin-top: 55px; /* 지도의 높이를 고려하여 margin-top 조정 */
    margin-left: 5%;
}

.center-container {
   width: 80%;
   margin: 20px auto;
   background-color: white;
   border-radius: 8px;
   box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
   padding: 20px;
   text-align: center;
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
</style>
</head>

<body>
   <jsp:include page="Head.jsp" />

   <div class="info-container">
      <div class="info-title">${hugesoInfo.rest_nm }</div>

      <div class="map-info-wrapper">
         <div id="map" style="width: 750px; height: 350px;"></div>

         <div class="info-details">
            <p>
               <strong>주소:</strong> ${hugesoInfo.rest_addr }
            </p>
            <p>
               <strong>편의시설:</strong> ${hugesoInfo.rest_facilities }
            </p>
            <div class="buttons" id="buttons"
               style="display: flex; justify-content: left; margin-top: 10px;">
               <a href="goReview" class="order-btn" style="margin-right: 10px;">리뷰 작성</a> 
               <a href="goMenu?rest_idx=${hugesoInfo.rest_idx}" class="order-btn">음식 주문하기</a>
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
                level: 3,
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