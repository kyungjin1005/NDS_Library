package com.nds.library.main;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nds.library.board.Board;
import com.nds.library.main.User;

@Controller
public class MainController {
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/Main.nds", method = RequestMethod.GET)
	public String MainBoardList(Model model, HttpServletRequest request) {

		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);

		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		map.put("nds_number", Util.getId()); // spring-security�쓽 �꽭�뀡�쓣
												// �씠�슜�빐�꽌
												// nds_number �뼸湲�
		User user = dao.getSessionId(map); // nds_number �넻�빐�꽌 user_id �뼸湲�
		session.setAttribute("sessionId", user.getUser_id());
		session.setAttribute("sessionName", user.getName());

		ArrayList<Board> StudyBoardList = dao.StudyBoardList();
		ArrayList<Board> NoticeBoardList = dao.NoticeBoardList();
		ArrayList<Board> MonthlyChampion = dao.MonthlyChampion();
		ArrayList<Borrowing> MonthlyBookList = dao.MonthlyBookList();
		ArrayList<Borrowing> list;
		ArrayList<Borrowing> bList = new ArrayList<Borrowing>();
		ArrayList<Borrowing> NewRegisteredBookList = dao.NewRegisteredBookList();

		String apikey = "AFFB7CB6B98788B011E21E57116E7D57F7265DB845C79917A613CD62ADA6CC71";

		String uri = "";
		try {

			uri = "http://book.interpark.com/api/newBook.api?key=interpark&categoryId=122";

		} catch (Exception e) {
			System.out.println(e);
		}
		InterparkParse interparkAPI = new InterparkParse();
		list = interparkAPI.parse(uri);

		for (int i = 0; i < MonthlyBookList.size(); i++) {
			Borrowing book = MonthlyBookList.get(i);
			String title = book.getTitle();
			if (title.length() >= 30) {
				title = title.substring(0, 30);
			}
			book.setTitle(title + "...");
			bList.add(book);
		}

		model.addAttribute("bookList", list);
		model.addAttribute("studyBoardList", StudyBoardList);
		model.addAttribute("noticeBoardList", NoticeBoardList);
		model.addAttribute("monthlyChampion", MonthlyChampion);
		model.addAttribute("monthlyBookList", bList);
		model.addAttribute("newRegisteredBookList", NewRegisteredBookList);

