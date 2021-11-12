package DTO;

import java.sql.Date;

public class boardVO {
	private int board_idx;

	private String id;
	private String title;
	private String content;
	private Date date;
	private int hit;
	private int Available;

	public boardVO(int board_idx,  String id, String title, String content, Date date, int hit,
			int Available) {
		this.board_idx = board_idx;
		this.id = id;
		this.title = title;
		this.content = content;
		this.date = date;
		this.hit = hit;
		this.Available = Available;
	}

	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}

	public int getBoard_idx() {
		return board_idx;
	}

	public void setAvailable(int Available) {
		this.Available = Available;
	}

	public int getAvailable() {
		return Available;
	}


	public void setId(String id) {
		this.id = id;
	}

	public String getId() {
		return id;
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
