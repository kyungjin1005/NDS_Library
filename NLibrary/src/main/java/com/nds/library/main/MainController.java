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
//import org.springframework.web.servlet.ModelAndView;

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
		map.put("nds_number", Util.getId()); // spring-security의 세션을 이용해서
												// nds_number 얻기
		User user = dao.getSessionId(map); // nds_number 통해서 user_id 얻기
		session.setAttribute("sessionId", user.getUser_id());
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

	 // 3번 검색결과 (SearchResult)
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
	      model.addAttribute("filter", filter); // 대출중 필터

	      return "WEB-INF/views/main/SearchResult.jsp";
	   }

	   // 4번 도서 상세정보(BookInfo) - (5)리뷰 작성 포함
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

	   // 6번 자료검색 (SearchPage)
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
	    	  category ="웹프로그래밍";
	      }else if(category_id.equals("3")){
	    	  category ="데이터베이스";
	      }else if(category_id.equals("4")){
	    	  category ="프레임워크";
	      }else if(category_id.equals("5")){
	    	  category ="클라우드";
	      }else if(category_id.equals("6")){
	    	  category ="기타";
	      }
	      
	      model.addAttribute("category", category);
	      
	      model.addAttribute("totalCount", dao.totalCount(map));
	      model.addAttribute("filter", filter); // 대출 중 필터
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

}