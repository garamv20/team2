package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.HanConv;

public class UserDBBean {
	private static UserDBBean instance = new UserDBBean();

	public static UserDBBean getInstance() {
		return instance;
	}
	public Connection getConnection() throws Exception {
		Connection conn=null;
		try{
			//sql 경로 
			String url= "jdbc:mysql://localhost:3306/team2_db";
			//커넥션 아이디 비번 
			String user= "team2";
			String password= "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn= DriverManager.getConnection(url, user, password);
			/* System.out.print("데이터베이스 연결에 성공"); */
		}catch(SQLException ex){
			/* System.out.print("데이터베이스 연결에 실패"); */
			System.out.print("SQLException"+ex.getMessage());
			
		}
		return conn;
	}
	public int signup(UserBean user) throws Exception { // 회원 가입시 사용 될 메소드
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;

		try {
			conn = getConnection();
		
			sql = "insert into user (u_name,u_id,u_pw,u_phone,u_jumin,u_email,u_address)" + "values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, HanConv.toKor(user.getU_name()));
			pstmt.setString(2, HanConv.toKor(user.getU_id()));
			pstmt.setString(3, user.getU_pw());
			pstmt.setString(4, user.getU_phone());
			pstmt.setString(5, user.getU_jumin());
			pstmt.setString(6, user.getU_email());
			pstmt.setString(7, HanConv.toKor(user.getU_address()));
		

			pstmt.executeUpdate();

			re = 1;

		} catch (Exception e) {
			System.out.println("시스템 오류 ");
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
			if (rs!=null) {
				rs.close();
			}
		}
		return re;
	}
	public int confirmID(String id) throws Exception { // 로그인시 ID가 저장되어있는 회원이지 확인
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select u_id from user where u_id=?";
		int re = -1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setNString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				re = 1;
			} else {
				re = -1;
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	public int userCheck(String id, String pwd) throws Exception { // 아이디와 비밀번호가 일치한지
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int re = -1;
		String db_u_pwd = "";
		String sql = "select u_pw from user where u_id=?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				db_u_pwd = rs.getString("u_pw");
				if (db_u_pwd.equals(pwd)) {
					re = 1;
					
				} else {
					re = 0;
				}
			} else {
				re = -1;
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return re;

	}
	public UserBean getUser(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from user where u_id=?";
		UserBean user = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				user = new UserBean();
				
				user.setU_name(rs.getString("u_name"));
				user.setU_id(rs.getString("u_id"));
				user.setU_pw(rs.getString("u_pw"));
				user.setU_phone(rs.getString("u_phone"));
				user.setU_jumin(rs.getString("u_jumin"));
				user.setU_email(rs.getString("u_email")); 
				user.setU_address(rs.getString("u_address"));
				user.setU_point(rs.getInt("u_point"));
				user.setU_grade(rs.getString("u_grade"));
			
			}
			
		} catch (Exception e) {
			System.out.println("시스템 오류 ");
			e.printStackTrace();
		}finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
				if (rs!=null)
					rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return user;

	}
	/*
	 * public int changepw(String u_id) throws Exception{ Connection conn = null;
	 * PreparedStatement pstmt = null; ResultSet rs = null; String sql =
	 * "select u_pw from user where u_id=?";
	 * 
	 * return 0;
	 * 
	 * }
	 */
	
}
