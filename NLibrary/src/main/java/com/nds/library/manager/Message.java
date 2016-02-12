package com.nds.library.manager;

public class Message {
	private int message_id, user_id, is_checked;
	private String title, content, sended_date, checked_date;
	public int getMessage_id() {
		return message_id;
	}
	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getIs_checked() {
		return is_checked;
	}
	public void setIs_checked(int is_checked) {
		this.is_checked = is_checked;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSended_date() {
		return sended_date;
	}
	public void setSended_date(String sended_date) {
		this.sended_date = sended_date;
	}
	public String getChecked_date() {
		return checked_date;
	}
	public void setChecked_date(String checked_date) {
		this.checked_date = checked_date;
	}
	
}
