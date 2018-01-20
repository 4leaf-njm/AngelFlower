package com.dawn.angel.util;

public class MenuUtil {
	
	public static String getMenu(int no) {
		String menu = null;
		
		switch(no) {
		case 1:
			menu = "근조 화환";
			break;
		case 2:
			menu = "근조 바구니";
			break;
		case 3:
			menu = "축하 화환";
			break;
		case 4:
			menu = "꽃다발";
			break;
		case 5:
			menu = "꽃바구니";
			break;
		case 6:
			menu = "동·서양란";
			break;
		case 7:
			menu = "★ 플라워";
			break;
		}
		return menu;
	}
}
