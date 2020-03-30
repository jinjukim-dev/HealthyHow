package recipe;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class RecipeDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	//접속
	public RecipeDAO() {
		try {
			String dbURL = "jdbc:mysql://127.0.0.1:3306/recipe?useUnicode=true&characterEncoding=utf8";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//날짜 받아오기
	public String getDate() {
		String SQL = "select now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터 베이스 오류
	}
	
	//작성된 레시피 저장하기
	public int wirteRecipe(int recipeCode, String recipeTitle, String recipeName, String id, String recipeIngredi, 
			String recipeSteps, String fileName) {
		String SQL = "insert into recipeboard (recipeCode, recipeTitle, recipeName, id, recipeIngredi, recipeSteps, recipeDate, recipeAvailable, fileName) values" + 
				" (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, recipeCode);
			pstmt.setString(2, recipeTitle);
			pstmt.setString(3, recipeName);
			pstmt.setString(4, id);
			pstmt.setString(5, recipeIngredi);
			pstmt.setString(6, recipeSteps);
			pstmt.setString(7, getDate());
			pstmt.setInt(8, 1);
			pstmt.setString(9, fileName);
			
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;  //데이터 베이스 오류
	}
	
	//menu 별 리스트 출력
	public ArrayList<RecipeVO> getRecipeList(int recipeCode){
		String SQL = "select * from recipeboard where recipeCode = ?";
		ArrayList<RecipeVO> list = new ArrayList<RecipeVO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, recipeCode);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				RecipeVO recipe = new RecipeVO();
				recipe.setRecipeNo(rs.getInt(1));
				recipe.setRecipeCode(rs.getInt(2));
				recipe.setRecipeTitle(rs.getString(3));
				recipe.setRecipeName(rs.getString(4));
				recipe.setId(rs.getString(5));
				recipe.setRecipeIngredi(rs.getString(6));
				recipe.setRecipeSteps(rs.getString(7));
				recipe.setRecipeDate(rs.getString(8));
				recipe.setRecipeAvailable(rs.getInt(9));
				recipe.setFileName(rs.getString(10));
				
				list.add(recipe);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//내가 작성한 레시피만 불러오기
	public ArrayList<RecipeVO> getMyRecipeList(String id){
		String SQL = "select * from recipeboard where id = ?";
		ArrayList<RecipeVO> list = new ArrayList<RecipeVO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				RecipeVO recipe = new RecipeVO();
				recipe.setRecipeNo(rs.getInt(1));
				recipe.setRecipeCode(rs.getInt(2));
				recipe.setRecipeTitle(rs.getString(3));
				recipe.setRecipeName(rs.getString(4));
				recipe.setId(rs.getString(5));
				recipe.setRecipeIngredi(rs.getString(6));
				recipe.setRecipeSteps(rs.getString(7));
				recipe.setRecipeDate(rs.getString(8));
				recipe.setRecipeAvailable(rs.getInt(9));
				recipe.setFileName(rs.getString(10));
				
				list.add(recipe);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//글 내용 불러오기
	public RecipeVO getRecipe(int recipeNo) {
		String SQL = "select * from recipeboard where recipeNo = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, recipeNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				RecipeVO recipe = new RecipeVO();
				recipe.setRecipeNo(rs.getInt(1));
				recipe.setRecipeCode(rs.getInt(2));
				recipe.setRecipeTitle(rs.getString(3));
				recipe.setRecipeName(rs.getString(4));
				recipe.setId(rs.getString(5));
				recipe.setRecipeIngredi(rs.getString(6));
				recipe.setRecipeSteps(rs.getString(7));
				recipe.setRecipeDate(rs.getString(8));
				recipe.setRecipeAvailable(rs.getInt(9));
				recipe.setFileName(rs.getString(10));
				return recipe;				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;		
	}

}
