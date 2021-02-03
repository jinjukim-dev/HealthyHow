<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<h2>로그인</h2>
<form method="post" action="./member/authentication.jsp">
<div class="col-6 col-12-xsmall">
<input type="text" name="id" id="id" value="" placeholder="아이디를 입력하세요." style="width:400px;" />
<br/>
<input type="password" name="password" id="password" value="" placeholder="비밀번호를 입력하세요." style="width:400px;"/>
</div>
<br/>
<class="actions">
<input type="submit" class="button primary" value="로그인"/>

<br/>
</form>
<a href="index.jsp?center=./member/registerForm" class="button primary" style="margin-top:100px;">회원가입 하러가기</a>
<a href="#" class="button primary" style="margin-left:50px;">아이디/비밀번호 찾기</a>
</center>
</body>
</html>