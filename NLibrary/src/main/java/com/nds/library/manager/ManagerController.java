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
	public String managerBookRequireConfirm(Model model, ReqAndDon requireBook) {

		IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);

		ReqAndDon book = dao.getReqAndDonBook(requireBook);

		// System.out.println("req_don_id : " + book.getReq_don_id());

		model.addAttribute("book", book);

		return "WEB-INF/views/managerpage/ManagerBookRequireConfirm.jsp";
	}

	@RequestMapping(value = "/RequireConfirm.nds", method = RequestMethod.GET)
	public String requireConfirm(ReqAndDon book) {

		IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);

		// System.out.println("req_don_id : " + book.getReq_don_id());
		dao.requireConfirm(book);

		return "redirect:ManagerBookRequire.nds";
	}

	@RequestMapping(value = "/AjaxBookRegister.nds", method = RequestMethod.GET)
	public String ajaxBookRegister(Model model, ReqAndDon rBook) {

		// System.out.println("id : " + rBook.getReq_don_id());
		IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);
		ReqAndDon book = dao.getReqAndDonBook(rBook);
		//System.out.println("book : " + book.getTitle());

		model.addAttribute("book", book);
		return "WEB-INF/views/managerpage/AjaxBookRegister.jsp";
	}

	@RequestMapping(value = "/ManagerRequireRegisterBook.nds", method = RequestMethod.POST)
	public String ManagerRequireRegisterBook(ReqAndDon book) {

		IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);

		// System.out.println("req_don_id : " + book.getReq_don_id());
		// System.out.println("category_id : " +book.getCategory_id());

		dao.requireRegisterBook(book);
		// dao.insertBook(book);
		return "redirect:ManagerBookRequire.nds";
	}

	@RequestMapping(value = "/ManagerRequireRejectBook.nds", method = RequestMethod.POST)
	public String managerRequireRejectBook(ReqAndDon book) {

		IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);

		// System.out.println("req_don_id : " + book.getReq_don_id());
		// System.out.println("manager_comment : " +book.getManager_comment());
		dao.requireRejectBook(book);

		return "redirect:ManagerBookRequire.nds";
	}
	
	@RequestMapping(value = "/ManagerBookDonation.nds", method = RequestMethod.GET)
	public String managerBookDonation(Model model, String filter) {

		IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);

		Map<String, Object> map = new HashMap<String, Object>();

		if (filter == null) {
			filter = "0";
		}
		map.put("filter", filter);

		ArrayList<ReqAndDon> list = dao.donationBookList(map);
		model.addAttribute("donationList", list);
		model.addAttribute("filter", filter);

		return "WEB-INF/views/managerpage/ManagerBookDonation.jsp";
	}
	
	@RequestMapping(value = "/ManagerBookDonationConfirm.nds", method = RequestMethod.GET)
	public String managerBookDonationConfirm(Model model, ReqAndDon dBook) {

		IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);

		System.out.println("req_don_id : " + dBook.getReq_don_id());
		ReqAndDon book = dao.getReqAndDonBook(dBook);

		model.addAttribute("book", book);
		return "WEB-INF/views/managerpage/ManagerBookDonationConfirm.jsp";
	}
	
	@RequestMapping(value = "/ManagerDonationRegisterBook.nds", method = RequestMethod.POST)
	public String managerDonationRegisterBook(ReqAndDon book) {

		IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);

		 System.out.println("req_don_id : " + book.getReq_don_id());
		 System.out.println("category_id : " +book.getCategory_id());

		dao.donationRegisterBook(book);
		// dao.insertBook(book);
		return "redirect:ManagerBookDonation.nds";
	}

	@RequestMapping(value = "/ManagerDonationRejectBook.nds", method = RequestMethod.POST)
	public String managerDonationRejectBook(ReqAndDon book) {

		IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);

		// System.out.println("req_don_id : " + book.getReq_don_id());
		// System.out.println("manager_comment : " +book.getManager_comment());
		dao.donationRejectBook(book);

		return "redirect:ManagerBookDonation.nds";
	}
	
	
	@RequestMapping(value = "/ManagerMember.nds", method = RequestMethod.GET)
	public String managerMember(Model model) {

		IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);
		ArrayList<User> user = dao.memberList();
		
		model.addAttribute("userList", user);
		model.addAttribute("size", user.size());
		
		return "WEB-INF/views/managerpage/ManagerMember.jsp";
	}
	
	@RequestMapping(value = "/ManagerMemberInfo.nds", method = RequestMethod.GET)
	public String managerMemberInfo(Model model, User user) {

		IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);
		User u = dao.getUser(user);
		ArrayList<User> bList = dao.userBorrowList(user);
		ArrayList<ReqAndDon> rList = dao.userRequireList(user);
		ArrayList<ReqAndDon> dList = dao.userDonationList(user);
		
		model.addAttribute("user", u);
		model.addAttribute("bList", bList);
		model.addAttribute("bSize", bList.size());
		model.addAttribute("rList", rList);
		model.addAttribute("rSize", rList.size());
		model.addAttribute("dList", dList);
		model.addAttribute("dSize", dList.size());
		
		return "WEB-INF/views/managerpage/ManagerMemberInfo.jsp";
	}
	
	@RequestMapping(value = "/ManagerMemberMsg.nds", method = RequestMethod.POST)
	public String managerMemberMsg(Model model, String[] uid, Message m) {
		
		IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);
		
		System.out.println("size : " + uid.length);
		for(String user_id : uid){
			System.out.print(user_id);
			m.setUser_id(Integer.parseInt(user_id));
			dao.messageSend(m);
		}
		
		return "WEB-INF/views/managerpage/ManagerMemberMsg.jsp";
	}
}