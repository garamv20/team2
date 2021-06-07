package faq;

import java.sql.Timestamp;

public class faqBean {
	private int f_num; //글 번호
	private String f_category;//글 분류
	private String f_title; //글 제목
	private String f_content; //글 내용

	private String u_id; //작성자
	
	/*   페이징   */
	public static int pageSize = 10;
	public static int pageCount = 1;
	public static int pageNum = 1;
	
	public static String pageNumber(int limit, String u_id) {
		String str = "";
		int temp = (pageNum - 1) % limit;
		int startPage = pageNum - temp;
		
		if((startPage - limit) > 0) {
			str = "<a href='#?u_id=" + u_id + "&pageNum=" + (startPage - 1) + "'><< 이전</a>;";
		}
		
		for (int i = startPage; i < (startPage + limit); i++) {
			if(i == pageNum) {
				str += i + "&nbsp;&nbsp;";
			} else {
				str += "<a href='#?u_id=" + u_id + "&pageNum=" + i + "'>" + i + "</a>&nbsp;&nbsp;";
			}
			
			if(i >= pageCount) {
				break;
			}
		}
		
		if((startPage + limit) <= pageCount) {
			str += "<a href='#p?u_id=" + u_id + "&pageNum=" + (startPage + limit) + "'>다음 >></a>";
		}
		
		return str;
	}
}
