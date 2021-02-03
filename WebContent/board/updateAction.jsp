<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.*"%>
<%@page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("utf-8"); %>
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
		} else {  //로그인이 된경우
			
			if(request.getParameter("boardTitle") == null || request.getParameter("boardContent") == null ||
			request.getParameter("boardTitle").equals("") || request.getParameter("boardContent").equals("")) {  //입력사항을 입력하지 않을 경우
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안된 사항이 있습니다.')");
					script.println("history.back()");  //다시 로그인 페이지로
					script.println("</script>");
					
				} else{ //정상적으로 입력이 다 되었다면
					
					BoardDAO boardDAO = new BoardDAO();
					int result = boardDAO.update(boardNo, request.getParameter("boardTitle"), request.getParameter("boardContent"));
					
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
						script.println("alert('글이 수정되었습니다.')");
						script.println("location.href = 'http://localhost:8080/RecipeSite/index.jsp?center=./board/boardListForm'");
						script.println("</script>");
					}
					
				}
			
		}		
	%>
</body>
</html>