package com.nds.library.manager;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nds.library.mypage.ReqAndDon;

@Controller
public class ManagerController {
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/ManagerBoard.nds", method = RequestMethod.GET)
	public String managerBoard(Model model) {		
		return "WEB-INF/views/managerpage/ManagerBoard.jsp";
	}
	
	@RequestMapping(value = "/MessageList.nds", method = RequestMethod.GET)
	public String messageList(Model model, String filter) {

		IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (filter == null) {
			filter = "0";
		}
		map.put("filter", filter);
		
		ArrayList<Message> list = dao.MessageList(map);
		model.addAttribute("messageList", list);
		model.addAttribute("filter", filter);
		
		return "WEB-INF/views/managerpage/ManagerMessageBox.jsp";
	}
	
	@RequestMapping(value = "/ManagerMemberMsg.nds", method = RequestMethod.GET)
	public String messageDetail(Model model, int msg_id) {

		System.out.println("msg_id : " + msg_id);
		
		IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);
		
		ArrayList<Message> msg = dao.messageDetail(msg_id);
		model.addAttribute("msg", msg);
		
		return "WEB-INF/views/managerpage/ManagerMessage.jsp";
	}

	@RequestMapping(value = "/ManagerBookRequire.nds", method = RequestMethod.GET)
	public String managerBookRequire(Model model, String filter) {

		IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);
		
		Map<String, Object> map = new HashMap<String, Object>();

		if (filter == null) {
			filter = "0";
		}
		map.put("filter", filter);

		ArrayList<ReqAndDon> list = dao.requireBookList(map);
		model.addAttribute("requireList", list);
		model.addAttribute("filter", filter);
		
		return "WEB-INF/views/managerpage/ManagerBookRequire.jsp";
	}
	
	@RequestMapping(value = "/ManagerBookRequireConfirm.nds", method = RequestMethod.GET)
	public String managerBookRequireConfirm(Model model,ReqAndDon requireBook) {

		IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);

		System.out.println("req_don_id : " + requireBook.getReq_don_id());
		ReqAndDon book = dao.getRequireBook(requireBook);
		
		model.addAttribute("book", book);
		
		return "WEB-INF/views/managerpage/ManagerBookRequireConfirm.jsp";
	}

}