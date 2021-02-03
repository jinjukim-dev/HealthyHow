<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="recipe.*" %>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int recipeCode = Integer.parseInt(request.getParameter("recipeCode"));
		String fileName = request.getParameter("fileName");
		String recipeTitle = request.getParameter("recipeTitle");
		String recipeName = request.getParameter("recipeName");
		String recipeIngredi = request.getParameter("recipeIngredi");
		String recipeSteps = request.getParameter("recipeSteps");
		
		System.out.println("recipeCode : "+recipeCode);
		System.out.println("fileName : "+fileName);
	
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
		}else { //로그인 된 경우
			
			if(recipeCode == 0 || recipeTitle.equals("") || recipeTitle == null ||
					recipeName.equals("") || recipeIngredi.equals("") || recipeSteps.equals("")){
					PrintWriter script = response.getWriter();	
					script.println("<script>");
					script.println("alert('입력이 안된 사항이 있습니다.')");
					script.println("history.back()");
					script.println("</script>");
			} else { //정식으로 입력이 다 되었을 때
				
				RecipeDAO recipeDao = new RecipeDAO();
				int result = recipeDao.wirteRecipe(recipeCode, recipeTitle, recipeName, id, recipeIngredi, recipeSteps, fileName);
				
				if(result == -1){  //데이터 베이스 오류
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('레시피 등록에 실패했습니다.')");
					script.println("history.back()"); 
					script.println("</script>");
				}
				else { //글쓰기 성공
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('레시피가 등록되었습니다.')");
					script.println("location.href = 'http://localhost:8080/RecipeSite/index.jsp?'");
					script.println("</script>");
				}
				
			}
		
		}
	%>

</body>
</html>