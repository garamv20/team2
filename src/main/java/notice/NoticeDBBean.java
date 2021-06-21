package notice;

import java.sql.DriverManager;
import java.sql.SQLException;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import faq.FaqBean;
import faq.FaqDBBean;
import myUtil.HanConv;

public class NoticeDBBean {
	private static NoticeDBBean instance = new NoticeDBBean();
	public static NoticeDBBean getInstance() {
		return instance;
	}
	
//	public Connection getConnection() throws Exception{
//		Context ctx = new InitialContext();
//		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
//		return ds.getConnection();
//	}

	public Connection getConnection() throws Exception {
		Connection conn = null;
			try{
					String url = "jdbc:mysql://localhost:3306/team2_db";
					String user = "root";
					String password = "root";
	
					Class.forName("com.mysql.cj.jdbc.Driver");
					conn = DriverManager.getConnection(url, user, password);
			}catch(SQLException ex){
				System.out.println("SQLException: "+ex.getMessage());
			}
			return conn;
			}
	
	
	//글작성
	public int insertBoard(NoticeBean notice, String u_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int number;
		int re = -1;
		
		notice.setN_date(new Timestamp(System.currentTimeMillis()));
		
		try {
			con = getConnection();
			sql = "select max(n_num) from NOTICE";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
				if(rs.next()) {
					number = rs.getInt(1) + 1;
				} else {
					number = 1;
				}
			
			sql="insert into NOTICE(n_num, n_title, n_content, n_date, u_id) "
					+ "values(?,?,?,?,?)";
			System.out.println("@@@###sql ===> "+sql);
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, number);
			pstmt.setString(2, HanConv.toKor(notice.getN_title()));
			pstmt.setString(3, HanConv.toKor(notice.getN_content()));
			pstmt.setTimestamp(4, notice.getN_date());
			pstmt.setString(5, u_id);
			
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
	
	public ArrayList<NoticeBean> listBoard(String pageNumber){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		ResultSet pageSet = null;
		int dbCount = 0;
		int absoultePage = 1;
		
		
		ArrayList<NoticeBean> noticeList = new ArrayList<NoticeBean>();
		
		try {
			con = getConnection();
			
			stmt = con.createStatement();
			pageSet = stmt.executeQuery("select count(n_num) from notice");
			
			if (pageSet.next()) {
				dbCount = pageSet.getInt(1);
				pageSet.close();
				stmt.close();
			}
			
			if (dbCount % NoticeBean.pageSize == 0) {
				NoticeBean.pageCount = dbCount / NoticeBean.pageSize;
			}else {
				NoticeBean.pageCount = dbCount / NoticeBean.pageSize + 1;
			}
			
			if (pageNumber != null) {
				NoticeBean.pageNum = Integer.parseInt(pageNumber);
				absoultePage = (NoticeBean.pageNum-1) * NoticeBean.pageSize + 1;
			}
			
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			String sql = "select n.* from notice n join user u "
					+ "on n.u_id = u.u_id order "
					//+ "by u.u_point desc, n.n_num desc";
					+ "by n.n_num desc";
			
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				rs.absolute(absoultePage);
				int count = 0;
				while (count < NoticeBean.pageSize) {
					NoticeBean notice = new NoticeBean();
					notice.setN_num(rs.getInt(1));
					notice.setN_title(rs.getString(2));
					notice.setN_content(rs.getString(3));
					notice.setN_date(rs.getTimestamp(4));
					notice.setU_id(rs.getString(5));
				
					noticeList.add(notice);
					
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
		return noticeList;
	}
	
	//글보기 
	public NoticeBean getBoard(int n_num, boolean hitadd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		NoticeBean notice = null;
		
		try {
			con = getConnection();
			
			sql="select n_num, n_title, n_content,n_date,u_id from notice where n_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, n_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				notice = new NoticeBean();
				notice.setN_num(rs.getInt(1));
				notice.setN_title(rs.getString(2));
				notice.setN_content(rs.getString(3));
				notice.setN_date(rs.getTimestamp(4));
				notice.setU_id(rs.getString(5));
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
		return notice;
	}
	
	//글삭제
	public int deleteHtBoard(int n_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int re = -1;
		
		try {
			con = getConnection();
			sql = "delete from notice where n_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, n_num);
			
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
	public int editBoard(NoticeBean notice) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		
		try {
			con = getConnection();
			sql = "update NOTICE set n_title = ?, n_content = ? where n_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, HanConv.toKor(notice.getN_title()));
			pstmt.setString(2, HanConv.toKor(notice.getN_content()));
			pstmt.setInt(3, notice.getN_num());
			
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
			sql = "select u_point from user where u_id=?";
			//sql = "select u_manager from user where u_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			
			/*--관리자 0--*/
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
