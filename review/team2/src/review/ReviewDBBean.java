package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import myUtil.*;

public class ReviewDBBean {

	private static ReviewDBBean instance = new ReviewDBBean();
	public static ReviewDBBean getInstance() {
		return instance;
	}
		
	public Connection getConnection() throws Exception{
		Context ctx=new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	//글 작성
	public int insertBoard(ReviewBean review) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="";
			int number;
			
			int num = review.getR_num();
			
			try {
				con = getConnection();
				sql="SELECT MAX(RV_NUM) FROM REVIEWBOARD";
				pstmt=con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					number=rs.getInt(1)+1;
				}else {
					number=1;
				}
				
				sql="insert into boardT(b_id, b_name, b_email, b_title, b_content, b_pwd, b_date"
						+ ", b_ip, b_ref, b_step, b_level, b_fname, b_fsize, b_rfname) "
						+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				System.out.println("@@@###sql ===> "+sql);
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, number);
//				pstmt.setString(2, HanConv.toKor(board.getB_name()));
//				pstmt.setString(2, review.getB_name());
//				pstmt.setString(3, review.getB_email());
		
				
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
		
	
	//글목록   
	public ArrayList<ReviewBean> listBoard(String pageNumber){
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		ResultSet pageSet=null;
		int dbCount=0;
		int absoultePage=1;
			
		ArrayList<ReviewBean> boardList = new ArrayList<ReviewBean>();
			
			try {
				con = getConnection();
				
//				stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				stmt = con.createStatement();
				pageSet = stmt.executeQuery("select count(b_id) from boardt");
				
				if (pageSet.next()) {
					dbCount = pageSet.getInt(1);
					pageSet.close();
					stmt.close();
				}
				
				if (dbCount % ReviewBean.pageSize == 0) {
					ReviewBean.pageCount = dbCount / ReviewBean.pageSize;
				}else {
					ReviewBean.pageCount = dbCount / ReviewBean.pageSize + 1;
				}
				
				if (pageNumber != null) {
					ReviewBean.pageNum = Integer.parseInt(pageNumber);
					absoultePage = (ReviewBean.pageNum-1) * ReviewBean.pageSize + 1;
				}
				
//				stmt = con.createStatement();
				stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				String sql="select * from boardt order by b_ref desc, b_step asc";
				rs = stmt.executeQuery(sql);
				
				if (rs.next()) {
					rs.absolute(absoultePage);
					int count = 0;
					while (count < ReviewBean.pageSize) {
						ReviewBean board=new ReviewBean();
//						board.setB_id(rs.getInt(1));
//						board.setB_name(rs.getString(2));
						
						boardList.add(board);
						
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
			return boardList;
		}
		
	
	
	public ReviewBean getBoard(int bid, boolean hitadd) {
			Connection con=null;
			PreparedStatement pstmtUp=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="";
			ReviewBean board=null;
			
			try {
				con = getConnection();
				
				if (hitadd==true) {
					sql="update boardt set b_hit=b_hit+1 where b_id=?";
					pstmtUp = con.prepareStatement(sql);
					pstmtUp.setInt(1, bid);
					pstmtUp.executeUpdate();
					pstmtUp.close();
				}
				
				sql="select * from boardt where b_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, bid);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					board=new ReviewBean();
//					board.setB_id(rs.getInt(1));
//					board.setB_name(rs.getString(2));
	
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
			return board;
		}
		
		public int deleteBoard(int b_id, String b_pwd) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="";
			int re=-1;
			String pwd="";
			
			try {
				con = getConnection();
				sql="select b_pwd from boardt where b_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, b_id);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					pwd = rs.getString(1);
					
					if (!pwd.equals(b_pwd)) {
						re=0;
					}else {
						sql="delete boardt where b_id=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, b_id);
						pstmt.executeUpdate();
						re=1;
					}
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
			return re;
		}

		
	//글 수정
	public int editBoard(ReviewBean board) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int re=-1;
		String pwd="";
			
		try {
			con = getConnection();
			sql="select b_pwd from boardt where b_id=?";
			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, board.getB_id());
			rs = pstmt.executeQuery();
				
			if (rs.next()) {
				pwd = rs.getString(1);
				
//				if (!pwd.equals(board.getB_pwd())) {
					re=0;
				}else {
					sql="update boardt set b_name=?, b_email=?, b_title=?, b_content=? where b_id=?";
					pstmt = con.prepareStatement(sql);
//					pstmt.setString(1, HanConv.toKor(board.getB_name()));
//					pstmt.setString(2, HanConv.toKor(board.getB_email()));
				
//					pstmt.setInt(5, board.getB_id());
					pstmt.executeUpdate();
					re=1;					
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
			return re;
	}
		
	
		public ReviewBean getFileName(int bid) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="";
			ReviewBean board=null;
			
			try {
				con = getConnection();
				sql="select b_fname, b_rfname from boardt where b_id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, bid);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					board=new ReviewBean();
//					board.setB_fname(rs.getString(1));
//					board.setB_rfname(rs.getString(2));
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
			return board;
		}
	}