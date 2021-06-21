package qna;

import java.sql.Timestamp;

public class QnaBean {
	private int q_num; //글 번호
	private String q_category;//글 분류
	private String q_title; //글제목
	private String q_content; //글내용
	private Timestamp q_date; //작성일
	private int q_hit; //조회수
	
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

	public int getQ_num() {
		return q_num;
	}

	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}

	public String getQ_category() {
		return q_category;
	}

	public void setQ_category(String q_category) {
		this.q_category = q_category;
	}

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public Timestamp getQ_date() {
		return q_date;
	}

	public void setQ_date(Timestamp q_date) {
		this.q_date = q_date;
	}

	public int getQ_hit() {
		return q_hit;
	}

	public void setQ_hit(int q_hit) {
		this.q_hit = q_hit;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	
}
