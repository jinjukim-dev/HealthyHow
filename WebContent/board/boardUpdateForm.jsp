<%@ page import="board.*"%>
<%@ page import="java.io.PrintWriter" %>
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
		if(id == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요.')");
			script.println("location.href = 'http://localhost:8080/RecipeSite/index.jsp?center=./member/loginForm'");  //다시 로그인 페이지로
			script.println("</script>");
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
		if(!id.equals(board.getId())){  //세션값과 작성자가 같은지 비교
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'http://localhost:8080/RecipeSite/index.jsp?center=./board/boardListForm'");
			script.println("</script>");
		}
		
		System.out.println("boardNo : "+ request.getParameter("boardNo"));
	%>
<h2 style="text-align: center">게시판 수정 양식</h2>
<br/>
	<form method="post" action="./board/updateAction.jsp?boardNo=<%= boardNo%>">
		<div class="table-wrapper" style="width: 1000px; margin: auto;">
					<table>
											<thead>
												<tr>												
													<th colspan="2" style="text-align: center;"></th>
												</tr>
											</thead>
											
											<tbody>
												<input type="hidden" value="<%= board.getBoardNo()%>"/>
												<tr>													
													<td><input type="text" placeholder="글 제목" name="boardTitle" maxlength="50" value="<%= board.getBoardTitle()%>"/></td>
												</tr>
												<tr>
													<td><textarea placeholder="글 내용" name="boardContent" maxlength="2048" value="<%= board.getBoardContent()%>" style="min-height: 300px;"></textarea></td>																									
												</tr>												
											</tbody>												
					</table>
					<input type="submit" class="button primary" value="글수정" style="float:right; "/>
		</div>
	</form>
</body>
</html>