		return "WEB-INF/views/main/Main.jsp";
	}

	@RequestMapping(value = "/SearchResult.nds", method = RequestMethod.GET)
	public String searchResult(Model model, String key, String searchWord, String filter, String pageNum) {

		int pageNumTemp = 1;
		// 한 페이지에 10개의 글이 보임
		int listCount = 10;
		// 뷰에서 글번호를 받아옴
		String pagenum = pageNum;
		if (pageNum != null) {
			pageNumTemp = Integer.parseInt(pagenum);
		}
		// 시작하는 글번호를 계산함
		int startNumber = listCount * (pageNumTemp - 1) + 1;

		if (filter == null)
			filter = "0";

		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("key", key);
		map.put("searchWord", searchWord);
		map.put("filter", filter);
		map.put("startNumber", startNumber);

		ArrayList<Borrowing> Result = dao.result(map);
		model.addAttribute("totalCount", dao.totalCount2(map));
		model.addAttribute("result", Result);
		model.addAttribute("select", key);
		model.addAttribute("query", searchWord);
		model.addAttribute("filter", filter);
		model.addAttribute("indexCount", dao.totalCount2(map) - (pageNumTemp - 1) * 10);

		return "WEB-INF/views/main/SearchResult.jsp";
	}

	@RequestMapping(value = "/BookInfo.nds", method = RequestMethod.GET)
	public String bookInfo(Model model, String isbn, HttpServletRequest request, String book_id) {
		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);
		int BorrowN, ReviewN;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("isbn", isbn);

		Borrowing bookInfo = dao.bookInfo(map).get(0);
		model.addAttribute("bookInfo", bookInfo);

		ArrayList<Borrowing> ownInfo = dao.ownInfo(map);

		for (Borrowing book : ownInfo) {
			if (book.getCurrent_state().equals("대출가능") && book.getScheduled_date() != null) {
				book.setScheduled_date("");
			}
		}

		BorrowN = dao.ownInfo(map).size();
		model.addAttribute("ownInfo", ownInfo);

		ArrayList<Review> bookReview = dao.bookReview(map);
		ReviewN = dao.bookReview(map).size();

		for (int i = 0; i < bookReview.size(); i++) {
			Review info = bookReview.get(i);
			String star = info.getStar();
			if (star.equals("1")) {
				info.setStar("☆☆☆☆★");
			} else if (star.equals("2")) {
				info.setStar("☆☆☆★★");
			} else if (star.equals("3")) {
				info.setStar("☆☆★★★");
			} else if (star.equals("4")) {
				info.setStar("☆★★★★");
			} else if (star.equals("5")) {
				info.setStar("★★★★★");
			}
		}
		model.addAttribute("bookReview", bookReview);
		model.addAttribute("BorrowN", BorrowN);
		model.addAttribute("ReviewN", ReviewN);

		String user_id = request.getSession().getAttribute("sessionId").toString();
		model.addAttribute("borrowing_count", dao.getBorrowingCount(user_id));

		return "WEB-INF/views/main/BookInfo.jsp";
	}

	@RequestMapping(value = "/ReviewInsert.nds", method = RequestMethod.POST)
	public String reviewInsert(Review r, HttpServletRequest request) {

		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);

		String user_id = request.getSession().getAttribute("sessionId").toString();
		r.setUser_id(user_id);

		dao.add(r);

		String s[] = r.getIsbn().split(" ");
		String url = "redirect:BookInfo.nds?isbn=";

		for (int i = 0; i < s.length; i++) {
			url += s[i];
			if (i != s.length - 1) {
				url += "%20";
			}
		}

		return url;
	}

	// 자료검색 (SearchPage)
	@RequestMapping(value = "/SearchPage.nds", method = RequestMethod.GET)
	public String SearchPage(Model model, String category_id, String filter, String pageNum) {

		int pageNumTemp = 1;
		// 한 페이지에 10개의 글이 보임
		int listCount = 10;
		// 뷰에서 글번호를 받아옴
		String pagenum = pageNum;
		if (pageNum != null) {
			pageNumTemp = Integer.parseInt(pagenum);
		}
		// 시작하는 글번호를 계산함
		int startNumber = listCount * (pageNumTemp - 1) + 1;

		if (filter == null)
			filter = "0";
		if (category_id == null)
			category_id = "1";

		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category_id", category_id);
		map.put("filter", filter);
		map.put("startNumber", startNumber);
		
		ArrayList<Borrowing> data = dao.data(map);

		String category = "";
		if (category_id.equals("1")) {
			category = "JAVA";
		} else if (category_id.equals("2")) {
			category = "웹프로그래밍";
		} else if (category_id.equals("3")) {
			category = "데이터베이스";
		} else if (category_id.equals("4")) {
			category = "프레임워크";
		} else if (category_id.equals("5")) {
			category = "클라우드";
		} else if (category_id.equals("6")) {
			category = "기타";
		}

		model.addAttribute("category", category);

		model.addAttribute("totalCount", dao.totalCount(map));
		model.addAttribute("filter", filter);
		model.addAttribute("category_id", category_id);
		model.addAttribute("data", data);
		model.addAttribute("indexCount", dao.totalCount(map)-(pageNumTemp-1)*10);
		model.addAttribute("pageNum", pagenum);

		return "WEB-INF/views/main/SearchPage.jsp";
	}

	@RequestMapping(value = "/Login.nds", method = RequestMethod.GET)
	public String login(Model model) {

		return "WEB-INF/views/main/Login.jsp";
	}

	@RequestMapping(value = "/LoginFail.nds", method = RequestMethod.GET)
	public String loginFail() {

		return "WEB-INF/views/main/LoginFail.jsp";
	}

	@RequestMapping(value = "/Logout.nds", method = RequestMethod.GET)
	public String logout() {

		return "WEB-INF/views/main/Logout.jsp";
	}

	@RequestMapping(value = "/AccessDenied.nds", method = RequestMethod.GET)
	public String accessDenied() {

		/*
		 * Authentication auth =
		 * SecurityContextHolder.getContext().getAuthentication(); Object
		 * principal = auth.getPrincipal(); if(principal instanceof
		 * UserDetails){ String username =
		 * ((UserDetails)principal).getUsername(); String password =
		 * ((UserDetails)principal).getPassword(); System.out.println(
		 * "Account : " + username.toString() + password.toString());
		 * 
		 * }
		 */
		return "WEB-INF/views/main/AccessDenied.jsp";
	}

	@RequestMapping(value = "/UseInformation.nds", method = RequestMethod.GET)
	public String userInformation() {

		return "WEB-INF/views/main/UseInformation.jsp";
	}

	@RequestMapping(value = "/borrowBook.nds", method = RequestMethod.GET)
	public String borrowBook(Model model, String book_id, HttpServletRequest request) {
		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);

		String user_id = request.getSession().getAttribute("sessionId").toString();

		// book의 상태를 대출대기로
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("book_id", book_id);
		map.put("current_state", "대출대기");
		dao.updateCurrentState(map);

		// borrowing table에 insert (날짜는 다 null로)
		Borrowing borrowing = new Borrowing();
		borrowing.setBook_id(book_id);
		borrowing.setUser_id(user_id);
		dao.borrowBook(borrowing);

		return "redirect:mypageBorrow.nds";
	}

	@RequestMapping(value = "/reserveBook.nds", method = RequestMethod.GET)
	public String reserveBook(Model model, String book_id, HttpServletRequest request) {
		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);
		Map<String, Object> map = new HashMap<String, Object>();
		
		String user_id = request.getSession().getAttribute("sessionId").toString();
		map.put("book_id", book_id);
		
		// 같은 책, 같은 user이면 예약 1번밖에 못하도록 구현
		Borrowing book_information = dao.findBookAndInfoByBookId(map);
		String ISBN = book_information.getISBN();
		map.put("ISBN", ISBN);
		map.put("user_id", user_id);
		
		System.out.println("ISBN : " + ISBN);
		System.out.println("book_id : " + book_id);
		System.out.println("user_id : " + user_id);
		
		if(dao.isReservedByUser(map) == 1) {
			System.out.println("니가 예약해놨던 책의 ISBN이랑 같은 ISBN을 가지는 책이다.");
		}else {
			dao.reserveBook(map);
		}
		return "redirect:mypageReserve.nds";
	}
}