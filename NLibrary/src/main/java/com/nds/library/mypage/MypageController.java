package com.nds.library.mypage;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController {


	@Autowired
	private SqlSession sqlSession;


	@RequestMapping(value = "/MypageRequire.nds", method = RequestMethod.GET)
	public String mypageRequire(Model model, String filter) {

		IMypageDAO dao = sqlSession.getMapper(IMypageDAO.class); //

		Map<String, Object> map = new HashMap<String, Object>();

		if (filter == null) {
			filter = "0";
		}
		map.put("filter", filter);

		ArrayList<ReqAndDon> list = dao.requireBookList(map);
		model.addAttribute("requireList", list);
		model.addAttribute("filter", filter);

		return "WEB-INF/views/mypage/MypageRequire.jsp";
	}

	@RequestMapping(value = "/MypageRequireForm.nds", method = RequestMethod.GET)
	public String mypageRequireForm(Model model, String isbn) {

		IMypageDAO dao = sqlSession.getMapper(IMypageDAO.class);

		System.out.println("isbn : " + isbn);

		String apiKey = "c1b406b32dbbbbeee5f2a36ddc14067f ";

		String uri = "";

		try {
			// http://openapi.naver.com/search?key=c1b406b32dbbbbeee5f2a36ddc14067f
			// &query=?&target=book_adv&d_isbn=8996094021+9788996094029
			uri = "http://openapi.naver.com/search?key=" + apiKey + "&query=?&target=book_adv" + "&d_isbn="
					+ URLEncoder.encode(isbn, "UTF-8");

			System.out.println("URI : " + uri);

		} catch (UnsupportedEncodingException e) {
			System.out.println(e);
		}

		NaverParse naverAPI = new NaverParse();
		ReqAndDon book = naverAPI.parse(uri).get(0);

		// System.out.println(book.getAuthor());
		// System.out.println(book.getImage());
		// System.out.println(book.getIsbn());
		// System.out.println(book.getTitle());
		// System.out.println(book.getPubdate());
		// System.out.println(book.getPublisher());

		SimpleDateFormat simDf = new SimpleDateFormat("YYYY-MM-dd");
		String rDate = simDf.format(new Date(System.currentTimeMillis()));
		book.setRegistered_date(rDate);
		System.out.println("rDate : " + rDate);
		model.addAttribute("book", book);

		return "WEB-INF/views/mypage/MypageRequireForm.jsp";
	}

	@RequestMapping(value = "/MypageRequireAdd.nds", method = RequestMethod.POST)
	public String mypageRequireAdd(Model model, ReqAndDon book) {

		System.out.println(book.getAuthor());
		System.out.println(book.getImage());
		System.out.println(book.getIsbn());
		System.out.println(book.getTitle());
		System.out.println(book.getPubdate());
		System.out.println(book.getPublisher());
		System.out.println(book.getUser_comment());
		System.out.println(book.getExplanation());

		IMypageDAO dao = sqlSession.getMapper(IMypageDAO.class);
		dao.requireBookAdd(book);

		return "redirect:MypageRequire.nds";
	}

	@RequestMapping(value = "/NaverAjax.nds", method = RequestMethod.GET)
	public String naverAjax(Model model, String query) {

		System.out.println(query);

		ArrayList<ReqAndDon> list;

		String apiKey = "c1b406b32dbbbbeee5f2a36ddc14067f ";
		String searchQuery = query;

		String uri = "";

		try {

			uri = "http://openapi.naver.com/search?key=" + apiKey + "&target=book" + "&d_titl="
					+ URLEncoder.encode(searchQuery, "UTF-8") + "&query=" + URLEncoder.encode(searchQuery, "UTF-8");

			System.out.println("URI : " + uri);

		} catch (UnsupportedEncodingException e) {
			System.out.println(e);
		}

		NaverParse naverAPI = new NaverParse();
		list = naverAPI.parse(uri);

		// System.out.println("list Size : " + list.size());

		//
		// for(Book b : list){ System.out.println(b.getAuthor());
		// System.out.println(b.getImage()); System.out.println(b.getIsbn());
		// System.out.println(b.getTitle()); System.out.println(b.getPubdate());
		// System.out.println(b.getPublisher()); }
		//
		model.addAttribute("bookList", list);

		return "WEB-INF/views/mypage/NaverAjax.jsp";
	}

	@RequestMapping(value = "/MypageDonation.nds", method = RequestMethod.GET)
	public String mypageDonation(Model model, String filter) {

		IMypageDAO dao = sqlSession.getMapper(IMypageDAO.class); //

		Map<String, Object> map = new HashMap<String, Object>();

		if (filter == null) {
			filter = "0";
		}
		map.put("filter", filter);

		ArrayList<ReqAndDon> list = dao.donationBookList(map);
		model.addAttribute("donationList", list);
		model.addAttribute("filter", filter);

		return "WEB-INF/views/mypage/MypageDonation.jsp";
	}

	@RequestMapping(value = "/MypageDonationForm.nds", method = RequestMethod.GET)
	public String mypageDonationForm(Model model, String isbn) {

		System.out.println("isbn : " + isbn);

		String apiKey = "c1b406b32dbbbbeee5f2a36ddc14067f ";

		String uri = "";

		try {
			// http://openapi.naver.com/search?key=c1b406b32dbbbbeee5f2a36ddc14067f
			// &query=?&target=book_adv&d_isbn=8996094021+9788996094029
			uri = "http://openapi.naver.com/search?key=" + apiKey + "&query=?&target=book_adv" + "&d_isbn="
					+ URLEncoder.encode(isbn, "UTF-8");

			// System.out.println("URI : " + uri);

		} catch (UnsupportedEncodingException e) {
			System.out.println(e);
		}

		NaverParse naverAPI = new NaverParse();
		ReqAndDon book = naverAPI.parse(uri).get(0);

		// System.out.println(book.getAuthor());
		// System.out.println(book.getImage());
		// System.out.println(book.getIsbn());
		// System.out.println(book.getTitle());
		// System.out.println(book.getPubdate());
		// System.out.println(book.getPublisher());

		SimpleDateFormat simDf = new SimpleDateFormat("YYYY-MM-dd");
		String rDate = simDf.format(new Date(System.currentTimeMillis()));
		book.setRegistered_date(rDate);
		// System.out.println("rDate : " + rDate);
		model.addAttribute("book", book);

		return "WEB-INF/views/mypage/MypageDonationForm.jsp";
	}

	@RequestMapping(value = "/MypageDonationAdd.nds", method = RequestMethod.POST)
	public String mypageDonationAdd(Model model, ReqAndDon book) {

		// System.out.println(book.getAuthor());
		// System.out.println(book.getImage());
		// System.out.println(book.getIsbn());
		// System.out.println(book.getTitle());
		// System.out.println(book.getPubdate());
		// System.out.println(book.getPublisher());
		// System.out.println(book.getUser_comment());
		// System.out.println(book.getExplanation());

		IMypageDAO dao = sqlSession.getMapper(IMypageDAO.class);
		dao.donationBookAdd(book);

		return "redirect:MypageDonation.nds";
	}
	
//	@RequestMapping(value = "/MypageBorrow.nds", method = RequestMethod.GET)
//	public String mypageBorrow(Model model) {
//		IMypageDAO dao = sqlSession.getMapper(IMypageDAO.class); 
//
//		ArrayList<Borrowing> list = dao.mypageBorrow();
//		model.addAttribute("borrowingList", list);
//
//		return "WEB-INF/views/mypage/MypageBorrow.jsp";
//	}
}