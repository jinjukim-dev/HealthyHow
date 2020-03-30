<%@page import="board.*"%>
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
<h2 style="text-align: center">게시판 글쓰기 양식</h2>
<br/>
	<form mothod="post" action="./board/writeAction.jsp">
		<div class="table-wrapper" style="width: 1000px; margin: auto;">
					<table>
											<thead>
												<tr>												
													<th colspan="2" style="text-align: center;"></th>
												</tr>
											</thead>
											
											<tbody>
												<tr>													
													<td><input type="text" placeholder="글 제목" name="boardTitle" maxlength="50"/></td>
												</tr>
												<tr>
													<td><textarea class="ta" placeholder="글 내용" name="boardContent" maxlength="2048" style="min-height: 300px;"></textarea></td>																									
												</tr>												
											</tbody>												
					</table>
					<input type="submit" class="button primary" value="글쓰기" style="float:right; "/>
		</div>
	</form>
</body>
</html>