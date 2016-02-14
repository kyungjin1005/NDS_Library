package com.nds.library.manager;

import java.util.ArrayList;
import java.util.Map;

import com.nds.library.mypage.ReqAndDon;

public interface IManagerDAO {
	public ArrayList<Message> MessageList();
	public ArrayList<ReqAndDon> requireBookList(Map<String, Object> map);
	public ReqAndDon getReqAndDonBook(ReqAndDon book);
	public ArrayList<Message> MessageList(Map<String, Object> map);
	public ArrayList<Message> messageDetail(int msg_id);
	
	public int requireConfirm(ReqAndDon book);
	public int requireRegisterBook(ReqAndDon book);
	public int insertBook(ReqAndDon book);
	public int requireRejectBook(ReqAndDon book);
	
	public ArrayList<ReqAndDon> donationBookList(Map<String, Object> map);
	public int donationRegisterBook(ReqAndDon book);
	public int donationRejectBook(ReqAndDon book);
	
	public ArrayList<User> memberList();
	public User getUser(User user);
	public ArrayList<User> userBorrowList(User user);
	public ArrayList<User> userRequireList(User user);
	public ArrayList<User> userDonationList(User user);
}
