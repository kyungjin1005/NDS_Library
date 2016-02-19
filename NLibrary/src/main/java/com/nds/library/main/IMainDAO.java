package com.nds.library.main;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.nds.library.board.Board;
import com.nds.library.main.User;

public interface IMainDAO {

	public ArrayList<Borrowing> NewRegisteredBookList();

	public ArrayList<Board> StudyBoardList();

	public ArrayList<Board> NoticeBoardList();

	public ArrayList<Board> MonthlyChampion();

	public ArrayList<Borrowing> MonthlyBookList();

	// public ArrayList<Book> NewBookList();
	public ArrayList<Borrowing> bookList();

	public User getSessionId(Map<String, Object> map);

	public int totalCount(Map<String, Object> map);

	public int totalCount2(Map<String, Object> map);

	public int add(Review r);

	public ArrayList<Borrowing> ownInfo(Map<String, Object> map);

	public ArrayList<Borrowing> bookInfo(Map<String, Object> map);

	public ArrayList<Review> bookReview(Map<String, Object> map);

	public ArrayList<Borrowing> result(HashMap<String, Object> map);

	public ArrayList<Borrowing> data(HashMap<String, Object> map);

	public Borrowing findBookById(String book_id);

	public Borrowing findInfoById(String information_id);

	public void borrowBook(String book_id, String user_id);

	public void borrowBook(Borrowing borrowing);

	public void updateCurrentState(Map<String, Object> map);

	public void reserveBook(Map<String, Object> map);

	public int getBorrowingCount(String user_id);

	public int isBorrowing(String book_id);

	public int isReserving(String book_id);

	public int isReserving(Map<String, Object> map);

	public String getIsbn(Map<String, Object> map);

	public int isReservedByUser(Map<String, Object> map);

	public Borrowing findBookAndInfoByBookId(Map<String, Object> map);

}