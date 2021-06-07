package qna;

import java.sql.Timestamp;

public class qnaBean {
	private int q_num; //글 번호
	private String q_category;//글 분류
	private String q_title; //글제목
	private String q_content; //글내용
	private Timestamp q_date; //작성일
	private int q_hit; //조회수
	
	private String u_id; //작성자
	
}
