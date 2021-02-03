package recipeMenu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class RecipeMenuDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	public RecipeMenuDAO() {
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
	
	public ArrayList<RecipeMenuVO> getMenuList(){
		String SQL ="select * from recipemenu";
		ArrayList<RecipeMenuVO> list = new ArrayList<RecipeMenuVO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				RecipeMenuVO menu = new RecipeMenuVO();
				menu.setRecipeCode(rs.getInt(1));
				menu.setRecipeMenu(rs.getString(2));
				
				list.add(menu);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			}
			return list;
			
		}
	
		
			
}	

	
