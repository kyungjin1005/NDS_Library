package com.nds.library.mypage;

import java.util.ArrayList;
import java.util.Map;

import com.nds.library.mypage.User;

public interface IMypageDAO {
	public ArrayList<Borrowing> mypageBorrow(Map<String, Object> map);
	
	public ArrayList<ReqAndDon> requireBookList(Map<String, Object> map);
	public int requireBookAdd(ReqAndDon book);
	
	public ArrayList<ReqAndDon> donationBookList(Map<String, Object> map);
	public int donationBookAdd(ReqAndDon book);
	
	public int totalCount(Map<String, Object> map);

	public ArrayList<Borrowing> mypageReserveList(Map<String, Object> map);

	public ArrayList<Message> getMessageList(Map<String, Object> map);

	public Message messageDetail(int msg_id);

	public User findUserByUserId(String user_id);
}
