package board;

import java.sql.Timestamp;

public class ReviewBean {
	private int r_num; //�� ��ȣ
	private String r_title; //�� ����
	private String r_content; //�� ����
	private String r_img; // ����
	private int r_grade; //����
	private Timestamp r_date; //�ۼ���
	private int r_hit; //��ȸ��
	private int r_like;//���� ���ƿ�
	
	private String product;//��ǰ��ȣ
	private String u_id; //�ۼ���
	
	/*--����¡ ó�� �κ�--*/
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

	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public String getR_img() {
		return r_img;
	}

	public void setR_img(String r_img) {
		this.r_img = r_img;
	}

	public int getR_grade() {
		return r_grade;
	}

	public void setR_grade(int r_grade) {
		this.r_grade = r_grade;
	}

	public Timestamp getR_date() {
		return r_date;
	}

	public void setR_date(Timestamp r_date) {
		this.r_date = r_date;
	}

	public int getR_hit() {
		return r_hit;
	}

	public void setR_hit(int r_hit) {
		this.r_hit = r_hit;
	}

	public int getR_like() {
		return r_like;
	}

	public void setR_like(int r_like) {
		this.r_like = r_like;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

}
