package com.nds.library.main;

public class Book {
	private int book_id, information_id, read_count;
	private String current_state, registered_date, location;
	
	private String sbn, title, publisher, author, image;
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getRead_count() {
		return read_count;
	}
	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}
	public String getSbn() {
		return sbn;
	}
	public void setSbn(String sbn) {
		this.sbn = sbn;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public int getInformation_id() {
		return information_id;
	}
	public void setInformation_id(int information_id) {
		this.information_id = information_id;
	}
	public String getCurrent_state() {
		return current_state;
	}
	public void setCurrent_state(String current_state) {
		this.current_state = current_state;
	}
	public String getRegistered_date() {
		return registered_date;
	}
	public void setRegistered_date(String registered_date) {
		this.registered_date = registered_date;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
}
