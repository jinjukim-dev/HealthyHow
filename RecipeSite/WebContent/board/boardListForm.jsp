<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@	page import="board.*"%>
<%@	page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강 HOW 게시판</title>
</head>
<style>
	a, a:hover {
		color: #000000;
		text-decoration: none;
	}
	
</style>
<body>
		<%
			String id = null;
			if(session.getAttribute("id") != null){
				id = (String) session.getAttribute("id");
			}
			
			int pageNumber = 1; //기본페이지
			if(request.getParameter("pageNumber") != null) {
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			}
		%>
<h2 style="text-align: center">게시판</h2>
<br/>
			<div class="table-wrapper" style="width: 1000px; margin: auto;">
					<table>
											<thead>
												<tr>
													<th>번호</th>													
													<th>제목</th>
													<th>작성자</th>													
													<th>작성일</th>
												</tr>
											</thead>
											
											<tbody>
											<%
												BoardDAO boardDao = new BoardDAO();
												ArrayList<BoardVO> list = boardDao.getList(pageNumber);
												
												for(int i=0; i<list.size(); i++){
													
											%>
												<tr>													
													<td><%= list.get(i).getBoardNo()%></td>
													<td style="width: 45%;"><a href = "http://localhost:8080/RecipeSite/index.jsp?center=./board/boardViewForm&boardNo=<%= list.get(i).getBoardNo()%>"><%= list.get(i).getBoardTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("/", "&#47;")%></a></td>													
													<td><%= list.get(i).getId() %></td>
													<td><%= list.get(i).getBoardDate().substring(0, 4)+"년 "+list.get(i).getBoardDate().substring(5, 7)+"월 "+list.get(i).getBoardDate().substring(8, 10)+"일 " + list.get(i).getBoardDate().substring(11, 13)+"시 "+list.get(i).getBoardDate().substring(14,16)+"분" %></td>
												</tr>
											<%
												}
											%>											
											</tbody>										
										
					</table>
					<%
						if(pageNumber != 1){						
					%>
						<a href = "http://localhost:8080/RecipeSite/index.jsp?center=./board/boardListForm&pageNumber=<%= pageNumber - 1 %>" class="button">이전</a>
					<%
						} if(boardDao.nextPage(pageNumber + 1)) {
					%>
						<a href = "http://localhost:8080/RecipeSite/index.jsp?center=./board/boardListForm&pageNumber=<%= pageNumber + 1 %>" class="button">다음</a>
					<%
						}
					%>
			<a href="http://localhost:8080/RecipeSite/index.jsp?center=./board/boardWriteForm" class="button primary" style="float:right; margin-bottom:50px;">게시글 작성하기</a>
		</div>
</body>
</html>