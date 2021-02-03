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
<h2 style="text-align: center">레시피를 등록해주세요!</h2>
<br/>
	<form mothod="post" action="./recipe/recipeWriteAction.jsp">
		<div class="table-wrapper" style="width: 1050px; margin: auto;">
											<div class="col-12">
												<select name="recipeCode" id="demo-category">
													<option value="0">- 카테고리를 선택해주세요. -</option>
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
										<td colspan="2"><input type="text" placeholder="레시피 제목 예)쑥 라떼" name="recipeTitle" maxlength="50"/></td>
									</tr>
									<tr>
										<td colspan="2"><textarea style="min-height: 130px;" placeholder="요리소개 &#13;&#10;이 레시피의 탄생 배경을 적어주세요." name="recipeInfo" maxlength="1000"></textarea></td>																									
									</tr>
									<tr>													
										<td colspan="2">요리 대표 사진을 등록해주세요. <input type="file" placeholder="레시피 대표 이미지" name="fileName" maxlength="50"/></td>
									</tr>
									<tr>
									<div>
										<td>재료
											<input type="text" placeholder="예) 양배추" name="recipeIngredi" maxlength="100"></input>
										</td>						
										<td><br/>
											<input type="text" placeholder="예) 1/2개" name="recipeIngredi" maxlength="100"></input>			
										</td>																																				
									</tr>
									<tr>
										<td>
											<input type="text" placeholder="예) 사과" name="recipeIngredi" maxlength="100"></input>
										</td>						
										<td>
											<input type="text" placeholder="예) 반쪽" name="recipeIngredi" maxlength="100"></input>			
										</td>
									</div>
									</tr>
									<tr>
										<td colspan="2">						
											<input type="button" style="float:right;" class="button primary" value="재료추가" name="fileName" maxlength="50"/>
										</td>																																				
									</tr>
									<tr>							
										<td colspan="2">
											<textarea style="min-height: 150px;" placeholder="요리 순서 Step1" name="recipeSteps" maxlength="1000"></textarea>
											해당 요리 순서의 이미지를 선택해주세요. <input type="file" placeholder="레시피 대표 이미지" name="fileName" maxlength="50"/>
										</td>																									
									</tr>
									<tr>
										<td colspan="2">
											<input type="button" style="float:right;" class="button primary" value="순서추가" name="fileName" maxlength="50"/>
										</td>
									</tr>
									<tr>
										<td colspan="2"><textarea style="min-height: 130px;" placeholder="요리팁 &#13;&#10;예) 과일과 채소를 먼저 간 후에 물을 넣고 갈아야 잘 섞여요." name="recipeInfo" maxlength="1000"></textarea></td>																									
									</tr>											
								</tbody>												
					</table>
					<input type="submit"  style="text-align:center;" class="button primary" value="등록하기"/>
		</div>
	</form>
</body>
</html>