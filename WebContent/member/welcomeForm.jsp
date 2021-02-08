<%@page import="board.BoardVO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="recipe.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
    
    <%
    	if(session.getAttribute("id") == null){
    		response.sendRedirect("logout.jsp");
    	}
    
    	String id = (String) session.getAttribute("id");	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
</head>
<style>
	.at {
		text-align: center;
		margin: 50px;
	}
</style>
<body>
	<div id="wrapper">
			<div class="main">
			<!-- 내가 작성한 레시피 부분 -->	
				<div class="inner">
				<h2 style="text-align: center;"><%=session.getAttribute("id") %>님, 작성한 레시피</h2>
					<section class="tiles">
					<%
						RecipeDAO recipeDao = new RecipeDAO();
						ArrayList<RecipeVO> list = recipeDao.getMyRecipeList(id);
						
						for(int i=0; i<list.size(); i++){
					%>
						<article class="style<%=i+1%>">
							<span class="image">
								<img src="images/<%= list.get(i).getFileName()%>" alt="" style="min-height: 400px;" />
							</span>
							<a href="http://localhost:8080/RecipeSite/index.jsp?center=./recipe/recipeViewForm&recipeNo=<%=list.get(i).getRecipeNo()%>">
								<h2><%= list.get(i).getRecipeTitle()%></h2>
								<div class="content">
									<p>클릭해서 레시피 보기</p>
								</div>
							</a>
						</article>
					
					<%
						}
					%>
					
					</section>
					<br/>
				</div>
				<!-- 스크랩한 부분 -->	
				<div class="inner">
				<h2 style="text-align: center;"><%=session.getAttribute("id") %>님, 스크랩한 레시피</h2>
					
					<%
					//스크랩 리스트
					ArrayList scrapList = (ArrayList)session.getAttribute("list");
	
					if(scrapList == null){ %>
						<h3 style="text-align: center;">스크랩한 레시피가 없습니다.</h3>
					<section class="tiles">
					<% }else{
						
						for(int i=0; i<scrapList.size(); i++){
							out.println(scrapList.get(i) + "\n");
							
					%>
						
						
					<%		
							
						}
					}
					%>
					</section>
				</div>
						
					<%--
					<div class="inner">
						<h3 class="at"><%=session.getAttribute("id") %>님, 작성한 게시글</h3>
					</div> --%>
					
					<div class = "at">
						<a style="text-align: center;" href="http://localhost:8080/RecipeSite/index.jsp?center=./member/logoutAction" class="button primary">로그아웃</a>
					</div>				
				<%-- <h2 style="text-align: center;"><%=session.getAttribute("id") %>님, 작성한 게시글</h2>
				<div class="table-wrapper" style="width: 1000px; margin: auto;">
					<table>
					<thead>
							<tr>
								<th>번호</th>													
								<th>제목</th>												
								<th>작성일</th>
							</tr>
						</thead>
						
						<tbody>
							<%
								BoardDAO boardDao = new BoardDAO();
								ArrayList<BoardVO> myBoard = boardDao.getMyList(id);
								
								for(int i=0; i<myBoard.size(); i++){
							%>
								<tr>													
									<td><%= myBoard.get(i).getBoardNo()%></td>
									<td style="width: 45%;"><a href = "http://localhost:8080/RecipeSite/index.jsp?center=./board/boardViewForm&boardNo=<%= myBoard.get(i).getBoardNo()%>"><%= myBoard.get(i).getBoardTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("/", "&#47;")%></a></td>																						
									<td><%= myBoard.get(i).getBoardDate().substring(0, 4)+"년 "+myBoard.get(i).getBoardDate().substring(5, 7)+"월 "+myBoard.get(i).getBoardDate().substring(8, 10)+"일 "%></td>
								</tr>
							<%
								}
							%>
					</table>
				</div> --%>
				
		</div>
	</div>
									
</body>
</html>