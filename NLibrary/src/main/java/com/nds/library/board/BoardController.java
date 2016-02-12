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
    public String boardList(Model model) {

        IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
        Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", "notice");
        
        ArrayList<Board> list = dao.boardList(map);
        model.addAttribute("list", list);
        
       return "WEB-INF/views/board/BoardNoticeList.jsp";
    }   
    
    @RequestMapping(value = "/BoardRequireList.nds", method = RequestMethod.GET)
    public String boardRequireList(Model model) {

        IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
        Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", "request");
        
        ArrayList<Board> list = dao.reqaAndDonList(map);
        model.addAttribute("list", list);
        
       return "WEB-INF/views/board/BoardRequireList.jsp";
    }   
    
  @RequestMapping(value = "/BoardDonationList.nds", method = RequestMethod.GET)
    public String boardDonationList(Model model) {

        IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
        Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", "donation");
        
        ArrayList<Board> list = dao.reqaAndDonList(map);
        model.addAttribute("list", list);
        
       return "WEB-INF/views/board/BoardDonationList.jsp";
    }   
    
    @RequestMapping(value = "/BoardStudyList.nds", method = RequestMethod.GET)
    public String boardStudyList(Model model) {

        IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
        Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", "notice");
        
        ArrayList<Board> list = dao.boardList(map);
        model.addAttribute("list", list);
        
       return "WEB-INF/views/board/BoardStudyList.jsp";
    }   
    
    /* 공지사항 상세보기 */
    @RequestMapping(value = "/BoardNoticeDetail.nds", method = RequestMethod.GET)
    public String boardNoticeDetail(Model model, int board_id) {
    	
    	IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("board_id", board_id);
            
        // 조회수증가
        dao.readCount(map);
        // 게시글 정보 받아오기
        model.addAttribute("board", dao.detailBoard(map));
        // 댓글 갯수 받아오기 
        model.addAttribute("replyCount", dao.replyCount(map));
        // 댓글 리스트 받아오기 
        model.addAttribute("replylist", dao.replyList(map));
        
       return "WEB-INF/views/board/BoardNoticeDetail.jsp";
    }   
    
    /* 댓글 작성 */
    @RequestMapping(value = "/InsertReply.nds", method = RequestMethod.POST)
    public String insertReply(Model model, Reply reply, HttpServletRequest request, String type, String board_id) {
    
    	IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
        dao.addReply(reply);
       if(type.equals("notice"))
       {
    	   System.out.println("공지사항 댓글등록!");
    	   return "redirect:BoardNoticeDetail.nds?board_id="+board_id;
       }
       else if(type.equals("study"))
       {
    	   return "redirect:BoardStudyDetail.nds?board_id="+board_id;
       }
       System.out.println("타입 받기 실패!");
       return "redirect:BoardNoticeDetail.nds?board_id="+board_id;
    }
    
    /* 댓글 삭제 */
    @RequestMapping(value = "/DeleteReply.nds", method = RequestMethod.GET)
    public String deleteReply(Model model, String board_id, int reply_id, String type) {
    	
    	IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("reply_id", reply_id);
        dao.deleteReply(map);
        
       if(type.equals("notice"))
       {
    	   System.out.println("공지사항 댓글등록!");
    	   return "redirect:BoardNoticeDetail.nds?board_id="+board_id;
       }
       else if(type.equals("study"))
       {
    	   return "redirect:BoardStudyDetail.nds?board_id="+board_id;
       }
       System.out.println("타입 받기 실패!");
       return "redirect:BoardNoticeDetail.nds?board_id="+board_id;
    }

}