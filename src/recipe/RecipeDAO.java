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
	public int wirteRecipe(int recipeCode, String recipeTitle, String id, String fileName, String recipeInfo,
			String recipeIngredi1, String recipeIngredi2, String recipeIngredi3, String recipeIngredi4, String recipeIngredi5,
			String recipeQuant1, String recipeQuant2, String recipeQuant3, String recipeQuant4, String recipeQuant5,
			String recipeStep1, String recipeStep2, String recipeStep3, String recipeStep1fileName, String recipeStep2fileName, String recipeStep3fileName,
			String recipeTips) {
		String SQL = "insert into recipeboard (recipeCode, recipeTitle, id, fileName, recipeInfo,"
				+ " recipeIngredi1, recipeIngredi2, recipeIngredi3, recipeIngredi4, recipeIngredi5,"
				+ " recipeQuant1, recipeQuant2, recipeQuant3, recipeQuant4, recipeQuant5,"
				+ " recipeStep1, recipeStep2, recipeStep3, recipeStep1fileName, recipeStep2fileName, recipeStep3fileName, "
				+ " recipeDate, recipeAvailable, recipeTips) values" + 
				" (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, recipeCode);
			pstmt.setString(2, recipeTitle);
			pstmt.setString(3, id);
			pstmt.setString(4, fileName);
			pstmt.setString(5, recipeInfo);
			pstmt.setString(6, recipeIngredi1);
			pstmt.setString(7, recipeIngredi2);
			pstmt.setString(8, recipeIngredi3);
			pstmt.setString(9, recipeIngredi4);
			pstmt.setString(10, recipeIngredi5);
			pstmt.setString(11, recipeQuant1);
			pstmt.setString(12, recipeQuant2);
			pstmt.setString(13, recipeQuant3);
			pstmt.setString(14, recipeQuant4);
			pstmt.setString(15, recipeQuant5);
			pstmt.setString(16, recipeStep1);
			pstmt.setString(17, recipeStep2);
			pstmt.setString(18, recipeStep3);
			pstmt.setString(19, recipeStep1fileName);
			pstmt.setString(20, recipeStep2fileName);
			pstmt.setString(21, recipeStep3fileName);
			pstmt.setString(22, getDate());
			pstmt.setInt(23, 1); //recipeAvailable
			pstmt.setString(24, recipeTips);
			
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
	  
	//recipeNo로 스크랩한 레시피 불러오기
	  public ArrayList<RecipeVO> getScrapList(int recipeNo){ 
		  String SQL = "select * from recipeboard where recipeNo = ?"; 
		  ArrayList<RecipeVO> list = new ArrayList<RecipeVO>(); 
		  try { PreparedStatement pstmt = conn.prepareStatement(SQL); 
		  pstmt.setInt(1, recipeNo); 
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
