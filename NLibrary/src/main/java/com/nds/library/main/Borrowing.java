package com.nds.library.main;

public class Borrowing {
	// borrowings table
	private String borrowing_id, book_id, user_id;
	private String borrowing_date, scheduled_date, returned_date;
	private int delay_count;
	// books table
	private String information_id, current_state, registered_date, location;
	// informations
	private String category_id, ISBN, title, author, publisher, image, pubdate, explanation;
	// users
	private String NDS_nubmer, password, name, position, department, picture, authority;
	// reservation
	private String reservation_id, reservated_date;
	
	public String getBorrowing_id() {
		return borrowing_id;
	}
	public void setBorrowing_id(String borrowing_id) {
		this.borrowing_id = borrowing_id;
	}
	public String getBook_id() {
		return book_id;
	}
	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBorrowing_date() {
		return borrowing_date;
	}
	public void setBorrowing_date(String borrowing_date) {
		this.borrowing_date = borrowing_date;
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
	public int getDelay_count() {
		return delay_count;
	}
	public void setDelay_count(int delay_count) {
		this.delay_count = delay_count;
	}
	public String getInformation_id() {
		return information_id;
	}
	public void setInformation_id(String information_id) {
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
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getPubdate() {
		return pubdate;
	}
	public void setPubdate(String pubdate) {
		this.pubdate = pubdate;
	}
	public String getExplanation() {
		return explanation;
	}
	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}
	public String getNDS_nubmer() {
		return NDS_nubmer;
	}
	public void setNDS_nubmer(String nDS_nubmer) {
		NDS_nubmer = nDS_nubmer;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getReservation_id() {
		return reservation_id;
	}
	public void setReservation_id(String reservation_id) {
		this.reservation_id = reservation_id;
	}
	public String getReservated_date() {
		return reservated_date;
	}
	public void setReservated_date(String reservated_date) {
		this.reservated_date = reservated_date;
	}
	
}
