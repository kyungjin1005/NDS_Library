package com.nds.library.board;

public class Reply {

	private int reply_id, user_id, board_id, blind, req_don_id;
	private String content, replyed_date, name, boarded_date, title, category;
	
	
	public int getReply_id() {
		return reply_id;
	}
	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public int getBlind() {
		return blind;
	}
	public void setBlind(int blind) {
		this.blind = blind;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReplyed_date() {
		return replyed_date;
	}
	public void setReplyed_date(String replyed_date) {
		this.replyed_date = replyed_date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getReq_don_id() {
		return req_don_id;
	}
	public void setReq_don_id(int req_don_id) {
		this.req_don_id = req_don_id;
	}
	public String getBoarded_date() {
		return boarded_date;
	}
	public void setBoarded_date(String boarded_date) {
		this.boarded_date = boarded_date;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	
	
}
