package com.nds.library.manager;

import java.util.ArrayList;
import java.util.Map;

public interface IManagerDAO {
	public ArrayList<Message> MessageList(Map<String, Object> map);
	public ArrayList<Message> messageDetail(int msg_id);
}
