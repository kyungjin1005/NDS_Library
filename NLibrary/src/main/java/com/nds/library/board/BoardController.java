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
    public String boardRequireList(Model model, HttpServletRequest request) {

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
       
        map.put("type", "require");
        map.put("startNumber", startNumber);
        
        ArrayList<ReqandDon> list = dao.reqaAndDonList(map);
        model.addAttribute("list", list);
        model.addAttribute("totalCount", dao.reQandDonCount(map));
        model.addAttribute("indexCount", dao.reQandDonCount(map)-(pageNumTemp-1)*10);
        model.addAttribute("pageNum", pageNum);
        
     
       return "WEB-INF/views/board/BoardRequireList.jsp";
    }   
    
    @RequestMapping(value = "/BoardDonationList.nds", method = RequestMethod.GET)
    public String boardDonationList(Model model, HttpServletRequest request) {

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
       
        map.put("type", "donation");
        map.put("startNumber", startNumber);
        
        ArrayList<ReqandDon> list = dao.reqaAndDonList(map);
        model.addAttribute("list", list);
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
    		return "redirect:BoardNoticeList.nds";
    }
   
    @RequestMapping(value = "/ReqDonFilterList.nds", method = RequestMethod.GET)
    public String  reqDonFilterList(Model model, HttpServletRequest request, String type, String filter) {

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

}