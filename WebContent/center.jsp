<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="recipeMenu.*" %>
<%@ page import="java.io.PrintWriter"%>
<%@	page import="java.util.ArrayList"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>건강 HOW</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">
							<section class="tiles">
							
							<%
								RecipeMenuDAO menuDao = new RecipeMenuDAO();
								ArrayList<RecipeMenuVO> list = menuDao.getMenuList();
								
								for(int i=1; i<list.size(); i++){
							%>
								<article class="style<%=i+1%>">
									<span class="image">
										<img src="images/pic01.jpg" alt="" />
									</span>
									<a href="http://localhost:8080/RecipeSite/index.jsp?center=./recipe/recipeMenuForm&recipeCode=<%=list.get(i).getRecipeCode()%>&recipeMenu=<%= list.get(i).getRecipeMenu()%>">
										<h2><%= list.get(i).getRecipeMenu() %></h2>
										<div class="content">
											<p>각종 <%= list.get(i).getRecipeMenu() %> 레시피 보러가기 </p>
										</div>
									</a>
								</article>
							<%
								}
							%>																					
							</section>
						</div>
					</div>

		
			</div>

			<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
	
	</body>
</html>