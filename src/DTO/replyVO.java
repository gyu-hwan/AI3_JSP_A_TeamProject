package DTO;

import java.sql.Date;

public class replyVO {
	private int reply_idx;
	private int con_num;
	private String name;
	private String id;
	private String pw;
	private String content;
	private Date date;

	public replyVO(int reply_idx, int con_num, String name, String id, String pw, String content, Date date) {
		this.reply_idx = reply_idx;
		this.con_num = con_num;
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.content = content;
		this.date = date;
	}

	public void setReply_idx(int reply_idx) {
		this.reply_idx = reply_idx;
	}

	public int getReply_idx() {
		return reply_idx;
	}

	public void setCon_num(int con_num) {
		this.con_num = con_num;
	}

	public int getCon_num() {
		return con_num;
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
}
