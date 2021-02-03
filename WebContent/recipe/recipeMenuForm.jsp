<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="recipe.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>건강음료 레시피 리스트</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">
	<%
		String id = null;
		if(session.getAttribute("id") != null){
			id = (String) session.getAttribute("id");
		}
		
		//레시피 코드 받아오기
		int recipeCode = 0;
		if(request.getParameter("recipeCode") != null){
			recipeCode = Integer.parseInt(request.getParameter("recipeCode"));
		}
		
		//레시피 메뉴 받아오기
		String recipeMenu = null;
		if(request.getParameter("recipeMenu") != null){
			recipeMenu = request.getParameter("recipeMenu");
		}
		
		if(recipeCode == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'http://localhost:8080/RecipeSite/index.jsp'");
			script.println("</script>");
		}
		
	%>
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
				<h2 style="text-align: center;">궁금한 <%=recipeMenu%></h2>
				<h2 style="text-align: center;">레시피를 클릭해보세요!</h2>
					<div id="main">
						<div class="inner">
							<section class="tiles">
							<%
								RecipeDAO recipeDao = new RecipeDAO();
								ArrayList<RecipeVO> list = recipeDao.getRecipeList(recipeCode);
								
								for(int i=0; i<list.size(); i++){
									
								
							%>
								<article class="style<%=i+1%>">
									<span class="image">
										<img src="images/<%= list.get(i).getFileName()%>" alt="" style="min-height: 300px; max-height: 550px" />
									</span>
									<a href="http://localhost:8080/RecipeSite/index.jsp?center=./recipe/recipeViewForm&recipeNo=<%=list.get(i).getRecipeNo()%>">
										<h2><%= list.get(i).getRecipeName()%></h2>
										<div class="content">
											<p>클릭해서 레시피 보기</p>
										</div>
									</a>
								</article>
								
								<%
									} 
								
									if(list.isEmpty()){
										
									
								%>
									<article class="style1">
									<span class="image">
										<img src="images/pig02" alt="" style="min-height: 300px; max-height: 550px" />
									</span>
									<a href="#">
										<h2>준비중</h2>
										<div class="content">
											<p>준비중 입니다.</p>
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