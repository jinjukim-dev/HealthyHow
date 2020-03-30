<%@page import="java.io.PrintWriter"%>
<%@ page import="recipe.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<style>
	.h2 {
		display:inline;
		background-color: #f2849e;
		color: #ffffff;
	}
</style>
	<body class="is-preload">
	<%
		String id = null;
		if(session.getAttribute("ud") != null){
			id = (String) session.getAttribute("id");
		}
		
		int recipeNo = 0;
		if(request.getParameter("recipeNo") != null) {
			recipeNo = Integer.parseInt(request.getParameter("recipeNo"));
		}
		
		if(recipeNo == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'http://localhost:8080/RecipeSite/index.jsp?center=./recipe/boardListForm'");
			script.println("</script>");	
		}
		
		RecipeVO recipe = new RecipeDAO().getRecipe(recipeNo);
		
	%>
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">
							<h1><%= recipe.getRecipeTitle()%></h1>
							<span class="image main"><img src="images/<%=recipe.getFileName()%>" alt="" style="max-height: 450px; "/></span>
							<br/>					
									<div class="table-wrapper">
										<table>
											<thead>
												<tr>
													<th colspan="3" style="text-align: center; font-size: 20px; "><%=recipe.getRecipeName()%> 레시피</th>																									
												</tr>
											</thead>
											
											<tbody>
												<tr>
													<td style="width: 20%;">작성자</td>
													<td><%= recipe.getId() %></td>													
												</tr>
												<tr>
													<td>등록일</td>
													<td><%= recipe.getRecipeDate().substring(0, 4)+"년 "+recipe.getRecipeDate().substring(5, 7)+"월 "+recipe.getRecipeDate().substring(8, 10)+"일 "%></td>													
												</tr>
												<tr>
													<td>재료</td>
													<td><%= recipe.getRecipeIngredi()%></td>													
												</tr>
												<tr>
													<td>조리순서</td>
													<td><%= recipe.getRecipeSteps()%></td>													
												</tr>
										</table>
									</div>
									<br/>								
						</div>
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