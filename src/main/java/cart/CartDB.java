package cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.HanConv2;

public class CartDB {
	private static CartDB instance = new CartDB();
	
	public static CartDB getInstance() {
		return instance;
	}
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext(); //dbcp방식 
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	//장바구니에 추가
	public int insertCart(CartVO cart) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		int number;
		
		try {
			con = getConnection();
			sql = "select max(c_code) from cart";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if ((rs.next())) {
				number = rs.getInt(1) + 1;
			} else {
				number = 1;
			}
			
			sql = "insert into cart values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, cart.getU_id());
			pstmt.setInt(3, cart.getItem_number());
			pstmt.setString(4, HanConv2.toKor(cart.getC_option1()));
			pstmt.setString(5, HanConv2.toKor(cart.getC_option2()));
			pstmt.setInt(6, cart.getC_qty());
			pstmt.setInt(7, cart.getC_price());
			pstmt.setInt(8, 0);
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
				try {
					if (pstmt != null)
						pstmt.close();
					if (con != null)
						con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		return 1;
	}
	
	//카트에 같은상품 있나 확인
	public int checkCart(CartVO cart) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		int result=0;
		
		try {
			con = getConnection();
			sql = "select c_code, item_number, c_option1, c_option2 from cart where u_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cart.getU_id());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int itemNum = rs.getInt("item_number");
				String option1 = rs.getString("c_option1");
				String option2 = rs.getString("c_option2");
				
				if(itemNum == cart.getItem_number() && option1.equals(HanConv2.toKor(cart.getC_option1()))
						&& option2.equals(cart.getC_option2())) {
					result = rs.getInt("c_code");
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
		return result;
	}
	
	//카트에 같은상품 추가할때 수량만 올리기 
	public void upItemQty(int c_code, int qty) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = getConnection();
			sql = "update cart set c_qty = c_qty + ? where c_code = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qty);
			pstmt.setInt(2, c_code);
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
	}
	
	//장바구니 리스트 
	public ArrayList<CartVO> cartList(String u_id){
		ArrayList<CartVO> list = new ArrayList<CartVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			sql ="select c.c_code, c.item_number, i.item_name, c.c_option1, c.c_option2, c.c_qty, c.c_price from cart c join items i "
					+ "on c.item_number = i.item_number where c.u_id = ? and c.c_to_next = 0 order by c.c_code";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CartVO cart = new CartVO();
				cart.setC_code(rs.getInt("c_code"));
				cart.setItem_number(rs.getInt("item_number"));
				cart.setItem_name(rs.getString("item_name"));
				cart.setC_option1(rs.getString("c_option1"));
				cart.setC_option2(rs.getString("c_option2"));
				cart.setC_qty(rs.getInt("c_qty"));
				cart.setC_price(rs.getInt("c_price"));
				
				list.add(cart);
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
		return list;
	}
}
