package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

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
			System.out.println("¿¬°áÇÏÁö ¸øÇÏ¿´½À´Ï´Ù.: " + e.getMessage());
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

	public int writereply(int reply_idx, int con_num, String name, String id, String pw, String content, Date date) {
		String SQL = "INSERT INTO reply values (?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, con_num);
			pstmt.setInt(2, reply_idx );
			pstmt.setString(3, name);
			pstmt.setString(4, id);
			pstmt.setString(5, pw);
			pstmt.setString(6, content);
			pstmt.setString(7, getDate());
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
