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
				recipe.setId(rs.getString(4));
				recipe.setFileName(rs.getString(5));
				recipe.setRecipeInfo(rs.getString(6));
				recipe.setRecipeIngredi1(rs.getString(7));
				recipe.setRecipeIngredi2(rs.getString(8));
				recipe.setRecipeIngredi3(rs.getString(9));
				recipe.setRecipeIngredi4(rs.getString(10));
				recipe.setRecipeIngredi5(rs.getString(11));
				recipe.setRecipeQuant1(rs.getString(12));
				recipe.setRecipeQuant2(rs.getString(13));
				recipe.setRecipeQuant3(rs.getString(14));
				recipe.setRecipeQuant4(rs.getString(15));
				recipe.setRecipeQuant5(rs.getString(16));
				recipe.setRecipeStep1(rs.getString(17));
				recipe.setRecipeStep2(rs.getString(18));
				recipe.setRecipeStep3(rs.getString(19));
				recipe.setRecipeStep1fileName(rs.getString(20));
				recipe.setRecipeStep2fileName(rs.getString(21));
				recipe.setRecipeStep3fileName(rs.getString(22));
				recipe.setRecipeDate(rs.getString(23));
				recipe.setRecipeAvailable(rs.getInt(24));
				recipe.setRecipeTips(rs.getString(25));
				
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
		  try { PreparedStatement pstmt = conn.prepareStatement(SQL); 
		  pstmt.setString(1, id); 
		  rs = pstmt.executeQuery(); 
		  while(rs.next()) { 
			RecipeVO recipe = new RecipeVO();
	  
			recipe.setRecipeNo(rs.getInt(1));
			recipe.setRecipeCode(rs.getInt(2));
			recipe.setRecipeTitle(rs.getString(3));
			recipe.setId(rs.getString(4));
			recipe.setFileName(rs.getString(5));
			recipe.setRecipeInfo(rs.getString(6));
			recipe.setRecipeIngredi1(rs.getString(7));
			recipe.setRecipeIngredi2(rs.getString(8));
			recipe.setRecipeIngredi3(rs.getString(9));
			recipe.setRecipeIngredi4(rs.getString(10));
			recipe.setRecipeIngredi5(rs.getString(11));
			recipe.setRecipeQuant1(rs.getString(12));
			recipe.setRecipeQuant2(rs.getString(13));
			recipe.setRecipeQuant3(rs.getString(14));
			recipe.setRecipeQuant4(rs.getString(15));
			recipe.setRecipeQuant5(rs.getString(16));
			recipe.setRecipeStep1(rs.getString(17));
			recipe.setRecipeStep2(rs.getString(18));
			recipe.setRecipeStep3(rs.getString(19));
			recipe.setRecipeStep1fileName(rs.getString(20));
			recipe.setRecipeStep2fileName(rs.getString(21));
			recipe.setRecipeStep3fileName(rs.getString(22));
			recipe.setRecipeDate(rs.getString(23));
			recipe.setRecipeAvailable(rs.getInt(24));
			recipe.setRecipeTips(rs.getString(25));
	  
			list.add(recipe); 
			}
	  
	  } catch (Exception e) { 
		  e.printStackTrace(); 
		 } return list; 
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
				recipe.setId(rs.getString(4));
				recipe.setFileName(rs.getString(5));
				recipe.setRecipeInfo(rs.getString(6));
				recipe.setRecipeIngredi1(rs.getString(7));
				recipe.setRecipeIngredi2(rs.getString(8));
				recipe.setRecipeIngredi3(rs.getString(9));
				recipe.setRecipeIngredi4(rs.getString(10));
				recipe.setRecipeIngredi5(rs.getString(11));
				recipe.setRecipeQuant1(rs.getString(12));
				recipe.setRecipeQuant2(rs.getString(13));
				recipe.setRecipeQuant3(rs.getString(14));
				recipe.setRecipeQuant4(rs.getString(15));
				recipe.setRecipeQuant5(rs.getString(16));
				recipe.setRecipeStep1(rs.getString(17));
				recipe.setRecipeStep2(rs.getString(18));
				recipe.setRecipeStep3(rs.getString(19));
				recipe.setRecipeStep1fileName(rs.getString(20));
				recipe.setRecipeStep2fileName(rs.getString(21));
				recipe.setRecipeStep3fileName(rs.getString(22));
				recipe.setRecipeDate(rs.getString(23));
				recipe.setRecipeAvailable(rs.getInt(24));
				recipe.setRecipeTips(rs.getString(25));
				
				return recipe;				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;		
	}

}
