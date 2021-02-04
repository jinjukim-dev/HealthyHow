<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = null;
	if(session.getAttribute("id") != null){
		id = (String) session.getAttribute("id");
	}
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>건강 HOW</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	
	<style>
		.ul {
			list-style:none;
			margin:0;
			padding:0;			
		}
		
		.li {
			margin: 0 100 0 0;
			padding: 0 100px;
			border : 0;
			float: left;
		}
		
		li a {
			text-decoration: none;
			
		}
		
		
	a, a:hover {
		text-decoration: none;
		}
		
	</style>
	<body class="is-preload">
	
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<div class="inner">

							<!-- Logo -->
								<a href="index.jsp" class="logo">
									<span class="symbol"></span><span class="title">HealthyHow</span>
								</a>
						</div>
					</header>
					
					<div id="main">
						<div class="inner">
							<header>
								<h1>당신을 위한 건강레시피<br/>
								건강 HOW </h1>
								<p>건강 레시피를 한눈에 보고, 직접해보고, 공유해서 올리는 <b>나만의 요리책</b>을 채워보세요.<br/>
								아래에서 원하는 <b>레시피의 카테고리</b>를 선택해보세요. </p>
							</header>
						</div>
						
						<!-- Menu -->
						<hr style="width: 1200px; margin:auto;">
						<br/>
						<div class="inner">
							<ul class="ul">
								<b>
								<li class="li"><a href="index.jsp">HOME</a></li>
								<li class="li"><a href="index.jsp?center=./recipe/recipeWriteForm">레시피 등록</a></li>
								<li class="li"><a href="index.jsp?center=./board/boardListForm">게시판</a></li>
								<% if(id != null){ %>
								<li class="li"><a href="index.jsp?center=./member/welcomeForm"><%=id%>님</a></li>
								<%} else{%>
								<li class="li"><a href="index.jsp?center=./member/loginForm">회원가입 / 로그인</a></li>
								<%} %>
								</b>
							</ul>
						</div>
						<br/>
						<hr style="width: 1200px; margin:auto; margin-top:30px;">
					</div>

			</div>					
					
					<!-- 메뉴판-->
					<script src="assets/js/jquery.min.js"></script>
					<script src="assets/js/browser.min.js"></script>
					<script src="assets/js/breakpoints.min.js"></script>
					<script src="assets/js/util.js"></script>
					<script src="assets/js/main.js"></script>
		</body>
</html>