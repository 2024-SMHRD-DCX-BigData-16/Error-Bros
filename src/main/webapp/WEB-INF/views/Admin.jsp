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
  background-color: #f2f2f2;
  color: #333; 
  border: 1px solid #ccc; 
  padding: 15px 30px;
  font-size: 18px;
  cursor: pointer;
  border-radius: 8px;
  transition: all 0.3s ease;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  display: flex;
  justify-content: center;
  align-items: center;
}

.member-list:hover, .show-restarealist:hover {
  border: 1px solid #aaa;
  box-shadow: 0 3px 7px rgba(0, 0, 0, 0.15); 
  transform: translateY(-2px); 
}

    </style>
</head>

<body>
<jsp:include page="Head.jsp" />


    <div class="center-container">
        <div class="admin-panel">
            <div>
            <a href="goshowMemberList"><button class="member-list">회원관리</button></a>
            </div>
            <div>
            <a href="hugesoList"><button class="show-restarealist">휴게소 관리</button></a>
                
            </div>
        </div>
    </div>

    <script>

    </script>
</body>

</html>