package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	//접속 
	public BoardDAO() {
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
	
	//날짜 조회
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
	
	//다음으로 작성될 글의 번호 (다음 boardNo값)
	public int getNext() {
		String SQL = "select boardNo from board order by boardNo desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //첫번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1; //데이터 베이스 오류
	}
	
	//작성된 글 데이터 베이스에 넣기
	public int write(String boardTitle, String id, String boardContent) {	
		String SQL = "insert into board values (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()); //게시글 번호가 맨처음 boardNo
			pstmt.setString(2, boardTitle);
			pstmt.setString(3, id);
			pstmt.setString(4, getDate());
			pstmt.setString(5, boardContent);
			pstmt.setInt(6, 1);
			
			return pstmt.executeUpdate();  //글쓰기 성공
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1; //데이터 베이스 오류
		
	}
	
	//게시판 리스트 출력 10개씩 출력
	public ArrayList<BoardVO> getList(int pageNumber){
		String SQL = "select * from board where boardNo < ? and boardAvailable = 1 order by boardNo desc limit 10";
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVO board = new BoardVO();
				board.setBoardNo(rs.getInt(1));
				board.setBoardTitle(rs.getString(2));
				board.setId(rs.getString(3));
				board.setBoardDate(rs.getString(4));
				board.setBoardContent(rs.getString(5));
				board.setBoardContent(rs.getString(5));
				board.setBoardAvailable(rs.getInt(6));
				
				list.add(board);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	//10단위로 끊기면 다음페이지가 없을을 처리 (페이징 처리)
	public boolean nextPage(int pageNumber) {
		String SQL = "select * from board where boardNo < ? and boardAvailable = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;  //하나라도 존재하면 다음페이지 존재
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	//글내용 불러오기
	public BoardVO getBoard(int boardNo) {
		String SQL = "select * from board where boardNo = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				BoardVO board = new BoardVO();
				board.setBoardNo(rs.getInt(1));
				board.setBoardTitle(rs.getString(2));
				board.setId(rs.getString(3));
				board.setBoardDate(rs.getString(4));
				board.setBoardContent(rs.getString(5));
				board.setBoardAvailable(rs.getInt(6));
				return board;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//내가 쓴 글 불러오기
	public ArrayList<BoardVO> getMyList(String id){
		String SQL = "select * from board where id = ?";
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVO board = new BoardVO();
				board.setBoardNo(rs.getInt(1));
				board.setBoardTitle(rs.getString(2));
				board.setId(rs.getString(3));
				board.setBoardDate(rs.getString(4));
				board.setBoardContent(rs.getString(5));
				board.setBoardContent(rs.getString(5));
				board.setBoardAvailable(rs.getInt(6));
				
				list.add(board);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	//글 수정
	public int update(int boardNo, String boardTitle, String boardContent) {
		String SQL = "update board set boardTitle = ?, boardContent = ? where boardNo = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, boardTitle); //게시글 번호가 맨처음 boardNo
			pstmt.setString(2, boardContent);
			pstmt.setInt(3, boardNo);
			return pstmt.executeUpdate();  //글수정 성공
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1; //데이터 베이스 오류
	}
	
	//글 삭제하기 - 글을 삭제하더라도 정보는 남아있게 하기
	public int delete(int boardNo) {
		String SQL = "update board set boardAvailable = 0 where boardNo = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardNo); 
			return pstmt.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1; //데이터 베이스 오류
	}
	
}
