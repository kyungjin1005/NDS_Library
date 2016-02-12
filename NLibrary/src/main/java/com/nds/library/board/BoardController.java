package com.nds.library.board;

import java.util.ArrayList;

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

      // model.addAttribute("message", "Hello Spring MVC Framework!");
        
    	
        IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
        ArrayList<Board> list = dao.BoardList();
        
        for (Board board : list) {
          System.out.println(board.getTitle());
       }
       return "WEB-INF/views/board/BoardNoticeList.jsp";
    }   
    
}