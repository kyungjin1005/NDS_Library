package com.nds.library.main;

import java.util.ArrayList;

import com.nds.library.board.Board;

public interface IMainDAO {
	//public ArrayList<Book> BookList();
	public ArrayList<Board> StudyBoardList();
	public ArrayList<Board> NoticeBoardList();
	public ArrayList<Board> MonthlyChampion();
	public ArrayList<Book> MonthlyBookList();
	//public ArrayList<Book> NewBookList();
}
