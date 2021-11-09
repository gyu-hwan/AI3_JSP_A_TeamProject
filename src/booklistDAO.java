package book;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class booklistDAO {
//	private ArrayList<MemberVO> dtos;
	private Connection con;
	private Statement st;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private ArrayList<booklistVO> booklist = new ArrayList<>();
	
	public booklistDAO() {
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://218.234.204.205:3306/web?serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true","DB_WEB","webadmin01");
			st = con.createStatement();
		}
		catch(Exception e)
		{
			System.out.println("데이버테이스 연결 오류: "+e.getMessage());
		}
	}
	
	public ArrayList<booklistVO> AllBook() {
		String SQL = "select * from web_booklist";
		ArrayList<booklistVO> booklist = new ArrayList<booklistVO>();
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int book_number = rs.getInt("book_number");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String publisher = rs.getString("publisher");
				Date year = rs.getDate("year");
				int loan = rs.getInt("loan");
				booklistVO booklistVO = new booklistVO(book_number, title, writer, publisher, year, loan);
				booklist.add(booklistVO);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return booklist;
	}
	
	public void AddBook(String title, String writer, String publisher, Date year, int loan) {
		String SQL="insert into web_booklist(title,writer,publisher,year,loan) "
				+ "values(?,?,?,?,?)";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, title);
			pstmt.setString(2, writer);
			pstmt.setString(3, publisher);
			pstmt.setDate(4, year);
			pstmt.setInt(5, loan);
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("데이터베이스 연결 오류: "+e.getMessage());
		}
	}
	
	public int updateTitle(String title, int book_number) {
		String SQL = "update web_booklist set title = ? where book_number = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, title);
			pstmt.setInt(2, book_number);
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int updateWriter(String writer, int book_number) {
		String SQL = "update web_booklist set writer = ? where book_number = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, writer);
			pstmt.setInt(2, book_number);
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int updatePublisher(String publisher, int book_number) {
		String SQL = "update web_booklist set publisher = ? where book_number = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, publisher);
			pstmt.setInt(2, book_number);
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int updateYear(Date year, int book_number) {
		String SQL = "update web_booklist set year = ? where book_number = ?";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setDate(1, year);
			pstmt.setInt(2, book_number);
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
		public int Delete(int book_number) {
			String SQL = "delete from web_booklist where id=?";
			try {
				PreparedStatement pstmt = con.prepareStatement(SQL);
				pstmt.setInt(1, book_number);
				pstmt.executeUpdate();
				return 1;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1;
		
	}
}
