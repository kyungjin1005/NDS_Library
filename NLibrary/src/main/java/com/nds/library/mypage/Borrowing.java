package com.nds.library.mypage;

public class Borrowing {
	private int borrowing_id, book_id, user_id, delay_count;
	private String borrowing_date, scheduled_date, returned_date;
	public int getBorrowing_id() {
		return borrowing_id;
	}
	public void setBorrowing_id(int borrowing_id) {
		this.borrowing_id = borrowing_id;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getDelay_count() {
		return delay_count;
	}
	public void setDelay_count(int delay_count) {
		this.delay_count = delay_count;
	}
	public String getBorrowing_date() {
		return borrowing_date;
	}
	public void setBorrowing_date(String borrowed_date) {
		this.borrowing_date = borrowed_date;
	}
	public String getScheduled_date() {
		return scheduled_date;
	}
	public void setScheduled_date(String scheduled_date) {
		this.scheduled_date = scheduled_date;
	}
	public String getReturned_date() {
		return returned_date;
	}
	public void setReturned_date(String returned_date) {
		this.returned_date = returned_date;
	}
	
	
}
