package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import DTO.memberVO;

public class memberDAO {
	private Connection con;
	private Statement st;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private ArrayList<memberVO> memberlist = new ArrayList<>();
	
	public memberDAO() {
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://218.234.204.205:3306/bbs?serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true",
					"DB_WEB", "webadmin01");
			st = con.createStatement();
		}
		catch(Exception e)
		{
			System.out.println("데이버테이스 연결 오류: "+e.getMessage());
		}
	}
	public ArrayList<memberVO> AllMember() {
		String SQL = "select * from web_member";
		ArrayList<memberVO> memberlist = new ArrayList<memberVO>();
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int user_number = rs.getInt("user_number");
				String userID = rs.getString("id");
				String userPW = rs.getString("pw");
				String userName = rs.getString("name");
				int phone = rs.getInt("phone");
				memberVO member = new memberVO(user_number, userID, userPW, userName, phone);
				memberlist.add(member);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberlist;
	}
	
	public void signUp(String id, String pw, String name, int phone) {
		String SQL="insert into web_member(id,pw,name,phone) "
				+ "values(?,?,?,?)";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setInt(4, phone);
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("데이터베이스 연결 오류: "+e.getMessage());
		}
	}
	
	public int updatePW(String pw, String id) {
		String SQL = "update web_member set pw = ? where id = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, pw);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int updatePhone(String phone, String id) {
		String SQL = "update web_member set phone = ? where id = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, phone);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
		public int Delete(String id) {
			String SQL = "delete from web_member where id=?";
			try {
				PreparedStatement pstmt = con.prepareStatement(SQL);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				return 1;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1;
		
	}
		
		public int login(String id, String pw) {
			String SQL = "SELECT pw FROM web_member WHERE id=?";
			try {
				pstmt = con.prepareStatement(SQL);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					if(rs.getString(1).equals(pw)) {
						return 1; //로그인 성공
					}
					else {
						return 0; //패스워드 불일치
					}
				}
				return -1; //ID 불일치
			} catch(Exception e)
			{
				System.out.println("데이버테이스 연결 오류: "+e.getMessage());
			}
			return -2; //모두 불일치 or 에러
		}
}