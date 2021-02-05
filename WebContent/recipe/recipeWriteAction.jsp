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
		String recipeTitle = request.getParameter("recipeTitle");
		String fileName = request.getParameter("fileName");
		String recipeInfo = request.getParameter("recipeInfo");
		String recipeIngredi1 = request.getParameter("recipeIngredi1");
		String recipeIngredi2 = request.getParameter("recipeIngredi2");
		String recipeIngredi3 = request.getParameter("recipeIngredi3");
		String recipeIngredi4 = request.getParameter("recipeIngredi4");
		String recipeIngredi5 = request.getParameter("recipeIngredi5");
		String recipeQuant1 = request.getParameter("recipeQuant1");
		String recipeQuant2 = request.getParameter("recipeQuant2");
		String recipeQuant3 = request.getParameter("recipeQuant3");
		String recipeQuant4 = request.getParameter("recipeQuant4");
		String recipeQuant5 = request.getParameter("recipeQuant5");
		String recipeStep1 = request.getParameter("recipeStep1");
		String recipeStep2 = request.getParameter("recipeStep2");
		String recipeStep3 = request.getParameter("recipeStep3");
		String recipeStep1fileName = request.getParameter("recipeStep1fileName1");
		String recipeStep2fileName = request.getParameter("recipeStep2fileName2");
		String recipeStep3fileName = request.getParameter("recipeStep3fileName3");
		String recipeTips = request.getParameter("recipeTips");
		
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
					recipeIngredi1.equals("") || recipeQuant1.equals("") || recipeStep1.equals("")){
					PrintWriter script = response.getWriter();	
					script.println("<script>");
					script.println("alert('입력이 안된 사항이 있습니다.')");
					script.println("history.back()");
					script.println("</script>");
			} else { //정식으로 입력이 다 되었을 때
				
				RecipeDAO recipeDao = new RecipeDAO();
				int result = recipeDao.wirteRecipe(recipeCode, recipeTitle, id, fileName, recipeInfo, recipeIngredi1, recipeIngredi2, recipeIngredi3, recipeIngredi4, recipeIngredi5, recipeQuant1, recipeQuant2, recipeQuant3, recipeQuant4, recipeQuant5, recipeStep1, recipeStep2, recipeStep3, recipeStep1fileName, recipeStep2fileName, recipeStep3fileName, recipeTips);
				
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