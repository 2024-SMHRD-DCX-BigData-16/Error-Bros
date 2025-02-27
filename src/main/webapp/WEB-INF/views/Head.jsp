<%@page import="com.errorbros.entity.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/assets/css/main.css" />
</head>
<body class="is-preload">
<% MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember"); %>

				<!-- Header -->
					<header id="header">
						<h1><a href="goMain">Go Stop</a></h1>
						<nav class="links">
							<ul>
								<li><a href="goShowHu">휴게소 찾기</a></li>
<% if (loginMember != null) {%>
								<li><%=loginMember.getMem_nm()%>님 환영합니다.</li>
								<li><a href="logOut">로그아웃</a></li>
								<li><a href="goMypage">마이페이지</a></li>
<% if ("admin".equals(loginMember.getMem_id())) { %>
								<li><a href="goAdmin">관리하기</a></li>
<%}%><%} else {%>
								<li><a href="goLogin">로그인</a></li>
								<li><a href="goJoin">회원가입</a></li>
<%}%>	
							</ul>
						</nav>
						<nav class="main">
							<ul>
								<li class="search">
									<a class="fa-search" href="#search">Search</a>
									<form id="search" method="get" action="#">
										<input type="text" name="query" placeholder="Search" />
									</form>
								</li>
								<li class="menu">
									<a class="fa-bars" href="#menu">Menu</a>
								</li>
							</ul>
						</nav>
					</header>
					



</body>
</html>