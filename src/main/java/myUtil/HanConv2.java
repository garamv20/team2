package myUtil;

import java.net.URLEncoder;

public class HanConv2 {
	public static String toKor(String str) {
		if ((str == null) || (str.equals("null"))){
			return str;
		}
		try {
			return new String(str.getBytes("8859_1"), "UTF-8"); //getBytes바이트를 영문배열로 받아서 다시 한글처리한다.
		} catch (Exception e) {
			e.printStackTrace();
			return str;
		}
	}
	public static String toKorTwo(String str) {
		if ((str == null) || (str.equals("null"))){
			return str;
		}
		try {
			String result=null;
			result = URLEncoder.encode(str, "euc-kr");
			return result; 
		} catch (Exception e) {
			e.printStackTrace();
			return str;
		}
	}
}
