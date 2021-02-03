<%@page import="board.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강 HOW 레시피 등록하기</title>
</head>
<body>
<h2 style="text-align: center">레시피를 공유해주세요!</h2>
<br/>
	<form mothod="post" action="./recipe/recipeWriteAction.jsp">
		<div class="table-wrapper" style="width: 1000px; margin: auto;">
		
								<div class="col-12">
									<select name="recipeCode" id="demo-category">
										<option value="0">- 클릭해서 레시피 메뉴를 선택해주세요. -</option>
										<option value="1">건강 음료</option>
										<option value="2">건강 도시락</option>
										<option value="3">비타민 충전</option>
										<option value="4">2020 슈퍼푸드</option>
										<option value="5">4월의 제철음식</option>
										<option value="6">밀가루 줄이기</option>
									</select>
								</div>
		
					<table>
					
								<thead>
									
								</thead>
								
								<tbody>
									<tr>													
										<td><input type="file" placeholder="레시피 이미지" name="fileName" maxlength="50"/></td>
									</tr>
									<tr>													
										<td><input type="text" placeholder="레시피 게시글 제목" name="recipeTitle" maxlength="50"/></td>
									</tr>
									<tr>													
										<td><input type="text" placeholder="레시피 이름" name="recipeName" maxlength="50"/></td>
									</tr>
									<tr>
										<td><textarea style="min-height: 130px;" placeholder="레시피에 필요한 재료" name="recipeIngredi" maxlength="1000"></textarea></td>																									
									</tr>
									<tr>
										<td><textarea style="min-height: 300px;" placeholder="조리순서" name="recipeSteps" maxlength="1000"></textarea></td>																									
									</tr>												
								</tbody>												
					</table>
					<input type="submit"  style="text-align: center;" class="button primary" value="등록하기"/>
		</div>
	</form>
</body>
</html>