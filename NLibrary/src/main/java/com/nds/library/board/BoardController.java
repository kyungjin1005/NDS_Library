package com.nds.library.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class BoardController {

	@Autowired
	   private SqlSession sqlSession;
	
    @RequestMapping(value = "/BoardNoticeList.nds", method = RequestMethod.GET)
    public String boardList(Model model, HttpServletRequest request) {

    	
    	int pageNumTemp = 1;
 		// 한 페이지에 10개의 글이 보임
 		int listCount = 10;
 		// 뷰에서 글번호를 받아옴
 		String pageNum = request.getParameter("pageNum");
 		System.out.println("pegeNum : " + pageNum);
 		if (pageNum != null) {
 			pageNumTemp = Integer.parseInt(pageNum);
 		}
 		// 시작하는 글번호를 계산함
 		int startNumber = listCount * (pageNumTemp-1)+1;
   	
    	IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
        Map<String, Object> map = new HashMap<String, Object>();
       
        map.put("type", "notice");
        map.put("startNumber", startNumber);
        
        ArrayList<Board> list = dao.boardList(map);
        model.addAttribute("list", list);
        model.addAttribute("totalCount", dao.Boardcount(map));
        model.addAttribute("indexCount", dao.Boardcount(map)-(pageNumTemp-1)*10);
        model.addAttribute("pageNum", pageNum);
        
 
       return "WEB-INF/views/board/BoardNoticeList.jsp";
    }   
    
    @RequestMapping(value = "/BoardRequireList.nds", method = RequestMethod.GET)
    public String boardRequireList(Model model, HttpServletRequest request, String category) {

    	int pageNumTemp = 1;
 		// 한 페이지에 10개의 글이 보임
 		int listCount = 10;
 		// 뷰에서 글번호를 받아옴
 		String pageNum = request.getParameter("pageNum");
 		System.out.println("pegeNum : " + pageNum);
 		if (pageNum != null) {
 			pageNumTemp = Integer.parseInt(pageNum);
 		}
 		// 시작하는 글번호를 계산함
 		int startNumber = listCount * (pageNumTemp-1)+1;
   	
    	IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
        Map<String, Object> map = new HashMap<String, Object>();
       
        String filter=category;
        System.out.println("필터출력");
        System.out.println("filter : " + filter);
        if(filter==null)
        	filter = "0";
        
        map.put("startNumber", startNumber);
        map.put("filter", filter);
        
        ArrayList<ReqandDon> list = dao.reqaAndDonList(map);
        model.addAttribute("list", list);
        model.addAttribute("filter", filter);
        model.addAttribute("totalCount", dao.reQandDonCount(map));
        model.addAttribute("indexCount", dao.reQandDonCount(map)-(pageNumTemp-1)*10);
        model.addAttribute("pageNum", pageNum);
        
        
       return "WEB-INF/views/board/BoardRequireList.jsp";
    }   
    
    @RequestMapping(value = "/BoardDonationList.nds", method = RequestMethod.GET)
    public String boardDonationList(Model model, HttpServletRequest request, String category) {

    	int pageNumTemp = 1;
 		// 한 페이지에 10개의 글이 보임
 		int listCount = 10;
 		// 뷰에서 글번호를 받아옴
 		String pageNum = request.getParameter("pageNum");
 		System.out.println("pegeNum : " + pageNum);
 		if (pageNum != null) {
 			pageNumTemp = Integer.parseInt(pageNum);
 		}
 		// 시작하는 글번호를 계산함
 		int startNumber = listCount * (pageNumTemp-1)+1;
   	
    	IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
        Map<String, Object> map = new HashMap<String, Object>();
       
        String filter=category;
        System.out.println("필터출력");
        System.out.println("filter : " + filter);
        if(filter==null)
        	filter = "5";
        
        map.put("startNumber", startNumber);
        map.put("filter", filter);
        
        ArrayList<ReqandDon> list = dao.reqaAndDonList(map);
        model.addAttribute("list", list);
        model.addAttribute("filter", filter);
        model.addAttribute("totalCount", dao.reQandDonCount(map));
        model.addAttribute("indexCount", dao.reQandDonCount(map)-(pageNumTemp-1)*10);
        model.addAttribute("pageNum", pageNum);
        
     
       return "WEB-INF/views/board/BoardDonationList.jsp";
    }   
    
    
    @RequestMapping(value = "/BoardStudyList.nds", method = RequestMethod.GET)
    public String boardStudyList(Model model, HttpServletRequest request) {

       	int pageNumTemp = 1;
     		// 한 페이지에 10개의 글이 보임
     		int listCount = 10;
     		// 뷰에서 글번호를 받아옴
     		String pageNum = request.getParameter("pageNum");
     		System.out.println("pegeNum : " + pageNum);
     		if (pageNum != null) {
     			pageNumTemp = Integer.parseInt(pageNum);
     		}
     		// 시작하는 글번호를 계산함
     		int startNumber = listCount * (pageNumTemp-1)+1;
       	
        	IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
            Map<String, Object> map = new HashMap<String, Object>();
           
            map.put("type", "study");
            map.put("startNumber", startNumber);
            
            ArrayList<Board> list = dao.boardList(map);
            model.addAttribute("list", list);
            model.addAttribute("totalCount", dao.Boardcount(map));
            model.addAttribute("indexCount", dao.Boardcount(map)-(pageNumTemp-1)*10);
            model.addAttribute("pageNum", pageNum);
        
       return "WEB-INF/views/board/BoardStudyList.jsp";
    }   
    
    /* 게시글 상세보기 */
    @RequestMapping(value = "/BoardDetail.nds", method = RequestMethod.GET)
    public String boardDetail(Model model, int board_id, String type) {
    	
    	IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("board_id", board_id);
        map.put("type", "board");
            
        // 조회수증가
        dao.readCount(map);
        // 게시글 정보 받아오기
        model.addAttribute("board", dao.detailBoard(map));
        // 댓글 갯수 받아오기 
        model.addAttribute("replyCount", dao.replyCount(map));
        // 댓글 리스트 받아오기 
        model.addAttribute("replylist", dao.replyList(map));
        
       if(type.equals("notice"))
    	   return "WEB-INF/views/board/BoardNoticeDetail.jsp";
       else
    	   return "WEB-INF/views/board/BoardStudyDetail.jsp";
    }   
    
    /* 신청, 기증 상세보기 */
    @RequestMapping(value = "/ReqAndDonDetail.nds", method = RequestMethod.GET)
    public String reqAndDonDetail(Model model, int req_don_id, String type) {
    	
    	IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("req_don_id", req_don_id);
        map.put("type", "reqanddon");    
        
        // 게시글 정보 받아오기
        model.addAttribute("board", dao.detailReQandDon(map));
        // 댓글 갯수 받아오기 
        model.addAttribute("replyCount", dao.replyCount(map));
        // 댓글 리스트 받아오기 
        model.addAttribute("replylist", dao.replyList(map));
        
        if(type.equals("require"))
    	   return "WEB-INF/views/board/BoardRequireDetail.jsp";
       else
    	   return "WEB-INF/views/board/BoardDonationDetail.jsp";
    }   
    
    /* 댓글 작성 */
    @RequestMapping(value = "/InsertReply.nds", method = RequestMethod.POST)
    public String insertReply(Model model, Reply reply, String type) {
    
    	IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	if(type.equals("notice") || type.equals("study"))
    	{
    		map.put("type", "board");
    		map.put("board_id", reply.getBoard_id());
    	}
    	else
    	{
    		map.put("type", "reqanddon");    
    		map.put("req_don_id", reply.getReq_don_id());
    	}
    
    	map.put("user_id", reply.getUser_id());
    	map.put("content", reply.getContent());
    	  	
    	dao.addReply(map);
        
       if(type.equals("notice"))
    	   return "redirect:BoardDetail.nds?board_id="+reply.getBoard_id()+"&type=notice";
       else if(type.equals("study"))    
    	   return "redirect:BoardDetail.nds?board_id="+reply.getBoard_id()+"&type=study";
       else if(type.equals("require"))
    	   return "redirect:ReqAndDonDetail.nds?req_don_id="+reply.getReq_don_id()+"&type=require";
       else
    	   return "redirect:ReqAndDonDetail.nds?req_don_id="+reply.getReq_don_id()+"&type=donation";
    }
    
    /* 댓글 삭제 */
    @RequestMapping(value = "/DeleteReply.nds", method = RequestMethod.GET)
    public String deleteReply(Model model, Reply reply, String type) {
    	
    	IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("reply_id", reply.getReply_id());
        dao.deleteReply(map);
        
       if(type.equals("notice"))
    	   return "redirect:BoardDetail.nds?board_id="+reply.getBoard_id()+"&type=notice";
       else if(type.equals("study"))
    	   return "redirect:BoardDetail.nds?board_id="+reply.getBoard_id()+"&type=study";
       else if(type.equals("require"))
    	   return "redirect:ReqAndDonDetail.nds?req_don_id="+reply.getReq_don_id()+"&type=require";
       else
    	   return "redirect:ReqAndDonDetail.nds?req_don_id="+reply.getReq_don_id()+"&type=donation";
    }
    
    /* 댓글 수정 */
    @RequestMapping(value = "/UpdateReply.nds", method = RequestMethod.GET)
    public String updateReply(Model model, String board_id, int reply_id, String type) {
    	
    	IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("reply_id", reply_id);
        dao.deleteReply(map);
        
       if(type.equals("notice"))
    	   return "redirect:BoardDetail.nds?board_id="+board_id+"&type=notice";
       
       else 
    	   return "redirect:BoardDetail.nds?board_id="+board_id+"&type=study";
    }
    
    /* 게시판 글쓰기 jsp로 이동*/
    @RequestMapping(value = "/AddBoard.nds", method = RequestMethod.GET)
    public String addBoard(String type) {	
       if(type.equals("notice"))
    	   return "WEB-INF/views/board/BoardNoticeWrite.jsp";
       else
    	   return "WEB-INF/views/board/BoardStudyWrite.jsp";
    }
    
    /* 게시판 글쓰기*/
    @RequestMapping(value = "/WriteBoard.nds", method = RequestMethod.GET)
    public String writeBoard(Board board) {	
      
    	IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
    	dao.addBoard(board);  
    	
    	if(board.getCategory().equals("스터디"))
    		return "redirect:BoardStudyList.nds";
    	else
    		return "redirect:ManagerBoard.nds";
    }
   
    @RequestMapping(value = "/ReqDonFilterList.nds", method = RequestMethod.GET)
    public String  reqDonFilterList(Model model, HttpServletRequest request, String type, String category, String filter) {

    	int pageNumTemp = 1;
 		// 한 페이지에 10개의 글이 보임
 		int listCount = 10;
 		// 뷰에서 글번호를 받아옴
 		String pageNum = request.getParameter("pageNum");
 		System.out.println("pegeNum : " + pageNum);
 		if (pageNum != null) {
 			pageNumTemp = Integer.parseInt(pageNum);
 		}
 		// 시작하는 글번호를 계산함
 		int startNumber = listCount * (pageNumTemp-1)+1;
   	
    	IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
        Map<String, Object> map = new HashMap<String, Object>();
       
        
        map.put("filter", filter);
        map.put("startNumber", startNumber);
       
        
        ArrayList<ReqandDon> list = dao.reqaAndDonFilterList(map);
        model.addAttribute("list", list);
        model.addAttribute("totalCount", dao.reqaAndDonFilterCount(map));
        model.addAttribute("indexCount", dao.reQandDonCount(map)-(pageNumTemp-1)*10);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("filter", filter);
        
       
       if(type.equals("require"))
    	   return "WEB-INF/views/board/BoardRequireList.jsp";
       else
    	   return "WEB-INF/views/board/BoardDonationList.jsp";
    }   
    
    // 관리자 게시글 관리
    @RequestMapping(value = "/ManagerBoard.nds")
	public String managerBoard(Model model, HttpServletRequest request, String category, String date) {
    	
    	int pageNumTemp = 1;
 		// 한 페이지에 10개의 글이 보임
 		int listCount = 10;
 		// 뷰에서 글번호를 받아옴
 		String pageNum = request.getParameter("pageNum");
 		System.out.println("pegeNum : " + pageNum);
 		if (pageNum != null) {
 			pageNumTemp = Integer.parseInt(pageNum);
 		}
 		// 시작하는 글번호를 계산함
 		int startNumber = listCount * (pageNumTemp-1)+1;
 		
 		 int filter=0;
 	     if(category==null)
 			category = "0";
 		 if(date==null)
 			date= "0";
 		
         if(category.equals("0") && date.equals("0")) // 전체, 전체
         	filter =0;
         if(category.equals("0") && date.equals("1")) // 전체 , 최근 일주일
         	filter =1;
         if(category.equals("0") && date.equals("2")) // 전체, 한달
         	filter =2;
         if(category.equals("1") && date.equals("0")) // 공지 , 전체
         	filter =3;
         if(category.equals("1") && date.equals("1")) // 공지 , 최근 일주일
         	filter =4;
         if(category.equals("1") && date.equals("2")) // 공지 , 최근 한달
         	filter =5;
         if(category.equals("2") && date.equals("0")) // 스터디 , 전체
         	filter =6;
         if(category.equals("2") && date.equals("1")) // 스터디 , 최근 일주일
         	filter =7;
         if(category.equals("2") && date.equals("2")) // 스터디 , 최근 한달
         	filter =8;
 	
    	IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
        Map<String, Object> map = new HashMap<String, Object>();
       
        map.put("type", "all");
        map.put("startNumber", startNumber);
        map.put("filter", filter);
        
        ArrayList<Board> list = dao.boardList(map);
        model.addAttribute("list", list);
        model.addAttribute("totalCount", dao.Boardcount(map));
        model.addAttribute("indexCount", dao.Boardcount(map)-(pageNumTemp-1)*10);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("category", category);
        model.addAttribute("date", date);
        
		return "WEB-INF/views/board/ManagerBoard.jsp";
	}
   
    // 관리자 댓글 관리
    @RequestMapping(value = "/ManagerComment.nds")
	public String managerComment(Model model, HttpServletRequest request, String category, String date) {
    	
    	int pageNumTemp = 1;
 		// 한 페이지에 10개의 글이 보임
 		int listCount = 10;
 		// 뷰에서 글번호를 받아옴
 		String pageNum = request.getParameter("pageNum");
 		System.out.println("pegeNum : " + pageNum);
 		if (pageNum != null) {
 			pageNumTemp = Integer.parseInt(pageNum);
 		}
 		// 시작하는 글번호를 계산함
 		int startNumber = listCount * (pageNumTemp-1)+1;
 		
 		int filter=0;
 		
 		if(category==null)
 			category = "0";
 		if(date==null)
 			date= "0";
 		 
         if(category.equals("0") && date.equals("0")) // 전체, 전체
         	filter =0;
         if(category.equals("0") && date.equals("1")) // 전체 , 최근 일주일
         	filter =1;
         if(category.equals("0") && date.equals("2")) // 전체, 한달
         	filter =2;
         if(category.equals("1") && date.equals("0")) // 공지 , 전체
         	filter =3;
         if(category.equals("1") && date.equals("1")) // 공지 , 최근 일주일
         	filter =4;
         if(category.equals("1") && date.equals("2")) // 공지 , 최근 한달
         	filter =5;
         if(category.equals("2") && date.equals("0")) // 스터디 , 전체
         	filter =6;
         if(category.equals("2") && date.equals("1")) // 스터디 , 최근 일주일
         	filter =7;
         if(category.equals("2") && date.equals("2")) // 스터디 , 최근 한달
         	filter =8;
   	
    	IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
        Map<String, Object> map = new HashMap<String, Object>();
        
        // 댓글 리스트 받아오기 
        map.put("startNumber", startNumber);
        map.put("type", "admin");
        map.put("filter", filter);
          
        model.addAttribute("boardreplylist", dao.adminBoardReplyList(map));
        model.addAttribute("totalCount", dao.replyCount(map));
        model.addAttribute("indexCount", dao.replyCount(map)-(pageNumTemp-1)*10);
        model.addAttribute("category", category);
        model.addAttribute("date", date);
        
		return "WEB-INF/views/board/ManagerComment.jsp";
	}
   
    // 블라인드 처리
    @RequestMapping(value = "/AdminQABoardBlind.nds", method = RequestMethod.GET)
   	public String adminBoardBlind(Model model, Board b) {
    	
    	IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		dao.boardBlind(b);
    	
   		return "WEB-INF/views/board/AdminBoardBlind.jsp";
   	}
    
    // 관리자 게시판 필터링처리
    @RequestMapping(value = "/ManagerBoardFilterList.nds", method = RequestMethod.POST)
    public String  managerBoardFilterList(Model model, HttpServletRequest request, int category, int date) {

    	int pageNumTemp = 1;
 		// 한 페이지에 10개의 글이 보임
 		int listCount = 10;
 		// 뷰에서 글번호를 받아옴
 		String pageNum = request.getParameter("pageNum");
 		System.out.println("pegeNum : " + pageNum);
 		if (pageNum != null) {
 			pageNumTemp = Integer.parseInt(pageNum);
 		}
 		// 시작하는 글번호를 계산함
 		int startNumber = listCount * (pageNumTemp-1)+1;
   	
    	IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
        Map<String, Object> map = new HashMap<String, Object>();
        
        int filter=0;
        
        if(category==0 && date==0) // 전체, 전체
        	filter =0;
        if(category==0 && date==1) // 전체 , 최근 일주일
        	filter =1;
        if(category==0 && date==2) // 전체, 한달
        	filter =2;
        if(category==1 && date==0) // 공지 , 전체
        	filter =3;
        if(category==1 && date==1) // 공지 , 최근 일주일
        	filter =4;
        if(category==1 && date==2) // 공지 , 최근 한달
        	filter =5;
        if(category==2 && date==0) // 스터디 , 전체
        	filter =6;
        if(category==2 && date==1) // 스터디 , 최근 일주일
        	filter =7;
        if(category==2 && date==2) // 스터디 , 최근 한달
        	filter =8;
        
        map.put("filter", filter);
        map.put("startNumber", startNumber);
        
        
        
        ArrayList<Board> list = dao.boardFilterList(map);
        model.addAttribute("list", list);
        model.addAttribute("totalCount", dao.Boardcount(map));
        model.addAttribute("indexCount", dao.Boardcount(map)-(pageNumTemp-1)*10);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("filter", filter);
       	
		return "WEB-INF/views/board/ManagerBoard.jsp";
    }   
   
    // 블라인드 처리
    @RequestMapping(value = "/AdminQACommentBlind.nds", method = RequestMethod.GET)
   	public String adminQACommentBlind(Model model, Reply b) {
    	
    	IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		dao.commentBlind(b);
    	
   		return "WEB-INF/views/board/AdminBoardBlind.jsp";
   	}
    
}