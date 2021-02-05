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
							<div style="text-align: center">
								<h1><%= recipe.getRecipeTitle()%></h1><!-- 레시피제목 -->
								<h3><%= recipe.getRecipeInfo() %></h3><!-- 요리소개 -->
								<!-- 대표사진 -->
								<span><img src="images/<%=recipe.getFileName()%>" alt="" style="width: 550px;"/></span>
							</div>
							<br/>			
									<div class="table-wrapper">
										<table>
											<thead>
												<tr>
													<th style="text-align:left; font-size: 20px;">
													준비 재료
													</th>																									
												</tr>
											</thead>
											<!-- 요리재료 -->					
											<tbody style="text-align:center;">
												<tr>
													<td><%= recipe.getRecipeIngredi1()%></td>
													<td><%= recipe.getRecipeQuant1() %></td>																								
												</tr>
												<tr>
													<td><%= recipe.getRecipeIngredi2()%></td>
													<td><%= recipe.getRecipeQuant2() %></td>																									
												</tr>
												<tr>
													<td><%= recipe.getRecipeIngredi3()%></td>
													<td><%= recipe.getRecipeQuant3() %></td>																									
												</tr>
												<tr>
													<td><%= recipe.getRecipeIngredi4()%></td>
													<td><%= recipe.getRecipeQuant4() %></td>																									
												</tr>
												<tr>
													<td><%= recipe.getRecipeIngredi5()%></td>
													<td><%= recipe.getRecipeQuant5() %></td>																									
												</tr>
										 </tbody>
										 </table>
										 <table>
											 	<thead>
													<tr>
														<th colspan="3" style="text-align:left; font-size: 20px; ">조리순서</th>																									
													</tr>
												</thead>
												<!-- 조리 순서 -->
												<tr>												
													<td colspan="3"><img src="images/<%=recipe.getRecipeStep1fileName()%>" style="max-height: 350px; width: 400px; float:left; margin:10px;"/><h3>Step1</h3><br/><%= recipe.getRecipeStep1()%></td>																		
												</tr>
												<tr>												
													<td colspan="3"><img src="images/<%=recipe.getRecipeStep2fileName()%>" style="max-height: 350px; width: 400px; float:left; margin:10px;"/><h3>Step2</h3><br/><%= recipe.getRecipeStep2()%></td>																		
												</tr>
												<tr>												
													<td colspan="3"><img src="images/<%=recipe.getRecipeStep3fileName()%>" style="max-height: 350px; width: 400px; float:left; margin:10px;"/><h3>Step3</h3><br/><%= recipe.getRecipeStep3()%></td>																		
												</tr>
												<!-- 요리팁  -->
												<tr>												
													<td>요리팁/주의사항</td>
													<%
														if(recipe.getRecipeTips() == ""){
													%>
													<td colspan="2"></td>
													<%}else{%>													
													<td colspan="2"><%= recipe.getRecipeTips() %></td>
													<%} %>																					
												</tr>
											</table>
											<table>				
												<tr>
													<td style="width: 20%;">작성자</td>
													<td colspan="2"><%= recipe.getId() %></td>													
												</tr>
												<tr>
													<td>등록일</td>
													<td colspan="2"><%= recipe.getRecipeDate().substring(0, 4)+"년 "+recipe.getRecipeDate().substring(5, 7)+"월 "+recipe.getRecipeDate().substring(8, 10)+"일 "%></td>													
												</tr>																		
										</table>
									</div>
								<input type="button" style="float:right;" class="button primary" value="스크랩 하기" name="" maxlength="50"/>								
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