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
	private int hit;

	public boardDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://218.234.204.205:3306/web?serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true",
					"DB_WEB", "webadmin01");
			st = con.createStatement();
		} catch (Exception e) {
			System.out.println("데이터베이스 오류" + e.getMessage());
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

	// 寃뚯떆湲� 踰덊샇 遺��뿬
	public int getNext() {
		String sql = "select board_idx from web_board order by board_idx desc";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;// 泥ル쾲吏멸쾶�떆臾쇱씤寃쎌슦
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;// �뜲�씠�꽣踰좎씠�뒪�삤瑜�
	}

	public int writeBoard(String id, String title, String content) {
		String SQL = "INSERT INTO web_board values (?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, id);
			pstmt.setString(3, title);
			pstmt.setString(4, content);
			pstmt.setString(5, getDate());
			pstmt.setInt(6, 1);
			pstmt.setInt(7, 1);// �쑀�슚踰덊샇
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int getCount() {
		String SQL = "SELECT COUNT(*) FROM web_board";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public ArrayList<boardVO> getBoardList(int pageNumber) {
		String SQL = "select * from web_board where Available = 1 order by board_idx DESC limit ?,10";
		ArrayList<boardVO> BoardList = new ArrayList<boardVO>();
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {

				int board_idx = rs.getInt("board_idx");
				String id = rs.getString("id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String date = rs.getString("date");
				int hit = rs.getInt("hit");
				int Available = rs.getInt("Available");
				boardVO board = new boardVO(board_idx, id, title, content, date, hit, Available);
				BoardList.add(board);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return BoardList;
	}

	public boolean nextPage(int pageNumber) {
		String sql = "select * from web_board where board_idx < ? and Available = 1 ";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boardVO getBoard(int board_idx) {
		String sql = "select * from web_board where board_idx = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_idx);
			rs = pstmt.executeQuery();
			if (rs.next()) {

				String id = rs.getString("id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String date = rs.getString("date");
				int hit = rs.getInt("hit");
				int Available = rs.getInt("Available");
				boardVO board = new boardVO(board_idx, id, title, content, date, hit, Available);
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
