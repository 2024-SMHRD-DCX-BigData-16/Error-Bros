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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
body, html {
  height: 100%;
  min-height: 100%;
  overflow-x: hidden;
}
#video-container  {
  position: relative;
  width: 100%;
  height: 100%;
  overflow: hidden;
  z-index: 1;
}

#video-container video,
.video-overlay {
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  min-width: 100%;
  min-height: 100%;
}

#video-container .video-overlay {
  z-index: 9999;
  background: rgba(0,0,0,0.5);
  width: 100%;
}

#video-container .video-content {
  z-index: 99999;
  position: absolute;
  height: 100%;
  width: 100%;
}

#video-container .video-content .inner {
  height: 100%;
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-flow: column wrap;
}

#video-container .video-content .inner h1 {
  font-size: 64px;
  text-transform: uppercase;
  color: #fff;
  letter-spacing: 2px;
  font-weight: 500;
  text-align: center;
}

#video-container .video-content .inner em {
  font-style: normal;
  font-weight: 200;
}


#video-container .video-content .inner p {
  color: #fff;
  font-size: 22px;
  font-weight: 200;
  letter-spacing: 1.5px;
  text-align: center;
  padding: 0px 30px;
}

#video-container .video-content .inner a {
  color: #fff !important;
  text-decoration: underline !important;
}

#video-container .video-content .inner .scroll-icon {
 
}
.search-result-table {
    background-color: rgba(0, 0, 1, 0.85) !important; /* 흰색 + 70% 불투명 */
    border-left: 1px solid rgb(50, 50, 50) !important; 
    border-right: 1px solid rgb(50, 50, 50) !important; 
}
.search-btn {
    color: #AAAAAA !important;
    }
.search-result-table td {
    height: 45px;
    vertical-align: middle;
}

.search-result-table input[type="text"],
.search-btn {
    height: 45px; /* 기존 td 높이와 동일하게 맞춤 */
}
th, td {
   border: 1px solid #ddddddb7 !important;
   padding: 8px !important;
   text-align: center !important;
   vertical-align: middle !important;
}

</style>
</head>
<body>
<jsp:include page="Head.jsp" />
	 <div id="video-container">
        <div class="video-overlay"></div>
        <div class="video-content">
            <div class="inner">
              <h1>Welcome to <em>Go Stop</em></h1>
              		<!-- 중앙 휴게소 검색창 -->
						<div class="search-container">
							<div class="search-box">
								<form action="searchHugeso" method="post">
					           	     <table class="search-result-table">
					                        <tr>
					                            <td><input type="text" name="searchInput" id="searchInput"
					                            placeholder="휴게소명" 
					                           <%--  value="${sessionScope.searchInput}" --%>
					                            ></td>
						                            <td>
						                          			<button type="submit" class="search-btn" >검색</button>
						                            </td>
					                        </tr>
					                </table>
								</form>
							</div>
	                </div> 
        	</div>
        </div>
        <video autoplay loop muted>
        	<source src="resources/bgvideo/highway-loop.mp4" type="video/mp4" />
        </video>
    </div>
                

	
	<%-- <div class="center-container">
			<c:choose>
				<c:when test="${not empty hugesoList}">
					<table class="search-result-table">
						<thead>
							<tr>
								<th>휴게소 이름</th>
								<th>음식 주문</th>
								<th>휴게소 정보</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${hugesoList}" var="hugeso" end="13" >
								<tr>
									<td>${hugeso.rest_nm}</td>
									<td><a href="goMenu?rest_idx=${hugeso.rest_idx}"><button class="order-btn">음식
												주문하기</button></a></td>
									<td><a href="showHugeso?rest_idx=${hugeso.rest_idx}"><button
												class="info-btn">휴게소 정보보기</button></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:when>
				<c:otherwise>
					<div class="no-result-message">검색 결과가 없습니다.</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div> --%>

</body>
</html>
