package com.nds.library.manager;

import java.util.ArrayList;
import java.util.Map;

import com.nds.library.main.Borrowing;
import com.nds.library.main.User;
import com.nds.library.mypage.ReqAndDon;

public interface IManagerDAO {
	public ArrayList<Message> MessageList();
	public ArrayList<ReqAndDon> requireBookList(Map<String, Object> map);
	public ReqAndDon getReqAndDonBook(ReqAndDon book);
	public ArrayList<Message> MessageList(Map<String, Object> map);
	public Message messageDetail(int msg_id);
	
	public int requireConfirm(ReqAndDon book);
	public int requireRegisterBook(ReqAndDon book);
	public int insertBook(ReqAndDon book);
	public int requireRejectBook(ReqAndDon book);
	
	public ArrayList<ReqAndDon> donationBookList(Map<String, Object> map);
	public int donationRegisterBook(ReqAndDon book);
	public int donationRejectBook(ReqAndDon book);
	
	public ArrayList<User> memberList(Map<String, Object> map);
	public User getUser(User user);
	public ArrayList<User> userBorrowList(User user);
	public ArrayList<ReqAndDon> userRequireList(User user);
	public ArrayList<ReqAndDon> userDonationList(User user);
	
	public int messageSend(Message m);
	
	public ReqAndDon getInformation(ReqAndDon book);
	public int insertInformation(ReqAndDon book);
	
	public User findUserByUserId(String user_id);
	
	public ArrayList<Borrowing> managerBorrow(Map<String, Object> map);
	public void updateBorrowingDate(String borrowing_id);
	public void updateCurrentState(String book_id, String current_state);
	public Borrowing getBorrowingById(String borrowing_id);
	public void updateCurrentState(Map<String, Object> map);
	
	public ArrayList<ReqAndDon> bList(Map<String, Object> map);
	public int totalCount(Map<String, Object> map);
	public void updateReturnedDate(String borrowing_id);
	public ArrayList<Borrowing> bookList(Map<String, Object> map);
	public Borrowing getDamAndLosBook(Borrowing borrow);
	public void changeToDamOrLos(Map<String, Object> map);
	
	public int countUser();
	
	public int bookCount(Map<String, Object> map);
	public int messageCount(Map<String, Object> map);
	public void insertBorrowing(Map<String, Object> map);
	public void stopReserving(Map<String, Object> map);
	public ArrayList<Borrowing> getReservationList(Map<String, Object> map);
	public Borrowing getBookByReservationId(Map<String, Object> map);
}
