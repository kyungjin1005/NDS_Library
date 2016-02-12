package com.nds.library.mypage;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nds.library.manager.IManagerDAO;
import com.nds.library.manager.Message;

@Controller
public class MypageController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/MypageRequire.nds", method = RequestMethod.GET)
	public String mypageRequire(Model model) {

		// model.addAttribute("message", "Hello Spring MVC Framework!");

		IMypageDAO dao = sqlSession.getMapper(IMypageDAO.class);
		ArrayList<Borrowing> list = dao.BorrowingList();

		for (Borrowing borrowing : list) {
			System.out.println(borrowing.getBorrowing_date());
		}

		return "WEB-INF/views/mypage/MypageRequire.jsp";
	}
}