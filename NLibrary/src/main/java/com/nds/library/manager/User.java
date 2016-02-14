package com.nds.library.manager;

public class User {

	private String user_id;
	private String nds_number;
	private String password;
	private String name;
	private String position;
	private String department;
	private String picture;
	private String authority;
	private String registered_date;
	
	private String title;
	private String publisher;
	private String pubdate;
	private String author;
	private String current_state;
	private String borrowing_date;
	private String returned_date;
	private String scheduled_date;
	private String delay_count;
	private String image;
	
	
	/*--화면 23 : 대여내역
 borrowing_date, returned_date
	from borrowings natural join books natural join informations
	where user_id=1
	order by borrowing_date desc;

	--화면 23 : 신청내역. 
	select , publisher, pubdate, reqanddon.registered_date, current_state
	from reqanddon join users using(user_id)
	where user_id=1 and not (current_state='기증완료' or current_state='기증대기' or current_state='기증반려')
	order by reqanddon.registered_date desc;

	--화면 23 : 도서 기증 내역. 
	select name, publisher, pubdate, reqanddon.registered_date, current_state
	from reqanddon join users using(user_id)
	where user_id=1 and (current_state='기증완료' or current_state='기증대기')
	order by reqanddon.registered_date desc;*/
	
	

	public String getUser_id() {
		return user_id;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getScheduled_date() {
		return scheduled_date;
	}

	public void setScheduled_date(String scheduled_date) {
		this.scheduled_date = scheduled_date;
	}

	public String getDelay_count() {
		return delay_count;
	}

	public void setDelay_count(String delay_count) {
		this.delay_count = delay_count;
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

	public String getPubdate() {
		return pubdate;
	}

	public void setPubdate(String pubdate) {
		this.pubdate = pubdate;
	}

	public String getCurrent_state() {
		return current_state;
	}

	public void setCurrent_state(String current_state) {
		this.current_state = current_state;
	}

	public String getBorrowing_date() {
		return borrowing_date;
	}

	public void setBorrowing_date(String borrowing_date) {
		this.borrowing_date = borrowing_date;
	}

	public String getReturned_date() {
		return returned_date;
	}

	public void setReturned_date(String returned_date) {
		this.returned_date = returned_date;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getNds_number() {
		return nds_number;
	}

	public void setNds_number(String nds_number) {
		this.nds_number = nds_number;
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

	public String getRegistered_date() {
		return registered_date;
	}

	public void setRegistered_date(String registered_date) {
		this.registered_date = registered_date;
	}

}
