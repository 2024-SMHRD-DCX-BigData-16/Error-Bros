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
<<<<<<< HEAD
									<form id="search" method="post" action="searchHugeso">
										<input type="text" name="searchInput" placeholder="휴게소 검색">
=======
									<form id="search" method="get" action="#">
										<input type="text" name="query" placeholder="Search" />
>>>>>>> a80d6be62ee9efe15b7a83d498aad3e51b0b215f
									</form>
								</li>
								<li class="menu">
									<a class="fa-bars" href="#menu">Menu</a>
								</li>
							</ul>
						</nav>
					</header>
					
<<<<<<< HEAD
					<section id="menu">

						<!-- Search -->
							<section>
								<form class="search" method="post" action="searchHugeso">
									<input type="text" name="searchInput" id="searchInput" placeholder="휴게소 검색" value="${sessionScope.searchInput}">
								</form>
							</section>

						<!-- Links -->
							<section >
								<ul class="links">
								<% if (loginMember != null) {%>
									<li>
										<a href="goShowHu" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
											<h3>휴게소 찾기</h3>
										</a>
									</li>
									<li>
										<a href="goMypage" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
											<h3><%=loginMember.getMem_nm()%>님 환영합니다.</h3>
											<p>마이페이지</p>
										</a>
									</li>
									<% if ("admin".equals(loginMember.getMem_id())) { %>
									<li>
										<a href="goAdmin" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
											<h3>관리하기</h3>
											<p>휴게소 관리, 메뉴 관리, 회원 관리</p>
										</a>
									</li>
									<%}%><%} else {%>
									<li>
										<section>
											<ul class="actions stacked">
												<li><a href="goLogin" class="button large fit" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Log In</a></li>
											</ul>
										</section>
									</li>
									<li>
										<a href="goJoin" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
											<h3>회원가입</h3>
											<p>Porta lectus amet ultricies</p>
										</a>
									</li>
									<%}%>	
								</ul>
							</section>

						<!-- Actions -->


					</section>
		<!-- Scripts -->
			<script src="resources/assets/js/jquery.min.js"></script>
			<script src="resources/assets/js/browser.min.js"></script>
			<script src="resources/assets/js/breakpoints.min.js"></script>
			<script src="resources/assets/js/util.js"></script>
			<script src="resources/assets/js/main.js"></script>
=======


>>>>>>> a80d6be62ee9efe15b7a83d498aad3e51b0b215f

</body>
</html>