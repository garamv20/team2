package review;

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
import myUtil.*;

public class ReviewDBBean {

	private static ReviewDBBean instance = new ReviewDBBean();
	public static ReviewDBBean getInstance() {
		return instance;
	}
		
//	public Connection getConnection() throws Exception{
//		Context ctx=new InitialContext();
//		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
//		return ds.getConnection();
//	}

	
	public Connection getConnection() throws Exception {
		Connection conn=null;
		try{
			String url= "jdbc:mysql://localhost:3306/team2_db";
			String user = "team2";
			String password = "1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn= DriverManager.getConnection(url, user, password);
		}catch(SQLException ex){
			System.out.print("SQLException"+ex.getMessage());
		}
		return conn;
	}
	
	
	//글 작성
	public int insertBoard(ReviewBean review) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			int number;
			
			int num = review.getR_num();
			
			try {
				con = getConnection();
				sql="SELECT MAX(R_NUM) FROM REVIEW";
				pstmt=con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					number=rs.getInt(1)+1;
				}else {
					number=1;
				}
				
				sql="insert into review(r_num,r_title,r_content,r_grade,r_date,r_hit,"
						+ "r_like,item_num,u_id) values(?,?,?,?,?,?,?,?,?)";
				System.out.println("@@@###sql ===> "+sql);
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, number);
				pstmt.setString(2, review.getR_title());
				pstmt.setString(3, review.getR_content());
				pstmt.setInt(4, review.getR_grade());
				pstmt.setTimestamp(5, review.getR_date());
				pstmt.setInt(6, review.getR_hit());
				pstmt.setInt(7, review.getR_like());
				pstmt.setInt(8, review.getItem_num());
				pstmt.setString(9, review.getU_id());

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
	public ArrayList<ReviewBean> listBoard(String pageNumber) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		// paging 
		ResultSet pageSet = null;
		int dbCount = 0;
		int absoultePage = 1;
		
		ArrayList<ReviewBean> ReviewList = new ArrayList<ReviewBean>();
		
		try {
			
			con = getConnection();
			
			//페이징
			stmt = con.createStatement();
			pageSet = stmt.executeQuery("select count(r_num) from review");
			
			if(pageSet.next()) {
				dbCount = pageSet.getInt(1);
				pageSet.close();
				stmt.close();
			}
			
			if(dbCount % ReviewBean.pageSize == 0) {
				ReviewBean.pageCount = dbCount / ReviewBean.pageSize;
			} else {
				ReviewBean.pageCount = dbCount / ReviewBean.pageSize + 1;
			}
			
			if(pageNumber != null) {
				ReviewBean.pageNum = Integer.parseInt(pageNumber);
				absoultePage = (ReviewBean.pageNum - 1) * ReviewBean.pageSize + 1;
			}
			
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			String sql = "select r.* from review r join user u "
					+ "on r.u_id = u.u_id "
					+ "order by r.r_num desc";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				rs.absolute(absoultePage);
				int count = 0;
				
				while(count < ReviewBean.pageSize) {
					ReviewBean rb = new ReviewBean();
					rb.setR_num(rs.getInt(1));
					rb.setR_title(rs.getString(2));
					rb.setR_content(rs.getString(3));
					rb.setR_grade(rs.getInt(4));
					rb.setR_date(rs.getTimestamp(5));
					rb.setR_hit(rs.getInt(6));
					rb.setR_like(rs.getInt(7));
					rb.setItem_num(rs.getInt(8));
					rb.setU_id(rs.getString(9));
					
					ReviewList.add(rb);
					
					if(rs.isLast()) {
						break;
					} else {
						rs.next();
					}
					count++;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return ReviewList;
	}
		
	
	
	public ReviewBean getBoard(int bid, boolean hitadd) {
			Connection con = null;
			PreparedStatement pstmtUp = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			ReviewBean review = null;
			
			try {
				con = getConnection();
				
				if (hitadd==true) {
					sql = "update review set r_hit = r_hit+1 where u_id=?";
					pstmtUp = con.prepareStatement(sql);
					pstmtUp.setInt(1, bid);
					pstmtUp.executeUpdate();
					pstmtUp.close();
				}
				
				sql="select * from review where u_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, bid);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					review = new ReviewBean();
					review.setR_num(rs.getInt(1));
					review.setR_title(rs.getString(2));
					review.setR_content(rs.getString(3));
					review.setR_grade(rs.getInt(4));
					review.setR_date(rs.getTimestamp(5));
					review.setR_hit(rs.getInt(6));
					review.setR_like(rs.getInt(7));
					review.setItem_num(rs.getInt(8));
					review.setU_id(rs.getString(9));
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
			return review;
		}
	
	
	//삭제
	public int deleteHtBoard(int r_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int re = -1;
		
		try {
			
			con = getConnection();
			sql = "delete from review where r_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, r_num);
			
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

		
	//글 수정
	public int editBoard(ReviewBean board) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		
		try {
			
			con = getConnection();
			sql = "update reiew set r_title = ?, r_content = ?, r_grade=? where r_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, HanConv.toKor(board.getR_title()));
			pstmt.setString(2, HanConv.toKor(board.getR_content()));
			pstmt.setInt(3, board.getR_grade());
			pstmt.setInt(4, board.getR_num());
			
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
		
	
	//사진파일올리기
		public ReviewBean getFileName(int bid) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			ReviewBean review = null;
			
			try {
				con = getConnection();
				sql="select r_img from review where u_id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, bid);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					review = new ReviewBean();
					review.setR_img(rs.getString(1));

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
			return review;
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
						
						//관리자는 0
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
				
				/* 좋아요 추가*/
				public int likeBoard(int r_num) {
					Connection con = null;
					PreparedStatement pstmt = null;
					String sql = "";
					int re = -1;
					
					try {
						
						con = getConnection();
						sql = "update review set r_like = r_like + 1 where r_num=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, r_num);
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
				
				/* 좋아요 번호 입력 */
				public int inputlike(String u_id, int bl_num, String bl_title) {
					Connection con = null;
					PreparedStatement pstmt = null;
					String sql = "";
					int re = -1;
					
					try {
						con = getConnection();
						sql = "insert into like_list values(?, ?)";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, bl_num);
						pstmt.setString(2, u_id);
						pstmt.executeUpdate();
						
						re=1;
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
				
				/*--좋아요 중복 막기--*/
				
				public ArrayList<Integer> userLikeList(String u_id) {
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = "";
					ArrayList<Integer> listNum = new ArrayList<Integer>();
					
					try {
						con = getConnection();
						sql = "select like_num from review where u_id = ?";
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