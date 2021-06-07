package comment;

public class CommentBean {
	private int com_num;
	private String com_table;
	private String com_content;
	private int com_ref;
	private int com_step;
	private int com_level;
	
	private String u_id;
	private int table_num;
	public int getCom_num() {
		return com_num;
	}
	public void setCom_num(int com_num) {
		this.com_num = com_num;
	}
	public String getCom_table() {
		return com_table;
	}
	public void setCom_table(String com_table) {
		this.com_table = com_table;
	}
	public String getCom_content() {
		return com_content;
	}
	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}
	public int getCom_ref() {
		return com_ref;
	}
	public void setCom_ref(int com_ref) {
		this.com_ref = com_ref;
	}
	public int getCom_step() {
		return com_step;
	}
	public void setCom_step(int com_step) {
		this.com_step = com_step;
	}
	public int getCom_level() {
		return com_level;
	}
	public void setCom_level(int com_level) {
		this.com_level = com_level;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getTable_num() {
		return table_num;
	}
	public void setTable_num(int table_num) {
		this.table_num = table_num;
	}
	
}