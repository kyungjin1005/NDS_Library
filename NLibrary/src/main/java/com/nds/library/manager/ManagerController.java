package com.nds.library.manager;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nds.library.main.Book;
import com.nds.library.main.IMainDAO;

@Controller
public class ManagerController {
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/ManagerBoard.nds", method = RequestMethod.GET)
	public String managerBoard(Model model) {

		// model.addAttribute("message", "Hello Spring MVC Framework!");

		IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);
		ArrayList<Message> list = dao.MessageList();
		
		for (Message message : list) {
			System.out.println(message.getTitle());
		}
		
		return "WEB-INF/views/managerpage/ManagerBoard.jsp";
	}
	
	@RequestMapping(value = "/MessageList.nds", method = RequestMethod.GET)
	public String messageList(Model model) {

		IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);
		ArrayList<Message> list = dao.MessageList();
		
		model.addAttribute("messageList", list);
		
		return "WEB-INF/views/managerpage/ManagerMessageBox.jsp";
	}

	@RequestMapping(value = "/ManagerBookRequire.nds", method = RequestMethod.GET)
	public String managerBookRequire(Model model) {

		// model.addAttribute("message", "Hello Spring MVC Framework!");

		IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);
//		ArrayList<Message> list = dao.MessageList();
//		
//		for (Message message : list) {
//			System.out.println(message.getTitle());
//		}
		
		return "WEB-INF/views/managerpage/ManagerBookRequire.jsp";
	}
	
}