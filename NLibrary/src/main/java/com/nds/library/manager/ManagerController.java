package com.nds.library.manager;

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

import com.nds.library.mypage.ReqAndDon;

@Controller
public class ManagerController {
	@Autowired
	private SqlSession sqlSession;

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
	public String managerBookRequire(Model model, String filter, String page) {

		IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);

		System.out.println("filter : " + filter);
		Map<String, Object> map = new HashMap<String, Object>();

		if (filter == null) {
			filter = "0";
		}
		
		map.put("filter", filter);

		//ArrayList<ReqAndDon> list = dao.requireBookList(map);
		
		// 페이징 처리
		int nowpage = 0; // 현재 페이지 번호
		int totalCount = 0; // 총 게시물 수
		int totalPage = 0; // 총 페이지 수
		int pageSize = 10; // 한페이지당 게시물 수
		int n = 0, loop = 0;
		int start = 0, end = 0;
		int blockSize = 10;

		if (page == null) {
			nowpage = 1;
		} else {
			nowpage = Integer.parseInt(page);
		}

		start = ((nowpage - 1) * pageSize) + 1;
		end = start + pageSize - 1;
		
		// 페이징
		map.put("start", start + "");
		map.put("end", end + "");
		
		map.put("kind", "require");
		System.out.println("satrt : " + start + ", end : " + end);
		
		ArrayList<ReqAndDon> list = dao.requireBookList(map);

		// 페이징
		// 총 페이지 수?
		totalCount = dao.totalCount(map); // 124건
		totalPage = (int) Math.ceil((double) totalCount / pageSize); // 무조건
																		// 올림(3.1
																		// -> 4)
		System.out.println("totalCount: " + totalCount);

		// 페이지 바 생성
		String pagebar = "";

		pagebar += "<nav id='nav1'><ul class='pagination'>";

		/*
		 * for (int i=1; i<= totalPage; i++) { pagebar += String.format(
		 * "<li><a href='#'>%d</a></li>", i); }
		 */

		// blockSize : 한번에 보여질 페이지 최대 갯수

		// 페이지 번호를 만들기 위한 루프 변수
		loop = 1;

		// 페이지 출력 번호 변수(페이지 번호)
		// 5페이지 -> 1
		// 8페이지 -> 1
		// 10페이지 -> 1
		// 15페이지 -> 11
		n = ((nowpage - 1) / blockSize) * blockSize + 1;

