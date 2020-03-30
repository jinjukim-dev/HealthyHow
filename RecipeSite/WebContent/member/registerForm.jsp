<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 창</title>
</head>
<body>
<center>
 <h2>반갑습니다. HEALTHYHOW의 <br/>
 회원이 되어주세요!</h2>
 <br/>
 <form action = "./member/registerAction.jsp" method="post">
 	<input type="text" name="id" placeholder="아이디를 입력하세요." style="width:400px;"/><br/>
 	<input type="password" name="password" placeholder="비밀번호를 입력하세요." style="width:400px;"/> <br/>
 	<input type="text" name="name"/ placeholder="이름을 입력하세요." style="width:400px;"> <br/>
 	<input type="email" name="email" placeholder="이메일을 입력하세요." style="width:400px;"/> <br/>
 	<input type="tel" name="tel" placeholder="전화번호를 입력하세요." style="width:400px;"/> <br/>
 	<input type="submit" class="button primary" value="가입하기"/>
 </form>
 </center>
</body>
</html>