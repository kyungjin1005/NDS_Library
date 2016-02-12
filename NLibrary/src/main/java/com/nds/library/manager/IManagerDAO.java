package com.nds.library.manager;

import java.util.ArrayList;
import java.util.Map;

import com.nds.library.mypage.ReqAndDon;

public interface IManagerDAO {
	public ArrayList<Message> MessageList();
	public ArrayList<ReqAndDon> requireBookList(Map<String, Object> map);
	public ReqAndDon getRequireBook(ReqAndDon book);
}
