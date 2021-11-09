package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import DTO.boardVO;

public class boardDAO {
	private Connection con;
	private Statement st;
//	private PreparedStatement pstmt;
	private ResultSet rs;

	public boardDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://218.234.204.205:3306/bbs?serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true",
					"DB_WEB", "webadmin01");
			st = con.createStatement();
		} catch (Exception e) {
			System.out.println("데이버테이스 연결 오류: " + e.getMessage());
		}
	}

	public String getDate() {
		String SQL = "select now()";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	public int writeBoard(String name, String id, String pw, String title, String content,
			int hit) {
		String SQL = "INSERT INTO web_board(name,id,pw,title,content,date,hit) values (?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, pw);
			pstmt.setString(4, title);
			pstmt.setString(5, content);
			pstmt.setString(6, getDate());
			pstmt.setInt(7, hit);
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public ArrayList<boardVO> getBoardList(int pageNumber) {
		String SQL = "select * from web_board order by board_idx DESC limit ?,10";
		ArrayList<boardVO> BoardList = new ArrayList<boardVO>();
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, (pageNumber-1)*10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int board_idx = rs.getInt("board_idx");
				String name = rs.getString("name");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Date date = rs.getDate("date");
				int hit = rs.getInt("hit");
				boardVO board = new boardVO(board_idx, name, id, pw, title, content, date, hit);
				BoardList.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return BoardList;
	}
	
	public boardVO getBoard(int boardID) {
		String SQL = "select * from web_board where board_idx = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int board_idx = rs.getInt("board_idx");
				String name = rs.getString("name");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Date date = rs.getDate("date");
				int hit = rs.getInt("hit");
				boardVO board = new boardVO(board_idx, name, id, pw, title, content, date, hit);
				return board;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	
	public int updateTitle(String title, int board_idx) {
		String SQL = "update web_board set title = ? where board_idx = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, title);
			pstmt.setInt(2, board_idx);
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int updateContent(String boardContent, int boardID) {
		String SQL = "update web_board set content = ? where board_idx = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, boardContent);
			pstmt.setInt(2, boardID);
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int DeleteBoard(int board_idx) {
		String SQL = "delete from web_board where board_idx=?";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, board_idx);
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
