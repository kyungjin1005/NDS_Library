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
import com.nds.library.manager.User;

@Controller
public class MainController {
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/Main.nds", method = RequestMethod.GET)
	public String MainBoardList(Model model, HttpServletRequest request) {

		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);

		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		map.put("nds_number", Util.getId()); // spring-security�쓽 �꽭�뀡�쓣 �씠�슜�빐�꽌
												// nds_number �뼸湲�
		User user = dao.getSessionId(map); // nds_number �넻�빐�꽌 user_id �뼸湲�
		session.setAttribute("sessionId", user.getUser_id());
		session.setAttribute("sessionName", user.getName());
		
		System.out.println(session.getAttribute("sessionId"));

		ArrayList<Board> StudyBoardList = dao.StudyBoardList();
		ArrayList<Board> NoticeBoardList = dao.NoticeBoardList();
		ArrayList<Board> MonthlyChampion = dao.MonthlyChampion();
		ArrayList<Book> MonthlyBookList = dao.MonthlyBookList();
		ArrayList<Book> list;
		ArrayList<Book> NewRegisteredBookList = dao.NewRegisteredBookList();

		String apikey = "AFFB7CB6B98788B011E21E57116E7D57F7265DB845C79917A613CD62ADA6CC71";

		String uri = "";
		try {

			uri = "http://book.interpark.com/api/newBook.api?key=interpark&categoryId=122";

		} catch (Exception e) {
			System.out.println(e);
		}
		InterparkParse interparkAPI = new InterparkParse();
		list = interparkAPI.parse(uri);

		model.addAttribute("bookList", list);
		model.addAttribute("studyBoardList", StudyBoardList);
		model.addAttribute("noticeBoardList", NoticeBoardList);
		model.addAttribute("monthlyChampion", MonthlyChampion);
		model.addAttribute("monthlyBookList", MonthlyBookList);
		model.addAttribute("newRegisteredBookList", NewRegisteredBookList);
		
		 return "WEB-INF/views/main/Main.jsp";
	}

	 // 3踰� 寃��깋寃곌낵 (SearchResult)
	   @RequestMapping(value = "/SearchResult.nds", method = RequestMethod.GET)
	   public String searchResult(Model model, String key, String searchWord, String filter) {

	      if (filter == null)
	         filter = "0";

	      IMainDAO dao = sqlSession.getMapper(IMainDAO.class);

	      HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("key", key);
	      map.put("searchWord", searchWord);
	      map.put("filter", filter);
	      
	      ArrayList<Information> Result = dao.result(map);
	      model.addAttribute("totalCount", dao.totalCount2(map));
	      model.addAttribute("result", Result);
	      model.addAttribute("select", key);
	      model.addAttribute("query", searchWord);
	      model.addAttribute("filter", filter); // ��異쒖쨷 �븘�꽣

	      return "WEB-INF/views/main/SearchResult.jsp";
	   }

	   // 4踰� �룄�꽌 �긽�꽭�젙蹂�(BookInfo) - (5)由щ럭 �옉�꽦 �룷�븿
	   @RequestMapping(value = "/BookInfo.nds", method = RequestMethod.GET)
	   public String bookInfo(Model model, String isbn) {
	      IMainDAO dao = sqlSession.getMapper(IMainDAO.class);
	      int BorrowN, ReviewN;
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("isbn", isbn);

	      Information bookInfo = dao.bookInfo(map).get(0);
	      model.addAttribute("bookInfo", bookInfo);

	      ArrayList<Information> ownInfo = dao.ownInfo(map);
	      BorrowN=dao.ownInfo(map).size();
	      model.addAttribute("ownInfo", ownInfo);

	      ArrayList<Review> bookReview = dao.bookReview(map);
	      ReviewN=dao.bookReview(map).size();

	      for (int i = 0; i < bookReview.size(); i++) {
	         Review info = bookReview.get(i);
	         String star = info.getStar();
	         if (star.equals("1")) {
	            info.setStar("�쁿�쁿�쁿�쁿�쁾");
	         } else if (star.equals("2")) {
	            info.setStar("�쁿�쁿�쁿�쁾�쁾");
	         } else if (star.equals("3")) {
	            info.setStar("�쁿�쁿�쁾�쁾�쁾");
	         } else if (star.equals("4")) {
	            info.setStar("�쁿�쁾�쁾�쁾�쁾");
	         } else if (star.equals("5")) {
	            info.setStar("�쁾�쁾�쁾�쁾�쁾");
	         }
	      }
	      model.addAttribute("bookReview", bookReview);
	      model.addAttribute("BorrowN", BorrowN);
	      model.addAttribute("ReviewN", ReviewN);
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
	         if (i != s.length-1) {
	            url += "%20";
	         }
	      }
	      
	      return url;
	   }

	   // 6踰� �옄猷뚭��깋 (SearchPage)
	   @RequestMapping(value = "/SearchPage.nds", method = RequestMethod.GET)
	   public String SearchPage(Model model, String category_id, String filter) {
	      if (filter == null)
	         filter = "0";
	      if (category_id == null)
	         category_id = "1";

	      IMainDAO dao = sqlSession.getMapper(IMainDAO.class);

	      HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("category_id", category_id);
	      map.put("filter", filter);
	      
	      ArrayList<Information> data = dao.data(map);
	      
	      
	      String category ="";
	      if(category_id.equals("1")){
	    	  category ="JAVA";
	      }else if(category_id.equals("2")){
	    	  category ="�쎒�봽濡쒓렇�옒諛�";
	      }else if(category_id.equals("3")){
	    	  category ="�뜲�씠�꽣踰좎씠�뒪";
	      }else if(category_id.equals("4")){
	    	  category ="�봽�젅�엫�썙�겕";
	      }else if(category_id.equals("5")){
	    	  category ="�겢�씪�슦�뱶";
	      }else if(category_id.equals("6")){
	    	  category ="湲고�";
	      }
	      
	      model.addAttribute("category", category);
	      
	      model.addAttribute("totalCount", dao.totalCount(map));
	      model.addAttribute("filter", filter); // ��異� 以� �븘�꽣
	      model.addAttribute("category_id", category_id);
	      model.addAttribute("data", data);

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
	public String borrowBook(Model m, String book_id) {
		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);
		
		Book book = dao.findBookById(book_id);
		String information_id = book.getInformation_id();
		Information info = dao.findInfoById(information_id);
		String isbn = info.getIsbn();
		
		// book의 상태를 대출대기로
		book.setCurrent_state("대출대기");
		
		// borrowing table에 insert (날짜는 다 null로)
		dao.borrowBook();

		return "redirect:BookInfo.nds?isbn=" + isbn;
	}
	
	@RequestMapping(value = "/reserveBook.nds", method = RequestMethod.GET)
	public String reserveBook(Model m, String book_id) {
		IMainDAO dao = sqlSession.getMapper(IMainDAO.class);
		String isbn;
		
		// 이미 예약한 사람이 있으면 예약하기 버튼이 보이지 않도록 & alert띄우기?
		// 예약한 사람이 없다면 book상태를 예약으로 바꿈
		// reservation table에 저장
		
		

		return "redirect:BookInfo.nds?isbn=111";
	}
}