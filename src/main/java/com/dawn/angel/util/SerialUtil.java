package com.dawn.angel.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class SerialUtil {

	public static String getSerialNumber(int no) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date now = new Date();
		
		String num = Integer.toString(no);
		while(num.length() < 7) {
			num = "0" + num;
		}
		String serial = sdf.format(now) + "-" + num;
		return serial;
	}
}
