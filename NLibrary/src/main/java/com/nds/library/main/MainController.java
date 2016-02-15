package com.nds.library.main;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.servlet.ModelAndView;

import com.nds.library.board.Board;

@Controller
public class MainController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/Main.nds", method = RequestMethod.GET)
	public String MainBoardList(Model model) {

		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);
		ArrayList<Board> StudyBoardList = dao.StudyBoardList();
		ArrayList<Board> NoticeBoardList = dao.NoticeBoardList();
		ArrayList<Board> MonthlyChampion = dao.MonthlyChampion();
		ArrayList<Book> MonthlyBookList = dao.MonthlyBookList();
		//ArrayList<Book> NewBookList = dao.NewBookList();
		
		model.addAttribute("studyBoardList", StudyBoardList);
		model.addAttribute("noticeBoardList", NoticeBoardList);
		model.addAttribute("monthlyChampion", MonthlyChampion);
		model.addAttribute("monthlyBookList", MonthlyBookList);
		//model.addAttribute("newBookList", NewBookList);
		
		//System.out.println(MonthlyBookList.get(0).getImage());
		
		return "WEB-INF/views/main/Main.jsp";
	}
}