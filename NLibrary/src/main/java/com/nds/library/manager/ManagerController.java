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

		Message msg = dao.messageDetail(msg_id);
		String name = dao.findUserByUserId(msg.getUser_id()).getName();
		
		model.addAttribute("msg", msg);
		model.addAttribute("name", name);

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
		// System.out.println("book : " + book.getTitle());

		model.addAttribute("book", book);
		return "WEB-INF/views/managerpage/AjaxBookRegister.jsp";
	}

	@RequestMapping(value = "/ManagerRequireRegisterBook.nds", method = RequestMethod.POST)
	public String ManagerRequireRegisterBook(ReqAndDon book) {

		IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);

		System.out.println("req_don_id : " + book.getReq_don_id());
		System.out.println("category_id : " + book.getCategory_id());
		System.out.println("isbn : " + book.getIsbn());

		dao.requireRegisterBook(book); // �떊泥��쁽�솴 �뾽�뜲�씠�듃

		ReqAndDon info = dao.getInformation(book);

		if (info == null) { // �뾾�뒗梨낆씠硫�
			System.out.println("�뾾�뒗 梨낆씠�떎. informations �뀒�씠釉붿뿉 異붽��빐�빞�븳�떎.");

			ReqAndDon rBook = dao.getReqAndDonBook(book);

			rBook.setCategory_id(book.getCategory_id());

			// System.out.println(rBook.getCategory_id());
			// System.out.println(rBook.getIsbn());
			// System.out.println(rBook.getTitle());
			// System.out.println(rBook.getAuthor());
			// System.out.println(rBook.getPublisher());
			// System.out.println(rBook.getImage());
			// System.out.println(rBook.getPubdate());
			// System.out.println(rBook.getExplanation());

			dao.insertInformation(rBook);

			ReqAndDon result = dao.getInformation(rBook);

			System.out.println(result.getInformation_id());

			dao.insertBook(result);
		} else {
			System.out.println("�엳�뒗梨낆씠�떎. 諛붾줈 insert");
			dao.insertBook(info);
		}
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

		dao.donationRegisterBook(book);
		
		System.out.println("req_don_id : " + book.getReq_don_id());
		System.out.println("category_id : " + book.getCategory_id());
		System.out.println("isbn : " + book.getIsbn());


		ReqAndDon info = dao.getInformation(book);

		if (info == null) { // �뾾�뒗梨낆씠硫�
			System.out.println("�뾾�뒗 梨낆씠�떎. informations �뀒�씠釉붿뿉 異붽��빐�빞�븳�떎.");

			ReqAndDon dBook = dao.getReqAndDonBook(book);

			dBook.setCategory_id(book.getCategory_id());

			// System.out.println(rBook.getCategory_id());
			// System.out.println(rBook.getIsbn());
			// System.out.println(rBook.getTitle());
			// System.out.println(rBook.getAuthor());
			// System.out.println(rBook.getPublisher());
			// System.out.println(rBook.getImage());
			// System.out.println(rBook.getPubdate());
			// System.out.println(rBook.getExplanation());

			dao.insertInformation(dBook);

			ReqAndDon result = dao.getInformation(dBook);

			System.out.println(result.getInformation_id());

			dao.insertBook(result);
		} else {
			System.out.println("�엳�뒗梨낆씠�떎. 諛붾줈 insert");
			dao.insertBook(info);
		}
		
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
	public String managerMemberMsg(Model model, String[] user_id) {
		IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);
		StringBuilder str = new StringBuilder();
		StringBuilder user_name_list = new StringBuilder();
		
		for(String u : user_id){
			user_name_list.append(dao.findUserByUserId(u).getName());
			user_name_list.append(" ");
			
			str.append(u);
			str.append("/");
		}
		
		System.out.println(user_name_list);
		model.addAttribute("user_id_list", str);
		model.addAttribute("user_name_list", user_name_list);
		
		return "WEB-INF/views/managerpage/ManagerMemberMsg.jsp";
	}
	
	@RequestMapping(value = "/sendMessage.nds", method = RequestMethod.POST)
	public String sendMessage(String user_id_list, Message m) {
		IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);
		String[] uids = user_id_list.split("/");
		for(String u : uids){
			m.setUser_id(u);
			dao.messageSend(m);
		}
		return "redirect:MessageList.nds";
	}
}