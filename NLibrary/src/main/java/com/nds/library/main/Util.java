package com.nds.library.main;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

public class Util {
	
	public static String getId(){	
		
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String ndSNumber = auth.getName();
		
		
		System.out.println("ndSNumber : " + ndSNumber);
		return ndSNumber;
	}
}
