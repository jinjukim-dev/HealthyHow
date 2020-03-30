<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="member" class="member.MemberVO" scope="page"/>
<jsp:setProperty name="member" property="id"/>
<jsp:setProperty name="member" property="password"/>
<jsp:setProperty name="member" property="name"/>
<jsp:setProperty name="member" property="email"/>
<jsp:setProperty name="member" property="tel"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		if(member.getId() == null || member.getPassword() == null || 
			member.getName() == null || member.getEmail() == null || member.getTel() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.')");
			script.println("history.back()");  //다시 로그인 페이지로
			script.println("</script>");
		} else{  //정식으로 입력이 다되었을 때
			
			MemberDAO memberDAO = new MemberDAO();
			int result = memberDAO.join(member);  //회원가입
			
			if(result == -1){  //존재하는 아이디 입력시 데이터베이스 오류 발생
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('존재하는 아이디입니다.')");
				script.println("history.back()");  //다시 로그인 페이지로
				script.println("</script>");
			}
			else {  //회원가입 성공
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원가입이 완료되었습니다.')");
				script.println("location.href = 'http://localhost:8080/RecipeSite/index.jsp?center=./member/registerSuccess'");
				script.println("</script>");
			}
			
			
		}
	
	%>
</body>
</html>