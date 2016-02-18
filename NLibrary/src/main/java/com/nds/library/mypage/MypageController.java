package com.nds.library.mypage;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/MypageRequire.nds", method = RequestMethod.GET)
	public String mypageRequire(Model model, String filter, String page, HttpServletRequest request) {

		IMypageDAO dao = sqlSession.getMapper(IMypageDAO.class); 
	
		System.out.println(filter);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sessionId", request.getSession().getAttribute("sessionId"));
		
		if (filter == null) {
			filter = "0";
		}
		map.put("filter", filter);

		// �럹�씠吏� 泥섎━
		int nowpage = 0; // �쁽�옱 �럹�씠吏� 踰덊샇
		int totalCount = 0; // 珥� 寃뚯떆臾� �닔
		int totalPage = 0; // 珥� �럹�씠吏� �닔
		int pageSize = 10; // �븳�럹�씠吏��떦 寃뚯떆臾� �닔
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

		// �럹�씠吏�
		map.put("start", start + "");
		map.put("end", end + "");
		
		map.put("kind", "require");
		
		System.out.println("satrt : " + start + ", end : " + end);

		ArrayList<ReqAndDon> list = dao.requireBookList(map);

		// �럹�씠吏�
		// 珥� �럹�씠吏� �닔?
		totalCount = dao.totalCount(map); // 124嫄�
		System.out.println("totalCOunt : " + totalCount);
		totalPage = (int) Math.ceil((double) totalCount / pageSize); // 臾댁“嫄�
																		// �삱由�(3.1
																		// -> 4)

		// �럹�씠吏� 諛� �깮�꽦
		String pagebar = "";

		pagebar += "<nav id='nav1'><ul class='pagination'>";

		/*
		 * for (int i=1; i<= totalPage; i++) { pagebar += String.format(
		 * "<li><a href='#'>%d</a></li>", i); }
		 */

		// blockSize : �븳踰덉뿉 蹂댁뿬吏� �럹�씠吏� 理쒕� 媛��닔

		// �럹�씠吏� 踰덊샇瑜� 留뚮뱾湲� �쐞�븳 猷⑦봽 蹂��닔
		loop = 1;

		// �럹�씠吏� 異쒕젰 踰덊샇 蹂��닔(�럹�씠吏� 踰덊샇)
		// 5�럹�씠吏� -> 1
		// 8�럹�씠吏� -> 1
		// 10�럹�씠吏� -> 1
		// 15�럹�씠吏� -> 11
		n = ((nowpage - 1) / blockSize) * blockSize + 1;

		// �씠�쟾 10�럹�씠吏�
		if (n == 1) {
			pagebar += String.format(
					"<li class='disabled'><a href='#' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
		} else {
			pagebar += String.format(
					"<li><a href='MypageRequire.nds?page=%d&filter=%s' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>",
					n - 1, filter);
		}

		// �럹�씠吏� 踰덊샇 異쒕젰
		while (!(loop > blockSize || n > totalPage)) {

			// �쁽�옱 �럹�씠吏�
			if (n == nowpage) {
				pagebar += String.format("<li class='active'><a href='#'>%d</a></li>", n);
			} else {
				pagebar += String.format("<li><a href='MypageRequire.nds?page=%d&filter=%s'>%d</a></li>", n,
						filter, n);
			}

			loop++;
			n++;
		}

		// �떎�쓬 10�럹�씠吏�
		if (n > totalPage) {
			pagebar += String.format(
					"<li class='disabled'><a href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
		} else {
			pagebar += String.format(
					"<li><a href='MypageRequire.nds?page=%d&filter=%s' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>",
					n, filter);
		}
		pagebar += "</ul></nav>";

		model.addAttribute("pagebar", pagebar);
		
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
	public String mypageRequireAdd(Model model, ReqAndDon book, HttpServletRequest request) {

		System.out.println(book.getAuthor());
		System.out.println(book.getImage());
		System.out.println(book.getIsbn());
		System.out.println(book.getTitle());
		System.out.println(book.getPubdate());
		System.out.println(book.getPublisher());
		System.out.println(book.getUser_comment());
		System.out.println(book.getExplanation());
		
		
		book.setUser_id(request.getSession().getAttribute("sessionId").toString());

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
			uri = "http://openapi.naver.com/search?key=" + apiKey + "&display=100&target=book" + "&d_titl="
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
	public String mypageDonation(Model model, String filter, String page, HttpServletRequest request) {

		IMypageDAO dao = sqlSession.getMapper(IMypageDAO.class); //

		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(filter);
		
		map.put("sessionId", request.getSession().getAttribute("sessionId")); // �꽭�뀡 mapper濡� �꽆湲곌린

		if (filter == null) {
			filter = "0";
		}
		map.put("filter", filter);

		// �럹�씠吏� 泥섎━
		int nowpage = 0; // �쁽�옱 �럹�씠吏� 踰덊샇
		int totalCount = 0; // 珥� 寃뚯떆臾� �닔
		int totalPage = 0; // 珥� �럹�씠吏� �닔
		int pageSize = 10; // �븳�럹�씠吏��떦 寃뚯떆臾� �닔
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

		// �럹�씠吏�
		map.put("start", start + "");
		map.put("end", end + "");
		
		map.put("kind", "donation");
		
		System.out.println("satrt : " + start + ", end : " + end);

		ArrayList<ReqAndDon> list = dao.donationBookList(map);

		// �럹�씠吏�
		// 珥� �럹�씠吏� �닔?
		totalCount = dao.totalCount(map); // 124嫄�
		System.out.println("totalCOunt : " + totalCount);
		totalPage = (int) Math.ceil((double) totalCount / pageSize); // 臾댁“嫄�
																		// �삱由�(3.1
																		// -> 4)

		// �럹�씠吏� 諛� �깮�꽦
		String pagebar = "";

		pagebar += "<nav id='nav1'><ul class='pagination'>";

		/*
		 * for (int i=1; i<= totalPage; i++) { pagebar += String.format(
		 * "<li><a href='#'>%d</a></li>", i); }
		 */

		// blockSize : �븳踰덉뿉 蹂댁뿬吏� �럹�씠吏� 理쒕� 媛��닔

		// �럹�씠吏� 踰덊샇瑜� 留뚮뱾湲� �쐞�븳 猷⑦봽 蹂��닔
		loop = 1;

		// �럹�씠吏� 異쒕젰 踰덊샇 蹂��닔(�럹�씠吏� 踰덊샇)
		// 5�럹�씠吏� -> 1
		// 8�럹�씠吏� -> 1
		// 10�럹�씠吏� -> 1
		// 15�럹�씠吏� -> 11
		n = ((nowpage - 1) / blockSize) * blockSize + 1;

		// �씠�쟾 10�럹�씠吏�
		if (n == 1) {
			pagebar += String.format(
					"<li class='disabled'><a href='#' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
		} else {
			pagebar += String.format(
					"<li><a href='MypageDonation.nds?page=%d&filter=%s' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>",
					n - 1, filter);
		}

		// �럹�씠吏� 踰덊샇 異쒕젰
		while (!(loop > blockSize || n > totalPage)) {

			// �쁽�옱 �럹�씠吏�
			if (n == nowpage) {
				pagebar += String.format("<li class='active'><a href='#'>%d</a></li>", n);
			} else {
				pagebar += String.format("<li><a href='MypageDonation.nds?page=%d&filter=%s'>%d</a></li>", n,
						filter, n);
			}

			loop++;
			n++;
		}

		// �떎�쓬 10�럹�씠吏�
		if (n > totalPage) {
			pagebar += String.format(
					"<li class='disabled'><a href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
		} else {
			pagebar += String.format(
					"<li><a href='MypageDonation.nds?page=%d&filter=%s' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>",
					n, filter);
		}
		pagebar += "</ul></nav>";

		model.addAttribute("pagebar", pagebar);
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
			uri = "http://openapi.naver.com/search?key=" + apiKey + "&display=100&query=?&target=book_adv" + "&d_isbn="
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
	public String mypageDonationAdd(Model model, ReqAndDon book, HttpServletRequest request) {

		// System.out.println(book.getAuthor());
		// System.out.println(book.getImage());
		// System.out.println(book.getIsbn());
		// System.out.println(book.getTitle());
		// System.out.println(book.getPubdate());
		// System.out.println(book.getPublisher());
		// System.out.println(book.getUser_comment());
		// System.out.println(book.getExplanation());

		book.setUser_id(request.getSession().getAttribute("sessionId").toString());
		
		IMypageDAO dao = sqlSession.getMapper(IMypageDAO.class);
		dao.donationBookAdd(book);

		return "redirect:MypageDonation.nds";
	}
	
	@RequestMapping(value = "/mypageBorrow.nds", method = RequestMethod.GET)
	public String mypageBorrow(Model model, HttpServletRequest request) {
		IMypageDAO dao = sqlSession.getMapper(IMypageDAO.class); 
		Map<String, Object> map = new HashMap<String, Object>();
		String user_id = request.getSession().getAttribute("sessionId").toString();
		
		map.put("user_id", user_id);
		ArrayList<Borrowing> list = dao.mypageBorrow(map);
		model.addAttribute("list", list);

		return "WEB-INF/views/mypage/MypageBorrow.jsp";
	}
}