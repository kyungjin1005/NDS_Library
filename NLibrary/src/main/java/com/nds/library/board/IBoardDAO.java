package com.nds.library.board;

import java.util.ArrayList;
import java.util.Map;

public interface IBoardDAO {
	
	// 게시글 목록(공지사항, 스터디) 받아오기
	public ArrayList<Board> boardList(Map<String, Object> map);
	// 도서신청, 도서기부 목록 받아오기
	public ArrayList<ReqandDon> reqaAndDonList(Map<String, Object> map);
	// 게시글 상세보기
	public Board detailBoard(Map<String, Object> map);
	// 조회수 증가
	public void readCount(Map<String, Object> map);
	// 댓글 갯수 받아오기
	public int replyCount(Map<String, Object> map);
	// 댓글 리스트 받아오기
	public ArrayList<Reply> replyList(Map<String, Object> map);
	// 댓글 작성
	public void addReply(Map<String, Object> map);
	// 댓글 삭제
	public void deleteReply(Map<String, Object> map);
	// 게시판 글쓰기
	public void addBoard(Board board);
	// 게시글 리스트 갯수 받아오기
	public int Boardcount(Map<String, Object> map);
	// 신청, 기증 리스트 갯수 받아오기
	public int reQandDonCount(Map<String, Object> map);
	// 신청, 기증 상세보기
	public ReqandDon detailReQandDon(Map<String, Object> map);
	// 신청, 기증 상태별로 보기
	public ArrayList<ReqandDon> reqaAndDonFilterList(Map<String, Object> map);
	// 신청, 기증 상태별로 갯수 받아오기
	public Object reqaAndDonFilterCount(Map<String, Object> map);
	// 게시글 블라인드 처리
	public void boardBlind(Board b);
	// 게시글 필터링 처리
	public ArrayList<Board> boardFilterList(Map<String, Object> map);
	// 댓글 전체 목록 받아오기
	public ArrayList<Reply> adminBoardReplyList(Map<String, Object> map);
	// 댓글 블라인드 처리
	public void commentBlind(Reply b);
}
