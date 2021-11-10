package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import DTO.replyVO;

public class replyDAO {
	private Connection con;
	private Statement st;

	private ResultSet rs;

	public replyDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://218.234.204.205:3306/web?serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true",
					"DB_WEB", "webadmin01");
			st = con.createStatement();
		} catch (Exception e) {
			System.out.println("데이터베이스 오류: " + e.getMessage());
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
	
	public ArrayList<replyVO> getReplyList(int reply_idx) {
		String SQL = "select * from reply where reply_idx = ? order by con_num ASC";
		ArrayList<replyVO> ReplyList = new ArrayList<replyVO>();
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, reply_idx);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int con_num = rs.getInt("con_num");
				String name = rs.getString("name");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String content = rs.getString("content");
				Date date = rs.getDate("date");
				replyVO reply = new replyVO(con_num, reply_idx, name, id, pw, content, date);
				ReplyList.add(reply);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ReplyList;
	}

	public int writereply(int reply_idx, String name, String id, String pw, String content) {
		String SQL = "INSERT INTO reply(reply_idx,name,id,pw,content,date) values (?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, reply_idx);
			pstmt.setString(2, name);
			pstmt.setString(3, id);
			pstmt.setString(4, pw);
			pstmt.setString(5, content);
			pstmt.setString(6, getDate());
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public String UpdateReply(String content, int reply_idx, int con_num) {
		String SQL = "UPDATE reply set content=? WHERE reply_idx=? AND con_num = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, content);
			pstmt.setInt(2, reply_idx);
			pstmt.setInt(3, con_num);
			rs = pstmt.executeQuery();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	public int deleteReply(int reply_idx, int con_num) {
		String SQL = "DELETE FROM reply WHERE reply_idx=? AND con_num = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, reply_idx);
			pstmt.setInt(2, con_num);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}