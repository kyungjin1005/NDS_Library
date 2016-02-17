package com.nds.library.main;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.nds.library.board.Board;
import com.nds.library.manager.User;

public interface IMainDAO {
	
	  public ArrayList<Book> NewRegisteredBookList();
	public ArrayList<Board> StudyBoardList();
	public ArrayList<Board> NoticeBoardList();
	public ArrayList<Board> MonthlyChampion();
	public ArrayList<Book> MonthlyBookList();
	//public ArrayList<Book> NewBookList();
	public ArrayList<Book> bookList();
	public User getSessionId(Map<String, Object> map);
	
	public int totalCount(Map<String, Object> map);
	  public int totalCount2(Map<String, Object> map);
	   public int add(Review r);
	   
	   public ArrayList<Information> ownInfo(Map<String, Object> map);
	   public ArrayList<Information> bookInfo(Map<String, Object> map);
	   public ArrayList<Review> bookReview(Map<String, Object> map);
	   public ArrayList<Information> result(HashMap<String, Object> map);
	   public ArrayList<Information> data(HashMap<String, Object> map);

}