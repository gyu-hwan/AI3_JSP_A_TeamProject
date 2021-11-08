package DTO;

import java.sql.Date;

public class boardVO {
	private int board_idx;
	private String name;
	private String id;
	private String pw;
	private String title;
	private String content;
	private Date date;
	private int hit;

	public boardVO(int board_idx, String name, String id, String pw, String title, String content, Date date,
			int hit) {
		this.board_idx = board_idx;
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.title = title;
		this.content = content;
		this.date = date;
		this.hit = hit;
	}

	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}

	public int getBoard_idx() {
		return board_idx;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getPw() {
		return pw;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitle() {
		return title;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getContent() {
		return content;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Date getDate() {
		return date;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getHit() {
		return hit;
	}

}
