package com.nds.library.main;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nds.library.board.Board;
import com.nds.library.board.IBoardDAO;

@Controller
public class MainController {
	@Autowired
	   private SqlSession sqlSession;
	
	@RequestMapping(value = "/Main.nds", method = RequestMethod.GET)
	public String bookList(Model model) {
		


		// model.addAttribute("message", "Hello Spring MVC Framework!");

		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);
		ArrayList<Book> list = dao.BookList();

		for (Book book : list) {
			System.out.println(book.getLocation());
		}

		return "WEB-INF/views/main/Main.jsp";
	}

}