<%@page import="board.*"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강 HOW 게시판</title>
</head>
<style>
	.ta{
		hight:500px !important;
	}
</style>
<body>
			<%
				String id = null;
				if(session.getAttribute("id") != null){
					id = (String) session.getAttribute("id");
				}
				
				int boardNo = 0;
				if(request.getParameter("boardNo") != null){
					boardNo = Integer.parseInt(request.getParameter("boardNo"));
				}
				
				if(boardNo == 0){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('유효하지 않은 글입니다.')");
					script.println("location.href = 'http://localhost:8080/RecipeSite/index.jsp?center=./board/boardListForm'");
					script.println("</script>");
				}
				
				BoardVO board = new BoardDAO().getBoard(boardNo);
			%>
<h2 style="text-align: center">게시판 글보기</h2>
<br/>
		<div class="table-wrapper" style="width: 1000px; margin: auto;">
					<table>
											<thead>
												<tr>												
													<th colspan="3" style="text-align: center;"></th>
												</tr>
											</thead>
											
											<tbody>
												<tr>													
													<td style="width: 20%;">글 제목</td>
													<td colspan="2"><%=board.getBoardTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("/", "&#47;") %></td>
												</tr>
												<tr>													
													<td>작성자</td>
													<td colspan="2"><%=board.getId() %></td>
												</tr>
												<tr>													
													<td>작성일자</td>
													<td colspan="2"><%=board.getBoardDate().substring(0, 4)+"년 "+board.getBoardDate().substring(5, 7)+"월 "+board.getBoardDate().substring(8, 10)+"일 " + board.getBoardDate().substring(11, 13)+"시 "+board.getBoardDate().substring(14,16)+"분" %></td>
												</tr>	
												<tr>													
													<td>글 내용</td>
													<td colspan="2" style="min-height: 300px; text-align: left;"><%=board.getBoardContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("/", "&#47;").replaceAll("\r\n","<br>")%></td>
												</tr>												
											</tbody>
																											
					</table>
					
					<a href = "http://localhost:8080/RecipeSite/index.jsp?center=./board/boardListForm" class="button primary">목록으로 돌아가기</a>
					<%
						if(id != null && id.equals(board.getId())){
					%>
											
						<a href = "http://localhost:8080/RecipeSite/index.jsp?center=./board/boardUpdateForm&boardNo=<%= board.getBoardNo()%>" class="button primary" style="float:right; margin-right: 10px;">수정</a>
						<a onclick="return confirm('정말로 삭제하시겠습니까?')" href = "http://localhost:8080/RecipeSite/index.jsp?center=./board/deleteAction&boardNo=<%= board.getBoardNo()%>" class="button primary" style="float:right; margin-right: 10px;">삭제</a>
					<% 	
						}
					%>		
					
		</div>
</body>
</html>