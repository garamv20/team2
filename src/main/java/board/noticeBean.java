package board;

import java.sql.Timestamp;

public class noticeBean {
	private int n_num; //�� ��ȣ
	private String n_title; //�� ����
	private String n_content; //�� ����
	private Timestamp n_date; //�ۼ���
	private int n_hit; //��ȸ��

	private String u_id; //�ۼ���
	
	/*   ����¡   */
	public static int pageSize = 10;
	public static int pageCount = 1;
	public static int pageNum = 1;
	
	public static String pageNumber(int limit, String u_id) {
		String str = "";
		int temp = (pageNum - 1) % limit;
		int startPage = pageNum - temp;
		
		if((startPage - limit) > 0) {
			str = "<a href='#?u_id=" + u_id + "&pageNum=" + (startPage - 1) + "'><< ����</a>;";
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
			str += "<a href='#p?u_id=" + u_id + "&pageNum=" + (startPage + limit) + "'>���� >></a>";
		}
		
		return str;
	}
}
