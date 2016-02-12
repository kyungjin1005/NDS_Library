package com.nds.library;

import java.util.ArrayList;
import java.util.Map;

public interface ILibraryDAO {
	public ArrayList<Book> requireBookList(Map<String, Object> map);

}
