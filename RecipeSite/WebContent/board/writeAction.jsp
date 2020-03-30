<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="board" class="board.BoardVO" scope="page"/>
<jsp:setProperty name="board" property="boardTitle"/>
<jsp:setProperty name="board" property="boardContent"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		String id = null;
		if(session.getAttribute("id") != null){
			id = (String) session.getAttribute("id");
		}
		if(id == null){  //로그인이 안된경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요.')");
			script.println("location.href = 'http://localhost:8080/RecipeSite/index.jsp?center=./member/loginForm'");  //다시 로그인 페이지로
			script.println("</script>");
		} else {  //로그인이 된경우
			
			if(board.getBoardTitle() == null || board.getBoardContent() == null){  //입력사항을 입력하지 않을 경우
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안된 사항이 있습니다.')");
					script.println("history.back()");  //다시 로그인 페이지로
					script.println("</script>");
				}
			
				BoardDAO boardDAO = new BoardDAO();
				int result = boardDAO.write(board.getBoardTitle(), id, board.getBoardContent());
				
				if(result == -1){  //데이터 베이스 오류
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");  //다시 로그인 페이지로
					script.println("</script>");
				}
				else {  //글쓰기 성공
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글이 등록되었습니다.')");
					script.println("location.href = 'http://localhost:8080/RecipeSite/index.jsp?center=./board/boardListForm'");
					script.println("</script>");
				}
			
		}		
	%>
</body>
</html>