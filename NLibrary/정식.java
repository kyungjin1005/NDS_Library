package com.nds.library.main;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.servlet.ModelAndView;

import com.nds.library.board.Board;
import com.nds.library.mypage.IMypageDAO;
import com.nds.library.mypage.NaverParse;
import com.nds.library.mypage.ReqAndDon;

@Controller
public class MainController {
   @Autowired
   private SqlSession sqlSession;

   @RequestMapping(value = "/Main.nds", method = RequestMethod.GET)
   public String MainBoardList(Model model) {

      IMainDAO dao = sqlSession.getMapper(IMainDAO.class);
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

      // model.addAttribute("newBookList", NewBookList);

      // System.out.println(MonthlyBookList.get(0).getImage());

      return "WEB-INF/views/main/Main.jsp";
   }

   /*@RequestMapping(value = "/NaverAjax.nds", method = RequestMethod.GET)
   public String NewBookList(Model model, String query) {

      //System.out.println(query);

      ArrayList<Book> list;

      String apiKey = "AFFB7CB6B98788B011E21E57116E7D57F7265DB845C79917A613CD62ADA6CC71";

      String uri = "";
      try {

         uri = "http://book.interpark.com/api/newBook.api?key=interpark&categoryId=122";

      } catch (Exception e) {
         System.out.println(e);
      }
      InterparkParse interparkAPI = new InterparkParse();
      list = interparkAPI.parse(uri);

      model.addAttribute("bookList", list);
      return "redirect:QABoardList.nds";
      
      
      // System.out.println("list Size : " + list.size());

      //
      // for(Book b : list){ System.out.println(b.getAuthor());
      // System.out.println(b.getImage()); System.out.println(b.getIsbn());
      // System.out.println(b.getTitle()); System.out.println(b.getPubdate());
      // System.out.println(b.getPublisher()); }
      //

   }
*/
   /*
    * @RequestMapping(value = "/MypageRequireForm.nds", method =
    * RequestMethod.GET) public String NewBookList(Model model, String isbn) {
    * 
    * IMypageDAO dao = sqlSession.getMapper(IMypageDAO.class);
    * 
    * System.out.println("isbn : " + isbn);
    * 
    * String apiKey = "c1b406b32dbbbbeee5f2a36ddc14067f ";
    * 
    * String uri = "";
    * 
    * try { //
    * http://openapi.naver.com/search?key=c1b406b32dbbbbeee5f2a36ddc14067f //
    * &query=?&target=book_adv&d_isbn=8996094021+9788996094029 uri =
    * "http://openapi.naver.com/search?key=" + apiKey +
    * "&query=?&target=book_adv" + "&d_isbn=" + URLEncoder.encode(isbn,
    * "UTF-8");
    * 
    * System.out.println("URI : " + uri);
    * 
    * } catch (UnsupportedEncodingException e) { System.out.println(e); }
    * 
    * NaverParse naverAPI = new NaverParse(); ReqAndDon book =
    * naverAPI.parse(uri).get(0);
    * 
    * // System.out.println(book.getAuthor()); //
    * System.out.println(book.getImage()); //
    * System.out.println(book.getIsbn()); //
    * System.out.println(book.getTitle()); //
    * System.out.println(book.getPubdate()); //
    * System.out.println(book.getPublisher());
    * 
    * SimpleDateFormat simDf = new SimpleDateFormat("YYYY-MM-dd"); String rDate
    * = simDf.format(new Date(System.currentTimeMillis()));
    * book.setRegistered_date(rDate); System.out.println("rDate : " + rDate);
    * model.addAttribute("book", book);
    * 
    * return "redirect:QABoardList.nds"; }
    */
}