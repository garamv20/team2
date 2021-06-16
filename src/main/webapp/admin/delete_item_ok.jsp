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
<%
	int item_number = Integer.parseInt(request.getParameter("item_number"));

	boolean delete_success;
	try{
		//MySQL 접속, team2/1234
		String url = "jdbc:mysql://localhost:3306/team2_db";
		String user = "team2";
		String password = "1234";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, user, password);

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		pstmt = con.prepareStatement("delete from items where item_number=?");
		pstmt.setInt(1, item_number);
		pstmt.executeUpdate();

		delete_success = true;
		System.out.println("삭제 성공");
	}catch(Exception e){
		delete_success = false;
		e.printStackTrace();
		System.out.println("삭제 실패");
	}	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script>
	if("<%=verified%>" != "verified"){
		alert("관리자로 로그인되지 않았습니다. 관리자로 로그인해주세요.");
		location.href="login.jsp";
	}
	if(<%=delete_success%>==true){
		alert("상품을 삭제하였습니다.");
		location.href="show_items.jsp";
	}
	if(<%=delete_success%>==false){
		alert("상품 삭제에 실패했습니다.");
		location.href="show_items.jsp";
	}
</script>
</body>
</html>