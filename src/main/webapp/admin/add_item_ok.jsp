<%@page import="com.portfolio.shoppingmall.HanConv"%>
<%@page import="java.time.LocalDateTime"%>
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
	boolean add_success = false;

	//앞의 페이지에서 폼 값들을 받아온다.
	String item_name = HanConv.toKor((String)request.getParameter("item_name"));
	String item_type1 = HanConv.toKor((String)request.getParameter("item_type1"));
	String item_type2 = HanConv.toKor((String)request.getParameter("item_type2"));
	String item_option = HanConv.toKor((String)request.getParameter("item_option"));
	int item_price = Integer.parseInt((String)request.getParameter("item_price"));
	int item_discount_rate = 0;
	try{
		item_discount_rate = Integer.parseInt((String)request.getParameter("item_discount_rate"));
	}catch(Exception e){}
	int item_remains = Integer.parseInt((String)request.getParameter("item_remains"));
	String item_memo = HanConv.toKor((String)request.getParameter("item_memo"));
	
	try{
		//오라클 DB 접속, scott/tiger
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "scott";
		String password = "tiger";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(url, user, password);

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//마지막 번호 찾기
		int max_item_number = 0;	//없으면 0
		int insert_item_number;
		pstmt = con.prepareStatement("select max(item_number) from items");
		rs = pstmt.executeQuery();
		if(rs.next()){
			max_item_number = rs.getInt(1);
		}
		//입력할 번호는 최고 번호보다 1 크게
		insert_item_number = max_item_number + 1;

		pstmt = con.prepareStatement("insert into items(item_number, item_name, item_type1, item_type2, item_option, item_price, item_discount_rate, item_sells, item_remains, item_register_date, item_memo)"
		+"values(?,?,?,?,?,?,?,?,?,?,?)");
		pstmt.setInt(1, insert_item_number);
		pstmt.setString(2, item_name);
		pstmt.setString(3, item_type1);
		pstmt.setString(4, item_type2);
		pstmt.setString(5, item_option);
		pstmt.setInt(6, item_price);
		pstmt.setInt(7, item_discount_rate);
		pstmt.setInt(8, 0);				//item_sells
		pstmt.setInt(9, item_remains);
		pstmt.setString(10, LocalDateTime.now().toString());//item_regist_date
		pstmt.setString(11, item_memo);
		
		rs = pstmt.executeQuery();

		add_success = true;
		System.out.println("상품 추가 성공");
	}catch(Exception e){
		add_success = false;
		e.printStackTrace();
		System.out.println("상품 추가 실패");
	}
%>


<script>
	if("<%=verified%>" != "verified"){
		alert("관리자로 로그인되지 않았습니다. 관리자로 로그인해주세요.");
		location.href="login.jsp";
	}
	if(<%=add_success%>==true){
		alert("상품을 추가하였습니다.");
		location.href="show_items.jsp";
	}
	if(<%=add_success%>==false){
		alert("상품을 추가에 실패했습니다.");
		location.href="show_items.jsp";
	}
</script>
</body>
</html>