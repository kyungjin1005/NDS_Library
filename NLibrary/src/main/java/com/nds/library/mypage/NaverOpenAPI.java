package com.nds.library.mypage;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class NaverOpenAPI {

	public NaverOpenAPI(String query) {
		String apiKey = "f5888cb5b2d2cc41a3f3b0262943bcb4";
		String searchQuery = query;

		String uri = "";

		// http://openapi.naver.com/search?key=c1b406b32dbbbbeee5f2a36ddc14067f&query=%EC%82%BC%EA%B5%AD%EC%A7%80&display=10&start=1&target=book

		try {
			uri = "http://openapi.naver.com/search?key=" + apiKey + "&query=" + URLEncoder.encode(searchQuery, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			System.out.println(e);
		}

		NaverParse naverAPI = new NaverParse();
		naverAPI.parse(uri);
	}
}