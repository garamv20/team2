<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@page import="myUtil.HanConv"%>
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
	String item_type = HanConv.toKor((String)request.getParameter("item_type"));
	String item_name = HanConv.toKor((String)request.getParameter("item_name"));
	int item_price = Integer.parseInt((String)request.getParameter("item_price"));
	double item_discount_rate = Double.parseDouble((String)request.getParameter("item_discount_rate"));
	String item_memo = HanConv.toKor((String)request.getParameter("item_memo"));
	
	try{
		//MySQL 접속, team2/1234r
		String url = "jdbc:mysql://localhost:3306/team2_db";
		String user = "team2";
		String password = "1234";
		Class.forName("com.mysql.jdbc.Driver");
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

		pstmt = con.prepareStatement("insert into items values(?,?,?,?,?,?,?)");
		pstmt.setInt(1, insert_item_number);
		pstmt.setString(2, item_type);
		pstmt.setString(3, item_name);
		pstmt.setInt(4, item_price);
		pstmt.setDouble(5, item_discount_rate);
		pstmt.setDate(6, Date.valueOf(LocalDate.now()));
		pstmt.setString(7, item_memo);
		
		pstmt.executeUpdate();

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