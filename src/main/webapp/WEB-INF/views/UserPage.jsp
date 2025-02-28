<%@page import="com.errorbros.entity.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Search</title>
<style>

.center-container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  min-height: 300px;
  gap: 20px;
}

.admin-panel {
  display: flex;
  gap: 20px;
}

.member-list, .show-restarealist {
  background-color: #f2f2f2; /* 배경색과 동일한 색상 */
  color: #333; /* 글자색 */
  border: 1px solid #ccc; /* 테두리 추가 */
  padding: 15px 30px;
  font-size: 18px;
  cursor: pointer;
  border-radius: 8px;
  transition: all 0.3s ease;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 그림자 효과 감소 */
  display: flex;
  justify-content: center;
  align-items: center;
}

.member-list:hover, .show-restarealist:hover {
  border: 1px solid #aaa; /* 호버 시 테두리 색상 변경 */
  box-shadow: 0 3px 7px rgba(0, 0, 0, 0.15); /* 호버 시 그림자 효과 증가 */
  transform: translateY(-2px); /* 호버 시 살짝 위로 이동 */
}
</style>
</head>

<body>

   	<jsp:include page="Head.jsp" />
        <% MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember"); %>


    <div class="center-container">
    <h1>${loginMember.mem_id }님 환영합니다</h1>
        <div class="admin-panel">
            <div>
            <a href="goUpdateMember"><button class="member-list">개인 정보 수정</button></a>
            </div>
            <div>
            <a href="goUserPay"><button class="show-restarealist">결제 내역 확인</button></a>
            </div>
        </div>
    </div>

    <script>

    </script>
</body>

</html>