		// 이전 10페이지
		if (n == 1) {
			pagebar += String.format(
					"<li class='disabled'><a href='#' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
		} else {
			pagebar += String.format(
					"<li><a href='ManagerBookRequire.nds?page=%d&filter=%s' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>",
					n - 1, filter);
		}

		// 페이지 번호 출력
		while (!(loop > blockSize || n > totalPage)) {

			// 현재 페이지
			if (n == nowpage) {
				pagebar += String.format("<li class='active'><a href='#'>%d</a></li>", n);
			} else {
				pagebar += String.format("<li><a href='ManagerBookRequire.nds?page=%d&filter=%s'>%d</a></li>", n,filter, n);
			}

			loop++;
			n++;
		}

		// 다음 10페이지
		if (n > totalPage) {
			pagebar += String.format(
					"<li class='disabled'><a href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
		} else {
			pagebar += String.format(
					"<li><a href='ManagerBookRequire.nds?page=%d&filter=%s' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>",
					n, filter);
		}
		pagebar += "</ul></nav>";

		model.addAttribute("pagebar", pagebar);
		model.addAttribute("map", map);

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
	public String managerBookDonation(Model model, String filter, String page) {

		IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);

		System.out.println(filter);
		Map<String, Object> map = new HashMap<String, Object>();

		if (filter == null) {
			filter = "0";
		}
		
		map.put("filter", filter);

		//ArrayList<ReqAndDon> list = dao.requireBookList(map);
		
		// 페이징 처리
		int nowpage = 0; // 현재 페이지 번호
		int totalCount = 0; // 총 게시물 수
		int totalPage = 0; // 총 페이지 수
		int pageSize = 10; // 한페이지당 게시물 수
		int n = 0, loop = 0;
		int start = 0, end = 0;
		int blockSize = 10;

		if (page == null) {
			nowpage = 1;
		} else {
			nowpage = Integer.parseInt(page);
		}

		start = ((nowpage - 1) * pageSize) + 1;
		end = start + pageSize - 1;
		
		// 페이징
		map.put("start", start + "");
		map.put("end", end + "");
		
		map.put("kind", "donation");
		System.out.println("satrt : " + start + ", end : " + end);
		
		ArrayList<ReqAndDon> list = dao.donationBookList(map);

		// 페이징
		// 총 페이지 수?
		totalCount = dao.totalCount(map); // 124건
		totalPage = (int) Math.ceil((double) totalCount / pageSize); // 무조건
																		// 올림(3.1
																		// -> 4)

		// 페이지 바 생성
		String pagebar = "";

		pagebar += "<nav id='nav1'><ul class='pagination'>";

		/*
		 * for (int i=1; i<= totalPage; i++) { pagebar += String.format(
		 * "<li><a href='#'>%d</a></li>", i); }
		 */

		// blockSize : 한번에 보여질 페이지 최대 갯수

		// 페이지 번호를 만들기 위한 루프 변수
		loop = 1;

		// 페이지 출력 번호 변수(페이지 번호)
		// 5페이지 -> 1
		// 8페이지 -> 1
		// 10페이지 -> 1
		// 15페이지 -> 11
		n = ((nowpage - 1) / blockSize) * blockSize + 1;

		// 이전 10페이지
		if (n == 1) {
			pagebar += String.format(
					"<li class='disabled'><a href='#' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
		} else {
			pagebar += String.format(
					"<li><a href='ManagerBookDonation.nds?page=%d&filter=%s' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>",
					n - 1, filter);
		}

		// 페이지 번호 출력
		while (!(loop > blockSize || n > totalPage)) {

			// 현재 페이지
			if (n == nowpage) {
				pagebar += String.format("<li class='active'><a href='#'>%d</a></li>", n);
			} else {
				pagebar += String.format("<li><a href='ManagerBookDonation.nds?page=%d&filter=%s'>%d</a></li>", n,filter, n);
			}

			loop++;
			n++;
		}

		// 다음 10페이지
		if (n > totalPage) {
			pagebar += String.format(
					"<li class='disabled'><a href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
		} else {
			pagebar += String.format(
					"<li><a href='ManagerBookDonation.nds?page=%d&filter=%s' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>",
					n, filter);
		}
		pagebar += "</ul></nav>";

		model.addAttribute("pagebar", pagebar);
		model.addAttribute("map", map);

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
	public String managerMemberInfo(Model model, User user, HttpServletRequest request) {

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
	
	@RequestMapping(value = "/ManagerBorrow.nds", method = RequestMethod.GET)
	public String managerBorrow(Model model, String filter) {

		IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);
		
		Map<String, Object> map = new HashMap<String, Object>();

		if (filter == null) {
			filter = "0";
		}
		map.put("filter", filter);
		
		ArrayList<Borrowing> list = dao.managerBorrow(map);
		model.addAttribute("borrowingList", list);
		model.addAttribute("filter", filter);

		return "WEB-INF/views/managerpage/ManagerBorrow.jsp";
	}
	
	@RequestMapping(value = "/changeToBorrow.nds", method = RequestMethod.GET)
	public String changeToBorrow(Model model, String borrowing_id) {
		// 예약 또는 대출 신청이 되어있는 상태에서 대출 상태로 변경
		IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);
		Map<String, Object> map = new HashMap<String, Object>();
		
		String book_id = dao.getBorrowingById(borrowing_id).getBook_id();

		// 이미 대출일이 있는  애들은 update되면 안됨
		String borrowing_date = dao.getBorrowingById(borrowing_id).getBorrowing_date();
		
		map.put("current_state", "대출");
		map.put("book_id", book_id);
		
		if(borrowing_date == null) {			
			dao.updateBorrowingDate(borrowing_id);
			dao.updateCurrentState(map);
		}else {
//			대출 버튼에 마우스 오버 막거나 alret 창 띄워주기
		}
		return "redirect:ManagerBorrow.nds";
	}
	
	@RequestMapping(value = "/changeToReturn.nds", method = RequestMethod.GET)
	public String changeToReturn(Model model, String borrowing_id) {
		// 대출 중 --> 반납
		IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);
		Map<String, Object> map = new HashMap<String, Object>();
		
		String book_id = dao.getBorrowingById(borrowing_id).getBook_id();

		map.put("current_state", "대출가능");
		map.put("book_id", book_id);
		
		dao.updateReturnedDate(borrowing_id);
		dao.updateCurrentState(map);
			
		return "redirect:ManagerBorrow.nds";
	}
}