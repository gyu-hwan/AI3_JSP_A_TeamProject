package DTO;

import java.sql.Date;

public class booklistVO {
	private int book_number;
	private String title;
	private String writer;
	private String publisher;
	private Date year;
	private int loan;
	private String contents;
	private String field;
	private String imgURL;

	public booklistVO(int book_number, String title, String writer, String publisher, Date year, int loan
			,String contents,String field,String imgURL) {
		this.book_number = book_number;
		this.title = title;
		this.writer = writer;
		this.publisher = publisher;
		this.year = year;
		this.loan = loan;
		this.contents = contents;
		this.field = field;
		this.imgURL= imgURL;
		
	}

	public void setBook_number(int book_number) {
		this.book_number = book_number;
	}

	public int getBook_number() {
		return book_number;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitle() {
		return title;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getWriter() {
		return writer;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setYear(Date year) {
		this.year = year;
	}

	public Date getYear() {
		return year;
	}

	public void setLoan(int loan) {
		this.loan = loan;
	}

	public int getLoan() {
		return loan;
	}
	
	public void setContent(String Content) {
		this.contents=Content;
	}
	public String getContent() {
		return	contents;
	}	
	public void setField(String field) {
		this.field=field;
	}
	public String getField() {
		return field;
	}	
	public void setImgURL(String ImgURL) {
		this.imgURL=ImgURL;
	}
	public String getImgURL() {
		return imgURL;
	}	
}
