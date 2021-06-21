package qna;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import comment.CommentBean;
import faq.FaqBean;
import faq.FaqDBBean;
import myUtil.HanConv;

public class QnaDBBean {
	private static QnaDBBean instance=new QnaDBBean();
	public static QnaDBBean getInstance() {
		return instance;
	}
	
/*	public Connection getConnection() throws Exception{
		Context ctx=new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}*/
	
	public Connection getConnection() throws Exception {
		Connection conn = null;
			try{
					String url = "jdbc:mysql://localhost:3306/team2_db";
					String user = "team2";
					String password = "1234";
	
					Class.forName("com.mysql.cj.jdbc.Driver");
					conn = DriverManager.getConnection(url, user, password);
			}catch(SQLException ex){
				System.out.println("SQLException: "+ex.getMessage());
			}
			return conn;
			}	
	
	
	//글작성
	public int insertBoard(QnaBean qna) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int number;
		
		try {
			con = getConnection();
			sql = "select max(q_num) from QNA";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
				if(rs.next()) {
					number = rs.getInt(1) + 1;
				} else {
					number = 1;
				}
			
			sql="insert into QNA(q_num, q_category, q_title, q_content, u_id) "
					+ "values(?,?,?,?,?)";
			System.out.println("@@@###sql ===> "+sql);
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, number);
			pstmt.setString(2, HanConv.toKor(qna.getQ_category()));
			pstmt.setString(3, HanConv.toKor(qna.getQ_title()));
			pstmt.setString(4, HanConv.toKor(qna.getQ_content()));
			pstmt.setString(5, qna.getU_id());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return 1;
	}
	
	public ArrayList<QnaBean> listBoard(String pageNumber){
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		ResultSet pageSet=null;
		int dbCount=0;
		int absoultePage=1;
		
		ArrayList<QnaBean> qnaList = new ArrayList<QnaBean>();
		
		try {
			con = getConnection();
			
			stmt = con.createStatement();
			pageSet = stmt.executeQuery("select count(q_num) from QNA");
			
			if (pageSet.next()) {
				dbCount = pageSet.getInt(1);
				pageSet.close();
				stmt.close();
			}
			
			if (dbCount % QnaBean.pageSize == 0) {
				QnaBean.pageCount = dbCount / QnaBean.pageSize;
			}else {
				QnaBean.pageCount = dbCount / QnaBean.pageSize + 1;
			}
			
			if (pageNumber != null) {
				QnaBean.pageNum = Integer.parseInt(pageNumber);
				absoultePage = (QnaBean.pageNum-1) * QnaBean.pageSize + 1;
			}
			
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			String sql = "select q.* "
					+ "from qna q join user u "
					+ "on q.u_id = u.u_id "
					+ "order by q.q_num desc";
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				rs.absolute(absoultePage);
				int count = 0;
				while (count < QnaBean.pageSize) {
					QnaBean qna = new QnaBean();
					qna.setQ_num(rs.getInt(1));
					qna.setQ_category(rs.getString(2));
					qna.setQ_title(rs.getString(3));
					qna.setQ_content(rs.getString(4));
				
					qnaList.add(qna);
					
					if (rs.isLast()) {
						break;
					}else {
						rs.next();
					}
					count++;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return qnaList;
	}
	
	//글보기 
	public QnaBean getBoard(int bid, boolean hitadd) {
		Connection con = null;
		PreparedStatement pstmtUp = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		QnaBean qna = null;
		
		try {
			con = getConnection();
			
			sql="select * from qna where q_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				qna = new QnaBean();
				qna.setQ_num(rs.getInt(1));
				qna.setQ_category(rs.getString(2));
				qna.setQ_title(rs.getString(3));
				qna.setQ_content(rs.getString(4));
				qna.setQ_date(rs.getTimestamp(5));
				qna.setQ_hit(rs.getInt(6));
				qna.setU_id(rs.getString(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return qna;
	}
	
	//글삭제
	public int deleteBoard(int q_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int re = -1;
		
		try {
			con = getConnection();
			sql = "delete from qna where q_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, q_num);
			
			pstmt.executeUpdate();
			
			re = 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
	
	//글수정
	public int editBoard(QnaBean board) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		
		try {
			
			con = getConnection();
			sql = "update qna set q_title = ?, q_content = ? where q_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, HanConv.toKor(board.getQ_title()));
			pstmt.setString(2, HanConv.toKor(board.getQ_content()));
			pstmt.setInt(3, board.getQ_num());
			
			pstmt.executeUpdate();
			
			re = 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return re;
	}
	
	//사용자, 관리자 구분
		public int confirmManager(String u_id) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			int re = 0;
			
			try {
				con = getConnection();
				sql = "select u_grade from user where u_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, u_id);
				rs = pstmt.executeQuery();
				
				//관리자 : 0
				if(rs.next()) {
					re = rs.getInt(1);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			return re;
		}

		//댓글쓰기
		public int insertComment(CommentBean comBoard) throws Exception {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			int number;
						
			int ref = comBoard.getCom_ref();
			int step = comBoard.getCom_step();
			int level = comBoard.getCom_level();
						
			try {
				con = getConnection();
				sql = "select max(com_num) from comment";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
							
				if(rs.next()) {
					number = rs.getInt(1) + 1;
				} else {
					number = 1;
				}
							
				if(step > 0) {
					sql = "update comment set com_step = com_step + 1 where com_ref=? and com_step > ?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, ref);
						pstmt.setInt(2, step);
						pstmt.executeUpdate();
								
						step = step + 1;
						level = level + 1;
				} else {
						ref = number;
						step = 0;
						level = 0;
				}
							
					sql = "insert into comment values(?,?,?,?,?,?,?,?)";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, number);
					pstmt.setString(2, "Review");
					pstmt.setString(3, HanConv.toKor(comBoard.getCom_content()));
					pstmt.setInt(4, ref);
					pstmt.setInt(5, step);
					pstmt.setInt(6, level);
					pstmt.setInt(7, comBoard.getTable_num());
					pstmt.setString(8, comBoard.getU_id());
							
					pstmt.executeUpdate();
							
				} catch (Exception e) {
					e.printStackTrace();
				}
					return 1;
		}
		
		
		/*--댓글 리스트--*/
		public ArrayList<CommentBean> listComment(int table_num) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			ArrayList<CommentBean> comList = new ArrayList<CommentBean>();
				
				try {
					con = getConnection();
					sql = "select * from comment "
						+ "where com_table = 'review' and table_num = ? "
						+ "order by com_ref desc, com_level asc, com_num desc";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, table_num);
					rs = pstmt.executeQuery();
		
					while(rs.next()) {
						CommentBean cb = new CommentBean();
						cb.setCom_num(rs.getInt(1));
						cb.setCom_table(rs.getString(2));
						cb.setCom_content(rs.getString(3));
						cb.setCom_ref(rs.getInt(4));
						cb.setCom_step(rs.getInt(5));
						cb.setCom_level(rs.getInt(6));
						cb.setTable_num(rs.getInt(7));
						cb.setU_id(rs.getString(8));
								
						comList.add(cb);
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						if(rs != null) rs.close();
						if(pstmt != null) pstmt.close();
						if(con != null) con.close();
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			return comList;
		}
				
		// 댓글 삭제
		public int deleteComment(int com_num) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = "";
			int re = -1;
					
			try {
				con = getConnection();
				sql = "delete comment where com_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, com_num);
							
				pstmt.executeUpdate();
				re = 1;
							
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
				return re;
		}
		
		
		public ArrayList<Integer> userLikeList(String u_id) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			ArrayList<Integer> listNum = new ArrayList<Integer>();
			
			try {
				con = getConnection();
				sql = "select like_num from like_list where user_tbl_u_id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, u_id);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					listNum.add(rs.getInt(1));
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			return listNum;
		}
		
		
}

