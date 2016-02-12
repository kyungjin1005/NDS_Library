package com.nds.library;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LibraryController {

	private static final Logger logger = LoggerFactory.getLogger(LibraryController.class);

	
	@RequestMapping(value = "/Login.nds", method = RequestMethod.GET)
	public String login() {

		return "WEB-INF/views/Login.jsp";
	}
	
	@RequestMapping(value = "/MypageRequire.nds", method = RequestMethod.GET)
	public String mypageRequire(String query) {

		return "WEB-INF/views/MypageRequire.jsp";
	}

	@RequestMapping(value = "/NaverAjax.nds", method = RequestMethod.GET)
	public String naverAjax(Model model, String query) {
		
		System.out.println(query);

		ArrayList<Book> list;

		String apiKey = "c1b406b32dbbbbeee5f2a36ddc14067f ";
		String searchQuery = query;

		String uri = "";

		try {

			uri = "http://openapi.naver.com/search?key=" + apiKey + "&target=book"+ "&d_titl="
					+ URLEncoder.encode(searchQuery, "UTF-8") + "&query=" + URLEncoder.encode(searchQuery, "UTF-8");
			
			System.out.println("URI : " + uri);

		} catch (UnsupportedEncodingException e) {
			System.out.println(e);
		}

		NaverParse naverAPI = new NaverParse();
		list = naverAPI.parse(uri);
		
		System.out.println("list Size : " + list.size());
		
		/*for(Book b : list){
			System.out.println(b.getAuthor());
			System.out.println(b.getImage());
			System.out.println(b.getIsbn());
			System.out.println(b.getTitle());
			System.out.println(b.getPubdate());
			System.out.println(b.getPublisher());
		}*/
		model.addAttribute("bookList", list);
		
		

		return "WEB-INF/views/NaverAjax.jsp";
	}
	
	

}
