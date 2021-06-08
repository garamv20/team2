<%@page import="com.portfolio.shoppingmall.HanConv"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//세션 admin이 verified여야 페이지가 보임
	String verified = (String)session.getAttribute("admin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	//폼 데이터 불러오기
	String item_number = request.getParameter("item_number");
	String item_name = HanConv.toKor(request.getParameter("item_name"));
	String item_type1 = HanConv.toKor(request.getParameter("item_type1"));
	String item_type2 = HanConv.toKor(request.getParameter("item_type2"));
	String item_option = HanConv.toKor(request.getParameter("item_option"));
	String item_price = request.getParameter("item_cost");
	String item_discount_rate = request.getParameter("item_discount_rate");
	String item_sells = request.getParameter("item_sells");
	String item_remains = request.getParameter("item_remains");
	String item_register_date = request.getParameter("item_register_date");
	String item_memo = HanConv.toKor(request.getParameter("item_memo"));
	
	boolean edit_success;
	try{
		//오라클 DB 접속, scott/tiger
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "scott";
		String password = "tiger";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(url, user, password);

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		pstmt = con.prepareStatement("update items set "
		+"item_number=?, item_name=?, item_type1=?, item_type2=?, item_option=?"
		+", item_price=?, item_discount_rate=?, item_sells=?, item_remains=?"
		+", item_register_date=?, item_memo=? where item_number=?");
		pstmt.setInt(1, Integer.parseInt(item_number));
		pstmt.setString(2, item_name);
		pstmt.setString(3, item_type1);
		pstmt.setString(4, item_type2);
		pstmt.setString(5, item_option);
		pstmt.setString(6, item_price);
		pstmt.setString(7, item_discount_rate);
		pstmt.setString(8, item_sells);
		pstmt.setString(9, item_remains);
		pstmt.setString(10, item_register_date);
		pstmt.setString(11, item_memo);
		pstmt.setInt(12, Integer.parseInt(item_number));
		pstmt.executeUpdate();

		edit_success = true;
		System.out.println("수정 성공");
	}catch(Exception e){
		edit_success = false;
		e.printStackTrace();
		System.out.println("수정 실패");
	}
%>
<script>
	if("<%=verified%>" != "verified"){
		alert("관리자로 로그인되지 않았습니다. 관리자로 로그인해주세요.");
		location.href="login.jsp";
	}
	if(<%=edit_success%>==true){
		alert("상품 정보를 수정하였습니다.");
		location.href="show_items.jsp";
	}
	if(<%=edit_success%>==false){
		alert("상품 수정에 실패했습니다.");
		location.href="show_items.jsp";
	}
</script>
</body>
</html>