<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="member" class="member.MemberVO" scope="page"/>
<jsp:setProperty name="member" property="id"/>
<jsp:setProperty name="member" property="password"/>

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
		
		if(id != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href = 'http://localhost:8080/RecipeSite/index.jsp?center=./member/welcomeForm'");
			script.println("</script>");
		}
		
		MemberDAO memberDAO = new MemberDAO();
		int result = memberDAO.login(member.getId(), member.getPassword());  //로그인창에서 입력된 값 넘겨주기
		
		if(result == 1){  //로그인 성공
			session.setAttribute("id", member.getId()); //세션 등록
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'http://localhost:8080/RecipeSite/index.jsp'");
			script.println("</script>");
		}
		else if(result == 0){  //비밀번호 불일치
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호를 다시 입력해주세요.')");
			script.println("history.back()");  //다시 로그인 페이지로
			script.println("</script>");
		}
		else if(result == -1){  //존재하지 않는 아이디
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()");  //다시 로그인 페이지로
			script.println("</script>");
		}
		else if(result == -2){  //비밀번호 불일치
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터 베이스 오류가 발생하였습니다.')");
			script.println("history.back()");  //다시 로그인 페이지로
			script.println("</script>");
		}
	%>
</body>
</html>