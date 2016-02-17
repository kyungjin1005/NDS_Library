package com.nds.library.mypage;

import java.util.ArrayList;
import java.util.Map;

import com.nds.library.manager.User;

public interface IMypageDAO {
	public ArrayList<Borrowing> BorrowingList();
	
	
	public ArrayList<ReqAndDon> requireBookList(Map<String, Object> map);
	public int requireBookAdd(ReqAndDon book);
	
	public ArrayList<ReqAndDon> donationBookList(Map<String, Object> map);
	public int donationBookAdd(ReqAndDon book);


	public int totalCount(Map<String, Object> map);
	


}
