package faq;

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
import myUtil.*;
import review.ReviewBean;

public class FaqDBBean {
	private static FaqDBBean instance = new FaqDBBean();
	public static FaqDBBean getInstance() {
		return instance;
	}
	
//	public Connection getConnection() throws Exception{
//		Context ctx = new InitialContext();
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
	
	//글작성
	public int insertBoard(FaqBean faq, String u_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int number;
		int re=-1;
		
		try {
			con = getConnection();
			sql = "select max(f_num) from FAQ";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
				if(rs.next()) {
					number = rs.getInt(1) + 1;
				} else {
					number = 1;
				}
			
			sql="insert into FAQ(f_num, f_category,f_title, f_content, u_id) values(?,?,?,?,?)";
			System.out.println("@@@###sql ===> "+sql);
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, number);
			pstmt.setString(2, HanConv.toKor(faq.getF_category()));
			pstmt.setString(3, HanConv.toKor(faq.getF_title()));
			pstmt.setString(4, HanConv.toKor(faq.getF_content()));
			pstmt.setString(5, faq.getU_id());

			pstmt.executeUpdate();
			
			re = 1;
			
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
		return re;
	}
	
	public ArrayList<FaqBean> listBoard(String pageNumber){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		ResultSet pageSet = null;
		int dbCount = 0;
		int absoultePage = 1;
		
		ArrayList<FaqBean> faqList = new ArrayList<FaqBean>();
		
		try {
			con = getConnection();
			
			stmt = con.createStatement();
			pageSet = stmt.executeQuery("select count(f_num) from faq");
			
			if (pageSet.next()) {
				dbCount = pageSet.getInt(1);
				pageSet.close();
				stmt.close();
			}
			
			if (dbCount % FaqBean.pageSize == 0) {
				FaqBean.pageCount = dbCount / FaqBean.pageSize;
			}else {
				FaqBean.pageCount = dbCount / FaqBean.pageSize + 1;
			}
			
			if (pageNumber != null) {
				FaqBean.pageNum = Integer.parseInt(pageNumber);
				absoultePage = (FaqBean.pageNum-1) * FaqBean.pageSize + 1;
			}
			
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			String sql= "select f.* from faq f join user u "
					+ "on f.u_id = u.u_id order "
					+ "by f.f_num desc";
			
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				rs.absolute(absoultePage);
				int count = 0;
				
				while (count < FaqBean.pageSize) {
					FaqBean faq = new FaqBean();
					
					faq.setF_num(rs.getInt(1));
					faq.setF_category(rs.getString(2));
					faq.setF_title(rs.getString(3));
					faq.setF_content(rs.getString(4));
					faq.setU_id(rs.getString(5));
				
					faqList.add(faq);
					
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
		return faqList;
	}
	
	//글보기 (faq는 조회수x
	public FaqBean getBoard(int f_num, boolean hitadd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		FaqBean rb = new FaqBean();
		
		try {
			
			con = getConnection();
			sql = "select * from FAQ where f_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, f_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				rb.setF_num(rs.getInt(1));
				rb.setF_category(rs.getString(2));
				rb.setF_title(rs.getString(3));
				rb.setF_content(rs.getString(4));
				rb.setU_id(rs.getString(5));
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
	
		return rb;
	}
	
	//글삭제
	public int deleteBoard(int f_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int re = -1;
		
		try {
			
			con = getConnection();
			sql = "delete from faq where f_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, f_num);
			
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
	public int editBoard(FaqBean faq) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		
		try {
			
			con = getConnection();
			sql = "update FAQ set f_title = ?, f_content = ? where f_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, HanConv.toKor(faq.getF_title()));
			pstmt.setString(2, HanConv.toKor(faq.getF_content()));
			
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
			
			/*--관리자  0--*/
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
}