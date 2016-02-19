package com.nds.library.mypage;

import java.util.ArrayList;
import java.util.Map;

import com.nds.library.main.Borrowing;
import com.nds.library.main.User;
import com.nds.library.manager.Message;

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

	public void updateMsgToCheck(int msg_id);

	public int getBorrowingCount(String user_id);

	public void delayBorrowing(Map<Object, String> map);
}
